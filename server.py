from flask import Flask, jsonify, render_template, redirect, request, flash, session
from model import Recipe, Rating, Tag, User, connect_to_db, db
from flask_debugtoolbar import DebugToolbarExtension

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    app.debug = True
    #no caching for templates
    app.jinja_env.auto_reload = app.debug 

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run(port=5000, host='0.0.0.0')
