from flask import Flask, jsonify, render_template, redirect, request, flash, session
from model import Recipe, Rating, Tag, User, connect_to_db, db, TagRecipes
from flask_debugtoolbar import DebugToolbarExtension
import random
from SQLAlchemy import and_
import bcrypt
from helper import get_restriction_recipes


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
        rating_query = Rating.query.filter_by(recipe_id = recipe_display.recipe_id).filter_by(user_id=user.user_id).all()
        if rating_query:
            score = rating_query[0].rating_score
        else:
            score = None
        return render_template('recipe.html', recipe_title=recipe_title, 
                            recipe_ingredients=recipe_ingredients,
                            recipe_directions=recipe_directions,
                            user=user, recipe_display=recipe_display, score=score)
    else:
        return render_template('recipe.html', recipe_title=recipe_title, 
                                recipe_ingredients=recipe_ingredients,
                                recipe_directions=recipe_directions)


@app.route("/add-rating", methods=["POST"])
def add_rating():
    email = session["user_email"]
    user = User.query.filter_by(email = email).one()
    rating_score = request.form.get("score")
    recipe_id = request.form.get("recipe")
    recipe = Recipe.query.filter_by(recipe_id=recipe_id).one()

    
    rating = Rating.query.filter(Rating.user_id == user.user_id, Rating.recipe_id == recipe.recipe_id).first()
    if rating:
       rating.score = rating.rating_score
    else:
        rating = Rating(recipe_id=recipe.recipe_id, rating_score=rating_score, user_id=user.user_id)
        db.session.add(rating)
    db.session.commit()

    flash("Your rating has been added!")

    return redirect("/")


@app.route('/tags')
def show_tags():
    tags = Tag.query.all()
    # categories = tags.category
    
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
    def get_restriction_recipes(user):
        restrictions = user.restrictions.split(",")
        print restrictions[:-1]
        with_restrictions = []
        for restriction in restrictions[:-1]:
            restriction = restriction.strip()
            print restriction
            tid = Tag.query.filter_by(category= restriction).one()
            recipes = tid.recipe 
            for recipe in recipes:
                with_restrictions.append(recipe)
            # with_restrictions.append(recipes)
        return with_restrictions

    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).one()
        with_restrictions = get_restriction_recipes(user)
        with_restrictions = set(with_restrictions)
        recipes = set(recipes)
        # print recipes
        more_recipes = recipes & with_restrictions
        # print with_restrictions
        # print recipes
        print more_recipes
        restrictions = user.restrictions.split(",") 
        return render_template('taggedrecipe.html', tag=tag, recipes=recipes, user=user,
                                restrictions=restrictions, more_recipes=more_recipes)
    else:
        return render_template('taggedrecipe.html', tag=tag, recipes=recipes)

@app.route('/<category>/random/recipes')
def show_random(category):
    tag = Tag.query.filter_by(category=category).one()
    recipes = tag.recipe
    def get_random_recipes(recipes):
        recipe1, recipe2, recipe3 = random.sample(recipes, 3)
        ingredients1 = recipe1.recipe_ingredients.split(",")
        ingredients2 = recipe2.recipe_ingredients.split(",")
        ingredients3 = recipe3.recipe_ingredients.split(",")
        url1 =recipe1.recipe_url
        url2 = recipe2.recipe_url
        url3 = recipe3.recipe_url
        return recipe1,recipe2,recipe3,ingredients1,ingredients2,ingredients3,url1,url2,url3

    if "user_email" in session:
        email = session["user_email"]
        user = User.query.filter_by(email = email).one()
        if user.restrictions >= 1:
            with_restrictions = get_restriction_recipes(user)
            with_restrictions = set(with_restrictions)
            recipes = set(recipes)
            more_recipes = recipes & with_restrictions
            try:
                recipe1,recipe2,recipe3,ingredients1,ingredients2,ingredients3,url1,url2,url3 = get_random_recipes(more_recipes)
            except ValueError:
                recipe1,recipe2,recipe3,ingredients1,ingredients2,ingredients3,url1,url2,url3 = get_random_recipes(recipes)
            return render_template("threerecipes.html", recipe1=recipe1, recipe2=recipe2,
                                recipe3=recipe3, ingredients1=ingredients1, ingredients2=ingredients2,
                                ingredients3=ingredients3, user=user, url1=url1, url2=url2, url3=url3)
        else:
            recipe1,recipe2,recipe3,ingredients1,ingredients2,ingredients3,url1,url2,url3 = get_random_recipes(recipes)
        return render_template("threerecipes.html", recipe1=recipe1, recipe2=recipe2,
                            recipe3=recipe3, ingredients1=ingredients1, ingredients2=ingredients2,
                            ingredients3=ingredients3, url1=url1, url2=url2, url3=url3, user=user)

    else:
        recipe1,recipe2,recipe3,ingredients1,ingredients2,ingredients3,url1,url2,url3 = get_random_recipes(recipes)
        return render_template("threerecipes.html", recipe1=recipe1, recipe2=recipe2,
                            recipe3=recipe3, ingredients1=ingredients1, ingredients2=ingredients2,
                            ingredients3=ingredients3, url1=url1, url2=url2, url3=url3)


@app.route('/signup', methods=["GET"])
def show_signup():
    return render_template('signup.html')

@app.route('/signup', methods=["POST"])
def signup():

    name = request.form.get("name")
    email = request.form.get("email")
    password = request.form.get("Password")

    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

    user = User.query.filter(User.email == email).all()

    if user:
        flash("You're already signed up, please login.")
    else:
        user = User(name=name, email=email, password=hashed)
        db.session.add(user)
        db.session.commit()
        flash("Thanks for signing up! Please login")

    return redirect("/login")


@app.route('/login', methods=["GET"])
def show_login():
    if "user_email" in session:
        flash("You're already logged in.")
    return render_template('login.html')

@app.route('/login', methods=["POST"])
def login():
    session["user_email"] = request.form.get("email")
    password = request.form.get("Password")
    user = User.query.filter(User.email == session["user_email"]).one()
    to_check = user.password.encode('utf-8')
    if bcrypt.checkpw(password.encode('utf-8'), to_check):
        flash("Logged in as "+session["user_email"])
        user_id = user.user_id
        session["user_id"] = user_id
        return redirect('/%d' %user_id)
    else:
        flash("Username or Password do not match our records")
        del session["user_email"]
        return render_template('login.html')

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
        ratings = Rating.query.filter_by(user_id=user.user_id).all()   
        print ratings      
        return render_template('userprofile.html', name=name, user=user,ratings=ratings)
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
