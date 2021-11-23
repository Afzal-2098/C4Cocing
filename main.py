from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
from flask import session, redirect
import json
import os
import math


with open('config.json', 'r') as f:
    peramtr = json.load(f)["peramtr"]

local_server = True

app = Flask(__name__)
app.secret_key = 'my-secret-key-set-by-me'
app.config['UPLOAD_FOLDER'] = peramtr['upload_location']
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = peramtr['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = peramtr['prod_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(15), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date =db.Column(db.String(15), nullable=True)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date =db.Column(db.String(15), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)


@app.route("/")
def home():
    posts=Posts.query.filter_by().all()
    last=math.ceil(len(posts)/int(peramtr['num_of_post']))
    # pegination
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    
    page=int(page)
    posts=posts[(page-1)*int(peramtr['num_of_post']): (page-1)*int(peramtr['num_of_post']) + int(peramtr['num_of_post'])]
    #first page  
    if page==1:
        prev="#"
        next="/?page="+ str(page+1)

    #last page
    elif page==last:
        prev="/?page="+ str(page-1)
        next="#"

    #middle page
    else:
        prev="/?page="+ str(page-1)
        next="/?page="+ str(page+1)

    
    return render_template("index.html", peramtr=peramtr, posts=posts, prev=prev, next=next)

@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if ("user" in session and session['user']==peramtr['admin_username']):
        posts=Posts.query.all()
        return render_template("dashboard.html", peramtr=peramtr, posts=posts)

    elif request.method=='POST':
        '''redirect to admin panel'''
        username=request.form.get("uname")
        password=request.form.get("upass")
        if username==peramtr['admin_username'] and password==peramtr['admin_password']:
            '''session variable'''
            session['user']=username
            posts=Posts.query.all()
            return render_template("dashboard.html", peramtr=peramtr, posts=posts)

    else:    
        return render_template("login.html", peramtr=peramtr)

@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if ("user" in session and session['user']==peramtr['admin_username']):
        if request.method=='POST':
            req_title=request.form.get('title')
            req_tagline=request.form.get('tline')
            req_slug=request.form.get('tslug')
            req_content=request.form.get('tcontent')
            req_img_file=request.form.get('timage')
            req_date=datetime.now()

            if sno == '0':
                '''sno, title, tagline, slug, content, date, img_file'''
                post=Posts(title=req_title, tagline=req_tagline, slug=req_slug, content=req_content, img_file=req_img_file, date=req_date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=req_title
                post.tagline=req_tagline
                post.slug=req_slug
                post.content=req_content
                post.img_file=req_img_file
                post.date=req_date
                db.session.commit()
                return redirect('/edit/'+sno)

        post=Posts.query.filter_by(sno=sno).first()
        return render_template("edit.html", peramtr=peramtr, post=post, sno=sno)

    # else:
    #     return render_template("login.html", peramtr=peramtr)

@app.route("/login")
def login():
    return render_template("login.html", peramtr=peramtr)

@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ("user" in session and session['user']==peramtr['admin_username']):
        if(request.method=="POST"):
            Nf=request.files['filename']
            Nf.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(Nf.filename)))
            return "UPLOADED SUCCESSFULLY"

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if ("user" in session and session['user']==peramtr['admin_username']):
        post=Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')

@app.route("/about")
def about():
    return render_template("about.html", peramtr=peramtr)

@app.route("/post/<string:post_slug>", methods = ['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html", peramtr=peramtr, post=post)

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=="POST"):
        '''add entry to the database table named contact'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, email=email, phone_num=phone, msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
    return render_template("contact.html", peramtr=peramtr)



app.run(debug=True)