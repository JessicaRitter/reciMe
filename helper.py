from model import Recipe, Rating, Tag, User, connect_to_db, db, TagRecipes

def get_restriction_recipes(user):
        restrictions = user.restrictions.split(",")
        restrictions[:-1]
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