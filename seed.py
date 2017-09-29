from sqlalchemy import func
from model import Recipe, Rating, Tag, User

from model import connect_to_db, db

from server import app 
import jinja2



def load_recipe():

    for recipe in open("dumpfile.txt"):
        recipe = recipe.split("\t")
        for r in str(recipe):
            blank, recipie_title, recipe_source,recipe_ingredients, recipe_directions = r.split("|")

            recipe = Recipe(recipie_title=recipie_title,recipe_source=recipe_source,
                                recipe_ingredients=recipe_ingredients, recipe_directions=recipe_directions)

            db.session.add(Recipe)
    db.session.commit()








if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_recipe()