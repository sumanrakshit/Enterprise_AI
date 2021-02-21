from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, BooleanField
from wtforms.validators import DataRequired, Length, Email, EqualTo


class RegistrationForm(FlaskForm):
    uname = StringField( 'username', validators=[DataRequired(), Length(min=2, max=40)])
    password = PasswordField('password', validators=[DataRequired()])                    
    email = StringField('email', validators=[DataRequired(), Email()])
    
    
    


class LoginForm(FlaskForm):
    email = StringField('email',validators=[DataRequired(), Email()])
    password = PasswordField('password', validators=[DataRequired()])
    
    
