# ReciMe  
ReciMe aims to help indecisive foodies that want excellent recipes that take into account their dietary restrictions.Users select the meal to search for and ReciMe displays three recipes filtered by their restrictions. Recipes can be found by meal as well as by tag through the tagging page. Users can rate recipes they've made which are displayed on their profile page so they can always find the recipes they loved again. The tag page shows a word cloud of weighted tags on recipes, and below are links to see all recipes per tag. 

## Table of Contents
* [Tech Stack](#tech-stack)
* [Features](#features)
* [Setup/Installation](#installation)
* [To-Do](#future)
* [License](#license)

## <a name="tech-stack"></a>Tech Stack
__Frontend:__ HTML5, CSS, jQuery, Javascript, Ajax, Jinja2, Bootstrap <br/>
__Backend:__ Python, Flask, PostgreSQL, SQLAlchemy, Beautiful Soup, bcrypt <br/>
__External_Sources:__ jQCloud,Unsplash, hhursev/recipe-scraper* (*edited/modified for this project) <br/>
## <a name="features"></a>Features
click on the meal you want to see recipes for:
![View three options](/static/three_options.gif)
<br><br><br>
click to see all recipes by meal:
![View three options](/static/all_recipes.gif)
<br><br><br>
login to create user:
![View three options](/static/signup_signin.gif)
<br><br><br>
rate recipes:
![View three options](/static/rate_recipe.gif)
<br><br><br>
see recipes by all tags:
![View three options](/static/tag_cloud.gif)
<br><br><br>
## <a name="installation"></a>Setup/Installation 
####Requirements:
- PostgreSQL
- Python 2.7

To have this app running on your local computer, please follow the below steps:

Clone repository:
```
$ git clone https://github.com/JessicaRitter/reciMe.git
```
Create a virtual environment:
```
$ virtualenv env
```
Activate the virtual environment:
```
$ source env/bin/activate
```
Install dependencies:
```
$ pip install -r requirements.txt
```
## <a name="future"></a>TODO
* Add allergies to restrictions 
* Add rating predictions using k-nearest or pearson's
* Show best-of/highest rated recipes
* Allow users to add their own recipes
* Add custom dietary restrictions

## <a name="license"></a>License

