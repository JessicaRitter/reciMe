from flask import Flask, jsonify, render_template, redirect, request, flash, session
from model import Recipe, Rating, Tag, User, connect_to_db, db
from flask_debugtoolbar import DebugToolbarExtension
import random

app = Flask(__name__)


app.secret_key = "jessisthebest"


@app.route('/')
def showbutton():
    return render_template('showbutton.html')

@app.route('/recipes')
def recipe_options():

    recipes = Recipe.query.all()

    recipe1, recipe2, recipe3 = random.sample(recipes, 3)

    ingredients1 = recipe1.recipe_ingredients.split(" ")

    directions1 = recipe1.recipe_directions.split(".")
    directions2 = recipe2.recipe_directions.split(".")
    directions3 = recipe3.recipe_directions.split(".")

    return render_template('threerecipes.html', recipe1=recipe1,
                            recipe2=recipe2, recipe3=recipe3, 
                            directions1=directions1,
                            directions2=directions2,
                            directions3=directions3)

@app.route('/recipes/<recipe>')
def show_recipe(recipe):
    return render_template('recipe.html')



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
