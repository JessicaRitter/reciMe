from flask import Flask, jsonify, render_template, redirect, request, flash, session
from model import Recipe, Rating, Tag, User, connect_to_db, db
from flask_debugtoolbar import DebugToolbarExtension

app = Flask(__name__)


app.secret_key = "jessisthebest"


@app.route('/')
def showbutton():
    return render_template('showbutton.html')


# @app.route('/login')
# def login():
#     return render_template('login.html')

# @app.route('/logout')
# def logout():
#     return redirect('/')

# @app.route('/<user>'):
# def show_profile(user_id):
#     return render_template('userprofile.htm')




if __name__ == '__main__':
    app.debug = True
    #no caching for templates
    app.jinja_env.auto_reload = app.debug 

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run(port=5000, host='0.0.0.0')
