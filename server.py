from flask import Flask, jsonify, render_template, redirect, request, flash, session
from model import Recipe, Rating, Tag, User, connect_to_db, db
from flask_debugtoolbar import DebugToolbarExtension
import random

app = Flask(__name__)


app.secret_key = "jessisthebest"


@app.route('/')
def showbutton():
    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).one()
        return render_template('showbutton.html', user=user)
    else:
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

    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).one()
        return render_template('threerecipes.html', recipe1=recipe1,
                                recipe2=recipe2, recipe3=recipe3,
                                ingredients1=ingredients1,
                                ingredients2=ingredients2,
                                ingredients3=ingredients3,
                                url1=url1, url2=url2,url3=url3,
                                user=user)
    else:

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
    
    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).one()
        return render_template('recipe.html', recipe_title=recipe_title, 
                            recipe_ingredients=recipe_ingredients,
                            recipe_directions=recipe_directions,
                            user=user)
    else:
        return render_template('recipe.html', recipe_title=recipe_title, 
                                recipe_ingredients=recipe_ingredients,
                                recipe_directions=recipe_directions)


@app.route('/tags')
def show_tags():
    tags = Tag.query.all()
    
    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).one()
        return render_template('tag.html', tags=tags, user=user)
    else:    
        return render_template('tag.html', tags=tags)

@app.route('/<category>/recipes')
def show_taggedrecipes(category):
    tag = Tag.query.filter_by(category = category).one()
    recipes = tag.recipe
    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).one()
        return render_template('taggedrecipe.html', tag=tag, recipes=recipes, user=user)
    else:
        return render_template('taggedrecipe.html', tag=tag, recipes=recipes)


@app.route('/signup', methods=["GET"])
def show_signup():
    return render_template('signup.html')

@app.route('/signup', methods=["POST"])
def signup():

    name = request.form.get("name")
    email = request.form.get("email")
    password = request.form.get("Password")

    user = User.query.filter(User.email == email).all()

    if user:
        flash("You're already signed up, please login.")
    else:
        user = User(name=name, email=email, password=password)
        db.session.add(user)
        db.session.commit()
        flash("Thanks for signing up %d!") % name

    return redirect("/login")


@app.route('/login', methods=["GET"])
def show_login():
    if "user_email" in session:
        flash("You're already logged in.")
    return render_template('login.html')

@app.route('/login', methods=["POST"])
def login():
    session["user_email"] = request.form.get("email")
    flash("Logged in as "+session["user_email"])
    user = User.query.filter(User.email == session["user_email"]).all()
    user_id = user[0].user_id
    session["user_id"] = user_id
    return redirect('/%d' %user_id)

@app.route('/logout')
def logout():
    if "user_email" in session:
        del session["user_email"]
        flash("Logout successful")
    return redirect('/')

@app.route('/<user_id>')
def show_profile(user_id):
    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).first()
        name = user.name            
        return render_template('userprofile.html', name=name, user=user)
    else:
        return redirect('/')

@app.route('/add-dietary-restrictions', methods=["GET"])
def show_restrictions():
    email = session["user_email"]
    user = User.query.filter_by(email = email).one()
    return render_template('restrictions.html', user=user)

@app.route('/add-dietary-restrictions', methods=["POST"])
def add_restrictions():
    if request.method == "POST":
        selected_restrictions = request.form.getlist("restriction")
    restrictions = " "
    for restriction in selected_restrictions:
        restrictions += restriction + ","
    email =session["user_email"]
    print restrictions
    user = User.query.filter_by(email=email).first()
    user_id = user.user_id
    user.restrictions = restrictions
    db.session.commit()
    
    return redirect('/%d'% user_id)



if __name__ == '__main__':
    app.debug = True
    #no caching for templates
    app.jinja_env.auto_reload = app.debug 

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run(port=5000, host='0.0.0.0')
