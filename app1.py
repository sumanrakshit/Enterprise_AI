from flask import Flask, flash,render_template, url_for, flash, redirect, request , session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from forms import RegistrationForm, LoginForm

from flask_wtf import FlaskForm
import json
from flask_mail import Mail
from sqlalchemy import text

from werkzeug.security import check_password_hash , generate_password_hash
import string

import matplotlib.pyplot as plt
from nltk.corpus import stopwords
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.stem import WordNetLemmatizer
from nltk.tokenize import word_tokenize
import os





IMAGE_FOLDER = os.path.join('static', 'img_pool')


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = IMAGE_FOLDER

app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

app.config['SECRET_KEY'] = '12252904dc1cf0280bd97c0fe0f393ce'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


db = SQLAlchemy(app)





class Feedback(db.Model):

    '''
    sno, name phone_num, msg, date, email
    '''
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(80), nullable=False)
    phone = db.Column(db.Integer, nullable=False)
    message = db.Column(db.String(220), nullable=False)
    date = db.Column(db.String(30), nullable=True)

    def __init__(self, name, email,phone,message,date):
        self.name=name
        self.email=email
        self.phone=phone
        self.message=message
        self.date=date





class Product(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    uname = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(80), nullable=False)
    password = db.Column(db.String(80), nullable=False)
   
   


class Item(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    segment = db.Column(db.String(80), nullable=False)
    
   





@app.route("/")
def home():
    return render_template('index.html', params=params)

@app.route("/")
def product():
    return render_template('index.html', params=params)

@app.route("/")
def contact():
    return render_template('index.html', params=params)

@app.route("/manager")
def manager():
    return render_template('manager.html', params=params)



   


@app.route("/customer")
def customer():
    return render_template('customer.html' , params=params)

@app.route("/chart")
def chart():
    legend = 'Monthly Data'
    labels=['Team A', 'Team B', 'Team C', 'Team D', 'Team E']
    values = [44, 55, 13, 43, 22]
    return render_template('chart.html', values=values, labels=labels, legend=legend)
 
 

@app.route("/json")
def json():
    p=Item.query.filter_by(segment='Positive').count()
    n=Item.query.filter_by(segment='Negative').count()
    nu=Item.query.filter_by(segment='Neutral').count()
    value={
            "labels": ["Positive", "Negative" ,"Neutral"],
            "data": {
                "quantity": [p, n, nu]
            }
        }
    return value
 
@app.route("/json1")
def json1():
    # p=Item.query.filter_by(segment='Positive').count()
    # n=Item.query.filter_by(segment='Negative').count()
    # nu=Item.query.filter_by(segment='Neutral').count()
    value={
            "labels": ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
            "data": {
                "quantity": [35, 41, 36, 26, 45, 48, 52, 53, 41]
            }
        }
    return value

@app.route("/json2")
def json2():
    # p=Item.query.filter_by(segment='Positive').count()
    # n=Item.query.filter_by(segment='Negative').count()
    # nu=Item.query.filter_by(segment='Neutral').count()
    value={
            "labels": ["Pos", "Neg" ,"Neu"],
            "data": {
                "quantity": [0.50, 0.20, 0.30]
            }
        }
    return value




        
@app.route("/register", methods=['GET', 'POST'])
def register(): 
    msg = ''
    form = RegistrationForm()
    if request.method == 'POST' :
        hashed_password=generate_password_hash(request.form.get('password') ,method="sha256")
        uname=request.form.get('username')
        email=request.form.get('email')
        password=hashed_password
        entry = Product(uname=uname,email=email, password=password )
        db.session.add(entry)
        db.session.commit()
        flash('Thanks for registering')
        return redirect(url_for('login'))

    return render_template('register.html', form=form , params=params, msg=msg)
    

@app.route("/login", methods=['GET', 'POST'])
def login():
    msg = ''
    form = LoginForm()
    user=Product.query.filter_by(email=request.form.get('email')).first()
    # if('user' in session and session['user']==user.email):
    #     return render_template('manager.html' , params=params)

   
    if request.method == 'POST':

        if user:

            if check_password_hash(user.password, request.form.get('password')):

                session['user']=user.email
                flash('You have been logged in!', 'success')
                return redirect(url_for('manager',  params=params)) 

    else:

        flash('incorect usrname/password')
    return render_template('login.html',  params=params  , form=form ,msg=msg)



@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('login', None)
   session.pop('id', None)
   session.pop('username', None)
   # Redirect to login page
   return redirect(url_for('login'))    


@app.route("/fedback", methods = ['GET', 'POST'])

def fedback():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone')
        msg = request.form.get('message')
        entry = Feedback(name=name, email = email, phone = phone_num, message = msg, date= datetime.now() )
        db.session.add(entry)
        db.session.commit()
    return render_template('index.html' , params=params)


@app.route('/predict')
def predict():
     data= Feedback.query.all()

     return render_template('fdback.html', employee = data)


@app.route('/delete/<string:id>', methods = ['POST','GET'])
def delete_employee(id):
    my_data=Feedback.query.get(id)
    db.session.delete(my_data)
    db.session.commit()
    
    flash('Employee Removed Successfully')
    return redirect(url_for('predict'))
 


@app.route('/predict_sentiment/<string:id>')
def predict_sentiment(id):
    user=Feedback.query.filter_by(id=id).first()
    text = user.message
    lower_case = text.lower()
    cleaned_text = lower_case.translate(str.maketrans('', '', string.punctuation))

# Using word_tokenize because it's faster than split()
    tokenized_words = word_tokenize(cleaned_text, "english")

# Removing Stop Words
    final_words = []
    for word in tokenized_words:

        if word not in stopwords.words('english'):

            final_words.append(word)

# Lemmatization - From plural to single + Base form of a word (example better-> good)
    lemma_words = []
    for word in final_words:


        word = WordNetLemmatizer().lemmatize(word)
        lemma_words.append(word)

    emotion_list = []
    with open('emotions.txt', 'r') as file:

        for line in file:
            clear_line = line.replace("\n", '').replace(",", '').replace("'", '').strip()
            word, emotion = clear_line.split(':')

            if word in lemma_words:

                emotion_list.append(emotion)
    score = SentimentIntensityAnalyzer().polarity_scores(cleaned_text)
    

    if score['neg'] > score['pos']:

        sentiment = 'Negative'
        probability=score['compound']
        img_filename = os.path.join(app.config['UPLOAD_FOLDER'], 'sad.png')
    elif score['neg'] < score['pos']:
        sentiment = 'Positive'
        probability=score['compound']
        img_filename = os.path.join(app.config['UPLOAD_FOLDER'], 'happy.png')
    else:
        sentiment = 'Neutral'
        probability=score['compound']
        img_filename = os.path.join(app.config['UPLOAD_FOLDER'], 'neu.png')


    entry = Item(segment=sentiment )
    db.session.add(entry)
    db.session.commit()


    return render_template('tcs.html', sentiment=sentiment,  probability=probability, img=img_filename)  



   



 


if __name__ == '__main__':
    app.run(debug=True)
  
