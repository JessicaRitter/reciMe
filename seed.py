from sqlalchemy import func
from model import Recipe, Rating, Tag, User

from model import connect_to_db, db

from server import app 
import jinja2

def load_tags():
    file = open("tagdata.txt")
    for row in file:
        category = row.split("\n")[0]

        tag = Tag(category=category)
        db.session.add(tag)

    db.session.commit()

def load_users():
    file = open("userdata.txt")
    for row in file:
        email, name, password = row.split("|")
        user = User(email=email, name=name, password=password)
        db.session.add(user)
    db.session.commit()

import pdb

def load_recipe():
    # pdb.set_trace()
    #open file and bind to variable file
    file = open("dumpfile.txt")
    #read file and save conents to variable file
    savedfile = file.read()
    # recipes = []
    #create loop to go through each recipe in file
    # for recipes in file:
        #split on "\t"
    recipes = savedfile.split(r'"\t"')
    # print recipes, "this is"\t" your recipes"
    #for each recipe in the split recipes
    for recipe in recipes:
        # recipe = str(recipe)
        #unpack the values and split on |
        # pdb.set_trace()
        try:
            recipe_title, recipe_source,recipe_ingredients, recipe_directions = recipe.split("|")
            recipe = Recipe(recipe_title=recipe_title,recipe_source=recipe_source,
                            recipe_ingredients=recipe_ingredients,recipe_directions=recipe_directions)
        except:
            print recipe.split("|")
        # break

        db.session.add(recipe)
    db.session.commit()








if __name__ == "__main__":
    connect_to_db(app)

    # create tables
    db.create_all()

    load_tags()

    load_users()
    # Import dumpfile info
    load_recipe()