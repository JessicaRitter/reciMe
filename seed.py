from sqlalchemy import func
from model import Recipe, Rating, Tag, User, TagRecipes

from model import connect_to_db, db

from server import app 
import jinja2
import pdb

def load_tags():
    file = open("datafile.txt")
    file = file.read()
    # print file
    for recipes in file:

        # pdb.set_trace()
        recipes = file.split("\n")

        # pdb.set_trace()

        for recipe in recipes:
            rec, tags = recipe.split("|TAGS")
            # pdb.set_trace()
        
            for tag in set(tags):
                tag = tags.split(",")
                
            for item in set(tag):
                item = Tag(category=item)
                db.session.add(item)
                db.session.commit()

def load_users():
    file = open("userdata.txt")
    for row in file:
        email, name, password = row.split("|")
        user = User(email=email, name=name, password=password)
        db.session.add(user)
    db.session.commit()


def load_recipe():
    # pdb.set_trace()
    #open file and bind to variable file
    file = open("datafile.txt")
    #read file and save conents to variable file
    savedfile = file.read()
    # recipes = []
    #create loop to go through each recipe in file
    # for recipes in file:
        #split on "\t"
    recipes = savedfile.split("\n")
    # print recipes, "this is"\t" your recipes"
    #for each recipe in the split recipes
    for recipe in recipes:
        # recipe = str(recipe)
        #unpack the values and split on |
        # pdb.set_trace()
        try:
            recipe_url,recipe_title, recipe_source,recipe_ingredients, recipe_directions,tags = recipe.split("|")
            recipe = Recipe(recipe_url=recipe_url,recipe_title=recipe_title,recipe_source=recipe_source,
                            recipe_ingredients=recipe_ingredients,recipe_directions=recipe_directions)
        except:
            print recipe.split("|")
        # break
        db.session.add(recipe)

        
    db.session.commit()

def load_tagrecipe():
    file = open('datafile.txt')
    file = file.read()
    recipes = file.split("\n")
    for recipe in recipes:
        rec, tags = recipe.split("|TAGS")
        url, recipe_title, recipe_source, recipe_ingredients, recipe_directions = rec.split("|")
        recipe_db = Recipe.query.filter_by(recipe_title = recipe_title).first()
        tags = tags.split(",")
        for tag in tags:
            tag_db = Tag.query.filter_by(category = tag).first()
            # print recipe_db
            recipe_id = recipe_db.recipe_id
            tag_id = tag_db.tag_id
            tagrecipe = TagRecipes(tag_id=tag_id, recipe_id=recipe_id)
            db.session.add(tagrecipe)
            db.session.commit()

                                    









if __name__ == "__main__":
    connect_to_db(app)

    # create tables
    # db.create_all()

    # load_tags()

    # load_users()
    # Import dumpfile info
    # load_recipe()
    load_tagrecipe()