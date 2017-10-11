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

    ingredients1 = recipe1.recipe_ingredients.split(",")
    ingredients2 = recipe2.recipe_ingredients.split(",")
    ingredients3 = recipe3.recipe_ingredients.split(",")

    url1 = recipe1.recipe_url
    url2 = recipe2.recipe_url
    url3 = recipe3.recipe_url



    directions1 = recipe1.recipe_directions.split(".")
    directions2 = recipe2.recipe_directions.split(".")
    directions3 = recipe3.recipe_directions.split(".")

    return render_template('threerecipes.html', recipe1=recipe1,
                            recipe2=recipe2, recipe3=recipe3,
                            ingredients1=ingredients1,
                            ingredients2=ingredients2,
                            ingredients3=ingredients3,
                            url1=url1, url2=url2,url3=url3)

@app.route('/recipes/<recipe_url>')
def show_recipe(recipe_url):
    # print recipe_url
    recipe_url = str("/" + recipe_url)
    # print recipe_url
    recipe_display = Recipe.query.filter_by(recipe_url = recipe_url).one()
    recipe_title = recipe_display.recipe_title
    recipe_ingredients = recipe_display.recipe_ingredients.split(",")
    recipe_directions = recipe_display.recipe_directions.split(".")
    
    return render_template('recipe.html', recipe_title=recipe_title, 
                            recipe_ingredients=recipe_ingredients,
                            recipe_directions=recipe_directions)


@app.route('/tags')
def show_tags():
    tags = Tag.query.all()
    

    return render_template('tag.html', tags=tags)

@app.route('/<category>/recipes')
def show_taggedrecipes(category):
    tag = Tag.query.filter_by(category = category).one()
    recipes = tag.recipe
    return render_template('taggedrecipe.html', tag=tag, recipes=recipes)



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
