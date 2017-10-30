--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE ratings (
    rating_id integer NOT NULL,
    rating_score integer,
    recipe_id integer,
    user_id integer
);


ALTER TABLE ratings OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE ratings_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ratings_rating_id_seq OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE ratings_rating_id_seq OWNED BY ratings.rating_id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE recipes (
    recipe_id integer NOT NULL,
    recipe_url character varying(600) NOT NULL,
    recipe_title character varying(500) NOT NULL,
    recipe_source character varying(128),
    recipe_ingredients text NOT NULL,
    recipe_directions text
);


ALTER TABLE recipes OWNER TO vagrant;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE recipes_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_recipe_id_seq OWNER TO vagrant;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE recipes_recipe_id_seq OWNED BY recipes.recipe_id;


--
-- Name: tagrecipes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE tagrecipes (
    tagrecipe_id integer NOT NULL,
    tag_id integer,
    recipe_id integer
);


ALTER TABLE tagrecipes OWNER TO vagrant;

--
-- Name: tagrecipes_tagrecipe_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tagrecipes_tagrecipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tagrecipes_tagrecipe_id_seq OWNER TO vagrant;

--
-- Name: tagrecipes_tagrecipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tagrecipes_tagrecipe_id_seq OWNED BY tagrecipes.tagrecipe_id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE tags (
    tag_id integer NOT NULL,
    category character varying(128)
);


ALTER TABLE tags OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_id_seq OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tags_tag_id_seq OWNED BY tags.tag_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    email character varying(80),
    name character varying(24) NOT NULL,
    password character varying(60) NOT NULL,
    restrictions character varying(60)
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: rating_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings ALTER COLUMN rating_id SET DEFAULT nextval('ratings_rating_id_seq'::regclass);


--
-- Name: recipe_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY recipes ALTER COLUMN recipe_id SET DEFAULT nextval('recipes_recipe_id_seq'::regclass);


--
-- Name: tagrecipe_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tagrecipes ALTER COLUMN tagrecipe_id SET DEFAULT nextval('tagrecipes_tagrecipe_id_seq'::regclass);


--
-- Name: tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags ALTER COLUMN tag_id SET DEFAULT nextval('tags_tag_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY ratings (rating_id, rating_score, recipe_id, user_id) FROM stdin;
1	5	362	1
2	5	207	6
3	5	91	6
4	5	400	6
5	3	207	1
6	5	114	1
7	5	61	1
8	1	297	1
9	5	77	1
10	5	294	1
11	5	98	8
12	5	291	8
13	5	250	8
14	5	41	9
15	4	362	10
16	3	235	13
17	2	235	14
18	2	204	15
19	3	304	16
20	4	237	18
21	5	388	18
22	5	349	19
\.


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('ratings_rating_id_seq', 22, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY recipes (recipe_id, recipe_url, recipe_title, recipe_source, recipe_ingredients, recipe_directions) FROM stdin;
1	/moussaka	Moussaka Recipe 	 Bon Appetit	8 garlic cloves, finely grated, divided,½ cup plus 2 tablespoons extra-virgin olive oil,2 tablespoons chopped mint, divided,2 tablespoons chopped oregano, divided,3 medium eggplants (about 3½ pounds total), sliced crosswise into ½-inch-thick rounds,2½ teaspoons kosher salt, plus more,½ teaspoon freshly ground black pepper, plus more,2 pounds ground lamb,2 medium onions, chopped,1 3-inch cinnamon stick,2 Fresno chiles, finely chopped,1 tablespoon paprika,1 tablespoon tomato paste,¾ cup dry white wine,1 28-ounce can whole peeled tomatoes,6 tablespoons unsalted butter,½ cup all-purpose flour,2½ cups whole milk, warmed,¾ teaspoon kosher salt,4 ounces farmer cheese, crumbled (about 1 cup),2 ounces Pecorino or Parmesan, finely grated (about 1¾ cups), divided,3 large egg yolks, beaten to blend,	DIRECTIONS PreparationEggplant and LambPlace a rack in middle of oven; preheat to 475°. Whisk half of the garlic, ½ cup oil, 1 Tbsp. mint, and 1 Tbsp. oregano in a small bowl. Brush both sides of eggplant rounds with herb oil, making sure to get all the herbs and garlic onto eggplant; season with salt and pepper. Transfer eggplant to a rimmed baking sheet (it’s okay to pile the rounds on top of each other) and roast until tender and browned, 35–45 minutes. Reduce oven temperature to 400°.Meanwhile, heat remaining 2 Tbsp. oil in a large wide pot over high. Cook lamb, breaking up with a spoon, until browned on all sides and cooked through and liquid from meat is evaporated (there will be a lot of rendered fat), 12–16 minutes. Strain fat through a fine-mesh sieve into a clean small bowl and transfer lamb to a medium bowl. Reserve 3 Tbsp. lamb fat; discard remaining fat.Heat 2 Tbsp. lamb fat in same pot over medium-high (reserve remaining 1 Tbsp. lamb fat for assembling the moussaka). Add onion, cinnamon, 2½ tsp. salt, and ½ tsp. pepper and cook, stirring occasionally, until onion is tender and translucent, 8–10 minutes. Add chiles and remaining garlic and cook, scraping up any browned bits from the bottom of the pot, until onion is golden brown, about 5 minutes. Add paprika and tomato paste and cook until brick red in color, about 1 minute. Add wine and cook, stirring occasionally, until slightly reduced and no longer smells of alcohol, about 3 minutes. Add tomatoes and break up with a wooden spoon into small pieces (the seeds will shoot out at you if you’re too aggressive, so start slowly—puncture the tomato, then get your smash and break on!). Add lamb and remaining 1 Tbsp. mint and 1 Tbsp. oregano and cook, stirring occasionally, until most of the liquid is evaporated and mixture looks like a thick meat sauce, 5–7 minutes. Pluck out and discard cinnamon stick.Béchamel and AssemblyHeat butter in a medium saucepan over medium until foaming. Add flour and cook, whisking constantly, until combined, about 1 minute. Whisk in warm milk and bring sauce to a boil. Cook béchamel, whisking often, until very thick (it should have the consistency of pudding), about 5 minutes; stir in salt. Remove from heat and whisk in farmer cheese and half of the Pecorino. Let sit 10 minutes for cheese to melt, then add egg yolks and vigorously whisk until combined and béchamel is golden yellow.Brush a 13x9" baking pan with remaining 1 Tbsp. lamb fat. Layer half of eggplant in pan, covering the bottom entirely. Spread half of lamb mixture over eggplant in an even layer. Repeat with remaining eggplant and lamb to make another layer of each. Top with béchamel and smooth surface; sprinkle with remaining Pecorino.Bake moussaka until bubbling vigorously and béchamel is browned in spots, 30–45 minutes. Let cool 30 minutes before serving.Do Ahead: Moussaka can be baked 1 day ahead. Let cool, then cover and chill, or freeze up to 3 months. Thaw before reheating in a 250° oven until warmed through, about 1 hour.
2	/classic-cassoulet	Cassoulet Recipe 	 Bon Appetit	6 duck legs,6 tablespoons Diamond Crystal or 3 tablespoons plus 2½ teaspoons Morton kosher salt,4 sprigs thyme,4 garlic cloves, smashed,2 teaspoons black peppercorns,1 teaspoon juniper berries (optional),2 whole cloves,1 large onion, peeled, halved through root end,1½ pounds dried Tarbais, corona, or cannellini beans, soaked overnight, drained,8 ounces pancetta, in one thick piece,2 carrots, scrubbed, halved crosswise,1 head of garlic, halved crosswise,4 sprigs thyme,1 bay leaf,Kosher salt, freshly ground pepper,1½ pounds skinless, boneless pork shoulder, cut into 1-inch pieces,1½ teaspoons Diamond Crystal or 1 teaspoon Morton kosher salt, plus more,Freshly ground black pepper,2 tablespoons vegetable oil,1 large onion, peeled, chopped,1 large carrot, peeled, chopped,4 garlic cloves, finely chopped,4 sprigs thyme,1 bay leaf,1 14.5-ounce can crushed tomatoes,6 cups chicken stock or low-sodium chicken broth,Kosher salt, freshly ground pepper,1 pound fresh pork sausage, such as Toulouse, sweet Italian, or unsmoked kielbasa,3 cups medium-fine fresh breadcrumbs, divided,¼ cup finely chopped parsley,1 garlic clove, halved,1 pound precooked garlic sausage, sliced crosswise ¼ inch thick (optional),	DIRECTIONS PreparationDuck ConfitCure Legs (At Least 2 Days Ahead)Prick skin of duck legs all over with the tip of a paring knife. Rub legs all over with salt, making sure to massage into flesh and skin.Place legs in a large bowl and cover with plastic wrap, pressing directly onto legs. Rest a plate on top of legs and weight with several 28-oz. cans. Chill at least 12 hours and up to 24 hours.Note: If you are going to cook the ragù and beans and assemble the cassoulet tomorrow, soak the beans tonight.Confit Legs (At Least 1 Day Ahead)Preheat oven to 250°. Evenly scatter thyme, garlic, peppercorns, and juniper berries (if using) across a roasting pan and add 2 Tbsp. water.Unpack duck legs and remove from bowl. Rinse off salt and arrange skin side down over aromatics in roasting pan. Cover pan tightly with foil and weight legs with a cast-iron skillet or a heavy baking dish. Cook until fat cooks out of duck and legs are submerged, about 2 hours.Remove from oven and remove skillet and foil. Turn legs skin side up and nestle back into fat. Recover pan with foil and continue to cook legs, unweighted, until duck meat is very tender and bones wiggle easily in joints, 2–2½ hours longer.Let legs cool in fat until you can handle them, then transfer with tongs or a spider to a plate; set aside. Strain ¼ cup fat through a fine-mesh sieve into a small bowl and set aside; strain and reserve remaining fat for another use. Remove skin from duck legs, trying to keep whole pieces intact if possible; transfer skin to a small bowl or other container. Cover and chill. Pull duck meat from bones, breaking into 2" pieces; discard bones and cartilage. Place meat in a medium bowl or other container; cover and chill. You won’t need the skin or meat until you’re ready to assemble the cassoulet.Do Ahead: Duck legs can be confited 3 weeks ahead. Transfer legs to a large nonreactive vessel. Strain fat through a fine-mesh sieve over meat. Cover and chill. Let come to room temperature before using. Meat and skin can be prepared 3 days ahead; keep chilled.BeansCook Beans (At Least 1 Day Ahead)Stick a clove into each onion half. Place in a large pot along with beans, pancetta, carrots, garlic, thyme, and bay leaf; pour in cold water to cover beans by 2". Season with several grinds of pepper and bring to a gentle simmer. Partially cover and cook, skimming occasionally and adding more water as needed to keep beans submerged and seasoning with a couple of pinches of salt after about 30 minutes, until beans are tender but still intact, 45–60 minutes for cannellini and 1–1½ hours for Tarbais and corona. Remove from heat; pluck out and discard onion, carrots, garlic, thyme, and bay leaf. Remove pancetta; let cool slightly, then cut into 1x¼" strips. Add back to pot and let cool.Pork RagùCook Ragù (At Least 1 Day Ahead)Meanwhile, sprinkle pork shoulder with 1½ tsp. Diamond Crystal or 1 tsp. Morton kosher salt and several grinds of pepper. Heat oil in a large Dutch oven over medium-high. Working in 2 batches, cook pork, turning once, until browned all over, 10–12 minutes per batch; transfer to a plate as you go.Reduce heat to medium and place onion, carrot, and garlic in same skillet; season with salt and pepper. Cook, stirring occasionally, until lightly browned, 8–10 minutes. Return pork shoulder back to pot and add thyme, bay leaf, tomatoes, and stock. Bring to a boil. Reduce heat, partially cover pot, and simmer gently, skimming fat occasionally, until meat is fork-tender, 1¾–2 hours. Pluck out and discard thyme and bay leaf. Let ragù cool slightly.Combine Beans and Ragù (At Least 1 Day Ahead)Using a slotted spoon, transfer bean mixture to pot with ragù. Add cooking liquid from beans to cover; reserve remaining bean cooking liquid. Let ragù mixture cool completely; cover and chill at least 12 hours.Do Ahead: Ragù and beans can be combined 2 days ahead. Keep chilled.AssemblyTemper and Season Ragù MixtureRemove ragù mixture from refrigerator and skim fat from surface; discard. Cover and bring to a gentle simmer over medium-low heat. Taste and season conservatively with salt and pepper if needed (the duck will add considerable saltiness when mixed in).Prepare Sausage and BreadcrumbsRemove reserved duck meat and skin from refrigerator and let meat sit until room temperature.Arrange skin in a single layer in an 8-qt. Dutch oven or other heavy pot (the same one you’ll cook the cassoulet in). Cook over low heat, turning occasionally, until golden brown and crisp, 20–30 minutes. Transfer to paper towels and blot away excess oil; set aside.Prick pork sausages all over and cook in same pot, turning occasionally, until browned all over and cooked through, 12–15 minutes. Transfer to a plate and let cool slightly. Cut sausages into 2" pieces and set aside.Add breadcrumbs to pot and cook, stirring often, until golden in spots and starting to crisp, about 5 minutes. If breadcrumbs seem very dry or are sticking, add 1–2 Tbsp. reserved duck fat. Transfer breadcrumbs to a large bowl and let cool slightly. Toss with parsley and set aside. Wipe out pot and let cool.Layer CassouletRub inside of Dutch oven with cut sides of garlic; ladle in one-third of ragù mixture. Top with half of pork sausage, garlic sausage, and duck meat, then another third of ragù mixture. Top with remaining duck meat and sausages, then remaining ragù mixture. Liquid should come to top of beans. Add reserved bean cooking liquid if needed.Do Ahead: Cassoulet can be assembled 1 day ahead; cover and chill. Bring to room temperature before proceeding. Store breadcrumbs and duck skin separately, airtight at room temperature.Bake CassouletPreheat oven to 375°. Scatter two-thirds of breadcrumb mixture over cassoulet. Bake, uncovered, until a golden crust forms, 25–30 minutes. Remove from oven and use a spoon to break up crust, pressing very gently so crust absorbs a little liquid; smooth surface. Bake until another crust forms, 25–30 minutes; break up again. Repeat process 2 more times (for a total of 4 times). If mixture starts to look dry, moisten with a bit of reserved bean cooking liquid when breaking up the crust.Top cassoulet with remaining breadcrumb mixture; bake until golden brown, 15–20 minutes. Let cassoulet rest at least25 minutes before serving.Divide cassoulet among bowls and crumble crispy duck skin over top.
3	/crepe-cake-with-cardamom	Crepe Cake with Whipped Cream Recipe 	 Bon Appetit	4½ cups whole milk,2½ cups heavy cream,5 tablespoons unsalted butter, cut into pieces,Zest of 1 medium orange,¾ teaspoon ground cardamom,¼ teaspoon kosher salt,1 vanilla bean, split lengthwise,10 large egg yolks,1 cup granulated sugar,¼ cup cornstarch,4 large eggs, room temperature,4 cups whole milk,⅔ cup granulated sugar,1 teaspoon vanilla extract,2⅓ cups all-purpose flour,½ teaspoon kosher salt, plus more,4 tablespoons unsalted butter, melted, divided,1½ cups heavy whipping cream,3 tablespoons powdered sugar,2 teaspoons orange sanding sugar (optional),	DIRECTIONS PreparationCustardCombine milk, cream, butter, orange zest, cardamom, and salt in a large saucepan. Scrape in seeds from vanilla bean and add pod. Bring to a simmer over medium heat, stirring occasionally, and cook until butter is melted and mixture is warm.Meanwhile, whisk egg yolks and granulated sugar in a medium bowl until light and very pale, about 3 minutes. Add cornstarch and whisk until no dry spots remain. Whisking constantly, gradually add warm milk mixture. Pour mixture back into saucepan and cook over medium-high heat, whisking constantly, until custard is thick and pudding-like in consistency and just beginning to boil, 5–7 minutes.Strain custard through a fine-mesh sieve into a clean medium bowl, using a heatproof rubber spatula to help press it through; discard solids. Cover with plastic wrap, pressing directly onto surface, and chill until cold, at least 2 hours.Do Ahead: Custard can be made 2 days ahead. Keep chilled.Crepes and AssemblyBlend eggs, milk, granulated sugar, and vanilla in a blender until smooth and frothy. Add flour and ½ tsp. salt and blend just to combine. Transfer to a large measuring cup, cover, and chill at least 1 hour.Heat a large nonstick skillet over medium, then brush lightly with some butter. Whisk batter to reincorporate and ladle ¼-cupful into skillet. Working quickly, swirl pan to evenly coat and cook crepe, reducing heat if browning too quickly, until bubbles form on surface and edges are light golden, about 2 minutes. Slide a spatula underneath to loosen and carefully flip. Cook on other side until a few brown spots appear, 15–30 seconds; transfer to a flat plate. Repeat with remaining butter and batter, stacking crepes on plate as you go (you should have 25 total). Let crepes cool.Place 1 crepe in the center of a flat plate or cake platter. Dollop a scant ⅓ cup custard over. Using a small offset spatula, carefully spread custard across entire surface of crepe. Repeat process with remaining custard and all but 1 crepe. Place remaining crepe on top, then lightly cover cake with plastic. Chill 2 hours.Using an electric mixer on medium-high speed, beat cream, powdered sugar, and a pinch of salt in a medium bowl until medium peaks form. Pile whipped cream on top of crepe cake, making decorative swooshes with a spoon. Sprinkle with sanding sugar, if desired.Do Ahead: Batter can be made 2 days ahead; keep chilled. Crepes can be cooked 1 day ahead; cover and chill. Cake (without whipped cream and sanding sugar) can be assembled 1 day ahead; keep chilled. Top with whipped cream and sanding sugar, if using, just before serving.
4	/cast-iron-roast-chicken-with-crispy-potatoes	Cast-Iron Roast Chicken with Crispy Potatoes Recipe 	 Bon Appetit	1 3½–4-pound whole chicken,Kosher salt,1½ pounds russet potatoes, scrubbed, thinly sliced crosswise,2 tablespoons unsalted butter, melted,1 tablespoon thyme leaves,2 tablespoons olive oil, divided,Freshly ground black pepper,	DIRECTIONS PreparationPat chicken dry with paper towels and season generously with salt, inside and out. (We use 1 tsp. Diamond Crystal or ½ tsp. Morton kosher salt per lb.) Tie legs together with kitchen twine. Let sit 1 hour to allow salt to penetrate, or chill, uncovered, up to 1 day ahead.Place a rack in upper third of oven and set a 12" cast-iron skillet or 3-qt. enameled cast-iron baking dish on rack. Preheat oven to 425°.Meanwhile, toss potatoes, butter, thyme, and 1 Tbsp. oil in a large bowl to coat; season with salt and pepper.Once oven reaches temperature, pat chicken dry with paper towels and lightly coat with half of remaining oil; sprinkle with dry rub, if using. Drizzle remaining oil into hot skillet (this helps keep the chicken from sticking and tearing the skin). Place chicken in the center of skillet and arrange potatoes around. Roast until potatoes are golden brown and crisp and an instant-read thermometer inserted into the thickest part of breasts registers 155°, 50–60 minutes (temperature will climb to 165° as chicken rests). Let chicken rest in skillet at least 20 minutes and up to 45 minutes.Transfer chicken to a cutting board and carve. Serve with potatoes.
5	/cast-iron-roast-chicken-with-winter-squash-red-onions-and-pancetta	Cast-Iron Roast Chicken with Winter Squash, Red Onions, and Pancetta Recipe 	 Bon Appetit	1 3½–4-pound whole chicken,Kosher salt,2 tablespoons unsalted butter, melted,2 red onions, cut into wedges through root end,2 pound winter squash (such as delicata), cut into 1½-inch-thick wedges or rounds,1½ ounces pancetta, chopped into ¼-inch pieces,3 tablespoons olive oil, divided,Freshly ground black pepper,	DIRECTIONS PreparationPat chicken dry with paper towels and season generously with salt, inside and out. (We use 1 tsp. Diamond Crystal or ½ tsp. Morton kosher salt per lb.) Tie legs together with kitchen twine. Let sit 1 hour to allow salt to penetrate, or chill, uncovered, up to 1 day ahead.Place a rack in upper third of oven and set a 12" cast-iron skillet or 3-qt. enameled cast-iron baking dish on rack. Preheat oven to 425°.Meanwhile, toss onions, squash, pancetta, and 2 Tbsp. oil in a large bowl to coat; season with salt and pepper.Once oven reaches temperature, pat chicken dry with paper towels and lightly coat with half of remaining oil; sprinkle with dry rub, if using. Drizzle remaining oil into hot skillet (this helps keep the chicken from sticking and tearing the skin). Place chicken in the center of skillet and arrange squash mixture around. Roast until vegetables are golden brown and tender and an instant-read thermometer inserted into the thickest part of breasts registers 155°, 50–60 minutes (temperature will climb to 165° as chicken rests). Let chicken rest in skillet at least 20 minutes and up to 45 minutes.Transfer chicken to a cutting board and carve. Serve with vegetables.
6	/cast-iron-roast-chicken	Cast-Iron Roast Chicken Recipe 	 Bon Appetit	1 3½–4-pound whole chicken,Kosher salt,1 tablespoon olive oil,	DIRECTIONS PreparationPat chicken dry with paper towels and season generously with salt, inside and out. (We use 1 tsp. Diamond Crystal or ½ tsp. Morton kosher salt per lb.) Tie legs together with kitchen twine. Let sit 1 hour to allow salt to penetrate, or chill, uncovered, up to 1 day ahead.Place a rack in upper third of oven and set a 12" cast-iron skillet or 3-qt. enameled cast-iron baking dish on rack. Preheat oven to 425°. Once oven reaches temperature, pat chicken dry with paper towels and lightly coat with half of the oil. Drizzle remaining oil into hot skillet (this helps keep the chicken from sticking and tearing the skin). Place chicken in skillet and roast until an instant-read thermometer inserted into the thickest part of breasts registers 155°, 50–60 minutes (temperature will climb to 165° as chicken rests). Let chicken rest in skillet at least 20 minutes and up to 45 minutes.Transfer chicken to a cutting board and carve legs off, followed by breasts.
7	/apple-cider-syrup	Apple Cider Syrup Recipe 	 Bon Appetit	1 cup apple cider,1 cup sugar,	DIRECTIONS PreparationBring cider and sugar to a boil in a small saucepan, reduce heat, and simmer, stirring occasionally, until sugar dissolves. Let cool, then transfer to an airtight container. Cover and chill.Do aheadApple Cider Syrup can be made 1 week ahead. Keep chilled.
76	/chocolate-guinness-float	Chocolate Guinness Float Recipe 	 Bon Appetit	3 scoops chocolate ice cream,1 ounce simple syrup,4 ounces Guinness stout,	DIRECTIONS PreparationPlace ice cream in a tall glass. Pour simple syrup over and top off with Guinness. Serve with a straw and a long spoon.
8	/classic-applesauce	Applesauce Recipe 	 Bon Appetit	4 pounds any combination of apples (about 8 large), rinsed, halved or quartered,1 3-inch cinnamon stick,2 tablespoons fresh lemon juice,1 vanilla bean, split lengthwise, or 1 teaspoon vanilla extract,A food mill,	DIRECTIONS PreparationCombine apples, cinnamon stick, lemon juice, salt, and ¼ cup water in a large Dutch oven or other heavy pot. Scrape in seeds from vanilla bean and add pod. Cover pot and cook over medium-low heat, occasionally stirring with a wooden spoon and checking to make sure apples are not scorching (add a splash of water if they are), until apples are soft and falling apart, 35–45 minutes. Uncover pot and let apples cool slightly.Working in batches, pass apples through food mill fitted with a medium disk into a large bowl; discard solids. If sauce is watery, return to pot and simmer over medium heat until thickened.Do Ahead: Applesauce can be made 4 days ahead. Let cool; cover and chill.
9	/pork-tenderloin-with-golden-beets	Pork Tenderloin with Golden Beets Recipe 	 Bon Appetit	¼ cup walnuts,3 tablespoons plus ½ cup olive oil,1½ pounds pork tenderloin,2 medium onions, coarsely chopped,3 medium golden beets, scrubbed, cut into bite-size pieces,4 garlic cloves, chopped,2 cups sauerkraut, plus ½ cup brine,1 cup low-sodium chicken broth,½ cup dry white wine,4 tablespoons fresh lemon juice, divided,½ cup finely chopped mint,½ cup finely chopped parsley,¼ cup finely chopped dried tart apricots,	DIRECTIONS PreparationPreheat oven to 350°. Toast walnuts on a rimmed baking sheet, tossing once, until golden brown, 7–10 minutes. Let cool, then chop.Heat 3 Tbsp. oil in a large skillet over medium-high. Season pork loin (look for one with a nice dark color and some fat on it) with salt and cook until browned on all sides, 10–15 minutes. Transfer pork to a platter.Add onions and beets to same skillet and cook, stirring often, until onions are slightly translucent and browned, 10–12 minutes; season with salt and pepper. Add garlic, sauerkraut, brine, broth, wine, and 2 Tbsp. lemon juice and bring to a simmer. Cover skillet, reduce heat to low, and cook until beets are fork-tender, 25–30 minutes.Return pork to skillet and push down into liquid. Turn heat up to medium and simmer, uncovered, turning meat occasionally until an instant-read thermometer inserted into the thickest part of loin registers 150°, 20–30 minutes. Transfer pork to a cutting board and let rest 5 minutes before slicing.Meanwhile, mix walnuts, mint, parsley, apricots, remaining 2 Tbsp. lemon juice, and remaining ½ cup oil in a small bowl; season with salt and pepper.Spoon beet mixture onto plates and arrange sliced pork on top. Spoon a generous amount of walnut sauce over.
10	/sambal-short-rib-stir-fry	Short Rib Stir-Fry Recipe 	 Bon Appetit	3 tablespoons toasted sesame oil,1 pound boneless beef short ribs, thinly sliced against the grain,2 small onions, thinly sliced,8 ounces shiitake mushrooms, stems removed, caps thinly sliced,1 bunch scallions, cut into 1-inch pieces,1 2-inch piece ginger, peeled, finely grated,4 garlic cloves, finely grated,¼ cup sambal oelek,1 tablespoon mirin,6 medium radishes, trimmed, quartered,6 ounces snow peas,1 cup low-sodium chicken broth,1 cup torn basil leaves,	DIRECTIONS PreparationHeat oil in a wok or large cast-iron skillet over high. Season beef with salt and pepper and cook, tossing and stirring often, until deeply browned, 8–10 minutes. At first meat might seem wet but it will eventually take on color and look shiny. Add onions and mushrooms and cook, tossing around, until they soften and start to take on a little color, 6–8 minutes. Add scallions, ginger, and garlic and cook, tossing constantly, until slightly wilted, about 2 minutes. Add sambal oelek and mirin and cook, tossing to coat, about 1 minute. Add radishes, snow peas, and broth and bring to a boil. Cook until liquid is reduced by half and meat and vegetables are glossy and saucy, about 5 minutes. Season with salt and pepper. Serve stir-fry over rice topped with basil.
11	/spaghetti-and-meatballs	Spaghetti and Meatballs Recipe 	 Bon Appetit	2 28-ounce cans whole peeled tomatoes in juice, drained, juice reserved, tomatoes finely chopped,1/2 cup (1 stick) unsalted butter,2 medium onions, peeled, halved through root end,1/2 teaspoon (or more) salt,1 cup fresh breadcrumbs made from crustless French or country-style bread,1/3 cup whole milk,8 ounces ground beef (15% fat),8 ounces ground pork,1 cup finely ground (not grated) Parmesan cheese,1/3 cup finely chopped Italian parsley,1 teaspoon salt,1/4 teaspoon freshly ground black pepper,2 large eggs,2 large garlic cloves, pressed,1 pound spaghetti,Freshly grated Parmesan cheese (for serving),	DIRECTIONS PreparationPREP:  1TOTAL: 2SauceCombine tomatoes with juice, butter, onions, and salt in large wide pot. Bring to simmer over medium heat. Reduce heat; simmer uncovered 45 minutes, stirring occasionally. Discard onions. Using immersion blender, process sauce briefly to break up any large pieces of tomato (texture should be even but not completely smooth). Season sauce with more salt and freshly ground black pepper. Remove from heat.MeatballsCombine breadcrumbs and milk in small bowl; stir until breadcrumbs are evenly moistened. Let stand 10 minutes.Place beef and pork in large bowl and break up into small chunks. Add 1 cup ground Parmesan, parsley, salt, and pepper.Whisk eggs to blend in small bowl; whisk in garlic. Add to meat mixture.Using hands, squeeze milk from breadcrumbs, reserving milk. Add breadcrumbs to meat mixture. Using hands, quickly and gently mix meat mixture just until all ingredients are evenly combined (do not overmix). Chill mixture at least 15 minutes and up to 1 hour.Moisten hands with some of reserved milk from breadcrumbs, then roll meat mixture between palms into golf-ball-size balls, occasionally moistening hands with milk as needed and arranging meatballs in single layer in sauce in pot. Bring to simmer. Reduce heat to medium-low, cover, and simmer until meatballs are cooked through, 15 to 20 minutes. DO AHEAD Can be made 2 days ahead. Cool slightly. Chill uncovered until cold, then cover and keep chilled. Rewarm before continuing.Cook spaghetti in large pot of boiling salted water until just tender but still firm to bite, stirring occasionally. Drain.Using slotted spoon, transfer meatballs to platter. Add pasta to sauce in pot and toss to coat. Divide pasta among 6 plates. Top each serving with meatballs. Sprinkle meatballs with freshly grated Parmesan cheese and serve.
12	/curried-chicken-drumsticks	Curried Chicken Drumsticks Recipe 	 Bon Appetit	3 tablespoons ghee or virgin coconut oil,8 chicken drumsticks,2 large onions, chopped,4 garlic cloves, thinly sliced,1 lemongrass stalk, crushed (optional),3 tablespoons vadouvan or any yellow curry powder,¼ teaspoon cayenne pepper,2 cups low-sodium chicken broth,1 13.5-ounce can unsweetened coconut milk,1 cup cilantro leaves with tender stems, divided,1 14-ounce package rice noodles,	DIRECTIONS PreparationHeat ghee in a large skillet, preferably cast iron, over medium-high. Season chicken with salt and pepper and cook, turning occasionally, until skin is golden brown and crisp, 8–10 minutes. Transfer to a plate (it will not be cooked through).Add onions to same skillet and cook, stirring occasionally, until softened and golden, 6–8 minutes. Add garlic, lemongrass (if using), vadouvan, and cayenne and cook, stirring often, until fragrant, about 2 minutes. Add broth, coconut milk, lime juice, and ½ cup cilantro, then return chicken to skillet and gently push down into liquid. Bring to a boil, then reduce heat and simmer, uncovered, until chicken is tender and cooked through and sauce is thickened, 40–45 minutes. Be sure to turn chicken a couple of times while it’s cooking so all sides get exposed to the curry sauce.Just before chicken is done, cook noodles according to package directions. Rinse noodles under warm water, then toss in a large bowl with a little bit of the curry sauce. This will help to prevent them from sticking.Divide noodles among shallow bowls. Place drumsticks on top and ladle curry sauce over. Top with crispy shallots and remaining ½ cup cilantro. Serve with lime wedges for squeezing over.
13	/millet-couscous-roasted-carrots	Millet Couscous with Roasted Carrots Recipe 	 Bon Appetit	4 tablespoons olive oil, divided, plus more for drizzling,1 cup millet,½ teaspoon cumin seeds,2 ¼ cups low-sodium chicken broth,6 medium carrots, peeled, cut into 1” pieces,Kosher salt, freshly ground pepper,¼ cup roasted almonds, chopped,¼ teaspoon cayenne pepper,¼ cup fresh cilantro leaves with tender stems,Lemon wedges (for serving),	DIRECTIONS PreparationPreheat oven to 400°. Heat 1 Tbsp. oil in a medium saucepan over medium-high heat. Add millet and cumin seeds and cook, stirring, until beginning to brown, about 2 minutes. Add broth and bring to a boil. Reduce heat, cover, and simmer, stirring occasionally, until millet is tender, 25–35 minutes.Meanwhile, toss carrots with 2 Tbsp. oil on a rimmed baking sheet; season with salt and pepper. Roast until tender and golden brown, 15–20 minutes.Heat remaining 1 Tbsp. oil in a small skillet over medium-low heat; cook almonds and cayenne, stirring occasionally, until fragrant, about 2 minutes.Serve millet drizzled with oil and topped with carrots, cilantro, almond mixture.
14	/garlic-and-achiote-fermented-hot-sauce	Fermented Hot Sauce Recipe 	 Bon Appetit	2 garlic cloves,1 pound fresh red chiles (such as cayenne, Fresno, or Holland), coarsely chopped,3 tablespoons kosher salt,3 tablespoons sugar,1 cup olive oil,3 tablespoons achiote (annatto) seeds,2 teaspoons smoked paprika,¾ cup distilled white vinegar,A 1-pint glass jar; a layer of cheesecloth,Achiote seeds can be found in specialty stores, in the spice section of some supermarkets, and online.,	DIRECTIONS PreparationPulse garlic in a food processor until finely chopped. Add chiles, salt, and sugar and pulse until chile pieces are no bigger than ½". Transfer mixture to jar and press down so chiles are slightly submerged in their own liquid. Cover with cheesecloth and fasten with kitchen twine or a rubber band. Let sit in a cool place away from direct sunlight at least 2 days and up to 5 days. The liquid will develop a slightly sour smell and there should be small bubbles scattered throughout. The longer you let it ferment, the more active it will become, but don’t go longer than 5 days.Heat oil, achiote seeds, and paprika in a small saucepan over medium-high. As soon as small bubbles appear around the edges of the pan (2–3 minutes), let cook another 30 seconds; let cool. Strain oil through a fine-mesh sieve into a heatproof bowl; discard solids.Blend achiote oil, vinegar, and two-thirds of chile mixture in a blender until smooth. Transfer to an airtight container and stir in remaining chile mixture.Do Ahead: Hot sauce can be made 2 weeks ahead; cover and chill.
15	/fennel-rubbed-leg-of-lamb-with-salsa-verde	Fennel-Rubbed Leg of Lamb with Salsa Verde Recipe 	 Bon Appetit	1 4–5-pound butterflied boneless leg of lamb, rolled, tied,3 tablespoons fennel seeds,4 teaspoons crushed red pepper flakes,4 garlic cloves, finely grated,3 tablespoons plus ¼ cup olive oil,2½ pounds small or medium carrots with tops,½ cup finely chopped parsley,¼ cup finely chopped chives,2 tablespoons (or more) fresh lemon juice,2 tablespoons olive oil,A spice mill or mortar and pestle,	DIRECTIONS PreparationLambSeason lamb generously with salt and pepper; let it sit out at room temperature while you prepare the rub.Using spice mill or mortar and pestle, coarsely grind fennel seeds and red pepper flakes. Transfer to a small bowl and mix in garlic and 3 Tbsp. oil. Evenly rub lamb all over with spice mixture, making sure to work it into every nook and cranny.Preheat oven to 300°. Heat remaining ¼ cup oil in a large heavy skillet over medium. As soon as oil is hot and shimmering, add lamb to skillet and cook, carefully pouring off fat as needed into a small bowl (reserve it), until golden brown all over, 3–5 minutes per side. The goal here is to cook out some of the excess fat while you brown the meat, so it’s important to maintain a moderate heat to keep the meat from getting dark before the fat can melt out. If the oil looks really dark or tastes burned, discard it and use olive oil in the next step.Trim tops from carrots and set aside for making the salsa verde. Scrub carrots, pat dry, and scatter along the outer edges of a large rimmed baking sheet. Place seared lamb in the center. Pour reserved fat and any fat still in skillet (don’t forget to scrape out the crispy bits stuck to the bottom of the pan) over carrots, season with salt and pepper, and toss to coat.Roast lamb and carrots until an instant-read thermometer inserted into the center of leg registers 135° for medium-rare, 75–90 minutes. Transfer lamb to a cutting board and tent with foil; let rest 20 minutes. Leave oven on.Salsa Verde and AssemblyWhile the lamb is resting, transfer carrots to a platter, then carefully pour any juices from the baking sheet into a small bowl (you should have about ¼ cup; if you don’t, top off with olive oil). Transfer carrots back to baking sheet and pop back into oven. Roast 5 minutes to reheat.Meanwhile, finely chop reserved carrot tops to make ½ cup; discard remaining tops. Place in a small bowl and mix in parsley, chives, lemon juice, pan juices, and 2 Tbsp. oil. Season with salt and pepper and more lemon juice if needed.Remove twine from lamb and slice about ½" thick (but you can really go as thick or thin as you would like). Arrange on a platter and serve with warm roasted carrots and salsa verde alongside.
16	/marinated-anchovies-with-bread-and-butter	Marinated Anchovies with Bread and Butter Recipe 	 Bon Appetit	1 4–5-ounce jar oil-packed anchovies, drained,1 tablespoon distilled white vinegar,2 peperoncini, thinly sliced, or ½ red Fresno chile, thinly sliced, or ¾ teaspoon crushed red pepper flakes,1 lemon,2 tablespoons olive oil,½ cup (1 stick) unsalted butter, room temperature,8 slices seedy whole wheat bread, each cut into 4 triangles,	DIRECTIONS PreparationPlace anchovies in a shallow dish or small serving bowl and drizzle vinegar over. Let sit 5 minutes, then add peperoncini. Finely grate zest from half of lemon over anchovies. Slice lemon in half and squeeze in juice from both halves; drizzle with oil.Scoop butter into a small dish and sprinkle generously with salt and pepper if desired. Serve marinated anchovies with bread and butter alongside.
17	/chewy-no-bake-grain-and-oat-bars	Chewy No-Bake Grain and Oat Bars Recipe 	 Bon Appetit	4 tablespoons unsalted butter, cut into pieces, plus more,4 cups mixed unsweetened puffed grain cereal (such as corn, rice, kamut, and/or millet),1 cup old-fashioned oats,1½ cups dried fruit, nuts, seeds, unsweetened shredded coconut or coconut flakes, and/or chocolate chips, chopped if large,⅓ cup (packed) light brown sugar,⅓ cup honey,½ teaspoon kosher salt,⅓ cup creamy nut butter (such as cashew, almond, or peanut),1 teaspoon vanilla extract,	DIRECTIONS PreparationButter a 13x9" baking dish. Toss puffed cereals, oats, and dried fruits, nuts, seeds and/or coconut (all mix-ins except chocolate chips) in a large bowl with your hands to evenly distribute.Bring brown sugar, honey, salt, and 4 Tbsp. butter to a boil in a small saucepan and let cook 1 minute. Remove from heat and whisk in nut butter and vanilla until smooth. Drizzle over puffed rice mixture and stir with a large rubber spatula until everything is evenly coated. If using chocolate chips, let mixture cool about 5 minutes before mixing in.Scrape mixture into prepared dish and press and compact down into an even layer with buttered hands. Let cool at least 1 hour before cutting into bars.Do Ahead: Bars can be made 1 week ahead. Store airtight at room temperature.
18	/iceberg-salad-with-italian-dressing	Salad with Italian Dressing Recipe 	 Bon Appetit	½ cup olive oil,5 tablespoons white wine vinegar,1 tablespoon mayonnaise,1 tablespoon sugar,1½ teaspoons dried oregano,1 garlic clove, finely grated,1 small head of iceberg lettuce,½ small red onion, sliced into rings,2 ounces provolone piccante cheese, thinly sliced,1 cup drained small mozzarella balls, torn,10 peperoncini, halved if large,	DIRECTIONS PreparationWhisk oil, vinegar, mayonnaise, sugar, oregano, and garlic in a small bowl. Season with salt and pepper.Cut lettuce in half through stem end. Tear apart into large pieces. Arrange on a platter and scatter onion, provolone, mozzarella, and peperoncini over, nestling in among leaves. Drizzle with dressing to coat to your liking (you’ll probably have some extra) and top with more black pepper.Do Ahead: Dressing can be made 1 week ahead. Cover and chill.
19	/aperol-kombucha-cocktail	Aperol-Kombucha Cocktail Recipe 	 Bon Appetit	2 cups gin, tequila, or mezcal,1½ cups Aperol,1 16-ounce bottle chilled kombucha, preferably ginger or lemon flavored,4 12-ounce cans chilled club soda,2 tangerines or oranges, halved through stem ends, thinly sliced,	DIRECTIONS PreparationCombine gin, Aperol, and kombucha in a large pitcher or glass jar and stir well.To make each cocktail, fill a small glass with ice and pour in gin mixture to come up halfway. Top off with club soda and finish with a few dashes of bitters and a tangerine slice or 2.
94	/pork-enchiladas-rojas	Pork Enchiladas Rojas Recipe 	 Bon Appetit	1 teaspoon coriander seeds,2 tablespoons cumin seeds,14 guajillo chiles, seeds removed,4 ancho chiles, seeds removed,3 morita chiles,4 cups homemade chicken stock or low-sodium chicken broth,8 garlic cloves, peeled,2 tablespoons tomato paste,1 teaspoon crushed Mexican or Italian oregano,1 tablespoon vegetable oil,1 pound boneless pork shoulder (Boston butt), fat trimmed,Kosher salt,2 bay leaves,1 cup vegetable oil,8 6-inch white corn tortillas,10 ounces queso fresco, crumbled, plus more for serving,1 avocado,2 tablespoons sour cream,1 tablespoon fresh lime juice,Kosher salt,½ onion, sliced into thin rings,Lime wedges (for serving),A spice mill or mortar and pestle,	DIRECTIONS PreparationSauce and FillingToast coriander seeds in a small skillet over medium heat, swirling pan often and adding cumin seeds during the last 30 seconds of cooking, until fragrant, about 2 minutes. Let cool, then finely grind in spice mill or with mortar and pestle.Bring guajillo, ancho, and morita chiles and stock to a boil in a medium saucepan over medium-high heat. Cover, remove from heat, and let sit 30 minutes to let chiles soften.Transfer chile mixture to a blender and add toasted spices, garlic, tomato paste, and oregano and purée until smooth, about 2 minutes.Preheat oven to 250°. Heat oil in a medium heavy pot over medium-high. Season pork with salt and cook, turning occasionally, until browned on all sides, 10–12 minutes. Pour off excess oil and add chile purée and bay leaves. Bring to a boil, cover, and transfer to oven. Braise pork until meat is very tender and shreds easily, 1 ½–2 hours; season with salt.Skim excess fat from chile sauce; discard bay leaves. Transfer pork to a large bowl. Let cool slightly, then shred with 2 forks. Mix ½ cup chile sauce into pork; season with salt. Set remaining sauce aside.Do Ahead: Pork can be braised 3 days ahead. Let cool in chile sauce (do not shred); cover and chill.AssemblyPreheat oven to 425°. Heat oil in a medium skillet over medium-high until it bubbles immediately when edge of tortilla touches the surface. Working one at a time, fry tortillas until just starting to brown and crisp, about 10 seconds per side (they should still be somewhat pliable). Transfer to paper towels to drain.Dip both sides of each tortilla in chile sauce just to coat, then transfer to a rimmed baking sheet. Spread 1 cup sauce down the length of a 13x9" baking dish. Spoon ¼ cup pork mixture across the center of a tortilla and fold one side over filling, then continue to roll up tortilla. Place seam side down in prepared baking dish. Repeat with more sauce and remaining tortillas (enchiladas should be nestled right up against each other in pan). Top with cheese and remaining sauce. Bake until sauce is bubbling and cheese is beginning to brown, 15–20 minutes. Let sit 10 minutes.Meanwhile, purée avocado, sour cream, lime juice, and ¼ cup water in a food processor, adding more water to thin as needed, until smooth and creamy; season with salt.Top enchiladas with onion slices and drizzle with avocado cream. Serve with lime wedges for squeezing over.
20	/grain-salad-with-olives-and-whole-lemon-vinaigrette	Grain Salad with Olives Recipe 	 Bon Appetit	2 cups unhulled farro or spelt,2 cups green olives,1 lemon, halved, seeds removed, finely chopped (peel and flesh), plus more juice if desired,2 medium shallots, finely chopped,½ cup olive oil,2 cups coarsely chopped mint and/or cilantro,2 cups coarsely chopped parsley,	DIRECTIONS PreparationCook farro in a large wide pot over medium heat, stirring often, until golden brown and toasted (it should start to smell like popcorn), about 4 minutes. Remove pot from heat and pour in cold water to cover grains by 1"; throw in a generous amount of salt (a healthy handful should do it). Set pot over medium-high heat and bring water to a boil. Reduce heat and simmer, skimming surface occasionally of any foam that may rise to the top, until grains are tender but still have some bite, 25–35 minutes. Drain and transfer farro to a large bowl.Meanwhile, using the side of a chef’s knife, coarsely crush olives to break them up into large craggy pieces; discard pits. Place in a large bowl and add chopped lemon and shallots. Toss to combine; season with salt and pepper. Let mixture sit 5 minutes to allow shallots to slightly pickle and flavors to meld.Heat oil in a small saucepan over medium. Add olive mixture and cook, swirling occasionally, until ingredients are warmed through and shallots are slightly softened, about 4 minutes. Scrape vinaigrette into bowl with farro and toss to combine. Taste grain salad and season with salt, pepper, and a little lemon juice if you want.Just before you’re ready to eat, fold herbs into salad.Do Ahead: Grains can be cooked 1 day ahead; let cool, then cover and chill. Salad (without herbs) can be made 6 hours ahead; cover and chill.
21	/the-antipasti-plate	The Antipasti Plate Recipe 	 Bon Appetit	5 thin slices hard salami,2 ounces hard cheese (such as Parmesan), cut into ½” pieces,¼ cup assorted olives,8 cherry tomatoes,8 crackers,	DIRECTIONS PreparationPack salami, cheese, olives, and tomatoes in separate containers. Place crackers in a small resealable plastic bag to keep them crisp.
22	/cast-iron-roast-chicken-with-caramelized-leeks	Cast-Iron Roast Chicken with Caramelized Leeks Recipe 	 Bon Appetit	1 3½–4-pound whole chicken,Kosher salt,3 leeks, white and pale green parts only, halved lengthwise,3 tablespoons olive oil, divided,Freshly ground black pepper,	DIRECTIONS PreparationPat chicken dry with paper towels and season generously with salt, inside and out. (We use 1 tsp. Diamond Crystal or ½ tsp. Morton kosher salt per lb.) Tie legs together with kitchen twine. Let sit 1 hour to allow salt to penetrate, or chill, uncovered, up to 1 day ahead.Place a rack in upper third of oven and set a 12” cast-iron skillet or 3-qt. enameled cast-iron baking dish on rack. Preheat oven to 425°.Meanwhile, toss leeks and 2 Tbsp. oil in a medium bowl to coat; season with salt and pepper.Once oven reaches temperature, pat chicken dry with paper towels and lightly coat with half of the remaining oil; sprinkle with dry rub, if using. Drizzle remaining oil into hot skillet (this helps keep the chicken from sticking and tearing the skin). Place chicken in the center of skillet and arrange leeks around. Roast until leeks are browned at edges and tender and an instant-read thermometer inserted into the thickest part of breasts registers 155°, 50–60 minutes (temperature will climb to 165° as chicken rests). Let chicken rest in skillet at least 20 minutes and up to 45 minutes.Transfer chicken to a cutting board and carve. Serve with leeks.
23	/cast-iron-roast-chicken-with-fennel-and-carrots	Cast-Iron Roast Chicken with Fennel and Carrots Recipe 	 Bon Appetit	1 3½–4-pound whole chicken,Kosher salt,2 fennel bulbs, cut into 6 wedges each,1 pound small carrots, scrubbed, cut into 4-inch-long pieces on a diagonal,3 tablespoons olive oil, divided,Freshly ground black pepper,	DIRECTIONS PreparationPat chicken dry with paper towels and season generously with salt, inside and out. (We use 1 tsp. Diamond Crystal or ½ tsp. Morton kosher salt per lb.) Tie legs together with kitchen twine. Let sit 1 hour to allow salt to penetrate, or chill, uncovered, up to 1 day ahead.Place a rack in upper third of oven and set a 12" cast-iron skillet or 3-qt. enameled cast-iron baking dish on rack. Preheat oven to 425°.Meanwhile, toss fennel, carrots, and 2 Tbsp. oil in a large bowl to coat; season with salt and pepper.Once oven reaches temperature, pat chicken dry with paper towels and lightly coat with half of remaining oil. Drizzle remaining oil into hot skillet (this helps keep the chicken from sticking and tearing the skin). Place chicken in the center of skillet and arrange vegetables around. Roast until fennel and carrots are golden brown in spots and tender an instant-read thermometer inserted into the thickest part of breasts registers 155°, 50–60 minutes (temperature will climb to 165° as chicken rests). Let chicken rest in skillet at least 20 minutes and up to 45 minutes.Transfer chicken to a cutting board and carve. Serve with vegetables.
24	/radicchio-with-tahini-and-sesame-seeds	Radicchio with Tahini and Sesame Seeds Recipe 	 Bon Appetit	3 tablespoons toasted sesame seeds,½ small red onion, very thinly sliced,¼ cup fresh lemon juice,⅓ cup plain whole-milk Greek yogurt,1 tablespoon tahini,2 medium or 4 small heads of radicchio, leaves separated, large leaves torn,Olive oil (for drizzling),	DIRECTIONS PreparationLightly crush sesame seeds in a mortar and pestle (alternatively, place seeds in a resealable plastic bag and crush with a mug) and transfer to a small bowl. Add a few generous pinches of sea salt and toss to combine. Set aside.Toss onion and lemon juice in a large bowl; season with kosher salt and pepper. Let sit 5 minutes to lightly pickle.Meanwhile, mix yogurt, tahini, and 2 Tbsp. water in another small bowl until smooth; season tahini dressing with kosher salt and pepper.Add radicchio to bowl with onion and drizzle with oil. Toss to coat; season with kosher salt and pepper. Transfer salad to a platter and drizzle with tahini dressing. Sprinkle reserved salted sesame seeds over salad.
25	/carrot-salad-with-feta-and-anchovies	Carrot Salad with Feta and Anchovies Recipe 	 Bon Appetit	5 medium carrots (about 12 ounces total), scrubbed, thinly sliced on a bias with a mandoline,3 tablespoons fresh lemon juice,4 tablespoons extra-virgin olive oil, divided,2 teaspoons Aleppo-style pepper, divided,Kosher salt,12 boquerones (marinated white anchovies),4 ounces feta, crumbled,¼ cup parsley leaves with tender stems,	DIRECTIONS PreparationToss carrots with lemon juice, 2 Tbsp. oil, and 1 tsp. Aleppo-style pepper in a medium bowl; generously season with salt. Massage carrots with your hands until softened. Taste and season with more salt if needed.Transfer carrots and any accumulated juices to a platter and top with boquerones and feta. Drizzle with remaining 2 Tbsp. oil and scatter parsley and remaining 1 tsp. Aleppo-style pepper over.
109	/vanilla-cream-cheese-frosting	Vanilla Cream Cheese Frosting Recipe 	 Bon Appetit	8 ounces cream cheese, room temperature,6 tablespoons unsalted butter, room temperature,1 teaspoon kosher salt,2 cups powdered sugar,1 tablespoon vanilla extract,	DIRECTIONS PreparationUsing an electric mixer on medium-low speed, beat cream cheese, butter, and salt in a large bowl until smooth. Add powdered sugar and beat on low speed until incorporated, then increase speed to medium and beat until light and fluffy, about 2 minutes. Scrape down sides of bowl, then beat in vanilla. Spread frosting on cupcakes.
26	/one-skillet-roasted-sesame-chicken-thighs	One-Skillet Roasted Sesame Chicken Thighs Recipe 	 Bon Appetit	6 skin-on, bone-in chicken thighs (about 2 pounds total),Kosher salt,2 tablespoons sesame oil, preferably toasted, divided,1 pound medium carrots, scrubbed,2 tablespoons soy sauce,2 tablespoons Sriracha,2 tablespoons unseasoned rice vinegar,1 tablespoon honey,1 1-inch piece ginger,3 scallions,Toasted sesame seeds (for serving),	DIRECTIONS Hide All ImagesPreheat oven to 425°. Heat a large dry skillet, preferably cast iron, over medium-low.Pat chicken thighs dry with paper towels and season all over with salt. Rub only skin side of thighs with 1 Tbsp. oil.Transfer thighs skin side down to skillet and cook until enough fat is rendered to cover bottom of skillet, about 5 minutes. Once skin starts to brown, increase heat to medium. Rotate skillet to encourage even browning. Carefully lift up thighs to allow hot fat to run underneath. If thighs are stubborn and don’t want to release, let them go a bit longer.While thighs are cooking, cut carrots into 4" segments.Cook thighs until meat is opaque all around the edges and skin is deep golden brown, 10–12 minutes total. Transfer skin side up to a plate.Pour off all but about 2 Tbsp. from skillet (you just want enough left to form a thin layer) and heat over medium-high. Add carrots and try to arrange so all are side by side in a single layer in direct contact with skillet. Cook, undisturbed, until lightly charred on first side, about 5 minutes. Turn carrots so charred side is facing up, then season lightly with salt.Cook carrots on opposite side until lightly charred, about 2 minutes. Turn off stove and transfer skillet to oven. Roast until a toothpick, skewer, or cake tester easily pierces surface of carrot but encounters resistance in the center, 8–10 minutes.While carrots are roasting, stir 2 Tbsp. soy sauce, 2 Tbsp. Sriracha, 1 Tbsp. rice vinegar, 1 Tbsp. honey, and remaining 1 Tbsp. oil in a small bowl. Scrape peel off of ginger root with a spoon; discard peel. Grate ginger into bowl with microplane, then stir to combine.PreviousNextCarefully remove skillet from oven (the handle will be hot!) and place on stove. Arrange thighs over carrots and drizzle sauce over. Return to oven and roast until chicken thighs are cooked through (an instant-read thermometer inserted into the thickest part near the bone will register 165°), juices run clear, sauce is caramelized on chicken skin, and carrots are tender all the way through, 12–18 minutes. Remove from oven and let rest 10 minutes.PreviousNextWhile skillet is resting, thinly slice scallions.Transfer chicken and carrots to a platter and drizzle pan juices over. Top with scallions and sesame seeds.PreviousNext
27	/roasted-spring-onions	Roasted Spring Onions Recipe 	 Bon Appetit	4 bunches spring onions, trimmed, halved lengthwise,6 sprigs thyme,6 tablespoons olive oil, divided,Kosher salt, freshly ground pepper,½ cup low-sodium chicken broth,1 cup fresh breadcrumbs,1 teaspoon finely grated lemon zest,	DIRECTIONS PreparationPreheat oven to 400°. Toss onions and thyme with 4 Tbsp. oil in a shallow 13x9” baking dish; season with salt and pepper. Add stock and roast until tender, 30–35 minutes.When onions are almost finished roasting, toss breadcrumbs and zest with remaining 2 Tbsp. oil; season with salt and pepper. Toast on a rimmed baking sheet, tossing halfway through, until golden brown, 8–10 minutes.Serve onions topped with breadcrumbs.
28	/cherry-oh-baby	Cherry Oh Baby Recipe 	 Bon Appetit	2 ounces dark rum,3/4 ounce Rothman and Winters Orchard cherry liqueur,1/2 ounce cherry Heering,2 dashes Angostura bitters,1 Fresh cherry (for serving),	DIRECTIONS PreparationCombine rum, cherry liqueurs, and bitters in a cocktail shaker filled with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a highball glass filled with ice and garnish with cherry.
29	/spicy-beef-and-cucumbers-with-black-vinegar	Spicy Beef and Cucumbers Recipe 	 Bon Appetit	1 medium English hothouse cucumber or 3 kirby cucumbers (about 12 ounces total),2 tablespoons vegetable oil,1 pound ground beef,Kosher salt,4 garlic cloves, finely chopped,2 red chiles, finely chopped,1 medium shallot, thinly sliced,2 tablespoons black (Chinkiang) vinegar,1 tablespoon soy sauce,1 teaspoon sugar,Freshly ground black pepper,Steamed rice, cooked ramen, or chopped romaine (for serving),1½ cups mixed tender herbs (such as mint, basil, and/or cilantro),Lime wedges (for serving),	DIRECTIONS PreparationCut cucumbers crosswise into 4"-thick pieces. Using a rolling pin, meat mallet, or the flat side of a chef’s knife, lightly crush cucumbers, then slice crosswise into ½"-thick slices; set aside.Heat oil in a large skillet, preferably cast iron, over high. Add beef and a pinch of salt; break up meat into small pieces with a wooden spoon then spread out in pan to create a single layer. Cook, undisturbed, until bottom side is browned and crisp, about 5 minutes. Break up meat with a spatula and turn over pieces. Cook until other side is browned and crisp and meat is cooked through, 5–7 minutes.Push meat to one side of pan and add garlic and chiles. Cook, stirring often, until fragrant and softened, about 2 minutes. Mix garlic and chile into meat. Add shallot and reserved cucumbers and cook, tossing occasionally and scraping up any browned bits, until cucumbers are softened and translucent, about 4 minutes. Remove skillet from heat and stir in vinegar, soy sauce, and sugar. Set skillet over medium heat and cook, stirring, until sauce is reduced slightly, about 2 minutes. Season with salt and pepper.Spoon beef and cucumbers over rice and top with herbs. Serve with lime wedges for squeezing over.
30	/portuguese-egg-custard-tarts	Portuguese Egg Tarts Recipe 	 Bon Appetit	½ teaspoon kosher salt,1 cup all-purpose flour, plus more for dusting,½ cup (1 stick) unsalted butter, softened,1 lemon,1 3–4-inch cinnamon stick,¾ cup sugar,⅓ cup all-purpose flour,⅛ teaspoon kosher salt,1½ cups whole milk, divided,6 large egg yolks,1 teaspoon vanilla extract,A candy thermometer,	DIRECTIONS PreparationDoughUsing your hands, mix salt, 1 cup flour, and ½ cup water in a large bowl until a shaggy dough forms. Knead until dough is elastic but still very sticky, about 5 minutes (alternatively, beat on medium speed in a stand mixer fitted with the paddle attachment until dough pulls away from sides of bowl, about 3 minutes). Wrap in plastic and let sit 30 minutes to relax gluten.Make sure your butter is softened to the consistency of sour cream (you can put it in a bowl and give it a stir). Generously flour (really, use a lot of flour) a clean work surface. Place dough on surface and dust with flour; lightly coat rolling pin with flour. Roll dough out to a 12" square (it will be quite thin), flouring surface as needed to prevent dough from sticking.Brush excess flour off dough. Imagine dough is made up of 3 equal columns. Using a small rubber spatula, spread 2½ Tbsp. butter over the left and center columns, leaving a ½" border around the edges (it should look like a slice of toast that’s been buttered on the left two-thirds). Lift up the right, unbuttered column and fold it over the middle column, then fold the far left column over the middle, as though you were folding a letter into thirds. Rotate dough 90° counterclockwise; the sides and top edge will be open.Generously flour work surface and dough. Roll out again to a 12" square. Repeat buttering and folding process. Again rotate folded dough 90° counterclockwise, flouring surface as needed. Roll dough out a third time to a 12" square (it’s worth it; we promise!). Spread remaining butter over surface of dough, leaving a ½" border. Starting with the long side closest to you, tease up edge of dough with a bench scraper and tightly roll it away from you into a log, brushing excess flour from the underside as you go. This dough is very forgiving—if there are any small holes, don't worry about it. When you get to the end, wet edge of dough just before you roll it so that it sticks. Trim both ends to clean up the edges, cut log in half crosswise, then wrap both pieces in plastic wrap (you should have two 6" logs). Chill 1 log at least 3 hours; transfer remaining log to freezer for another use (this amount of dough makes enough for 24 tarts; freeze the extras for your future crispy tart needs).Do Ahead: Dough can be made 1 day ahead; keep chilled, or freeze up to 3 months.Filling and AssemblyPeel zest from one half of lemon into wide strips with a vegetable peeler, leaving white pith behind; set aside. Bring cinnamon, sugar, and ¼ cup water to a boil in a small saucepan fitted with candy thermometer over medium-high heat. Cook, swirling pan occasionally, until thermometer registers 225°. Remove from heat and stir in reserved lemon peel. Let sugar syrup sit 30 minutes.Position a rack in top third of oven; preheat to 500°. Place a rimmed baking sheet in oven to heat.Whisk flour, salt, and ½ cup milk in a medium bowl until combined and no lumps remain. Heat remaining 1 cup milk in a large saucepan over medium-high until it begins to boil, about 5 minutes. Remove from heat and whisk into flour mixture. Return mixture to saucepan over medium heat and cook, stirring occasionally, until thick, creamy, and smooth, about 5 minutes.Strain sugar syrup through a fine-mesh sieve into hot milk mixture and whisk to combine. Whisk in egg yolks and vanilla.Cut chilled dough crosswise into twelve ½"-thick slices. Place 8 slices on a plate and chill; place remaining 4 dough slices in 4 cups of a standard 12-cup muffin pan. Using your thumb, firmly press the center each piece against bottom of cup, forming a wall of dough around your thumb. Using your thumbs and fingers, press edges of dough against sides of cup, turning pan as you go, until dough  comes halfway up sides of cup and is about 1/16" thick (or as thin as you can get it). Repeat twice more with remaining dough slices.Fill each pastry shell with about 2 Tbsp. filling (it should come about three-fourths of the way up the sides). Try not to get any on the pan itself; it may burn and stick during baking.Carefully place muffin pan on heated baking sheet in oven and bake tarts until custard is slightly puffed and browned in spots, and crust is golden brown and bubbles of melted butter are popping around it, 14–16 minutes. Let cool 10 minutes in pan, then carefully transfer each tart to a wire rack with an offset spatula. Let cool 20 minutes before serving.
31	/meringue-mushrooms	Meringue Mushrooms Recipe 	 Bon Appetit	2 large egg whites, room temperature,Pinch of cream of tartar,8 tablespoons superfine sugar,1/4 teaspoon vanilla extract,Powdered sugar (for garnish),Natural unsweetened cocoa powder (for garnish),	DIRECTIONS PreparationPosition rack in center of oven and preheat to 250°F. Line large rimmed baking sheet with parchment paper. Using electric mixer, beat egg whites and cream of tartar in medium bowl until stiff peaks form. Add superfine sugar 1 tablespoon at a time, beating well after each addition until dissolved and mixture is stiff and glossy. Beat in vanilla.Transfer mixture to large pastry bag fitted with 1/2-inch plain pastry tip. To form mushroom caps, pipe twelve 1 1/2-inch-diameter mounds onto prepared baking sheet. To form stems for mushroom caps, on same baking sheet position pastry bag and tip 1/4 inch above surface of sheet and pipe out 12 steady pointed cones of 1- to 1 1/4-inch-high meringue, pulling straight up while squeezing pastry bag. Reserve some meringue in pastry bag for attaching stems to mushroom caps.Bake meringues until dry to touch and still white, 60 to 65 minutes. Remove from oven and let meringues cool on baking sheet. DO AHEAD Can be made 1 day ahead. Store meringues in airtight container in single layer at room temperature. Wrap pastry bag with remaining meringue in plastic and chill.Carefully poke small hole in underside of each meringue mushroom cap; pipe in small amount of meringue, then carefully insert stem. Repeat with all remaining caps and stems. Dust mushrooms with powdered sugar, then lightly with cocoa powder. Lean meringue mushrooms against yule log and serve.
144	/roasted-broccoli	Roasted Broccoli Recipe 	 Bon Appetit	2 large heads of broccoli, cut into large florets with some stalk attached,5 tablespoons olive oil,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationPreheat oven to 450°. Toss broccoli and oil on a rimmed baking sheet; season with salt and pepper. Roast, tossing occasionally, until tender and browned, 25–35 minutes.
32	/chocolate-buttercream	Chocolate Buttercream Recipe Recipe 	 Bon Appetit	2 large egg yolks,1 large egg whites,½ tsp kosher salt,½ cup granulated sugar,1 cup (2 sticks) unsalted butter, room temperature, cut into pieces,5 ounces bittersweet chocolate, melted, cooled,1 tsp vanilla extract,A candy thermometer,	DIRECTIONS PreparationUsing an electric mixer on medium-high speed, beat egg yolks, egg, and salt until pale and thick, about 4 minutes.Meanwhile, bring granulated sugar and ¼ cup water to a boil in a small saucepan fitted with a candy thermometer over medium-high heat, stirring to dissolve sugar. Continue to cook, swirling occasionally (but not stirring), until thermometer registers 248° (this is the firm-ball stage). With motor running, gradually pour syrup into egg mixture just where the eggs meet the sides of the bowl (you want to avoid the beaters to keep sugar from splattering). Beat until eggs are light and fluffy and the outside of bowl is cool to the touch, about 5 minutes.Beat in butter a piece at a time, mixing until incorporated before adding the next piece. If mixture looks either soupy or curdled, continue to beat until an emulsion forms and mixture is light and thick (this could take several minutes). Mix in chocolate and vanilla.Do ahead: Buttercream can be made 2 days ahead. Cover and chill, or freeze up to 1 month. Bring to room temperature and beat again before using. (Thaw frozen buttercream in refrigerator overnight before bringing to room temperature.)
33	/o-d-a	O.D.A. Recipe 	 Bon Appetit	¼ cup clover honey,4 leaves Thai or sweet basil, plus sprig for garnish,1 ounce white rum, such as Caña Brava,½ ounce fresh lemon juice,1½ ounces tepache (click here for recipe),Mint sprig, for garnish,	DIRECTIONS PreparationHoney Simple SyrupDissolve honey in ⅓ cup hot water. Chill syrup until cold.DO AHEAD: Honey syrup can be made 1 month ahead. Cover and keep chilled.CocktailSlap basil leaves between your hands and place in the bottom of a Collins glass with rum, lemon juice, and ½ oz. honey syrup. Muddle with a few firm strokes, top with tepache, and stir to combine. Fill glass with crushed ice and garnish with mint and Thai basil.
34	/asparagus-frittata	Asparagus Frittata Recipe 	 Bon Appetit	8 large eggs,4 large egg whites,1 cup (packed) basil leaves, thinly sliced,Kosher salt, freshly ground pepper,2 tablespoons olive oil,2 cups thinly sliced asparagus (from about 1 bunch),	DIRECTIONS PreparationPreheat oven to 400°. Whisk eggs and egg whites in a medium bowl until frothy; mix in basil and season with salt and pepper.Heat oil in a medium ovenproof nonstick skillet over medium-high heat. Add asparagus and cook, tossing occasionally, until beginning to soften, about 2 minutes. Reduce heat to medium and add egg mixture, stirring to combineCook, shaking pan occasionally, until egg mixture is set around edges, about 4 minutes. Transfer skillet to oven and cook frittata until top is puffed and completely set, 10–15 minutes.Run a heatproof spatula around edge of pan to release frittata. Slide frittata onto a warmed plate and cut into wedges.
35	/cinnamon-ice	Cinnamon Ice Recipe 	 Bon Appetit	8 sticks cinnamon,	DIRECTIONS PreparationBring cinnamon and 3 cups water to a boil in a small saucepan; remove from heat and let cool completely. Pour into ice cube molds and freeze until solid.
36	/veranda-way	Veranda Way Recipe 	 Bon Appetit	1¾ ounces gin,1¼ ounces tepache (click here for recipe),½ ounce Aperol,½ ounce fresh lime juice,¼ ounce simple syrup (click here for recipe),Cinnamon ice (click here for recipe),Pineapple wedge, for garnish,	DIRECTIONS PreparationCombine gin, tepache, Aperol, lime juice, and simple syrup in a cocktail shaker and fill with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a Collins glass filled with cinnamon ice. Garnish with pineapple.
37	/roasted-cauliflower-with-capers-and-parmesan	Roasted Cauliflower with Capers and Parmesan Recipe 	 Bon Appetit	1 large head of cauliflower (about 2½ pounds),5 tablespoons extra-virgin olive oil, divided,Kosher salt, freshly ground black pepper,1 ounce Parmesan,2 tablespoons capers, drained, divided,1 lemon,	DIRECTIONS Hide All ImagesArrange a rack in lowest position of oven; preheat to 450°. Place cauliflower on a cutting board and snap off green outer leaves. Use knife to shave off end of stem to create a flat surface on which the cauliflower can stand upright.PreviousNextStarting from one end, cut entire head of cauliflower into ½" slices, letting the pieces fall where they may. The pieces connected to the root will remain intact in planks.Transfer cauliflower to a rimmed baking sheet and drizzle with 3 Tbsp. oil. Season with salt and pepper and toss with your hands to make sure pieces are evenly coated, then arrange so they’re resting on a flat cut surface.PreviousNextRoast cauliflower on bottom rack until pieces are browned around the edges and undersides are deeply browned all over, 25–30 minutes.YOU CAN SERVE ROASTED VEGETABLES COLD TOO, YOU KNOWWhile cauliflower is roasting, grate Parm on the large holes of a box grater. Set aside about half for garnishing.Coarsely chop half of capers, then toss all capers in a small bowl with remaining 2 Tbsp. oil. Cut lemon in half and squeeze in juice.WHAT EVEN ARE CAPERS, ANYWAY?PreviousNextWhen cauliflower is ready on the first side, remove baking sheet from oven and place on a work surface. Using a spatula, turn pieces over so browned sides are facing up. Sprinkle Parm NOT set aside for garnish over cauliflower.PreviousNextReturn sheet to oven and continue to roast until second side of cauliflower is browned and Parm is toasty smelling and browned, 10–12 minutes.Let cool a few minutes, then transfer cauliflower to a plate with spatula and drizzle lemon-caper dressing over. Season with a bit more salt and pepper, then top with reserved Parm.PreviousNext
38	/horseradish-black-pepper-vodka	Horseradish–Black Pepper Vodka Recipe 	 Bon Appetit	1 1” piece horseradish, peeled, thinly sliced,¼ tsp black peppercorns, crushed or chopped,8 ounces vodka,	DIRECTIONS PreparationCombine horseradish, black pepper, and vodka in a large jar. Cover and let sit at at least 3 days and up to 1 month. Strain before using.
39	/el-coco	El Coco Recipe 	 Bon Appetit	1½ ounces blanco tequila,1½ ounces tepache (click here for recipe),¾ ounces cream of coconut, such as Coco Lopez,½ ounce yellow chartreuse,Several dashes Peychaud’s bitters,	DIRECTIONS PreparationCombine tequila, tepache, cream of coconut, and chartreuse in a cocktail shaker and stir to combine (do not add ice). Pour into a chilled rocks glass filled with crushed ice and top with several dashes Peychaud’s bitters.
40	/el-bigote	El Bigote Recipe 	 Bon Appetit	4 cinnamon sticks,1/2 cup sugar,1 ounce mezcal,1 ounce Old Grand-Dad 114 or other high-proof bourbon,1/2 ounce Cocchi Americano (Italian aperitif wine),1/4 ounce Sherry,2 dashes Bittermen's Xocolatl Mole or Angostura bitters,Orange twist (for serving),	DIRECTIONS PreparationCinnamon Bark SyrupBring cinnamon sticks, sugar and ½ cup water to a boil in a small saucepan. Remove from heat and let steep 2 hours. Strain syrup into a small jar or bowl; discard cinnamon.Do AheadSyrup can be made 1 week ahead. Cover and chill.CocktailCombine mezcal, bourbon, Cocchi Americano, Sherry, bitters, and ¼ oz. cinnamon bark syrup in a large glass, mixing glass, or cocktail shaker filled with ice. Stir until outside of glass is frosty, about 30 seconds. Strain into a rocks glass filled with ice and garnish with orange twist.
334	/rigatoni-with-sausage-beans-and-greens	Rigatoni with Sausage, Beans, and Greens Recipe 	 Bon Appetit	3 tablespoons (or more) kosher salt,3 links sweet Italian sausage,1 15-ounce can cannellini (white kidney) beans,1 bunch of Tuscan kale, rinsed,1 2-ounce chunk of Parmesan,3 tablespoons extra-virgin olive oil, divided,12 ounces rigatoni pasta,½ teaspoon crushed red pepper flakes,2 tablespoons unsalted butter,1 lemon,	DIRECTIONS The first thing you want to do is get your pasta water boiling. Fill a large pot (preferably around 8 quarts) with approximately 6 quarts of water, then put it over high heat. When you see wisps of steam, add 3 Tbsp. salt, stir once, and cover the pot. This will make it boil faster. Yes, it’s A LOT of salt, but as the pasta cooks, it absorbs the salty water, ensuring the pasta is seasoned from the inside out. You end up dumping most of the salt anyway when you drain the water.While the water comes to a boil, prep your other ingredients. Remove sausage from its casings and set aside. Dump beans into a strainer or colander and rinse well. Shake off excess water. Turn out beans onto a couple of sheets of paper towel and pat dry with a few more paper towels. Strip kale leaves off the thick woody ribs and tear into small pieces; discard ribs. Finely grate Parmesan using the small holes of a box grater. Set aside about ½ cup cheese for garnishing.Heat 2 Tbsp. oil in a large Dutch oven or large skillet, preferably with straight sides, over medium-high. It’s best to use a vessel with high sides, because you’re about to do a lot of tossing and flinging when the pasta goes in, and this will minimize spillage. Add sausage and cook, breaking up with a wooden spoon and stirring occasionally, until meat is browned, crispy in places, and cooked through, 8–10 minutes. Transfer with a spider or slotted spoon to a plate. Remove pot from heat and set aside.PreviousNextPour pasta into water and stir once. Set timer for 3 minutes less than the package advises. You’re going to cook it well shy of al dente.While pasta is cooking, return pot to medium-low heat and add beans and ½ tsp. red pepper flakes. Cook, tossing occasionally and mashing some beans with spoon, until browned in spots, about 5 minutes. Transfer about half of beans to plate with sausage.Using a ladle or liquid measuring cup, add about 1 cup cooking liquid from pasta into pot with beans (reserve remaining liquid). Increase heat to medium-high.Using spider or a slotted spoon, transfer pasta to pot with beans and add kale. Toss vigorously with tongs to move the pasta around to incorporate the kale as it wilts.Continue to cook, tossing often, until kale is wilted, pasta is al dente, and water is reduced by about half, about 4 minutes. If water is reduced before pasta is al dente, add another ¼–½ cup pasta cooking liquid. Reduce heat to low.Add another ¼ cup pasta cooking liquid, then gradually add cheese, tossing all the while, until cheese is emulsified into the water and forms a luxurious, glossy sauce.Remove pot from heat and add reserved beans and sausage, then butter, tossing, until butter is melted.Taste pasta and add more salt if needed. Cut lemon in half and squeeze one half over pasta, then drizzle with remaining 1 Tbsp. oil.PreviousNextDivide pasta among bowls and top with reserved ½ cup cheese.
41	/roasted-spiced-rhubarb-with-dates-and-yogurt	Roasted Spiced Rhubarb with Dates and Yogurt Recipe 	 Bon Appetit	¼ cup unsalted, shelled raw pistachios,½ cup Medjool dates, chopped,2 teaspoons finely grated orange zest,½ teaspoon vanilla extract,2 tablespoons honey, divided,3 large rhubarb stalks (about ¾ lb.), cut into 2” pieces,¼ teaspoon ground cinnamon,1 1/3 cups plain nonfat Greek yogurt,	DIRECTIONS PreparationPreheat oven to 350°. Toast pine nuts on a rimmed baking sheet, tossing occasionally, until golden brown, 8–10 minutes; let cool, then chop.Meanwhile, bring dates, zest, vanilla, 1 Tbsp. honey, and 1 cup water to a boil in a small saucepan, reduce heat, and simmer gently until dates are very soft and liquid is reduced by half, 8–10 minutes. Place rhubarb in a small baking dish and toss with cinnamon and date mixture. Roast, turning halfway through, until rhubarb is tender but not falling apart, 25–30 minutes.Whisk yogurt and remaining 1 Tbsp. honey in a small bowl. Serve spiced rhubarb and any juices with yogurt and pistachios.
42	/bourbon-tepache-cocktail	Bourbon & Tepache Cocktail Recipe 	 Bon Appetit	1½ ounces bonded Bourbon, such as Old Fitzgerald,¾ ounces tepache (click here for recipe),½ ounce fresh lemon juice,¼ ounce Falernum,A few dashes Angostura bitters,Orange twist, for garnish,	DIRECTIONS PreparationCombine bourbon, tepache, lemon juice, and Falernum in a cocktail shaker; fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a chilled double old-fashioned glass filled with crushed ice. Top with bitters, and garnish with orange twist.
43	/radicchio-salad-turkey-pear-pomegranate	Radicchio Salad with Turkey, Pear, and Pomegranate Recipe 	 Bon Appetit	4 ounces leftover turkey from Turkey Breast with Roasted Broccolini (click here for recipe),3 cups radicchio,1 pear,2 tablespoons toasted chopped hazelnuts,2 tablespoons pomegranate seeds,2 tablespoons Whole Grain Mustard Walnut Vinaigrette (click here for recipe),	DIRECTIONS PreparationToss radicchio, sliced pear, and turkey with vinaigrette. Top with hazelnuts and pomegranate seeds.
44	/tepache-highball	Tepache Highball Recipe 	 Bon Appetit	2 ounces tepache (click here for recipe),1½ ounces blanco tequila,1 teaspoon agave nectar,Club soda,Pineapple wedge for serving,Tajín (Mexican seasoning mix) for serving, optional,	DIRECTIONS PreparationCombine tepache, tequila, and agave in a highball glass and stir until agave is dissolved. Fill glass with crushed ice, and top off with club soda. Top with pineapple and sprinkle with tajín.
45	/creamy-herb-dressing	Creamy Herb Dressing Recipe 	 Bon Appetit	1 large egg yolk,1 garlic clove, finely chopped,2 tablespoons Sherry vinegar,½ cup olive oil,½ cup (packed) fresh dill leaves,½ cup (packed) fennel fronds,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationPulse egg yolk, garlic, and vinegar in a food processor until smooth. With motor running, gradually drizzle in oil and process until emulsified. Add dill and fennel and process, adding water by the tablespoonful as needed, until dressing is the consistency of heavy cream; season with salt and pepper.
46	/herbed-egg-salad	Herbed Egg Salad Recipe 	 Bon Appetit	8 hard-boiled large eggs, chopped,¼ cup finely chopped fresh chives,2 tablespoons mayonnaise,1 tablespoon coarsely chopped fresh dill,2 teaspoons whole grain mustard,1½ teaspoons apple cider vinegar, plus more if needed,Hot sauce,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationMix eggs, chives, mayonnaise, dill, mustard, 1½ tsp. vinegar, and a few dashes of hot sauce in a medium bowl until well combined. Season with salt, pepper, and more hot sauce or vinegar, if desired.
47	/espresso-old-fashioned	Espresso Old Fashioned Recipe 	 Bon Appetit	1 double shot espresso (about 2 oz.), room temperature,1 ounce bourbon or rye whiskey (optional),¼ ounce simple syrup,Dash of Peychaud’s bitters,1 1" piece lemon peel,	DIRECTIONS PreparationCombine espresso, bourbon, if using, simple syrup, and bitters in a cocktail shaker and fill with ice. Stir until outside of shaker is frosty, about 30 seconds; strain into a lowball glass filled with ice. Twist lemon peel over cocktail to release oils, then rub over the rim of glass; discard peel.
48	/ginger-pepper-truffles	Ginger and Pepper Truffles Recipe 	 Bon Appetit	9 ounces bittersweet chocolate (70% cacao), chopped,1¼ cups heavy cream,2 teaspoons coarsely ground black pepper,1 teaspoon Aleppo pepper,½ cup crystalized ginger,½ cup sugar,	DIRECTIONS PreparationPlace chocolate in a medium bowl. Bring cream, black pepper, and Aleppo pepper to a simmer in a small saucepan over medium heat. Strain cream into bowl with chocolate; discard solids. Let sit until chocolate is softened, about 3 minutes. Whisk until smooth. Cover and chill until ganache is firm enough to roll into balls, at least 3 hours.Pulse ginger and sugar in a food processor until mixture resembles coarse sand; transfer to a small bowl. Scoop out a scant tablespoonful of ganache. Roll into a ball (if you’d like, wear disposable gloves to keep your hands clean), then roll in ginger sugar. Place on a parchment-lined baking sheet. Repeat with remaining ganache. Chill truffles until firm, at least 1 hour.Do ahead: Ganache can be made 3 days ahead; keep chilled. Ginger sugar can be made 1 week ahead; store airtight at room temperature. Truffles can be made 1 week ahead; store airtight in the refrigerator.
49	/viking-glogg	Viking Glogg Recipe 	 Bon Appetit	2 750-ml bottles fruity red wine,1/2 cup cream Sherry,1/2 cup sugar,2 tablespoons loose chai tea,1 teaspoon caraway seeds,4 cinnamon sticks, plus more for garnish,4 star anise pods, plus more for garnish,2 orange slices,1 4" knob ginger, peeled and chopped,1 vanilla bean, split lengthwise, seeds scraped,8 orange twists, (for serving),	DIRECTIONS PreparationCombine wine, Sherry, sugar, chai tea, caraway seeds, 4 cinnamon sticks, 4 star anise pods, 2 orange slices, ginger and vanilla bean in a large pot. Bring to a simmer and reduce heat to low. Let steep for one hour. Strain and divide among mugs; garnish with cinnamon stick, star anise pod and orange twist.
50	/iced-matcha-latte	Iced Matcha Latte Recipe 	 Bon Appetit	½ cup whole milk,2½ teaspoons matcha,2 teaspoons sugar,	DIRECTIONS PreparationHeat milk in a large heatproof glass measuring cup in a microwave on high until very hot but not boiling, about 45 seconds (or, heat milk in a small saucepan over medium). Using an immersion blender, carefully blend on medium speed, moving blade up and down through milk, until foamy, about 30 seconds. (Alternatively, whisk vigorously.)Combine matcha, sugar, and ½ cup water in an ice-filled cocktail shaker. Cover and shake vigorously until outside of shaker is very cold and latte is frothy, 30 seconds. Using a cocktail strainer or slotted spoon to hold back ice while allowing foam and small ice chips to pass through, pour into a tall, ice-filled glass. Top off with frothy milk.
51	/seeded-coconut-truffles	Seeded Coconut Truffles Recipe 	 Bon Appetit	9 ounces bittersweet chocolate (70% cacao), chopped,1¼ cups heavy cream,¼ cup amaranth,¼ cup sesame seeds,¼ cup unsweetened shredded coconut,	DIRECTIONS PreparationPlace chocolate in a medium bowl. Bring cream to a simmer in a small saucepan over medium heat. Pour over chocolate and let sit until chocolate is softened, about 3 minutes. Whisk until smooth. Cover and chill until ganache is firm enough to roll into balls, at least 3 hours.Toast amaranth and sesame seeds in a dry medium skillet over medium-high heat, stirring, until some of amaranth has puffed and sesame seeds are golden, about 3 minutes. Transfer to a small bowl and stir in coconut; let cool.Scoop out a scant tablespoonful of ganache. Roll into a ball (if you’d like, wear disposable gloves to keep your hands clean), then roll in coconut mixture. Place on a parchment-lined baking sheet. Repeat with remaining ganache. Chill truffles until firm, at least 1 hour.Do ahead: Ganache can be made 3 days ahead; keep chilled. Truffles can be made 1 week ahead; store airtight in the refrigerator.
52	/amaretto-mocha-truffles	Amaretto-Mocha Truffles Recipe 	 Bon Appetit	9 ounces bittersweet chocolate (70% cacao), chopped,1 cup heavy cream,¼ cup amaretto,¾ cup coffee beans, finely ground,	DIRECTIONS PreparationPlace chocolate in a medium bowl. Bring cream and amaretto to a simmer in a small saucepan over medium heat. Pour over chocolate and let sit until chocolate is softened, about 3 minutes. Whisk until smooth. Cover and chill until ganache is firm enough to roll into balls, at least 3 hours.Place ground coffee in a small bowl. Scoop out a scant tablespoonful of ganache. Roll into a ball (if you’d like, wear disposable gloves to keep your hands clean), then roll in espresso. Place on a parchment-lined baking sheet. Repeat with remaining ganache. Chill truffles until firm, at least 1 hour.Do ahead: Ganache can be made 3 days ahead; keep chilled. Truffles can be made 1 week ahead; store airtight in the refrigerator.
53	/watermelon-margarita	Watermelon Margarita Recipe 	 Bon Appetit	1 tablespoon kosher salt,1 ounce fresh lime juice, plus 1 lime wedge for glass,1½ cups cubed seeded watermelon, plus 1 small wedge for serving,2 sprigs mint,2 ounces tequila blanco,¾ ounce simple syrup,	DIRECTIONS PreparationPlace salt on a small plate. Rub rim of a margarita coupe with lime wedge; dip in salt.Muddle watermelon cubes and mint in a cocktail shaker until watermelon breaks up into small pieces and releases its juice. Add tequila, simple syrup, and lime juice. Fill shaker with ice, cover, and shake vigorously until outside of shaker is frosty, about 30 seconds. Strain cocktail into prepared glass and garnish with watermelon wedge.
54	/strawberry-cucumber-ice-pops	Strawberry-Cucumber Ice Pops Recipe 	 Bon Appetit	2 English hothouse cucumbers, peeled, chopped,4 10-ounce bags frozen strawberries,1½ teaspoons finely grated lime zest,½ cup fresh lime juice,½ cup sugar,Pinch of kosher salt,Thirty 2-ounce ice-pop molds and wooden sticks,	DIRECTIONS PreparationPurée 1 cucumber and half of strawberries, lime zest, lime juice, and sugar in a blender until very smooth; transfer to a large pitcher or measuring cup. Repeat with remaining cucumber, strawberries, lime zest, lime juice, and sugar. Season with salt and stir to combine.Pour strawberry-cucumber mixture into ice-pop molds. Cover and insert sticks. Freeze until solid, at least 4 hours. Dip molds briefly in hot water to release pops.Do Ahead: Ice pops can be made 1 week ahead. Keep frozen.
55	/horseradish-black-pepper-gibson	Horseradish–Black Pepper Gibson Recipe 	 Bon Appetit	2 ½ ounces Horseradish–Black Pepper Vodka (click for recipe),½ ounce dry vermouth,Cocktail onions (for serving),	DIRECTIONS PreparationCombine vodka and vermouth in a cocktail shaker; fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a chilled coupe glass and garnish with cocktail onions.
56	/balsamic-dressing	Balsamic Dressing Recipe Recipe 	 Bon Appetit	½ red Thai chile, finely chopped, or ¼ teaspoon crushed red pepper flakes,1 garlic clove, finely grated,¼ cup balsamic vinegar,¼ cup whole-milk Greek yogurt,3 tablespoons olive oil,1 teaspoon honey,1 teaspoon kosher salt,	DIRECTIONS PreparationMix chile, garlic, vinegar, yogurt, oil, honey, and salt in a pint-sized jar, seal, and shake vigorously until dressing is smooth and no lumps of yogurt remain, about 20 seconds.Do Ahead: Dressing can be made 3 days ahead. Cover and chill.
57	/arugula-gimlet	Arugula Gimlet Recipe 	 Bon Appetit	2 ounces gin,¾ ounce fresh lime juice,½ ounce simple syrup,1 cup arugula,Lime wheel (for serving),	DIRECTIONS PreparationCombine gin, lime juice, and simple syrup in a cocktail shaker. Fill partway with ice, then top with arugula. Cover and shake vigorously until the outside of shaker is very cold, about 20 seconds. Strain through a very fine-mesh sieve into a coupe glass; garnish with lime wheel.
58	/pizzeria-vetri-rotolo	Rotolo Recipe 	 Bon Appetit	1 pound pizza dough, room temperature,All-purpose flour (for surface),6 ounces thinly sliced mortadella,8 ounces ricotta (about 1 cup),Kosher salt, freshly ground pepper,½ cup pistachios,4 garlic cloves, finely chopped,⅓ cup olive oil,	DIRECTIONS PreparationRoll out dough on a lightly floured surface to a 20x12" rectangle, about ⅛" thick, orienting dough so that a long edge is facing you (short edges will be to your left and right). Cover dough with mortadella (overlapping the slices slightly is okay), leaving a ¼" border of dough around edges. Evenly dollop ricotta over mortadella; season with salt and pepper. Roll dough away from you, using a dough scraper if needed to peel it up and off the surface, into a tight log. Cut crosswise into 2 ½" rounds. Transfer rotolos to a parchment-lined large rimmed baking sheet, placing cut side up. Cover tightly with plastic wrap and let sit in a warm place until puffed slightly, 1–1 ½ hours.Meanwhile, place a rack in upper third of oven and preheat to 425°. Toast pistachios on a small rimmed baking sheet, tossing once, until fragrant and just beginning to brown, about 4 minutes. Let cool, then coarsely chop.Bake rotolo, rotating baking sheet halfway through, until deeply browned and dough is no longer raw in the center, 24–28 minutes.Meanwhile, combine garlic, oil, and pistachios in a small bowl; season with salt and pepper.Spoon pistachio-garlic oil over warm rotolos just before serving.
59	/brandy-milk-punch	Brandy Milk Punch Recipe 	 Bon Appetit	2 ounces brandy,1 ½ ounces heavy cream or almond milk,1 ounce simple syrup,½ teaspoon vanilla extract,Freshly grated nutmeg (for serving),	DIRECTIONS PreparationCombine brandy, cream, simple syrup, and vanilla extract in a cocktail shaker; fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a rocks glass filled with ice and garnish with nutmeg.
60	/fudgsicle-popsicle-recipe	Fudgsicle-Inspired Ice Pops Recipe 	 Bon Appetit	3 cups half-and-half,6 ounces semisweet chocolate, finely chopped,6 tablespoons sugar,2 tablespoons cocoa powder (preferably Dutch-processed),1 tablespoon vanilla extract or paste,⅛ teaspoon kosher salt,Twelve 3-ounce ice-pop molds,	DIRECTIONS PreparationBring half-and-half to a simmer in a medium saucepan over medium-high heat. Whisk in chocolate, sugar, and cocoa powder and cook, whisking frequently, until mixture is smooth and creamy and chocolate is melted, about 5 minutes. Remove from heat and whisk in vanilla and salt; chill at least 1 hour.Pour chocolate mixture into ice-pop molds. Cover and insert sticks. Freeze until solid, at least 4 hours. Dip molds briefly in hot water to release pops.Do Ahead: Chocolate mixture can be made 1 day ahead; keep chilled. Fudgecicles can be made 1 week ahead; keep frozen.
61	/chicken-salad-with-celery-scallions-and-marinated-cucumbers	Chicken Salad with Celery, Scallions, and Marinated Cucumbers Recipe 	 Bon Appetit	2 cups cucumber, thinly sliced,Rice vinegar,4 ounces leftover chicken from Roast Chicken with Butternut-Tahini Purée,1 cup celery,1 tablespoon scallions,2 tablespoons Kimchi Miso Dressing	DIRECTIONS PreparationToss cucumber with vinegar and set aside to soften for 10 minutes. Toss chicken, celery, and scallions with dressing. Serve with cucumbers on the side.
62	/pretzel-banana-truffles	Pretzel and Banana Truffles Recipe 	 Bon Appetit	9 ounces bittersweet chocolate (70% cacao), chopped,1¼ cups heavy cream,2½ cups mini pretzels (such as Rold Gold Tiny Twists),¾ cup sweetened banana chips,	DIRECTIONS PreparationPlace chocolate in a medium bowl. Place cream in a small saucepan. Add pretzels, crumbling with your hands. Bring to a simmer over medium heat. Remove from heat, cover, and let stand 10 minutes to let flavors infuse.Return cream mixture to a simmer, then strain into bowl with chocolate; discard solids. Let sit until chocolate is softened, about 3 minutes. Whisk until smooth. Cover and chill until ganache is firm enough to roll into balls, at least 3 hours.Pulse banana chips in a food processor until coarsely ground; transfer to a small bowl. Scoop out a scant tablespoonful of ganache. Roll into a ball (if you’d like, wear disposable gloves to keep your hands clean), then roll in banana chips. Place on a parchment-lined baking sheet. Repeat with remaining ganache. Chill truffles until firm, at least 1 hour.Do ahead: Ganache can be made 3 days ahead; keep chilled. Truffles can be made 1 week ahead; store airtight in the refrigerator.
63	/chocolate-truffles-beer-sugar	Chocolate Truffles with Beer Sugar Recipe 	 Bon Appetit	1 cup demerara sugar,2 tablespoons India Pale Ale,9 ounces bittersweet chocolate (70% cacao), chopped,1¼ cups heavy cream,	DIRECTIONS PreparationPreheat oven to lowest setting (150° or 200° on most ovens). Mix demerara sugar and beer in a small bowl. Spread out mixture on a parchment-lined baking sheet in a thin, even layer. Let dry out in oven 12 hours (or overnight) with door slightly ajar. Mixture should feel like demerara sugar again. Transfer beer sugar to a small bowl.Place chocolate in a medium bowl. Bring cream to a simmer in a small saucepan over medium heat. Pour over chocolate and let sit until chocolate is softened, about 3 minutes. Whisk until smooth. Cover and chill until ganache is firm enough to roll into balls, at least 3 hours.Scoop out a scant tablespoonful of ganache. Roll into a ball (if you’d like, wear disposable gloves to keep your hands clean), then roll in beer sugar. Place on a parchment-lined baking sheet. Repeat with remaining ganache. Chill truffles until firm, at least 1 hour.Do ahead: Ganache can be made 3 days ahead; keep chilled. IPA sugar can be made 1 week ahead; store airtight at room temperature. Truffles can be made 1 week ahead; store airtight in the refrigerator.
64	/cilantro-margarita	Cilantro Margarita Recipe 	 Bon Appetit	2 ounces fresh lime juice,2 ounces tequila blanco,1 ounce simple syrup,¼ cup fresh cilantro leaves with tender stems,Lime wedge (for serving),	DIRECTIONS PreparationCombine lime juice, tequila, simple syrup, and cilantro in a cocktail shaker. Fill shaker with ice and shake until outside of shaker is frosty, about 30 seconds. Strain into an ice-filled rocks glass. Garnish with lime wedge.
65	/apple-fennel-chicken-salad	Apple-Fennel Chicken Salad Recipe 	 Bon Appetit	½ apple, finely chopped (we like Pink Lady or Gala for the color),½ fennel bulb, finely chopped,½ small shallot, finely chopped,8 ounces poached roasted or rotisserie chicken, torn into bite-size pieces,2 tablespoons mayonnaise,1 tablespoon finely chopped fresh chives,1 tablespoon finely chopped fresh tarragon,2 teaspoons finely grated lemon zest,1 tablespoon fresh lemon juice, plus more if needed,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationUsing a fork, mix apple, fennel, shallot, chicken, mayonnaise, chives, tarragon, lemon zest, and 1 Tbsp. lemon juice in a medium bowl until well combined. Season with salt, pepper, and more lemon juice, if desired.
66	/lemon-lavender-pound-cake	Lemon-Lavender Pound Cake Recipe 	 Bon Appetit	½ cup (1 stick) unsalted butter, room temperature, plus more for pan,1½ cups all-purpose flour,¾ teaspoon kosher salt,¾ teaspoon baking powder,¼ teaspoon baking soda,¾ cup plus 1 tablespoon granulated sugar,2 teaspoons dried lavender,4 teaspoons finely grated lemon zest,½ vanilla bean, split lengthwise,2 large eggs, room temperature,½ cup buttermilk or milk,3 tablespoons fresh lemon juice,1 cup powdered sugar,2 tablespoons buttermilk or milk,1 lemon,	DIRECTIONS PreparationCakePreheat oven to 350°. Butter an 8½x4½" loaf pan and line with parchment paper, leaving a generous overhang on long sides. Whisk flour, salt, baking powder, and baking soda in a medium bowl; set aside.Place granulated sugar, lavender, and lemon zest in a food processor. Scrape in seeds from vanilla bean; save pod for another use. Pulse until lavender is finely chopped; set 1 Tbsp. lavender sugar aside for topping.Using an electric mixer on medium-high speed, beat remaining lavender sugar and ½ cup butter in a large bowl until very light and fluffy, 5–7 minutes (don’t shortchange yourself here; the long beating time aerates the cake and yields the finest texture). Add eggs one at a time, beating to blend after each addition and scraping down sides and bottom of bowl as needed.Combine buttermilk and lemon juice in a small bowl. Reduce speed to low and add dry ingredients to lavender sugar mixture in 3 additions, alternating with buttermilk mixture in 2 additions, beginning and ending with dry ingredients. Stop mixer just before all dry ingredients are incorporated and finish mixing by hand, a guarantee against overmixing the batter, which can cause the cake to be tough. Scrape batter into prepared pan and smooth top with a spatula.Bake cake until a tester inserted into the center comes out clean, 55–65 minutes. Transfer pan to a wire rack; let cake cool in pan 20 minutes before turning out and peeling off parchment. Let cool completely.Do Ahead: Lavender sugar can be made 1 month ahead; store airtight at room temperature. Cake can be baked 2 days ahead; store tightly wrapped at room temperature.GlazeWhisk powdered sugar and buttermilk in a medium bowl. Pour over cooled cake, letting excess drip over sides. Using a lemon zester, zest lemon into strips into a small bowl; add 1 Tbsp. reserved lavender sugar and toss to coat. Top cake with sugared lemon zest. Let sit until glaze is set, about 30 minutes.Do Ahead: Glazed cake (without zest) can be made 1 day ahead; store under a cake dome (or an overturned bowl) at room temperature. Top with sugared lemon zest just before serving.
67	/mint-truffles	Mint Truffles Recipe 	 Bon Appetit	9 ounces bittersweet chocolate (70% cacao), chopped,1¼ cups heavy cream,½ cup sugar,2 teaspoons mint extract,⅓ cup fresh mint leaves,	DIRECTIONS PreparationPlace chocolate in a medium bowl. Bring cream to a simmer in a small saucepan over medium heat. Pour over chocolate and let sit until chocolate is softened, about 3 minutes. Add mint extract and whisk until smooth. Cover and chill until ganache is firm enough to roll into balls, at least 3 hours.Pulse sugar and fresh mint in a food processor until mint is very finely chopped; transfer to a small bowl. Scoop out a scant tablespoonful of ganache. Roll into a ball (if you’d like, wear disposable gloves to keep your hands clean), then roll in mint sugar. Place on a parchment-lined baking sheet. Repeat with remaining ganache. Chill truffles until firm, at least 1 hour.Do ahead: Ganache can be made 3 days ahead; keep chilled. Truffles can be made 1 week ahead; store airtight in the refrigerator.
68	/green-goddess-crunch-sandwich	Green Goddess Crunch Sandwich Recipe 	 Bon Appetit	¼ cup finely chopped chives,¼ cup mayonnaise,¼ cup tarragon,¼ cup whole-milk Greek yogurt,1 lemon, halved,2 tablespoons extra-virgin olive oil, plus more for drizzling,Kosher salt, freshly ground pepper,½ head of butter or Bibb lettuce (about 2 ounces), large leaves torn,¼ English hothouse cucumber, thinly sliced,1 avocado, thinly sliced,4 slices grainy bread,8 ounces fresh mozzarella, sliced ¼ inch thick,2 cups sprouts (such as broccoli sprouts or alfalfa),	DIRECTIONS PreparationPlace chives, mayonnaise, tarragon, and yogurt in a blender. Add zest and juice of 1 lemon half, then add 2 Tbsp. oil; season with salt and pepper. Purée until smooth.Squeeze juice from remaining lemon half over lettuce and cucumbers in a medium bowl. Drizzle with oil; season with salt and pepper. Toss to coat.Divide and smash avocado between 2 slices of bread; season with salt and pepper. Arrange lettuce and cucumbers over. Top with mozzarella and sprouts. Spread remaining 2 slices of bread with ¼ cup green goddess dressing and close sandwiches.
69	/spicy-mousse-recipe	Spicy Mousse Recipe 	 Bon Appetit	2 dried ancho chiles, stems removed,1-2 dried arbol chiles, stems removed, plus more for serving,2 cups heavy cream,½ vanilla bean, split and scraped,3 cinnamon sticks,1 tablespoon powdered sugar,8 ounces bittersweet chocolate, chopped,2 tablespoons unsalted butter, cut into pieces,4 large eggs, yolks and whites separated,1/3 cup granulated sugar,Softly whipped cream, for serving,	DIRECTIONS PreparationToast chiles in a medium dry saucepan over medium heat until fragrant and lightly browned, tossing often, about two minutes. Remove from pot and let sit until cool enough to handle. Crush chiles and return to pot with cream, vanilla, and cinnamon sticks and bring to a boil. Reduce to a simmer and cook 5 minutes. Remove from heat and let sit until cream has been infused with flavors, 15-20 minutes. Strain into a medium bowl set over ice and stir until mixture is cold. Whip just until very soft peaks form, watching constantly (cream will overbeat and curdle rapidly). Beat in powdered sugar and chill.Melt chocolate in large heatproof bowl set over a saucepan of simmering water, stirring with a heatproof spatula just until smooth, about 5 minutes. Remove from heat and stir in butter pieces until melted. Stir in egg yolks one at a time until fully incorporated (mixture will look slightly grainy but will smooth out eventually). Set aside.Beat egg whites until foamy and slowly add sugar, beating constantly, until soft peaks form. Do not overbeat. Gently fold egg white mixture into chocolate mixture in two additions. Gently fold in whipped cream mixture.Spoon mousse into individual serving glasses, cover with plastic wrap, and chill until set, at least 2 hours and up to overnight.Let mousse sit at room temperature before serving, 25-30 minutes. Serve mousse with softly whipped cream and more crushed chile.Do aheadMousse can be made 1 day ahead.
70	/tepache	Tepache Recipe 	 Bon Appetit	1 pineapple, with skin, top and bottom trimmed, cut into 1” pieces (about 10 cups),1 cup turbinado sugar,1 cup palm sugar, chopped,3 tablespoons whole coriander seeds,1 tablespoon grains of paradise,6 long peppercorns,1 tablespoon cubeb pepper,	DIRECTIONS PreparationCombine pineapple, turbinado sugar, palm sugar, coriander, grains of paradise, long peppercorns, cubeb peppers, and 8 cups warm water in a 4-quart container with a tight-fitting lid. Stir to combine, cover tightly, and set aside in a warm, draft-free area (about 75°F) until sugar is dissolved, mixture is slightly warmer than room temperature, and a little fizzy, 2-3 days. (Check after the 2nd day. If mixture isn’t ready, cover and let ferment another day).Using a slotted spoon, skim the solids from the top of the container and discard. Strain mixture through a cheese-cloth-lined fine-meshed sieve into a 3-qt. container. Cover and let sit at room temperature overnight, then refrigerate.DO AHEAD: Tepache can be made up to one week ahead.
71	/pisco-punch-grilled-lemons	Pisco Punch with Grilled Lemons Recipe 	 Bon Appetit	4 lemons, halved,2 cups Pisco,½ cup simple syrup (click for recipe),1 cup pineapple juice,1 cup club soda,	DIRECTIONS PreparationPrepare grill for medium heat. Grill lemon halves, cut-side down, until lightly charred, about 2 minutes; let cool.Squeeze grilled lemons into a large pitcher and add halves; add Pisco, simple syrup, and pineapple juice. Chill 1 hour. Strain into ice-filled rocks glasses, and top with club soda, about 1 oz. per glass.
72	/gorts-reprieve-irish-coffee	Gort's Reprieve Irish Coffee Recipe 	 Bon Appetit	4 ounces hot freshly brewed coffee,1 1/2 ounces Redbreast Irish Whiskey,3/4 ounce amaro (such as Luxardo Amaro Abano),1 teaspoon simple syrup,4 dashes Bittermens New Orleans Coffee Bitters (optional),Whipped cream, ground nutmeg, cinnamon, and allspice (for serving),1 fresh mint leaf,2 coffee beans,	DIRECTIONS PreparationStir coffee, whiskey, liqueur, simple syrup, and bitters in a glass to combine. Top with whipped cream, nutmeg, cinnamon, and allspice and garnish with mint leaf and coffee beans.
73	/cinnamon-sugar-apples	Cinnamon Sugar Apples Recipe 	 Bon Appetit	1 sliced tart apple,1 teaspoon sugar,¼ teaspoon ground cinnamon,	DIRECTIONS PreparationPlace apple, sugar, and ground cinnamon in a resealable plastic bag. Toss to combine, then let sit at room temperature 30 minutes or refrigerate up to 6 hours.
74	/rye-rye-riot	The Nellie Kuh Recipe 	 Bon Appetit	1 tablespoon very finely chopped crystallized ginger,1 tablespoon sugar,Lime wedge (for glass),2 ½ oz. rye whiskey,1 oz. fresh lime juice,½ oz. Ginger Syrup (click for recipe),¼ teaspoon orange-flower water,	DIRECTIONS PreparationCombine ginger and sugar on a small plate, rubbing together with your fingers to combine (should be sandy; this will help the ginger stick to rim. Rub the rim of a coupe glass with lime wedge and dip rim into ginger mixture to coat. Combine whiskey, lime juice, ginger syrup and orange blossom water in a cocktail shaker; fill shaker with ice and shake until outside of shaker is frosty, about 30 seconds. Strain into prepared glass.
75	/ginger-chocolate-guinness-float	Ginger-Chocolate Guinness Float Recipe 	 Bon Appetit	1 ounce chocolate syrup,3 scoops ginger ice cream,4 ounces Guinness stout,	DIRECTIONS PreparationPlace chocolate syrup in a tall glass. Add ice cream and top off with Guinness. Serve with a straw and a long spoon.
77	/grilled-sesame-shrimp-herb-salad	Grilled Sesame Shrimp with Herb Salad Recipe 	 Bon Appetit	1 pound large shrimp, peeled and deveined,¼ cup fish sauce,1 tablespoon toasted sesame oil,2 teaspoons crushed red chile flakes,Kosher salt, freshly ground pepper,1 tablespoon gochujang (Korean red pepper paste),2 tablespoons rice wine vinegar,½ teaspoon toasted sesame oil,Kosher salt,2 cups fresh parsley, mint, cilantro, or basil, torn if large,2 medium carrots, peeled, julienned (about 1 cup),½ medium English cucumber, halved lengthwise and thinly sliced into half-moons (about 1 cup),2 large radishes, halved lengthwise and thinly sliced into half-moons (about ½ cup),1 teaspoon toasted sesame seeds, plus more for serving,Lime wedges, for serving,	DIRECTIONS PreparationShrimpPrepare grill for medium-high heat. Whisk fish sauce, sesame oil, and chile flakes in small bowl; add shrimp and toss to coat. Set aside to marinate, 15 minutes.Lightly brush grill with oil. Season both sides of shrimp with salt and pepper and grill, turning once, until opaque throughout, about 4 minutes.Salad and AssemblyMeanwhile, whisk together gochujang, vinegar, and sesame oil in medium bowl. Add herbs, carrots, cucumber, and radishes and toss to combine; season with salt. Serve shrimp topped with salad and sprinkled with sesame seeds.
78	/swordfish-with-spinach-golden-raisins-and-pine-nuts	Swordfish with Spinach, Golden Raisins, and Pine Nuts Recipe 	 Bon Appetit	4 cups spinach,2 tablespoons golden raisins,1 tablespoon pine nuts,2 tablespoons olive oil,Fresh lemon juice,3 ounces leftover swordfish from Seared Swordfish with Fennel and Endive (click here for recipe),	DIRECTIONS PreparationToss spinach, raisins, and pine nuts with olive oil and lemon juice. Break swordfish into pieces and serve on top of greens.
79	/vintage-coffee-cocktail	Vintage Coffee Cocktail Recipe 	 Bon Appetit	1 14.9-oz. can Guinness,1 tablespoon malt extract (optional),1 vanilla bean, split lengthwise,1/2 cup heavy cream,4 ounces hot freshly drawn espresso,1 1/2 ounces Paddy old Irish whiskey,1 teaspoon mild-flavored (light) molasses, plus more to taste,Ground nutmeg (for serving),	DIRECTIONS PreparationCombine Guinness and malt extract, if using, in a small saucepan; scrape in vanilla seeds and add pod. Bring to a boil, reduce heat, and simmer, swirling occasionally, until reduced by one-third, about 12 minutes; remove vanilla bean and let cool.Whisk cream and 1 ½ oz. Guinness reduction in a small bowl until slightly thickened.Stir espresso, whiskey, and molasses in an Irish coffee glass until molasses is dissolved. Top with Guinness whipped cream and nutmeg.
80	/beet-and-arugula-salad-with-quinoa-avocado-and-sunflower-seeds	Beet and Arugula Salad with Quinoa, Avocado, and Sunflower Seeds Recipe 	 Bon Appetit	¼ cup leftover beets from Beet and Escarole Salad with Avocado and Walnuts,3 cups arugula,¼ cup quinoa,Olive oil,Lemon,2 ounces (¼ large) ounce avocado,1 ounce goat cheese,1 tablespoon sunflower seeds,	DIRECTIONS PreparationToss beets with arugula, quinoa, olive oil, and lemon. Top with avocado, goat cheese, and sunflower seeds.
81	/tofu-cabbage-salad-with-kimchi-miso-dressing-and-peanuts	Tofu Cabbage Salad with Kimchi Miso Dressing and Peanuts Recipe 	 Bon Appetit	2 cups shredded cabbage,1 cup shredded carrots,4 ounces leftover tofu from Brussels Sprouts and Tofu Stir-Fry,2 tablespoons Kimchi Miso Dressing,¼ cup cilantro,1 tablespoon chopped peanuts,	DIRECTIONS PreparationToss cabbage, carrots, and tofu with dressing. Top with cilantro and peanuts.
82	/blind-abbot	The Blind Abbot Recipe 	 Bon Appetit	1 1/2 ounces Tullamore Dew Irish whiskey,1 ounce chilled freshly brewed coffee,3/4 ounce Galliano Ristretto,1/2 ounce Cinnamon Syrup (click for recipe),3 dashes Angostura bitters,Whipped cream and ground cinnamon (for serving),	DIRECTIONS PreparationCombine whiskey, coffee, liqueur, cinnamon syrup, and bitters in a cocktail shaker; fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into an Irish coffee glass and top with whipped cream and cinnamon.
83	/benicea-boy-irish-coffee	Benicea Boy Irish Coffee Recipe 	 Bon Appetit	4 teaspoons demerara sugar,6 ounces hot freshly brewed coffee,1 1/2 ounces blended Irish whiskey (such as Jameson),Whipped cream and ground nutmeg (for serving),	DIRECTIONS PreparationStir sugar and 4 teaspoons hot water in a small bowl until sugar is dissolved.Stir demerara syrup, coffee and whiskey in a glass to combine and top with whipped cream and nutmeg.
84	/rhubarb-cornmeal-crumb-cake	Rhubarb Cornmeal Crumb Cake Recipe 	 Bon Appetit	½ cup all-purpose flour,½ cup cornmeal,¼ cup granulated sugar,2 tablespoons light brown sugar,½ teaspoon baking powder,¼ teaspoon kosher salt,3 tablespoons chilled unsalted butter, cut into pieces,1 large egg, beaten to blend,½ cup (1 stick) unsalted butter, room temperature, plus more for pan,1 cup all-purpose flour, plus more for pan,1 ½ pound rhubarb, trimmed, sliced 1/4" thick (about 5 cups),1 tablespoon grated peeled ginger,¾ cup granulated sugar, divided,1 1/3 cups cornmeal,2 teaspoons baking powder,1 teaspoon kosher salt,1 cup whole milk,½ cup plain whole-milk Greek yogurt,½ cup (packed) light brown sugar,4 large egg yolks,	DIRECTIONS PreparationCrumb ToppingWhisk flour, cornmeal, granulated sugar, brown sugar, baking powder, and salt in a medium bowl. Using your fingers, work in butter until pieces are the size of small peas. Using a fork, mis in egg until mixture comes together in varying size clumps. Cover and chill.DO AHEAD: Crumb can be made 3 days ahead. Cover and chill.Cake and AssemblyPreheat oven to 350°. Lightly butter and flour a 13-by-9" baking dish. Toss rhubarb, ginger, and ¼ cup granulated sugar in a medium bowl.Whisk cornmeal, baking powder, salt, and 1 cup flour in another medium bowl. Whisk milk and yogurt in a small bowl.Using an electric mixer on medium-high speed, beat brown sugar, remaining ½ cup sugar, and 1/2 cup butter until light and fluffy, about 3 minutes. Add egg yolks one at a time, beating to blend between additions.Reduce speed to low and add dry ingredients in 3 additions, alternating with milk mixture in 2 additions, beginning and ending with dry ingredients. Fold in rhubarb mixture. Scrape batter into prepared pan and scatter crumble topping over.Bake cake until golden brown and a tester inserted into the center comes out clean, 55–65 minutes. Transfer to a wire rack and let cool slightly.
85	/strawberry-pineapple-hotness	Strawberry-Pineapple Hotness Recipe 	 Bon Appetit	2 strawberries, hulled, halved,2 teaspoons sugar,2 ounces vodka,2 ounces pineapple juice,½ teaspoon adobo sauce from canned chipotle chiles in adobo sauce,Pineapple slice (for serving),	DIRECTIONS PreparationMuddle strawberries and sugar in a cocktail shaker. Add vodka, pineapple juice, and adobo sauce; fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a rocks glass filled with ice and garnish with pineapple slice.
86	/thanksgiving-butterball-with-salt-and-maple	Thanksgiving Butterball with Salt and Maple Recipe 	 Bon Appetit	½ cup (1 stick) unsalted butter, room temperature,2 tablespoons pure maple syrup,½ teaspoon kosher salt,	DIRECTIONS PreparationStir mix-ins into butter in a small bowl. Cover and chill until ready to use (up to 3 days). Bring to room temperature before serving so butter is easy to spread. Or, if using molds, press butter into molds while still soft and chill until firm. Unmold just before serving.
87	/sundaes-with-brown-buttercornbread-crumble	Sundaes with Cornbread Crumble Recipe Recipe 	 Bon Appetit	½ cup (1 stick) unsalted butter,1 pound baked store-bought cornbread crumbled (about 4 cups),A pinch of kosher salt,6 tablespoons raw sugar, divided,8 ounces fresh blackberries, halved crosswise if large,1 pint vanilla ice cream,	DIRECTIONS PreparationPreheat oven to 400°. Cook butter in a large saucepan over medium heat, swirling pan and stirring occasionally to prevent solids from sticking to bottom, until butter foams and then browns, 5–8 minutes. Remove from heat; add cornbread, salt, and 4 Tbsp. sugar and fold gently until cornbread is evenly coated.Spread out on a rimmed baking sheet and bake until crumbs are golden brown, 10–15 minutes (crumbs will look wet but will crisp and dry out as they cool). Let cool.Meanwhile, combine berries and remaining 2 Tbsp. sugar in a large bowl. Let berries sit, tossing occasionally and mashing a few with a spoon, until some juices accumulate, 15–20 minutes.Divide ice cream among small bowls and spoon berries plus juices over top. Sprinkle with some of cornbread crumble.Do Ahead: Crumble can be made 3 days ahead. Store airtight at room temperature.
88	/cod-romesco-sauce-hazelnuts-lemon-parsley	Cod with Romesco Sauce, Hazelnuts, Lemon, and Parsley Recipe 	 Bon Appetit	⅓ cup blanched hazelnuts,6 tablespoons olive oil, divided,Kosher salt,4 red bell peppers,1 medium tomato, halved crosswise, seeded,2 garlic cloves, finely grated,2 tablespoons sherry vinegar,½ teaspoon hot smoked Spanish paprika,¼ teaspoon cayenne pepper,4 6-ounce skinless cod fillets,2 tablespoons olive oil, plus more for serving,Kosher salt,2 teaspoons finely grated lemon zest,2 tablespoons fresh lemon juice,2 cups parsley leaves with tender stems,	DIRECTIONS PreparationRomescoPreheat oven to 350º. Toast hazelnuts on a rimmed baking sheet, tossing once, until golden brown and fragrant, 7–10 minutes; let cool. Smash hazelnuts in a mortar and pestle until very coarsely ground. (Alternatively, you can crush using the bottom of a mug or small saucepan.) Transfer to a small bowl. Stir in 2 Tbsp. oil and season with salt; set aside.Place a rack in upper third of oven and heat broiler. Broil peppers and tomatoes, skin side up, on a rimmed baking sheet, turning peppers occasionally, until charred all around and flesh is soft, 12–15 minutes.Slip off tomato skins; discard. Transfer peppers to a medium bowl and cover with plastic wrap so they can steam a bit (this extends the cooking and also makes the charred peels easier to remove). Peel peppers (flesh should feel slippery) and discard seeds; coarsely chop. Transfer peppers and tomatoes to a mortar and pestle and smash, covering the mortar slightly with your hands to prevent juices from splattering everywhere, until mixture achieves a saucy consistency. (You can also do this by pulsing in a food processor.)Transfer romesco sauce to a clean medium bowl. Add garlic, vinegar, paprika, cayenne, and remaining ¼ cup oil; season with salt and let sit 15 minutes.Fish and AssemblyPreheat oven to 350°. Place fish a rimmed baking sheet and rub with with 2 Tbsp. oil; season with salt on both sides. Bake fish until cooked through and a paring knife can easily slip through flesh, 10–12 minutes. Top with zest while fish is hot.Toss parsley, lemon juice, a drizzle of oil, and a pinch of salt in a small bowl. Spoon romesco onto plates, then spoon reserved oily hazelnuts over sauce. Arrange fish over, then top with parsley mixture.
89	/pork-with-nuoc-cham	Pork with Nuoc Cham Recipe Recipe 	 Bon Appetit	2 tablespoons fresh lime juice,2 tablespoons fish sauce,½ teaspoon sugar,1 small garlic clove, finely chopped,1 tablespoon finely chopped cilantro stems, plus leaves for serving,2 1-inch-thick boneless pork shoulder steaks (about 1 pound each),Kosher salt, freshly ground pepper,2 tablespoons olive oil,	DIRECTIONS PreparationPrepare a grill for medium heat. Whisk lime juice, fish sauce, sugar, and 1 Tbsp. water in a small bowl until sugar is dissolved. Stir in garlic and cilantro stems; set nuoc cham aside.Place pork on a rimmed baking sheet and season generously on both sides with salt and pepper, then drizzle with oil and turn pork to coat. Grill, turning often and moving around on grill to prevent flare-ups, until lightly charred all over and an instant-read thermometer inserted into the center registers 140° for medium), 12–15 minutes. Transfer meat to a cutting board and let rest 10 minutes before slicing.Spoon some of nuoc cham over pork and top with cilantro leaves. Serve remaining sauce alongside.
90	/kombucha-vodka-highball	Kombucha-Vodka Cocktail Recipe Recipe 	 Bon Appetit	1½ ounces vodka,¾ ounce fresh lime juice,2 teaspoons simple syrup,3 ounces ginger-flavored kombucha,Lime wedge (for serving),	DIRECTIONS PreparationCombine vodka, lime juice, and simple syrup in an ice-filled glass. Top with kombucha and garnish with a lime wedge.
91	/retox	The Retox Recipe 	 Bon Appetit	2 ounces whiskey,2 ounces apple cider,1 ounce apple cider vinegar,1 teaspoon pure maple syrup,1/8 teaspoon cayenne pepper,A few dashes angostura bitters,Orange twist (for garnish),	DIRECTIONS PreparationCombine apple cider, whiskey, vinegar, maple syrup, and cayenne in a cocktail shaker; fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a rocks glass filled with ice, top with bitters, and garnish with orange twist.
92	/sweet-potato-hummus	Sweet Potato Hummus Recipe 	 Bon Appetit	1 large sweet potato (about 1½ pounds), peeled, cut into large pieces (about 3 cups),2 garlic cloves, smashed,Olive oil (for drizzling),3 tablespoons pure tahini or tahini butter,1½ teaspoons kosher salt, plus more,1 lime, halved,	DIRECTIONS PreparationPlace a rack in upper third of oven and preheat to 375°. Scatter sweet potato and garlic across a parchment-lined baking sheet, generously drizzle with oil, and toss to coat. Roast, tossing halfway through, until garlic is golden brown and sweet potato is tender and browned in a few spots, 40–45 minutes.Let vegetables cool slightly, then transfer to a food processor or blender and purée until smooth. Add tahini and 1½ tsp. salt and squeeze in juice from lime; pulse to incorporate. With motor running, gradually add 1 cup water. Mixture should be the consistency of hummus; add a little more water if needed. Taste and season with more salt if needed.Do Ahead: Hummus can be made 3 ahead. Cover and chill. Bring to room temperature before serving.
93	/rye-and-caraway-crackers	Rye and Caraway Crackers Recipe Recipe 	 Bon Appetit	¾ teaspoon caraway seeds,¾ cup all-purpose flour,3 tablespoons olive oil,2 tablespoons rye flour,½ teaspoon kosher salt,Flaky sea salt,A spice mill or mortar and pestle,	DIRECTIONS PreparationPreheat oven to 400°. Grind caraway seeds in spice mill or with mortar and pestle until coarsely ground. Transfer to a food processor. Add all-purpose flour, oil, rye flour, and kosher salt and process to combine. With the motor running, pour in ¼ cup water and continue to process until mixture resembles wet sand.Transfer dough a clean work surface and knead until smooth, about 2 minutes. Roll out dough until you can almost see through it (about 14x9"). Transfer to a parchment-lined rimmed baking sheet. Dough might be an irregular shape, but that’s fine; just trim any excess so it fits on sheet. Sprinkle dough with sea salt.Bake cracker until golden brown, 14–16 minutes. Let cool before breaking into irregular pieces.
95	/homemade-vinegar	Homemade Vinegar Recipe 	 Bon Appetit	1½ cups dry red wine (or white wine),½ cup raw apple cider vinegar,	DIRECTIONS PreparationThe most surefire way to make vinegar is by using a vinegar mother (you can order one online). The next best way to make it is to use a heavy dose of unfiltered raw vinegar (like Bragg’s Cider Vinegar) to start a fermentation. The “mother” may not be visible in the vinegar (it will resemble a small jellyfish), but the raw vinegar should trigger a new fermentation once mixed with new wine. This should help grow a new visible mother as well as a pellicle (a thin layer of cellulose that acts as a barrier between the air and the vinegar while it ferments). Transferring the mother, along with a layer of the pellicle, will both work to quickly start new fermentations in the future.Combine wine and vinegar in a nonreactive (preferably glass) container. Top with cheesecloth or a clean kitchen towel; secure with a rubber band. Let sit in a dark place, stirring and tasting occasionally (like every few days), until it tastes fully vinegar-y (this could take from several weeks to several months). Along the way it might smell sort of weird, skunky, or maybe like nail polish remover as ours did for days on end. Don’t give up, just keep going. When your vinegar tastes as sharply acidic as your store-bought stuff does, you are ready to bottle it.Pour off three-quarters of vinegar into a clean, airtight bottle with as little empty space as possible. You can continue to age it in the bottle where its aroma and flavor should continue to improve. (Oxygen helps convert alcohol into acetic acid, but once all the alcohol is consumed, exposure to oxygen should be limited as much as possible.) You can now add more wine to the mother and pellicle left behind to start a new batch.
96	/shrimp-scampi	Shrimp Scampi Recipe 	 Bon Appetit	4 garlic cloves, 2 grated, 2 thinly sliced,1 teaspoon kosher salt,3 tablespoons olive oil, divided,1 pound large shrimp, peeled, deveined,¼ teaspoon red pepper flakes,¼ cup dry white wine,1 tablespoon fresh lemon juice,¼ cup (½ stick) unsalted butter,3 tablespoons chopped parsley,Warm crusty bread (for serving),	DIRECTIONS PreparationWhisk grated garlic, salt, and 1 Tbsp. oil in a medium bowl. Add shrimp, toss to coat, and chill, uncovered, at least 30 minutes and up to 1 hour.Heat remaining 2 Tbsp. oil in a large skillet over medium and cook shrimp mixture, being careful not to let shrimp or garlic brown, until shrimp is pink but still slightly underdone, about 1 minute per side. Transfer to a plate with a slotted spoon, leaving as much oil in pan as possible. Add sliced garlic and red pepper to skillet and cook, tossing, until fragrant, about 1 minute. Add wine and lemon juice and cook, stirring occasionally, until reduced by half, about 2 minutes. Add butter and cook, stirring and swirling pan occasionally, until butter is melted and sauce is thickened, about 5 minutes more.Scrape shrimp along with any accumulated juices into skillet. Toss to coat and cook until shrimp are fully cooked through, about 2 minutes. Transfer to a platter, top with parsley, and serve with bread for dipping alongside.
97	/ginger-miso-grilled-asparagus	Ginger-Miso Grilled Asparagus Recipe 	 Bon Appetit	¼ cup plus 2 tablespoons mirin (sweet Japanese rice wine),¼ cup white miso,2 tablespoons seasoned rice wine vinegar,2 teaspoons freshly grated peeled ginger,2 bunches asparagus (about 2 pounds), trimmed,Lime wedges, thinly sliced scallions, and toasted sesame seeds (for serving),	DIRECTIONS PreparationPrepare a grill for high heat. Whisk mirin, miso, vinegar, and ginger in a small bowl. Place asparagus in a pie plate or small baking dish and pour miso mixture over. Toss to coat.Grill asparagus, turning occasionally, until charred on all sides and crisp-tender, 4–5 minutes. Transfer to a platter. Squeeze lime juice over, then top with scallions and sesame seeds.
98	/smashed-cherry-tomatoes-and-cucumbers-with-lime-and-mint	Smashed Cherry Tomatoes and Cucumbers with Lime and Mint Recipe 	 Bon Appetit	4 medium Persian cucumbers,2 pints cherry tomatoes,¼ cup fresh lime juice, divided,¼ cup olive oil, divided,Flaky sea salt,2 teaspoons crushed dried mint,	DIRECTIONS PreparationMake a diagonal cut on 1 end of cucumber; discard piece. Roll cucumber a quarter turn toward you, then cut again on the diagonal about 1" from cut end (we call this a roll cut in culinary school) so piece has 2 angled ends. Repeat until cucumber is chopped, then do the same with remaining cucumbers. Gently smash tomatoes with a mug or small saucepan until flesh starts to break apart.Place tomatoes and cucumbers in 2 separate medium bowls. Divide lime juice and oil between bowls and toss to coat; season generously with salt. Transfer tomatoes and cucumbers to a small platter and top with mint.
99	/smooth-and-spicy-almond-sauce	Smooth and Spicy Almond Sauce Recipe 	 Bon Appetit	1 ½-inch piece ginger, peeled, coarsely chopped,1 cup smooth almond butter,1 tablespoon fresh lemon juice,1 tablespoon honey,1 teaspoon smoked paprika,⅛ teaspoon cayenne pepper,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationPulse ginger in a food processor until finely chopped. Add almond butter, lemon juice, honey, paprika, cayenne, and ⅓ cup ice-cold water and pulse, adding more water by the tablespoonful to thin if needed, until smooth. Season with salt and pepper.Do Ahead: Almond sauce can be made 3 days ahead; cover and chill. Bring to room temperature before using.
100	/barbecue-apple-milk-punch	Barbecue Apple Milk Punch Recipe 	 Bon Appetit	1 ½ cups apple brandy (preferably Laird’s),1 ½ cups gin (preferably CapRock),1 ½ cups maple liqueur (preferably Green Mountain),1 ½ cups mescal (preferably El Buho),1 ½ cups fresh lemon juice,1 ½ cups Apple Cider Syrup (click for recipe),Tabasco smoked chipotle hot sauce (optional),3 cups whole milk,Cheesecloth,	DIRECTIONS PreparationCombine brandy, gin, liqueur, mezcal, lemon juice, and syrup in a large pitcher.Bring milk to a bare simmer in a medium saucepan. Immediately pour milk into brandy mixture (milk will curdle right away). Cover and chill at least 1 hour and up to 24 hours.Strain mixture through a fine-mesh sieve lined with cheesecloth into a large bowl. Cover and chill until cold (any remaining curds should settle at the bottom of the pitcher).Carefully ladle clarified punch into a clean pitcher, leaving any remaining curds behind. Chill until ready to serve.Do aheadPunch base can be made 1 week ahead. Keep chilled.
101	/butterballs	Butterballs Recipe 	 Bon Appetit	1 cup pecans,½ cup (1 stick) unsalted butter,2 tablespoons powdered sugar, plus more for dusting,1 tablespoon rum,½ teaspoon kosher salt,½ teaspoon vanilla extract,¾ cup all-purpose flour,	DIRECTIONS PreparationArrange racks in upper and lower thirds of oven; preheat oven to 350°. Toast pecans on a rimmed baking sheet until slightly darker and very fragrant, 6–8 minutes. Let cool slightly, then pulse in a food processor until very finely chopped.Using an electric mixer on medium-high speed, beat butter and 2 Tbsp. powdered sugar in a large bowl (this can also be done by hand) until well combined. Add rum, salt, and vanilla and beat until smooth. Add flour and pecans, then beat on low speed until just combined.Roll tablespoonfuls of dough into balls with your hands. Place on 2 parchment-lined baking sheets, spacing at least 1" apart.Bake cookies, rotating sheets halfway through, until golden brown and firm around the edges, 15–18 minutes. Let cool, then roll in more powdered sugar, knocking off any excess.Do Ahead: Cookies, before rolling in sugar, can be made 2 months ahead; store airtight and freeze.
102	/seasonal-milk-punch	Seasonal Milk Punch Recipe 	 Bon Appetit	Zest of 1 lemon, removed with a peeler,Zest of 1 lime, removed with a peeler,Zest of 1 orange, removed with a peeler,½ cup granulated sugar,½ cup (packed) light brown sugar,8 dashes orange bitters,1 750-ml bottle bourbon,1 750-ml bottle dark rum,1 cup fresh lemon juice,1 cup fresh lime juice,1 cup fresh orange juice,8 cups whole milk,	DIRECTIONS PreparationUsing a wooden spoon, muddle lemon zest, lime zest, orange zest, granulated sugar, and brown sugar in a medium bowl until fragrant, about 30 seconds. Add Port and bitters and let sit 15 minutes. Stir in bourbon, rum, lemon juice, lime juice, orange juice, and 1 cup water.Bring milk to a bare simmer in a medium saucepan. Immediately pour milk into Cognac mixture (milk will curdle right away). Cover and chill at least 1 hour and up to 24 hours.Strain mixture through a fine-mesh sieve lined with cheesecloth into a large bowl. Cover and chill until cold (any remaining curds should settle at the bottom of the pitcher).Carefully ladle clarified punch into a clean pitcher, leaving any remaining curds behind. Chill until ready to serve.Do aheadPunch base can be made 1 week ahead. Keep chilled.
103	/miso-chicken-noodle-soup	Miso Chicken Noodle Soup Recipe 	 Bon Appetit	1 3x5-inch piece kombu,¾ ounce bonito flakes (about 1½ packed cups),2 medium carrots, cut into ¼-inch coins,2 ounces tiny star pasta (about ⅓ cup) or other small pasta shape,Kosher salt,1 cup shredded rotisserie chicken or any other cooked leftover chicken,¼ cup white miso,Leaves from 4 celery heart stalks (about ½ cup; for serving),	DIRECTIONS PreparationCombine kombu and 4 cups water in a large pot. Let sit until kombu softens, 25–30 minutes. Bring to a simmer over medium heat. Immediately remove from heat once water starts simmering; fish out kombu and discard. Add bonito flakes and stir once to submerge them. Bring to a gentle boil, reduce heat, and simmer about 5 minutes. Remove from heat and let steep 15 minutes (this ensures you get the most flavorful broth, or dashi, possible). Strain dashi through a fine-mesh strainer into a medium bowl. Discard solids, wipe out pot, and return dashi to pot.Cook carrots and pasta together in a separate pot of boiling salted water until pasta is al dente and carrots are tender, about 4 minutes. Drain, rinse under cold water, then drain thoroughly again. Add to pot with dashi along with chicken and bring to a simmer. Remove from heat. Submerge sieve in liquid, add miso to sieve, and stir to liquefy miso, then press through strainer until miso is dissolved.Divide soup among bowls. Top with celery leaves.
104	/cheesy-monkey-bread	Cheesy Monkey Bread Recipe 	 Bon Appetit	½ pound Monterey Jack,1 ounce Parmesan,¼ cup (½ stick) cold unsalted butter,1 shallot, chopped,4 garlic cloves, finely chopped,¼ cup finely chopped parsley,¼ teaspoon crushed red pepper flakes,Kosher salt; freshly ground pepper,1 pound cold pizza dough, cut into 1-inch pieces,Nonstick vegetable oil spray,	DIRECTIONS PreparationCoarsely shred both cheeses on the large holes of a box grater. Coarsely shred butter on the large holes of box grater. Toss cheeses, butter, shallot, garlic, parsley, and red pepper in a medium bowl; season generously with salt and pepper. Transfer one-third of cheese mixture to a small bowl; set aside. Add dough pieces, a few at a time, to remaining cheese mixture in original bowl and toss gently to coat.Lightly coat a medium skillet with nonstick spray. Arrange dough in skillet in an even layer; pour any leftover cheese mixture in bowl over. Let sit in a warm place until beginning to puff slightly, 30–40 minutes.Meanwhile, preheat oven to 375°. Bake bread until top is lightly browned and cheese is melted, 18–22 minutes. Top bread with reserved cheese mixture. Continue to bake until edges of bread are golden brown and firm and cheese is melted and oozing, 10–15 minutes more. Serve hot.
105	/vanilla-soy-vegan-ice-cream	Vanilla Soy Vegan Ice Cream Recipe 	 Bon Appetit	1 pound silken tofu,½ cup plus 2 tablespoons organic or granulated sugar,½ teaspoon kosher salt,1 vanilla bean, split lengthwise,¾ cup refined coconut oil, melted, cooled slightly,An ice cream maker,	DIRECTIONS PreparationPlace tofu, sugar, and salt in a blender. Scrape in seeds from vanilla bean; reserve pod for another use. Purée until smooth, about 15 seconds. With the motor running on medium speed, slowly stream in oil and purée until thick and creamy, being careful not to overblend or mixture will curdle.Immediately process tofu mixture in ice cream maker according to manufacturer’s directions. (Head’s up: this will take longer than a traditional dairy-based custard to reach soft-serve consistency.) Do not chill before processing or oil will harden into tiny bits and texture will be grainy.Transfer to an airtight container and press plastic wrap directly onto surface. Freeze until firm, at least 4 hours.Do Ahead: Ice cream can be made 1 month ahead; keep frozen.
106	/the-layaway	The Layaway Cocktail Recipe 	 Bon Appetit	2 ounces spiced rum,2 ounces strong black coffee, room temperature,½ ounce fresh lemon juice,4 ounces ginger beer,	DIRECTIONS PreparationCombine rum, coffee, and lemon juice in a cocktail shaker. Fill shaker with ice, cover, and shake vigorously until outside of shaker begins to get cold, about 10 seconds.  Strain into a chilled coupe glass and top with ginger beer.
107	/gluten-free-oat-and-buckwheat-pancakes	Gluten-Free Oat and Buckwheat Pancakes Recipe 	 Bon Appetit	¼ cup (½ stick) unsalted butter, plus more for pan,2 cups buttermilk,1 cup old-fashioned oats (not quick-cooking),2 large eggs,½ cup buckwheat flour,2 tablespoons ground flaxseeds,1 tablespoon sugar,1 teaspoon baking powder,1 teaspoon baking soda,½ teaspoon kosher salt,Pure maple syrup (for serving),	DIRECTIONS PreparationPreheat oven to 200°. Melt ¼ cup butter in a small saucepan over medium heat and cook, stirring often, until butter foams, then browns (do not burn), 4–5 minutes. Let cool slightly.Meanwhile, purée buttermilk and oats in a blender until smooth. Add eggs, buckwheat flour, flaxseeds, sugar, baking powder, baking soda, and salt. Blend on high 30 seconds. Add butter and blend just to combine.Heat a large nonstick skillet over medium. Coat very lightly with butter. Working in batches, scoop about 3 tablespoonfuls of batter per pancake into skillet and cook until bottoms are golden brown and tops are evenly covered with bubbles, about 3 minutes. Turn and cook until cooked through and undersides are golden, about 2 minutes. Keep warm in oven and serve with plenty of syrup.Do Ahead: Pancakes can be made 2 weeks ahead; wrap in plastic and freeze.
108	/thyme-roasted-walnuts	Thyme-Roasted Walnuts Recipe 	 Bon Appetit	2 cups walnuts, very coarsely chopped,2 tablespoons olive oil,1 tablespoon chopped thyme,½ teaspoon kosher salt,	DIRECTIONS PreparationPreheat oven to 350°. Toss walnuts, oil, thyme, and salt on a rimmed baking sheet until salt and thyme are evenly distributed. Bake until walnuts are golden brown and fragrant, 10–15 minutes.Do Ahead: Walnuts can be made 8 hours ahead. Store in an airtight container at room temperature.
110	/miso-caramel-apple	Miso Caramel Apple Recipe 	 Bon Appetit	½ cup raw pistachios,1½ teaspoons plus 1 cup sugar,3 tablespoons sesame seeds,2 tablespoons white miso, divided,4 medium Granny Smith apples (about 1⅓ pounds),Nonstick vegetable oil spray,2 tablespoons light corn syrup,¼ cup heavy cream,¼ teaspoon kosher salt,4 ice-pop sticks,	DIRECTIONS PreparationPreheat oven to 275°. Pulse pistachios and 1½ tsp. sugar in a food processor until nuts are the size of split peas. Add sesame seeds and 1 Tbsp. miso; continue to pulse until incorporated and no clumps of miso remain. Spread evenly on a rimmed baking sheet. Bake until lightly browned, 15–20 minutes; let cool.Meanwhile, insert ice-pop sticks into top of each apple, then push into center of apple. Spray a large plate or small baking sheet with nonstick spray.Bring corn syrup, 1 cup sugar, and 2 Tbsp. water to a boil in a medium saucepan, stirring to dissolve sugar. Continue to boil, brushing down sides of pan with a damp pastry brush and swirling pan occasionally (do not stir), until caramel is light amber, 5–7 minutes.Carefully add cream and salt and whisk to combine; caramel will bubble up vigorously and may seize, but will become smooth again after whisking. Transfer to a medium bowl. Working quickly, whisk remaining 1 Tbsp. miso into caramel. Tilt bowl so caramel pools on 1 side. Coat sides and bottom of each apple with sauce, letting excess drip back into bowl. Roll base of apples in pistachio mixture, then transfer to prepared plate. Let cool 30 minutes.Do Ahead: Apples can be assembled 1 day ahead; cover loosely with plastic wrap and chill. Let come to room temperature before serving.
111	/mexican-hot-chocolate	Mexican Hot Chocolate Recipe 	 Bon Appetit	2 1/2 cups water,2 3.16-ounce disks Mexican chocolate (such as Ibarra), chopped (about 1 cup),2 tablespoons whipping cream,	DIRECTIONS PreparationBring water and chocolate to simmer in medium saucepan, stirring until chocolate dissolves. Transfer to Mexican chocolate pot or blender. If using pot, whip mixture by vigorously rolling handle of molinillo between palms. If using blender, blend until frothy. Mix in cream. Divide among 4 mugs.
112	/fresh-green-cocktail	So Fresh and So Green Cocktail Recipe 	 Bon Appetit	4 sage leaves,1 teaspoon sugar,5 ⅛-inch-thick cucumber slices,1 large egg white,1½ ounces gin,½ ounce fresh lemon juice,½ ounce simple syrup,¼ ounce St-Germain (elderflower liqueur),Aromatic bitters (such as Angostura),	DIRECTIONS PreparationMuddle sage leaves, sugar, and 4 cucumber slices in a cocktail shaker. Add egg white, gin, lemon juice, simple syrup, St-Germain, and a dash of bitters. Cover and shake vigorously until egg white is very frothy, about 1 minute.Fill shaker with ice and shake vigorously until outside is frosty, about 1 minute. Pour into a coupe glass and garnish with remaining cucumber slice.
113	/carrot-hummus	Carrot Hummus Recipe 	 Bon Appetit	1 tablespoon caraway seeds,1 tablespoon coriander seeds,1 tablespoon cumin seeds,6 tablespoons olive oil, divided, plus more for drizzling,½ pound carrots, chopped,Kosher salt, freshly ground pepper,1 15-ounce can chickpeas, drained,2 garlic cloves, finely grated,½ cup carrot juice or water,¼ cup natural smooth peanut butter,2 tablespoons fresh lemon juice,¼ cup unsalted, roasted peanuts,1 tablespoon honey,2 canned chipotle chiles in adobo, plus 2 tablespoons adobo sauce,A spice mill or mortar and pestle,	DIRECTIONS PreparationToast caraway and coriander seeds in a small skillet over medium heat, swirling pan often and adding cumin seeds during the last 30 seconds of cooking, until fragrant, about 2 minutes. Let cool, then grind finely in spice mill or with mortar and pestle.Heat 2 Tbsp. oil in a medium saucepan over medium. Add carrots, season with salt and pepper, and cook, stirring occasionally, until carrots are tender, 6–8 minutes. Add chickpeas and one-third of the spice mixture; cook, stirring occasionally, until carrots are completely tender, about 5 minutes. Let cool slightly.Transfer carrot mixture to a blender and add garlic, carrot juice, peanut butter, lemon juice, and 4 Tbsp. oil; blend until smooth. Season with salt and pepper.Toast peanuts in a small skillet over medium heat, tossing occasionally, until lightly browned, about 2 minutes. Add honey and half of the remaining spice mixture; cook, stirring, until honey is caramelized and darker in color and pan is mostly dry, 5–8 minutes. Transfer peanut mixture to a parchment-lined rimmed baking sheet, spread in a single layer, and let cool. Coarsely chop.Meanwhile, blend chiles and adobo with remaining spice mixture in blender until smooth, adding water as necessary to thin. Serve hummus with adobo harissa dolloped in the center; sprinkle with peanuts. Drizzle with oil.Do Ahead: Hummus can be made 3 days ahead. Cover and chill. Bring to room temperature before serving.
114	/sparkling-grapefruit-gin-cocktail	Sparkling Grapefruit Cocktail Recipe 	 Bon Appetit	1 large ruby red or pink grapefruit,¼ cup sugar,2 ounces gin (preferably Hendricks),½ ounce fresh lemon juice,1 sprig tarragon,2 ounces French sparkling wine (such as Crémant de Bourgogne),Ruby red or pink grapefruit wedge (for serving),	DIRECTIONS PreparationRemove zest, along with some of the white pith, from grapefruit in wide strips with a vegetable peeler. Bring sugar and ¼ cup water to a boil in a small saucepan, swirling constantly, until sugar dissolves. Remove from heat and add grapefruit zest, pushing down to submerge. Let sit 30 minutes, then strain through a fine-mesh sieve into a measuring cup.Combine gin, lemon juice, tarragon, and ½ ounce syrup in a cocktail shaker. Fill shaker with ice, cover, and shake vigorously until outside of shaker is very cold, about 20 seconds.Strain cocktail into an old-fashioned or rocks glass filled with ice. Top with sparkling wine and garnish with grapefruit wedge.Do Ahead: Syrup can be made 1 week ahead; cover and chill.
115	/citrus-crumble-with-coconut-and-nuts	Citrus Crumble with Coconut and Nuts Recipe 	 Bon Appetit	¼ cup coconut sugar,2 teaspoons virgin coconut oil, melted,¼ teaspoon kosher salt,¼ cup raw pistachios,¼ cup sliced almonds,2 tablespoons raw pumpkin seeds (pepitas),½ cup unsweetened coconut flakes,4 mixed citrus fruits, such as grapefruits, blood oranges, cara cara oranges, and/or mandarin oranges,	DIRECTIONS PreparationPreheat oven to 275°. Whisk coconut sugar and 1 Tbsp. water in a small bowl until sugar is dissolved (this might take a couple minutes). Set aside 1 Tbsp. coconut syrup.Add coconut oil and salt to remaining syrup and stir to combine. Toss pistachios, almonds, pepitas, and coconut oil mixture on a parchment- or silpat-lined rimmed baking sheet. Fold in coconut flakes.Bake crumble, stirring occasionally, until golden brown, 22–28 minutes. Let cool.Remove peel and pith from citrus and slice into rounds. Drizzle with reserved 1 Tbsp. coconut syrup, then top with crumble.Do Ahead: Crumble can be made 2 weeks ahead; store in an airtight container at room temperature.
116	/troy-monson	The Troy Monson Recipe 	 Bon Appetit	¼ cup sugar,1 tablespoon fennel seeds,8 ounces vodka,6 ounces fresh blood orange juice,4 ounces fresh lemon juice,4 thin slices fennel,	DIRECTIONS PreparationBring sugar, fennel seeds, and ¼ cup water to a boil in a small saucepan over medium-high. Reduce heat to low and simmer, swirling occasionally, until sugar is dissolved, about 4 minutes. Let cool, then strain into a small bowl; discard solids.For each cocktail, combine 2 oz. vodka, 1½ oz. blood orange juice, 1 oz. lemon juice, and ½ oz. reserved fennel syrup in a cocktail shaker and fill with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a rocks glass filled with cracked ice and garnish with 1 fennel slice.
117	/potato-salad-chorizo-aioli-scallions	Smashed Potato Salad with Chorizo, Aioli, and Scallions Recipe 	 Bon Appetit	2 pounds small waxy red-skinned potatoes,Kosher salt,¾ cup plus 2 tablespoons vegetable oil, divided,1 medium onion, finely chopped,¾ pound fresh Mexican chorizo or hot Italian sausage, casings removed,1 large egg yolk,1 garlic clove, finely grated,2 teaspoons fresh lemon juice,3 scallions, thinly sliced, divided,Ancho chile powder (optional) and hot sauce (for serving),	DIRECTIONS PreparationPreheat oven to 450°. Place potatoes in a large pot and pour in cold water to cover; season with salt. Bring to a boil; reduce heat and simmer until tender, 20–25 minutes. Drain and return to pot to dry out; let cool. Transfer to a rimmed baking sheet and flatten with your hands or the bottom of a mug. You want the skins to tear to expose some flesh; some may fall apart.Meanwhile, heat ¼ cup vegetable oil in a medium skillet over medium-high. Cook onion, stirring occasionally, until soft, about 5 minutes. Add chorizo; cook, breaking up with a spoon, until browned and cooked through, 5–7 minutes. Transfer to a fine-mesh sieve set over a measuring cup. Drain, pressing on solids, until you have about ¼ cup chorizo oil. Add ½ cup vegetable oil to chorizo oil to make ¾ cup total; set chorizo mixture aside separately.Whisk egg yolk, garlic, and 1 tsp. water in a medium bowl to combine. Whisking constantly, gradually drizzle in chorizo oil, drop by drop at first; keep whisking until aioli is thickened and smooth. Whisk in lemon juice; season with salt.Drizzle potatoes with remaining 2 Tbsp. vegetable oil and turn to coat; season with salt. Roast, tossing once, until golden and crisp on outer edges, 20–25 minutes; season with salt.Toss potatoes, half of aioli, half of scallions, and reserved chorizo mixture in a large bowl; season with salt if needed.Spread remaining aioli on a platter and arrange potato salad on top. Sprinkle with remaining scallions, then ancho chile powder, if using. Serve with hot sauce.Do Ahead: Potatoes can be boiled and smashed 1 day ahead; cover and chill. Chorizo mayonnaise can be made 1 day ahead; cover and chill.
118	/pounded-lemongrass-chicken	Pounded Lemongrass Chicken Recipe 	 Bon Appetit	4 lemongrass stalks, tough outer layers removed, chopped,1 medium shallot, chopped,2 garlic cloves, chopped,¼ cup fresh lime juice,2 teaspoons fish sauce,2 teaspoons light brown sugar,½ teaspoon crushed red pepper flakes,4 6-ounce skinless, boneless chicken breasts, pounded to ½-inch thickness,Kosher salt, freshly ground pepper,2 tablespoons vegetable oil,Lime wedges (for serving),	DIRECTIONS PreparationACTIVE: 20TOTAL: 50Process lemongrass, shallot, garlic, lime juice, fish sauce, brown sugar, and red pepper flakes in a food processor to a fine paste. Season chicken with salt and pepper and place in a resealable plastic bag. Add lemongrass mixture; chill at least 30 minutes.Heat oil in a large skillet over medium-high. Remove chicken from marinade, scraping off excess, and cook until golden brown, 6–8 minutes; turn and cook until cooked through, about 2 minutes longer.Serve chicken with lime wedges for squeezing over.Do Ahead: Chicken can be marinated 2 days ahead. Keep chilled.
119	/pork-chops-with-leeks-in-mustard-sauce	Pork Chops with Leeks in Mustard Sauce Recipe 	 Bon Appetit	4 1 1/2- to 2-inch-thick bone-in heritage pork rib chops,2 teaspoons coarse kosher salt,2 teaspoons chopped fresh thyme,1 teaspoon finely chopped fresh rosemary,1 teaspoon freshly ground black pepper,2 bacon slices, coarsely chopped,Olive oil (optional),4 cups thinly sliced leeks (white and pale green parts only; about 3 large),3 garlic cloves, minced,1/4 cup brandy,1 cup low-salt chicken broth,2 teaspoons finely chopped fresh sage,2 tablespoons Dijon mustard,1/3 cup crème fraîche or sour cream,	DIRECTIONS PreparationPat chops dry with paper towels. Mix 2 teaspoons coarse salt, thyme, rosemary, and 1 teaspoon pepper in small bowl. Sprinkle seasoning mixture on both sides of chops. Let stand at room temperature 1 to 2 hours or wrap and chill up to 1 day.Heat heavy large skillet over medium heat. Add bacon and sauté until crisp and lightly browned. Using slotted spoon, transfer bacon to small bowl. Increase heat to medium-high. Add chops to skillet. Sear until brown, 4 to 5 minutes per side. Transfer chops to small baking sheet.Pour off all but 3 tablespoons drippings from skillet (or add olive oil to make 3 tablespoons). Add leeks and sauté until soft, about 7 minutes. Add garlic and stir 1 minute. Add brandy, then broth and bring to boil, scraping up browned bits. Return bacon to skillet; add sage and stir to blend.Nestle chops in leeks in skillet. Reduce heat to medium-low. Cover; simmer 3 minutes. Turn chops over. Cover; simmer until thermometer inserted into thickest part of chops registers 140°F to 145°F, about 3 minutes longer. Transfer chops to platter. Tent loosely with foil to keep warm.Spoon off any fat from cooking liquid in skillet. Boil until all liquid evaporates, about 3 minutes. Whisk in mustard, then crème fraîche; do not boil. Season with salt and pepper. Spoon over chops.
120	/hound-dog-cocktail	Hound Dog Cocktail Recipe 	 Bon Appetit	1 large or 2 small ripe peaches (about 8 ounces),¼ cup sugar,2 tablespoons finely grated peeled ginger,6 ounces bourbon,2 ounces fresh lemon juice,Mint sprigs and peach wedges (for serving),	DIRECTIONS PreparationPeach PuréeUsing the tip of a paring knife, score an X in the bottom of peach. Cook in a small saucepan of boiling water just until skin begins to peel back where cut, about 30 seconds. Transfer to a bowl of ice water; let cool.Peel peach, remove pit, and coarsely chop. Purée peach with 3 Tbsp. water in a blender until smooth. Strain through a fine-mesh sieve; discard solids (you should have about 4 oz.).Ginger SyrupCombine sugar, ginger, and ¼ cup hot water in a jar, cover, and shake vigorously until sugar is dissolved. Strain through a fine-mesh sieve into a small jar and chill.AssemblyFor each cocktail, combine 1½ oz. bourbon, 1 oz. peach purée, ½ oz. ginger syrup, and ½ oz. lemon juice in a cocktail shaker. Fill with ice, cover, and shake vigorously until outside of shaker is frosty, about 20 seconds. Strain into a rocks glass filled with ice. Garnish with a mint sprig and peach wedge.
121	/labneh-with-zaatar-oil	Labneh with Za'atar Oil  Recipe 	 Bon Appetit	1 garlic clove, finely grated,2 cups labneh (Lebanese strained yogurt) or plain whole-milk Greek yogurt,Kosher salt,2 tablespoons olive oil,1 tablespoon za'atar,Warm pita (for serving),	DIRECTIONS PreparationMix garlic and labneh in a medium bowl; season with salt.Heat oil in a medium skillet over medium. Stir in za’atar and remove from heat. Let cool. Drizzle za’atar oil over labneh mixture and serve with warm pita.Do Ahead: Labneh can be made 1 day ahead. Keep chilled.
122	/vanilla-cashew-vegan-ice-cream	Vanilla Cashew Vegan Ice Cream Recipe 	 Bon Appetit	1 vanilla bean, split lengthwise,1 cup raw cashews,½ cup plus 2 tablespoons organic or granulated sugar,½ teaspoon kosher salt,1 cup refined coconut oil, melted, cooled slightly,An ice cream maker,	DIRECTIONS PreparationPlace vanilla bean and cashews in a large bowl and add 2 cups boiling water. Cover and let sit at room temperature at least 12 hours (hydrating the cashews thoroughly is key for a silky, smooth ice cream).Transfer cashews and their soaking liquid to a blender. Scrape in seeds from vanilla bean; discard pod. Add sugar, and salt. Purée until smooth, about 30 seconds. With the motor running on medium speed, slowly stream in oil and purée until thick and creamy.Immediately process cashew mixture in ice cream maker according to manufacturer’s directions. (Head’s up: this will take longer than a traditional dairy-based custard to reach soft-serve consistency.) Do not chill before processing or oil will harden into tiny bits and texture will be grainy.Transfer to an airtight container and press plastic wrap directly onto surface. Freeze until firm, at least 4 hours.Do Ahead: Cashews can be soaked 3 days ahead; cover and chill. Ice cream can be made 1 month ahead; keep frozen.
123	/bas-best-slow-cooker-beef-chili	BA's Best Slow-Cooker Beef Chili Recipe 	 Bon Appetit	2 guajillo chiles,1 dried ancho chile,1 dried pasilla chile,3 cups low-sodium chicken broth,2 tablespoons olive oil, divided,1 pound boneless beef chuck, cut into ½" pieces,½ pound boneless beef short ribs, cut into ½" pieces,½ brisket, cut into ½" pieces,Kosher salt, freshly ground black pepper,2 yellow onions, finely chopped,6 garlic cloves, finely chopped,1 tablespoon ground cumin,2 teaspoons dried oregano,1 canned chipotle chile in adobo sauce, chopped (optional),1 12-ounce can lager,Sour cream, shredded cheddar, chopped red onion, cilantro leaves, and chips (for serving),	DIRECTIONS PreparationToast guajillo, ancho, and pasilla chiles in a medium dry skillet over medium-high heat, turning occasionally and pressing down to help chiles make contact with the pan, until darkened in color and beginning to soften, about 3 minutes. Transfer to a heatproof bowl and cover with 2 cups boiling water; let sit 30 minutes to soften. Drain; discard seeds and stems. Working in batches if needed, purée chiles and broth in a blender until smooth, about 1 minute, and set aside.Heat 1 Tbsp. oil in a large heavy pot over medium-high. Season chuck, short ribs, and brisket with salt and pepper. Working in batches, cook, stirring occasionally, until browned all over, about 5 minutes. Continue cooking until liquid accumulated in pot has evaporated, 8–10 minutes more. Transfer beef to a plate.Heat remaining 1 Tbsp. oil in same pot, then add onions and garlic; season with salt and pepper. Cook, stirring often, until onions are softened, 6–8 minutes. Onion juices should help loosen any bits of beef stuck to bottom of pot, but if the surface looks too brown, add a splash of water and cook, stirring and scraping up browned bits. Add cumin, oregano, and chipotle, if using, and cook, stirring constantly, 1 minute.Transfer mixture to a 4–6-quart slow cooker. Add lager, reserved beef, and reserved chile purée, season with salt and pepper, and stir to combine. Cover and cook until meat is very tender, 7–8 hours on low or 4–5 hours on high. If liquid seems too thin, simmer until thickened to desired consistency.Taste and season with salt and pepper. Serve chili topped with sour cream, cheddar, red onion, cilantro leaves, and chips.Do ahead: Chili can be made up to 4 days ahead. Cover and refrigerate. Reheat gently over low heat, adding a splash of water to loosen, if needed.
124	/hot-cross-buns	Hot Cross Buns Recipe 	 Bon Appetit	1 ¼-ounce envelope active dry yeast (about 2¼ teaspoons),2 tablespoons honey,1 cup plus 4 teaspoons whole milk, warmed,½ cup (1 stick) unsalted butter, room temperature, plus more,2 large eggs,1 large egg yolk,¼ cup light brown sugar,1 tablespoon vegetable oil,2 teaspoons finely grated lemon zest,2 teaspoons finely grated orange zest,2 teaspoons vanilla extract,1 teaspoon ground cinnamon,½ teaspoon ground cardamom,3½ cups plus 2 tablespoons all-purpose flour,1½ teaspoons kosher salt,1 cup mixed dried fruit, such as currants, raisins, chopped apricots, and/or candied citrus peel,½ cup apricot jam, warmed, strained,¾ cup powdered sugar,	DIRECTIONS PreparationWhisk yeast, honey, and 1 cup milk in the large bowl of a stand mixer. Let sit until foamy, about 5 minutes. Meanwhile, butter a large mixing bowl and a 13x9" baking dish; set aside.Whisk 1 egg, egg yolk, brown sugar, oil, zests, and vanilla into yeast mixture. Add cinnamon, cardamom, and 3½ cups flour and beat with dough hook on low speed until mixture starts to form a shaggy dough. Add salt and beat on medium until dough forms a ball around the hook, 1–2 minutes. Continue beating until dough is smooth and slightly tacky, about 5 minutes more. Add ½ cup butter, 1 Tbsp. at a time, allowing dough to absorb each piece before adding the next, then beat until dough is supple, shiny, and elastic, about 5 minutes.Turn out dough onto a clean work surface and knead with your hands, incorporating remaining 2 Tbsp. flour, until dough is very supple and tacky but not sticky, about 5 minutes. Transfer to prepared bowl and cover with plastic. Let dough sit in a warm place until doubled in size, 40–50 minutes.Turn dough out onto a clean work surface and pat down to ½" thick (the shape doesn’t matter). Scatter dried fruit over surface of dough and roll up into a log, starting at the end nearest you. Divide log into 12 equal pieces (if you’re using a scale, each piece should be a little less than 3½ oz.). Roll each piece into a smooth ball and arrange in prepared baking dish, spacing equally in a 4x3 grid. Cover dish tightly with plastic and let sit in a warm place until balls have nearly doubled in size and are touching, 30–40 minutes.Preheat oven to 350°. Beat remaining egg with 1 tsp. water and brush over tops of buns. Bake buns until tops and bottoms are deep golden brown, 25–35 minutes. Let cool slightly in pan. Brush jam onto warm buns, then let cool until jam is set.Whisk powdered sugar and remaining 4 tsp. milk in a small bowl until smooth. Transfer to a pastry bag or resealable plastic bag. Cut a small opening in 1 corner, then pipe crosses over each bun. Let sit until icing is set, at least 15 minutes.Do Ahead: Dough, without fruit, can be made 1 day ahead. Let rise at room temperature, then cover and chill.
125	/del-postos-tiramisu	Del Posto's Tiramisu Recipe 	 Bon Appetit	4 large eggs, separated, room temperature,1 cup sugar, divided,½ cup all-purpose flour,¼ cup cornstarch,Pinch of kosher salt,2 cups mascarpone,½ cup sugar,4 large egg yolks,2 tablespoons dark rum,2 tablespoons heavy cream,Pinch of kosher salt,½ cup freshly brewed espresso or strong coffee, cooled, divided,4 tablespoons unsweetened cocoa powder,	DIRECTIONS PreparationSponge CakePreheat oven to 375°. Line a rimmed baking sheet with parchment paper.Using an electric mixer on low speed, beat egg whites in a large bowl until just combined. Slowly add ½ cup sugar, gradually increasing the speed to medium, and beat until a stiff meringue forms. Transfer to a medium bowl; chill until ready to use.Whip egg yolks, 2 Tbsp. water, and remaining ½ cup sugar in the still-messy bowl you used for the meringue on high speed until a fluffy, ribbony mixture forms. Using a rubber spatula, gently add reserved meringue and fold until just combined. (Be nice. Streaks are fine. The less you manipulate this, the fluffier it will be later.)Sift flour, cornstarch, and salt into a medium bowl. Gently fold into egg mixture until no dry spots remain. Carefully transfer batter to prepared pan with spatula.Bake cake until top is golden brown and still soft to the touch, 7–10 minutes. Let cake cool completely in pan. Run a knife around sides of pan to release cake. Place a cutting board on top of pan. Invert cake onto board; remove pan and carefully peel away parchment. Using a serrated knife, cut cake in half crosswise.Mascarpone Cream and AssemblyUsing an electric mixer on low speed, beat mascarpone, sugar, egg yolks, rum, heavy cream, and salt in a large bowl. Gradually increase the speed to medium as mixture becomes stable and beat until soft peaks form, but don’t over-whip.Spread a thin layer of mascarpone cream in a shallow serving dish. Place one half of sponge cake on top. Using a squirt bottle or spoon, soak cake with ¼ cup espresso. Spread with half of remaining mascarpone cream, place second cake half on top, and soak again with remaining ¼ cup espresso. Don’t be stingy with the espresso, okay? Top with remaining mascarpone cream.Spoon cocoa powder into a double-layer of cheesecloth, pull together ends tightly to form a ball, and gently shake cocoa onto tiramisu until fully blanketed (alternately, place cocoa powder in a fine-mesh sieve and dust over tiramisu).Do Ahead: Cover tiramisu and store in refrigerator for up to 8 hours.
126	/bas-best-beignets	BA’s Best Beignets Recipe 	 Bon Appetit	¼ cup sugar,1 ¼-oz. envelope active dry yeast (about 2¼ tsp.),1 large egg, room temperature,¼ cup buttermilk, slightly warmed,¼ cup whole milk, slightly warmed,1 teaspoon kosher salt,½ teaspoon baking soda,3¾ cups bread flour, plus more for surface,¼ cup (½ stick) unsalted butter, cut into pieces, room temperature,Vegetable oil (for frying and bowl; about 6 cups),Powdered sugar (for dusting),A deep-fry thermometer,	DIRECTIONS PreparationWhisk sugar, yeast, and 3/4 cup warm water in a large bowl. Let sit until foamy, about 5 minutes. Add egg, buttermilk, milk, salt, baking soda, and 2 1/2 cups flour and mix until a shaggy dough forms. Add butter a couple of pieces at a time, mixing to combine after each addition before adding more (it’s okay if some pieces of butter are still visible). Add remaining 1 1/4 cups flour, mixing in 1/4 cup at a time. Work dough until butter is completely incorporated and dough is no longer sticky.Transfer dough to a lightly floured surface and knead until smooth and supple, about 5 minutes. Place in a lightly oiled bowl. Cover and let sit in a warm, draft-free place until doubled in size, about 1 hour.Roll out dough on a lightly floured surface to 1/2" thick. Using a knife, cut into 2" squares or diamonds (or cut into rounds with a 2"-diameter cookie cutter) and transfer to a lightly floured baking sheet. Cover with plastic wrap and let sit until slightly puffed, 25–30 minutes.Pour oil into a medium heavy saucepan to a depth of 3" and fit with thermometer. Heat over medium-high until thermometer registers 375°. Working in batches, fry beignets until golden brown, about 2 minutes per side. Transfer to a wire rack set inside a baking sheet.Generously dust beignets with powdered sugar just before serving.
127	/iced-turmeric-latte	Iced Turmeric Latte Recipe 	 Bon Appetit	1 cup cashew milk,4 teaspoons finely grated fresh turmeric,2 teaspoons finely grated palm sugar or raw sugar,1 teaspoon finely grated fresh ginger,1 teaspoon fresh lemon juice,2 pinches of ground cardamom,Pinch of flaky sea salt,Lemon wedge (for serving),	DIRECTIONS PreparationWhisk milk, turmeric, palm sugar, ginger, lemon juice, cardamom, and salt in a small bowl until sugar and salt have dissolved; let sit 5 minutes to let flavors meld. Strain through a fine-mesh sieve into a measuring cup, pressing on solids to extract juices; discard solids.Fill a glass with ice. Pour latte over and serve with lemon wedge.
242	/roman-sambal	Roman Sambal Recipe 	 Bon Appetit	½ pound red red Fresno chiles or red jalapeños,1 garlic clove,1 tablespoon kosher salt,¼ cup white distilled vinegar,¼ cup fresh lime juice,2 teaspoons sugar,Special equipment: cheesecloth,	DIRECTIONS PreparationPulse chiles, garlic, and salt in a food processor to a fine paste. Transfer to a glass jar; cover with cheesecloth and secure with a rubber band. Let sit at room temperature at least 1 day and up to 2 days to ferment (read: develop flavor—the longer it sits, the better).Transfer chile mixture to a blender; add lime juice, vinegar, and sugar and purée until smooth. Transfer to a clean jar, cover with cheesecloth, and let sit at room temperature at least 1 day and up to 2 days to ferment more. Chill until cold.Do ahead: Sambal can be made 1 month ahead. Keep chilled.
128	/spiked-hot-chocolate	Spiked Hot Chocolate Recipe 	 Bon Appetit	3 cups whole milk,3 tablespoons crushed cinnamon sticks (preferably Ceylon),8 ounces semisweet chocolate (preferably Scharffen Berger), finely chopped,3 tablespoons demerara or granulated sugar,Pinch of kosher salt,2 ounces bourbon,Toasted marshmallows (for serving),	DIRECTIONS PreparationBring milk and cinnamon to a simmer in a medium saucepan over medium-low heat, whisking occasionally and making sure milk doesn’t boil, until cinnamon is floral and fragrant, about 10 minutes. Whisk in chocolate, sugar, and salt and cook, whisking frequently, until mixture is smooth and creamy and chocolate is melted, about 5 minutes. Pour through a fine-mesh sieve into a large measuring cup; discard cinnamon.Add bourbon to hot chocolate mixture and stir to combine. Divide among mugs, then top with toasted marshmallows.
129	/ratatouille	Ratatouille Recipe 	 Bon Appetit	1/2 pound eggplant,1/2 pound zucchini, trimmed,1 teaspoon salt,7 tablespoons olive oil, divided,1 8-ounce onion, thinly sliced (about 2 cups),2 green bell peppers, thinly sliced into strips,2 garlic cloves, pressed,1 pound firm but ripe tomatoes, peeled, seeded, cut into 3/8- to 1/4-inch-thick strips,3 tablespoons minced fresh parsley,	DIRECTIONS PreparationPeel eggplant; cut lengthwise into 1/4-inch-thick slices, then cut into 3-inch-long, 1-inch-wide strips. Cut zucchini into same size strips. Place vegetables in large bowl; sprinkle with 1 teaspoon salt. Let stand 30 minutes. Drain; dry with paper towels.Heat 4 tablespoons oil in large skillet over medium-high heat. Working in batches, add eggplant and zucchini to skillet; sauté until light golden, about 1 minute per side. Transfer to plate; reserve.Add 3 tablespoons oil to skillet; heat over medium heat. Add onion and peppers; sauté until just tender, 10 to 12 minutes. Stir in garlic. Season with salt and pepper.Place tomato strips atop onion-pepper mixture in skillet. Sprinkle with salt and pepper. Cover skillet; cook over low heat until tomatoes begin to juice, about 5 minutes. Uncover; baste vegetables in skillet with juices. Boil until juices are almost evaporated, 2 to 3 minutes.Transfer 1/3 of onion-pepper-tomato mixture to 2 1/2-quart pot; sprinkle with 1 tablespoon parsley. Top with half of eggplant and half of zucchini, then remaining onion-pepper-tomato mixture; sprinkle with 1 tablespoon parsley. Layer remaining eggplant and zucchini over; sprinkle with 1 tablespoon parsley. Cover; simmer over low heat 10 minutes. Uncover; tilt pot and baste with accumulated juices. Increase heat to medium; simmer uncovered, basting several times with pan juices until only 2 to 3 tablespoons juices remain in pot, watching closely to avoid scorching, 10 to 15 minutes longer. Season with salt and pepper. DO AHEAD Can be made 8 hours ahead. Cool slightly. Cover; chill. Serve at room temperature or rewarm over medium-low heat before serving.
130	/classic-tuna-salad	Classic Tuna Salad Recipe 	 Bon Appetit	2 celery stalks, finely chopped,¼ small red onion, finely chopped,1 5-ounce can water-packed tuna, drained,¼ cup mayonnaise,2 tablespoons capers, drained, finely chopped,2 tablespoons coarsely chopped fresh parsley,1 teaspoon Dijon mustard,1 tablespoon fresh lemon juice, plus more if needed,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationUsing a fork, mix celery, onion, tuna, mayonnaise, capers, parsley, mustard, and 1 Tbsp. lemon juice in a medium bowl, breaking up any large pieces of tuna, until well combined. Season with salt, pepper, and more lemon juice, if desired.
131	/white-chili	White Chili Recipe 	 Bon Appetit	1 pound skinless, boneless chicken thighs, cut into 1” pieces,Kosher salt, freshly ground pepper,¼ cup olive oil,1 large onion, chopped,1 poblano chile, seeds removed, chopped,2 garlic cloves, finely chopped,1 tablespoon chopped fresh oregano,2 teaspoons ground cumin,4 cups chicken broth,2 15-oz. cans cannellini (white kidney) beans,1 bay leaf,2 tablespoons fresh lime juice,Sour cream, cilantro, and lime wedges (for serving),	DIRECTIONS PreparationSeason chicken all over with salt and pepper. Heat oil in a Dutch oven or small stockpot over medium-high heat. Working in batches as needed, add chicken and cook, turning occasionally, until browned all over, 10–15 minutes. Transfer to a plate and set aside. Add onion and poblano chile and season with salt and pepper. Cook, stirring often, until onion is softened and translucent, 8–10 minutes. Add garlic and cook, stirring, until fragrant, about 2 minutes. Add oregano and cumin and cook, stirring, until fragrant, about 1 minute. Add chicken broth, beans and their liquid, bay leaf, and chicken and bring to a simmer. Season with salt and pepper and cook, partially covered, stirring occasionally, until meat is cooked through and tender and liquid is slightly thickened, 30–35 minutes. Season with lime juice and more salt and pepper. Serve with sour cream, cilantro, and lime wedges.
132	/date-orange-filling	Date-Orange Filling Recipe 	 Bon Appetit	1 cup dates (about 8 oz.) pitted quartered,1 teaspoon finely grated orange zest,1 teaspoon ground cinnamon,½ teaspoon kosher salt,1 tablespoon unsalted butter,	DIRECTIONS PreparationBring dates, orange zest, cinnamon, salt, and 1 1/2 cups water to a boil in a small saucepan. Reduce heat and simmer, stirring often and mashing with a heatproof spatula, until dates are very soft and jammy, about 5 minutes. Add butter and stir until melted. Let cool.Do ahead: Filling can be made 4 days ahead. Cover and chill.
133	/espresso-hot-chocolate	Espresso Hot Chocolate Recipe 	 Bon Appetit	3 cups whole milk,3 tablespoons crushed cinnamon sticks (preferably Ceylon),8 ounces semisweet chocolate (preferably Scharffen Berger), finely chopped,3 tablespoons demerara or granulated sugar,Pinch of kosher salt,½ cup espresso,Lightly sweetened whipped cream and chocolate-covered espresso beans (for serving; optional),	DIRECTIONS PreparationBring milk and cinnamon to a simmer in a medium saucepan over medium-low heat, whisking occasionally and making sure milk doesn’t boil, until cinnamon is floral and fragrant, about 10 minutes. Whisk in chocolate, sugar, and salt and cook, whisking frequently, until mixture is smooth and creamy and chocolate is melted, about 5 minutes. Pour through a fine-mesh sieve into a large measuring cup; discard cinnamon.Add espresso to hot chocolate mixture and stir to combine. Divide among mugs, then top with whipped cream and espresso beans, if desired.
134	/poppy-seed-filling	Poppy Seed Filling  Recipe 	 Bon Appetit	1 cup poppy seeds,½ cup honey,½ cup milk,1 tablespoon fresh lemon juice,1 tablespoon sugar,¼ teaspoon salt,½ teaspoon vanilla extract,A spice mill or a mortar and a pestle,	DIRECTIONS PreparationFinely grind poppy seeds in spice mill. Transfer to a medium saucepan and add honey, milk, lemon juice, sugar, and salt. Bring to a boil, reduce heat, and simmer, stirring often, until thickened and a spatula holds a trail when dragged across bottom of pan, about 4 minutes; stir in vanilla. Let cool.Do ahead: Filling can be made 4 days ahead. Cover and chill.
135	/guinness-affogato	Guinness Affogato Recipe 	 Bon Appetit	3 scoops vanilla ice cream,1 ounce hot espresso,4 ounces Guinness stout,	DIRECTIONS PreparationPlace ice cream in a tall glass. Pour espresso over and top off with Guinness. Serve with a straw and a long spoon.
197	/beet-escarole-salad-avocado-walnuts	Beet and Escarole Salad with Avocado and Walnuts Recipe 	 Bon Appetit	½ small red onion, thinly sliced,2 tablespoons walnut oil,2 tablespoons olive oil,4 tablespoons Sherry vinegar,½ Big Batch of Oven-Steamed Beets, cut into 1” wedges,Kosher salt and freshly ground pepper,½ head escarole, torn into bite-size pieces,1 ripe avocado, cut into 1” pieces,¼ cup toasted walnuts,	DIRECTIONS PreparationFill a small bowl with cool water and immerse the sliced onion in it. Stir, drain well, then squeeze firmly in a clean kitchen towel or paper towels to remove excess water.Mix together walnut oil, olive oil, and vinegar in a large bowl. Add onion and beets and season with salt and pepper. Set aside to marinate 30 minutes.Just before serving, arrange escarole on a platter and top with beet mixture. Scatter avocado and walnuts on top. Season with salt and pepper.
136	/passover-chocolate-toffee-matzo	Passover Chocolate-Toffee Matzo Recipe 	 Bon Appetit	4 sheets matzo (kosher for Passover),1½ cups (3 sticks) unsalted butter,¾ cup sugar,½ teaspoon Aleppo pepper, plus more (optional),1 cup chopped semisweet chocolate or chocolate chips (about 6 ounces),½ cup chopped shelled pistachios, toasted,½ cup unsweetened coconut flakes, toasted,Flaky sea salt (for serving),2 tablespoons cocoa nibs (optional),	DIRECTIONS PreparationPreheat oven to 350°. Line a large rimmed baking sheet with 2 sheets of parchment paper, overlapping and leaving some overhang on all sides. Arrange matzo in a single layer on prepared baking sheet, breaking to fit as needed to cover entire surface without gaps.Bring butter, sugar, 3 Tbsp. water, and ½ teaspoon Aleppo pepper, if using, to a boil in a medium saucepan over medium-high heat, stirring occasionally. Once boiling, stir once, then reduce heat to low and simmer, swirling pan occasionally, until mixture is golden brown and syrupy, 8–10 minutes.Pour toffee evenly over matzo and spread to coat with an offset spatula. Bake until toffee is slightly darkened in color (the shade of a brown paper bag) and bubbling, 10–12 minutes. Remove from oven and let cool until toffee is firm but still hot, about 5 minutes. Sprinkle chocolate evenly over top and let sit until melted (chocolate will go from matte to shiny), about 5 minutes. Spread chocolate evenly to edges of matzo with offset spatula. Sprinkle with pistachios, coconut, salt, and cocoa nibs and more Aleppo, if using. Let cool (or chill in the refrigerator if you simply can’t wait) until chocolate has hardened. Break into pieces.Do Ahead: Matzo can be made 3 days ahead. Store airtight at room temperature.
137	/goat-cheese-leek-and-potato-galette-with-pistachio-crust	Leek and Potato Galette with Pistachio Crust Recipe 	 Bon Appetit	½ cup raw pistachios,2½ cups all-purpose flour,1 teaspoon kosher salt,1 teaspoon sugar,1 cup (2 sticks) chilled unsalted butter, cut into pieces,1 tablespoon olive oil, plus more for drizzling,1 large leek, white and pale-green parts only, halved lengthwise, thinly sliced,4 ounces fresh goat cheese,5 tablespoons heavy cream,2 garlic cloves, finely chopped,Kosher salt, freshly ground pepper,All-purpose flour (for surface),4 tablespoons coarsely chopped dill, divided, plus sprigs for serving,2 large Yukon Gold potatoes, thinly sliced,1 large egg, beaten to blend,Crushed pink peppercorns (for serving; optional),	DIRECTIONS PreparationDoughPulse pistachios in a food processor until coarsely ground. Add flour, salt, and sugar and pulse to combine. Add butter and pulse just until a coarse meal forms. With motor running, gradually stream in ½ cup ice water and process until dough comes together. Transfer dough to a work surface; form into a ball, then flatten into a disk. Wrap in plastic and chill at least 30 minutes.Do Ahead: Dough can be made 1 day ahead. Keep chilled.Filling and Assembly Preheat oven to 400º. Heat 1 Tbsp. oil in a small skillet over medium-low. Cook leek, stirring occasionally, until softened but without taking on any color, about 5 minutes. Transfer to a plate.Mix goat cheese, cream, and garlic in a medium bowl to combine; season with salt and black pepper.Divide dough into 4 pieces. Roll out 1 piece of dough on a lightly floured surface to an 8" round; transfer to a parchment-lined baking sheet. Using an offset spatula, spread one-quarter of goat cheese mixture over dough, leaving a 1" border. Scatter 1 Tbsp. dill evenly over, then top with a thin layer of potato slices. Drizzle with oil; season with salt. Scatter one-quarter of leeks over potatoes. Fold edges of dough over filling, tucking and overlapping slightly as needed. Repeat with remaining dough, goat cheese mixture, chopped dill, potatoes, and leeks and more oil and salt to make 3 more galettes. Brush top of dough with egg.Bake galettes until crusts are golden brown and potatoes are soft, 30–40 minutes. Drizzle with honey and top with dill sprigs. Sprinkle with pink peppercorns, if using; season with salt and black pepper.
138	/toasted-sambal-cashews	Toasted Sambal Cashews Recipe 	 Bon Appetit	2 tablespoons unsalted butter,1 cup salted, roasted cashews, coarsely chopped,2 teaspoons sambal oelek,Flaky sea salt,	DIRECTIONS PreparationMelt butter in a large pot over medium heat. Cook cashews and sambal oelek, stirring occasionally, until nuts begin to toast (yes, you’re double-toasting them), 3–5 minutes. Scrape into a small bowl; season with salt.
139	/kimchi-miso-dressing	Kimchi Miso Dressing Recipe 	 Bon Appetit	6 tablespoons kimchi, coarsely chopped,4 tablespoons white miso,½ cup silken tofu,½ cup vegetable oil or grapeseed oil,1 tablespoon rice vinegar,Kosher salt,	DIRECTIONS PreparationCombine kimchi, miso, tofu, oil, and vinegar in a blender and purée until very smooth; season with salt. Refrigerate until ready to use. Dressing may thicken as it sits; before serving, thin with water as desired.Do Ahead: Dressing can be made 4 days ahead; store in an airtight container and chill.
140	/whiskey-and-rye-chocolate-chip-cookies	Whiskey and Rye Chocolate Chip Cookies Recipe 	 Bon Appetit	1½ cups chocolate wafers (discs, pistoles, fèves; preferably 72% cacao), divided,2 cups all-purpose flour,½ cup rye flour,½ teaspoon baking soda,1½ teaspoons kosher salt,¾ cup (1½ sticks) plus 1 tablespoon unsalted butter, room temperature,¾ cup dark brown sugar,¾ cup granulated sugar,1 large egg,1½ teaspoons vanilla extract or vanilla paste,1 teaspoon bourbon,1 vanilla bean, split lengthwise,1 teaspoon flaky sea salt,Find chocolate wafers (do not use chocolate wafer cookies) at specialty food stores, some grocery stores, and online.,	DIRECTIONS PreparationPulse ¾ cup chocolate wafers in a food processor until pea-sized pieces form. Whisk all-purpose flour, rye flour, baking soda, and kosher salt in a medium bowl.Using an electric mixer on medium speed, beat butter, brown sugar, and granulated sugar in a large bowl, scraping down sides of bowl as needed, until light and fluffy, 3–4 minutes. Add egg, vanilla, and bourbon and beat until fully incorporated, about 1 minute. Reduce speed to low and slowly add dry ingredients, mixing just to blend. Fold in chopped chocolate and remaining chocolate wafers.Portion dough into 16 balls (about ¼ cup each) and transfer to a rimmed sheet sheet as you go. Wrap tightly with plastic wrap and chill at least 3 hours or up to 1 day.Position rack in middle of oven and preheat to 350°. Scrape vanilla seeds into sea salt in a small bowl and mix to combine (save pod for another use).Divide dough balls between 2 parchment-lined baking sheets, spacing 3" apart. Flatten each ball to about ¾" thick and sprinkle with vanilla salt. Bake cookies, rotating sheets halfway through, until golden brown around the edges, 14–18 minutes (cookies will firm up as they cool). Let cool slightly on baking sheets, then transfer to wire racks and let cool completely.Do Ahead: Cookies can be made 1 day ahead. Store airtight at room temperature.
141	/escarole-crispy-ham-eggs	Escarole with Crispy Ham and Eggs Recipe 	 Bon Appetit	4 tablespoons olive oil, divided,2 ounces thinly sliced Speck or prosciutto,4 large eggs,¾ teaspoon crushed red pepper flakes,1 head of escarole, leaves separated and torn into large pieces,1 teaspoon fish sauce (such as nam pla or nuoc nam),Kosher salt, freshly ground pepper,	DIRECTIONS PreparationHeat 1 Tbsp. oil in a large skillet, preferably nonstick, over medium-high. Cook Speck until golden brown and crisp, about 2 minutes per side; transfer to a plate.Heat 1 Tbsp. oil in same skillet over medium-high and fry 2 eggs until whites are golden brown and crisp around the edges and set around the yolks (which should still be runny), about 2 minutes; transfer to a plate. Repeat with 1 Tbsp. oil and remaining 2 eggs.Heat remaining 1 Tbsp. oil in skillet. Add red pepper flakes and cook, stirring often, until lightly toasted and fragrant, about 1 minute. Add escarole to skillet, toss to coat, and cook, stirring often, until slightly wilted, about 1 minute. Remove from heat and add fish sauce; season with salt and pepper. Serve topped with crisped ham and fried eggs.
142	/herbed-fresh-pasta-with-market-tomatoes-and-peppers	Herbed Fresh Pasta with Market Tomatoes and Peppers Recipe 	 Bon Appetit	1 cup cup plus 2 tablespoons semolina flour, plus more for dusting,1 cup all-purpose flour, plus more for dusting,3 large eggs,2 cups (packed) purple or green basil leaves or parsley leaves with tender stems,Kosher salt,2 pounds plum tomatoes, quartered,2 large red sweet peppers (such as Hungarian) or 1 large red bell pepper, halved lengthwise, seeded,3 garlic cloves, finely grated, divided,½ cup olive oil, divided,Kosher salt, freshly ground pepper,2 cups mixed cherry tomatoes, halved,Purple or green basil leaves or parsley leaves with tender stems, torn (for serving),Finely grated Parmesan (for serving),	DIRECTIONS PreparationDoughCombine 1 cup plus 2 Tbsp. semolina flour and 1 cup all-purpose flour in a large bowl. Purée eggs, basil, and 1 tsp. salt in a blender on medium-high speed, scraping down sides as necessary, until mixture is smooth, about 30 seconds. Scrape basil mixture into flour mixture and stir with a fork until dough just comes together. Turn out onto a work surface lightly dusted with all-purpose flour and knead until smooth and elastic, 8–10 minutes (alternatively, use a stand mixer fitted with a dough hook and beat on medium-low speed, about 8 minutes). Shape into a 6" log and wrap tightly in plastic wrap; let sit 1 hour at room temperature.Cut dough into 6 equal pieces. Working with one piece at a time, lightly dust both sides with all-purpose flour and roll into a thin 5½x20" rectangle (you should be able to see the shadow of your hand pass behind the sheet of pasta; alternatively, use a pasta machine). Dust both sides of dough with semolina flour and loosely roll into a cylinder. Using a sharp knife, trim edges and discard. Cut dough into 1½"-wide slices. Unfurl noodles, dust with semolina flour, and gently toss to separate. Place on a rimmed baking sheet and cover with a clean kitchen towel.Do Ahead: Pasta dough can be made 1 day ahead. Wrap tightly and chill. Pasta and AssemblyPreheat oven to 425°. Toss plum tomatoes, peppers, 2 garlic cloves, and ¼ cup oil on a rimmed baking sheet. Arrange tomatoes and peppers in a single layer, skin side down; season with salt and pepper. Roast until browned around the edges, 35–45 minutes. Let sit until cool enough to handle, then slip off skins. Transfer tomatoes and peppers to a large bowl and mash into medium-size pieces using a potato masher. Set aside.Combine cherry tomatoes, 2 Tbsp. oil, and remaining garlic clove in a small bowl. Season with salt and pepper and let sit at room temperature 30 minutes.Meanwhile, cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente, about 4 minutes. Drain, reserving 1 cup pasta cooking liquid.Toss pasta with tomato and pepper mixture, adding ⅓ cup pasta cooking liquid and remaining 2 Tbsp. oil to keep pasta from sticking; add more pasta cooking liquid if necessary. Divide pasta among plates, then top with cherry tomato mixture and any accumulated juices, basil, and Parmesan.
143	/roasted-carrots	Roasted Carrots Recipe 	 Bon Appetit	3 pounds carrots, peeled, cut into 3-inch pieces, halved lengthwised, quartered if large,¼ cup olive oil,2 teaspoons kosher salt,½ teaspoon freshly ground black pepper,	DIRECTIONS PreparationPreheat oven to 450°. Toss carrots, oil, salt, and pepper on a rimmed baking sheet. Roast, tossing occasionally, until tender and browned, 35–45 minutes.
145	/roast-chicken-butternut-tahini-puree	Roast Chicken with Butternut-Tahini Purée Recipe 	 Bon Appetit	2 tablespoons olive oil, divided,1 2-lb. butternut squash, halved, seeds removed,Kosher salt and freshly ground pepper,2 garlic cloves, unpeeled,¼ cup tahini,½ teaspoon ground cumin,¼ teaspoon smoked paprika,2 tablespoons lemon juice, plus lemon wedges for serving,1 3½–4-lb. chicken,Fresh cilantro leaves with tender stems (for serving),	DIRECTIONS PreparationPlace racks in upper and lower thirds of oven; preheat to 425°. Coat a rimmed baking sheet with 1 Tbsp. oil. Season squash with salt and pepper and place, cut side down, on sheet along with garlic cloves. Roast on bottom rack until squash is tender, 45–50 minutes. Let cool. When cool enough to handle, peel garlic and scrape flesh from squash. Mash garlic and squash together in a large bowl. Add tahini, cumin, paprika, and lemon juice; season with salt and pepper.Meanwhile, heat remaining 1 Tbsp. oil in a large ovenproof skillet over medium-high heat. Season chicken all over with salt and pepper. Add to skillet, breast side down, and cook until browned, about 5 minutes. Turn chicken breast side up and transfer skillet to oven. Roast, basting a few times with pan juices, until meat at the thickest part of the thigh registers 165° on an instant-read thermometer, 45–50 minutes. Let rest 10 minutes before carving. Reserve 4 oz. chicken for tomorrow’s lunch.Serve chicken with butternut-tahini purée and lemon wedges. Top purée with cilantro.
146	/sunset-strip	Sunset Strip Recipe 	 Bon Appetit	1 tablespoon simple syrup,2 teaspoons fresh lime juice,2 teaspoons fresh or bottled yuzu juice,1¾ ounces Ron Zacapa 23,1 dried lime wheel or lime twist,	DIRECTIONS PreparationVigorously shake simple syrup, lime juice, yuzu juice, and Ron Zacapa in an ice-filled cocktail shaker until outside of shaker is very cold, 20 seconds. Place a globe ice cube in a martini glass; strain cocktail through a Hawthorne strainer or a large slotted spoon into glass. Garnish with lime wheel.
147	/charmed-and-dangerous	Charmed and Dangerous Recipe 	 Bon Appetit	1½ ounces VSOP Cognac,½ ounce Maury vin doux naturel wine,1 teaspoon pure maple syrup,1 lime,1 teaspoon absinthe,1 dried orange wheel or orange twist,1 star anise pod, lightly blackened with a kitchen torch or over gas burner,	DIRECTIONS PreparationStir VSOP Cognac, Maury, maple syrup, and two 2" strips lime zest in an ice-filled mixing glass until cold, about 30 seconds.Rinse a rocks glass or a frozen snifter with absinthe; discard. Strain cocktail through a Hawthorne strainer or a large slotted spoon into glass. Garnish with orange wheel and star anise pod.
148	/fusilli-alla-vodka-basil-parmesan	Fusilli alla Vodka with Basil and Parmesan Recipe 	 Bon Appetit	¼ cup olive oil,½ shallot, finely chopped,1 small garlic clove, finely grated,½ cup tomato paste,2 tablespoons vodka,1 cup heavy cream,1 teaspoon crushed red pepper flakes,Kosher salt, freshly ground pepper,1 pound fusilli,2 tablespoons unsalted butter,1 ounce finely grated Parmesan, plus more for serving,¼ cup chopped fresh basil,	DIRECTIONS PreparationHeat oil in a large skillet over medium. Add shallot and garlic and cook, stirring occasionally, until softened, about 5 minutes. Add tomato paste and cook, stirring occasionally, until paste is brick red and starts to caramelize, about 5 minutes. Add vodka and cook, stirring constantly, until liquid is mostly evaporated, about 2 minutes. Add cream and red pepper flakes and stir until well blended. Season with salt and pepper; remove from heat.Meanwhile, cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain, reserving 1 cup pasta cooking liquid. Add pasta to skillet with sauce along with butter and ½ cup pasta cooking liquid. Cook over medium-low heat, stirring constantly and adding more pasta cooking liquid if needed, until butter has melted and a thick, glossy sauce has formed, about 2 minutes. Season with salt and pepper and add 1 oz. Parmesan, tossing to coat. Divide pasta among bowls, then top with basil and more Parmesan.Do Ahead: Vodka sauce can be made 5 days ahead; cover and chill.
149	/roasted-butternut-squash	Roasted Butternut Squash Recipe 	 Bon Appetit	1 medium butternut squash (about 2 lb.), peeled, seeded, cut into 1" wedges,2 tbsp olive oil,3/4 teaspoon kosher salt, plus more to taste,1/2 teaspoon Aleppo pepper or hot paprika, plus more to taste,2 tsp balsamic vinegar,1/2 cup Red Pepper–Walnut Relish,	DIRECTIONS PreparationIngredient Info: Aleppo pepper, a slightly sweet Syrian pepper with a moderate heat level, is available at some specialty foods stores and wholespice.com.Preheat oven to 425°. Toss squash with oil on a rimmed baking sheet and arrange in a single layer; season with ¾ tsp. salt and ½ tsp. Aleppo pepper. Roast, turning wedges halfway through, until golden and tender, 30–35 minutes. Toss squash with balsamic vinegar and season with salt and Aleppo pepper. Reserve ½ cup roasted squash for Squash and Mustard Greens Salad. Serve squash with red pepper spread.
150	/buche-de-noel	Bûche de Noël Recipe 	 Bon Appetit	6 large egg whites,1¼ cups sugar,¼ teaspoon cream of tartar,¼ teaspoon kosher salt,Unsweetened cocoa powder (for dusting),1 cup (2 sticks) unsalted butter, cut into 1-inch pieces, room temperature,1 teaspoon vanilla extract,1 vanilla bean, split lengthwise,Nonstick vegetable oil spray,¼ cup all-purpose flour,3 tablespoons cornstarch,⅓ cup unsweetened cocoa powder, plus more for dusting,¼ cup whole milk,3 tablespoons unsalted butter, cut into pieces,1 tablespoon vegetable oil,1 teaspoon vanilla extract,½ teaspoon kosher salt,3 large eggs, room temperature,3 large egg yolks, room temperature,¾ cup sugar,Cocoa Syrup,Bittersweet Ganache,Mascarpone Filling,1 ounce marzipan (about 2 tablespoons),2 tablespoons dark unsweetened cocoa powder, preferably Dutch-process,1 ounce bittersweet chocolate, melted,	DIRECTIONS PreparationMushrooms and ButtercreamPreheat oven to 225°. Whisk egg whites, sugar, cream of tartar, and salt in a large heatproof bowl set over a medium saucepan of simmering water (bowl should not touch water) until egg whites are very liquid (mixture will be warm to the touch) and sugar is dissolved (rub between your fingers to check), about 5 minutes. Remove bowl from heat and beat with an electric mixer until stiff, glossy peaks form (bowl will feel cool), about 5 minutes.Line a rimmed baking sheet with parchment paper and dust very lightly with cocoa powder. Scoop out 1 cup meringue. Dollop heaping teaspoonfuls of meringue onto prepared baking sheet, spacing at least 1½" apart.Lightly dust meringue with more cocoa powder and place a sheet of parchment over top. Use an offset spatula or your hands to flatten meringue into irregularly shaped disks about ⅛" thick. Bake until lightly browned and parchment peels away easily, 75–90 minutes (meringue will be soft when it first comes out of the oven but will dry and crisp as it cools).Meanwhile, with mixer on medium speed, beat butter into remaining meringue, adding a piece at a time and waiting until incorporated before adding more. Beat until mixture is very smooth. (If it looks very loose or curdled, just keep beating; buttercream will come back together.) Add vanilla extract and scrape in vanilla seeds; beat to combine.Do Ahead: Mushrooms and buttercream can be made 2 days ahead. Store mushrooms airtight at room temperature. Cover and chill buttercream; bring to room temperature, then beat until smooth before using.Sponge CakeIncrease oven to 400°. Coat a 18x13" rimmed baking sheet with nonstick spray and line with parchment paper, leaving overhang on long sides. Spray parchment. Whisk flour, cornstarch, and ⅓ cup cocoa powder in a small bowl.Bring milk, butter, oil, vanilla, and salt to a simmer in a small saucepan over medium-low heat. Keep warm over low heat.Meanwhile, beat eggs and egg yolks with an electric mixer on medium speed until smooth. Increase speed to high; beat until doubled in volume. With motor running, gradually add sugar; beat until very light and fluffy and mixture falls back on itself in a slowly dissolving ribbon (it should be at least quadrupled in volume), about 5 minutes.Reduce speed to medium and gradually stream in milk mixture. Sift one-third of dry ingredients over top; gently fold in until only a few streaks remain. Working in 2 additions, repeat with remaining dry ingredients, scraping bottom of bowl and using as few strokes as possible to keep eggs from deflating (a few streaks are fine). Scrape batter into prepared baking sheet and gently spread to edges of pan. Tap sheet lightly on counter to pop any large air bubbles.Bake cake until surface is puffed and springy to the touch, 10–12 minutes.Let cake cool in pan 2 minutes, then run a knife along short edges to loosen. Invert onto a wire rack and carefully peel away parchment. Using a fine-mesh sieve, dust cake with cocoa powder. Cover with a large kitchen towel. Place another wire rack on top and flip cake over so towel side is underneath. Remove top rack; dust exposed side with cocoa powder. Starting at one of the long sides, gently roll up warm cake inside towel. Let cake cool, seam side down, 30–35 minutes.Do Ahead: Cake can be baked 1 day ahead. Store tightly wrapped in plastic at room temperature.AssemblyCarefully unroll towel and cake on a flat surface (cake will curl at the ends and may have a few small cracks but should stay in 1 piece). Position cake so the end that was in innermost part of spiral is closest to you; brush off any excess cocoa.Using a pastry brush, gently dab cocoa syrup over entire surface of cake; you may not use it all. Dollop bittersweet ganache over top and smooth with an offset spatula to create an even layer.Dollop mascarpone filling over ganache; carefully spread over surface, trying not to blend with ganache and avoiding last inch of cake along long side farthest from you.Using towel to lift edge nearest you, reroll cake, keeping towel on exterior. Chill, seam side down, until filling is set, about 30 minutes.Transfer filled cake to a baking sheet. Set aside ½ cup buttercream for attaching branches. Evenly spread remaining buttercream over cake with an offset spatula.Using a long serrated knife, trim ½" of cake from each end to create clean edges; discard (or eat!). Slice off a 4" piece of cake. Starting 1" from end, divide 4" piece in half, cutting at a 45° angle, leaving 1" at opposite end. Transfer log to a platter.Place angled side of each small piece of cake against roll to create branches, positioning one on top and the other on the side using a large dab of buttercream to secure. Cover any exposed cake on sides with more buttercream but leave cut ends exposed.Use spatula to create textured lines in buttercream to look like birch bark.Knead together marzipan and cocoa powder on a surface until smooth. Roll out on a sheet of parchment paper to less than ⅛" thick, then cut out wavy strips to look like tree knots; drape over buttercream and press gently to adhere.Using either a pastry bag fitted with a very small round tip or a disposable plastic bag with one corner snipped off, drizzle melted chocolate over log to mimic birch bark striations. Chill Bûche de Noël, uncovered, until ready to serve.Just before serving, press mushrooms perpendicularly into log in groups of 2 or 3.Do Ahead: Bûche de Noël (without meringue mushrooms) can be assembled 1 day ahead. Wrap in plastic and chill. Attach mushrooms just before serving.
151	/roasted-cauliflower	Roasted Cauliflower Recipe 	 Bon Appetit	2 medium heads of cauliflower, cut into large florets with some stalk attached,5 tablespoons olive oil,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationPreheat oven to 450°. Toss cauliflower and oil on a rimmed baking sheet; season with salt and pepper. Roast, tossing occasionally, until tender and browned, 25–35 minutes.
152	/spaghetti-squash-cacio-e-pepe	Spaghetti Squash “Cacio e Pepe” Recipe 	 Bon Appetit	1 medium spaghetti squash (about 3 pounds),¼ cup unsalted butter,1 tablespoon finely grated lemon zest,2 teaspoons fresh thyme leaves, plus more for serving,½ cup grated Pecorino,½ cup finely grated Parmesan, plus more for serving,1 teaspoon freshly ground black pepper,Kosher salt,	DIRECTIONS PreparationPreheat oven to 375°. Pierce squash all over with a knife to vent.Roast on a rimmed baking sheet, turning every 20 minutes, until tender (knife will easily slide through), 60–90 minutes.Let cool slightly. Halve lengthwise and scoop out seeds; discard. Scrape flesh with a fork to remove in long strands. Spread out on paper towels to drain.Heat butter in a large skillet over medium-high. Cook squash, lemon zest, thyme, Pecorino, and ½ cup Parmesan, stirring to combine, until squash is heated through, about 2 minutes. Stir in pepper and season with salt. Serve topped with more Parmesan.
153	/winter-milk-punch	Winter Milk Punch  Recipe 	 Bon Appetit	2 cups Cognac (preferably Courvoisier VS),2 cups rum (Appleton Estate VX),2 teaspoons loose chai tea,1 teaspoon finely grated lemon zest,2 ounces fresh lemon juice,1 cup whole milk,1 ½ tablespoons Demerara Simple Syrup (click for recipe),Freshly grated nutmeg (for serving),	DIRECTIONS PreparationWinter Milk Punch Base  Combine Cognac, rum, tea, lemon zest, and lemon juice in a large pitcher. Set aside to steep, 2 hours; strain and discard tea and lemon zest.Bring milk to a bare simmer in a medium saucepan. Immediately add hot milk to cognac mixture (milk will curdle right away). Cover and refrigerate at least 24 hours. Strain mixture through a fine-mesh sieve into a clean pitcher or large bowl, leaving about half of the curds in the base. Cover and chill until ready to serve.Do ahead: Cocktails Combine simple syrup and 3 oz. punch base in a cocktail shaker and fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a chilled glass and garnish with nutmeg.
154	/flatbread-castelfranco-burrata-apples-olives	Flatbread with Castelfranco, Burrata, Apples, and Olives Recipe 	 Bon Appetit	1½ tablespoons finely chopped oil-cured black olives,¼ cup plus 2 tablespoons olive oil, plus more for drizzling,1 pound prepared pizza dough,½ garlic clove,1 head of Castelfranco radicchio, torn into 2-inch pieces (about 10 cups),Kosher salt, freshly ground pepper,8 ounces burrata or fresh mozzarella, sliced,1 tart, crisp apple (such as Pink Lady or Gala), thinly sliced crosswise,¼ cup fresh mint leaves,1 tablespoon white wine vinegar,Flaky sea salt,	DIRECTIONS PreparationPreheat oven to 450°. Mix olives and ¼ cup olive oil in a small bowl; set aside.Divide pizza dough into 4 portions. Drizzle some olive oil onto 2 rimmed baking sheets. Stretch or roll each piece of dough into a very thin round (irregular shapes are encouraged) and place on baking sheets. Drizzle with remaining 2 Tbsp. olive oil and bake until golden brown, 8–10 minutes. While crusts are still warm, rub with cut side of garlic.Toss radicchio with 2 Tbsp. black olive mixture in a medium bowl; season with kosher salt and pepper.Top flatbread with burrata, drizzle with remaining black olive mixture, and mound half of dressed radicchio over cheese. Bake until cheese is just warmed through and greens are slightly wilted, about 4 minutes.Meanwhile, toss remaining dressed radicchio with apple, mint, and vinegar; divide salad among warm flatbreads. Sprinkle with sea salt.
155	/italian-wedding-soup-puntarelle	Italian Wedding Soup with Puntarelle Recipe 	 Bon Appetit	1 head of puntarelle, trimmed, outer leaves removed,1 large egg,½ pound ground pork,⅓ cup fine fresh breadcrumbs,2 tablespoons finely chopped fresh parsley,2 medium leeks, white and pale-green parts only, finely chopped, divided,4 garlic cloves, finely chopped, divided,Kosher salt, freshly ground pepper,¼ cup plus 1 tablespoon olive oil,¼ cup dry white wine,6 cups low-sodium chicken broth,1 tablespoon fresh lemon juice,Shaved Pecorino (for serving),	DIRECTIONS PreparationTear dark leafy parts of puntarelle into 2” pieces; set aside. You’ll be left with long white stalks and the core of the puntarelle, which is layered similar to a fennel bulb. Thinly slice core lengthwise (smaller pieces will break away) and set aside.Using your hands, mix egg, pork, breadcrumbs, parsley, 1 leek, and 2 garlic cloves in a medium bowl until well combined; season with salt and pepper. Gently roll heaping teaspoonfuls of mixture into balls, transferring to rimmed baking sheets as you go (you should have about 40 meatballs).Heat ¼ cup oil in a large heavy pot over medium–high. Cook meatballs, turning often to help maintain their round shape, until browned all over, 5–7 minutes. Add remaining leek and 2 garlic cloves to pot and cook, stirring often, until lightly browned and softened, about 5 minutes.Add all but a small handful of reserved sliced puntarelle core to pot and cook, stirring occasionally, until softened, about 4 minutes. Add wine and simmer until liquid is reduced by half, about 2 minutes. Add broth and bring to a simmer. Add all but a small handful of puntarelle leaves to pot. Season with salt and pepper and bring to a boil. Reduce heat and simmer, uncovered, until puntarelle is cooked through and flavors have melded, 25–30 minutes.Toss remaining puntarelle core and greens in a small bowl with lemon juice and remaining 1 Tbsp. oil; season with salt and pepper.Divide soup among bowls and top with dressed puntarelle and Pecorino.Do Ahead: Soup (without dressed puntarelle and Pecorino) can be made 1 day ahead. Dress puntarelle and top soup just before serving.
156	/roasted-sweet-potatoes	Roasted Sweet Potatoes Recipe 	 Bon Appetit	3 pounds sweet potatoes, peeled, cut into 1½-inch pieces,¼ cup olive oil,2 teaspoons kosher salt,½ teaspoon freshly ground black pepper,	DIRECTIONS PreparationPreheat oven to 450°. Toss potatoes, oil, salt, and pepper on a rimmed baking sheet. Roast, tossing occasionally, until tender and browned, 35–45 minutes.
157	/braised-chicken-thighs-mustard-chestnuts	Braised Chicken Thighs with Mustard and Chestnuts Recipe 	 Bon Appetit	5 skinless, boneless chicken thighs (1¼ lb.),Kosher salt and freshly ground pepper,1 tablespoon olive oil,2 leeks, sliced into ½” rings,1 cup homemade chicken stock or low-sodium chicken broth, divided,1 cup cooked chestnuts, quartered,2 tablespoons whole grain mustard,	DIRECTIONS PreparationSeason chicken with salt and pepper. Heat oil in a large skillet over medium-high heat. Add chicken and cook until browned, about 5 minutes per side; transfer to a plate.Reduce heat to medium, add leeks to skillet, and season with salt and pepper. Cook, stirring often, until beginning to soften, about 5 minutes. Add 2 Tbsp. stock and scrape up any browned bits from bottom of skillet. Stir in chestnuts and remaining stock and return chicken to skillet. Simmer, covered, until chicken is cooked through, 10–15 minutes. Reserve 1 chicken thigh for tomorrow’s lunch.Stir mustard into sauce and season with salt and pepper.
158	/indoor-smores	Indoor S'mores Recipe 	 Bon Appetit	16 assorted graham crackers (regular, cinnamon, honey, or chocolate), broken in half crosswise,16 marshmallows,8 ounces assorted chocolate (milk, dark, or semisweet), broken into ½-ounce squares,1 cup strawberries, hulled, sliced,1 cup unsalted, roasted sliced almonds,1 cup toasted unsweetened coconut flakes,	DIRECTIONS PreparationPreheat oven to 425°. Arrange 16 graham cracker halves in a single layer on a parchment-lined rimmed baking sheet, placing about ½" apart. Set 1 marshmallow in the center of each cracker and bake until marshmallows are lightly golden on top and puffed, about 5 minutes. Remove from oven and immediately top each with 1 chocolate square. Let sit 5 minutes to allow chocolate to melt slightly.Transfer s’mores to a platter and serve with strawberries, almonds, coconut, and remaining graham cracker halves alongside.
165	/coffee-stracciatella	Coffee Stracciatella Recipe 	 Bon Appetit	1½ cups heavy cream,1 cup whole milk,Pinch of kosher salt,½ cup sugar, divided,½ vanilla bean, split lengthwise, or 1 teaspoon vanilla extract,5 large egg yolks,2 teaspoons instant espresso powder,3 ounces bittersweet chocolate, melted,	DIRECTIONS PreparationCombine cream, milk, salt, and ¼ cup sugar in a medium saucepan. Scrape in seeds from vanilla bean; add pod. Bring mixture just to a simmer, stirring to dissolve sugar. Remove from heat. If using vanilla bean, cover; let sit 30 minutes.Whisk egg yolks and remaining ¼ cup sugar in a medium bowl until pale, about 2 minutes. Gradually whisk in ½ cup warm cream mixture, then whisk yolk mixture into remaining cream mixture. Cook mixture over medium heat, stirring constantly, until thick enough to coat a wooden spoon, 2–3 minutes.Strain custard into a medium bowl set over a large bowl of ice water. Stir in espresso powder until dissolved. Let cool, stirring occasionally. Process custard in an ice cream maker according to manufacturer’s instructions. Once custard is frozen to desired consistency in ice cream maker, gradually pour in chocolate; process until ice cream is flecked with chocolate, 2 minutes longer.
159	/grilled-tofu-chimichurri	Grilled Tofu with Chimichurri Recipe 	 Bon Appetit	2 14-ounce packages extra-firm tofu drained sliced into 8 pieces each,1 teaspoon cumin seeds,1 cup (packed) fresh parsley leaves,½ cup (packed) fresh cilantro leaves,2 tablespoons fresh oregano leaves,½ cup olive oil,2 tablespoons red wine vinegar,Kosher salt, freshly ground pepper,Vegetable oil (for grill),1 Fresno chile, thinly sliced,Flaky sea salt,	DIRECTIONS PreparationLine a rimmed baking sheet with 2 layers of paper towels and top with a single layer of tofu. Top with 2 more layers of paper towels and weight with a heavy skillet or baking dish. Let sit 15 minutes to press excess liquid out of tofu, which will firm it up and make it easier to grill. Transfer tofu to a shallow baking dish.Meanwhile, toast cumin seeds in a small skillet over medium heat, swirling pan often, until fragrant, about 2 minutes; set aside.Blend parsley, cilantro, and oregano in a food processor until finely chopped. With the motor running, add olive oil in a steady stream and blend until well combined. Transfer herb mixture to a small bowl, stir in vinegar, and season with kosher salt and pepper. Pour chimichurri over tofu and turn to coat. Cover and chill at least 1 hour.Prepare a grill for medium-high heat and lightly oil grate. Transfer tofu to grill, reserving chimichurri, and grill, turning often, until charred in spots, about 5 minutes per side; transfer to a platter. Top with reserved chimichurri, toasted cumin seeds, chile, and sea salt.Do Ahead: Tofu can be marinated up to 1 day ahead.
160	/green-tacos	Green Tacos Recipe 	 Bon Appetit	3 tablespoons olive oil,1 small sweet potato, peeled, grated,1 garlic clove, finely chopped,4 cups Tuscan kale ribs and stems removed, torn into bite-size pieces,2 tablespoons fresh lime juice,Kosher salt, freshly ground pepper,4 corn tortillas, warmed,1 avocado, thinly sliced,¼ cup crema mexicana,	DIRECTIONS PreparationHeat oil in a medium saucepan over medium heat. Cook sweet potato and garlic, stirring often, until potato is tender and just beginning to brown, 8–10 minutes. Add kale and cook, tossing often, until kale is wilted and tender, 8–10 minutes. Add lime juice and season with salt and pepper.Serve sweet potato and kale mixture on tortillas, topped with avocado and crema.
161	/salted-texas-chocolate-sheet-cake	Salted Texas Chocolate Sheet Cake Recipe 	 Bon Appetit	1 cup (2 sticks) unsalted butter, cut into pieces, plus more for baking dish,2 cups all-purpose flour, plus more for baking dish,1/4 cup unsweetened cocoa powder,2 cups sugar,1 teaspoon baking soda,1 teaspoon kosher salt,2 large eggs,1/2 cup buttermilk,1 teaspoon vanilla extract,1/4 cup (1/2 stick) unsalted butter,3 tablespoons whole milk,2 tablespoons unsweetened cocoa powder,1 1/2 cups powdered sugar,1 teaspoon vanilla extract,1/2 cup chopped unsalted, roasted pistachios,1 teaspoon flaky sea salt (such as Maldon),	DIRECTIONS PreparationCakePreheat oven to 350°. Butter and flour a 13x9" baking dish. Bring cocoa powder, 1 cup butter, and 1 cup water to a boil in a small saucepan; remove from heat.Meanwhile, whisk sugar, baking soda, salt, and 2 cups flour in a medium bowl. Make a well in the center. Add eggs, buttermilk, and vanilla to well. Blend with a fork, then gradually incorporate dry ingredients. Add butter mixture and whisk until smooth. Scrape batter into prepared baking dish and smooth top.Bake until cake starts to pull away from edges of dish and a tester inserted into the center comes out clean, 35–40 minutes. Transfer pan to a wire rack.FrostingJust before cake has finished baking, heat butter, milk, and cocoa powder in a medium saucepan over low heat, whisking occasionally, until butter is melted and mixture is smooth (do not let boil). Remove from heat and whisk in powdered sugar and vanilla.Pour warm frosting over warm cake and spread out and smooth with an offset spatula. Top with pistachios and sea salt.Serve slightly warm or room temperature.
162	/grilled-cauliflower-steaks-scallions	Grilled Cauliflower Steaks and Scallions Recipe 	 Bon Appetit	1 large head cauliflower,6 tablespoons vegetable oil, divided, plus more for grill,1 bunch scallions, trimmed,Kosher salt, freshly ground pepper,1 1-inch piece ginger, peeled, grated,1 garlic clove,½ cup (packed) fresh cilantro leaves,2 tablespoons fresh lime juice,Gochugaru (Korean red pepper powder), toasted black sesame seeds, and sesame oil (for serving),	DIRECTIONS PreparationRemove leaves and trim stem of cauliflower, leaving core intact. Place cauliflower, core side down, on a work surface. Starting at the midline of the cauliflower, slice from top to bottom into four ½" "steaks" (reserve any florets that break loose).Prepare a grill for medium-high heat and lightly oil grate. Drizzle cauliflower steaks, florets, and scallions with 4 Tbsp. oil; season with salt and pepper. Grill scallions, turning occasionally, until charred in spots, about 2 minutes. Grill cauliflower steaks until tender and charred in spots, 8–10 minutes per side. Grill any loose florets in a grill basket, tossing often, until cooked through, 5–7 minutes.Blend ginger, garlic, cilantro, lime juice, and remaining 2 Tbsp. oil in a food processor, thinning with water if needed, until sauce is the consistency of yogurt; season with salt.Arrange cauliflower and scallions on a platter. Sprinkle with gochugaru and sesame seeds and drizzle with sesame oil. Serve with cilantro sauce alongside.
163	/tofu-summer-rolls	Tofu Summer Rolls Recipe 	 Bon Appetit	½ 14-oz. package extra-firm tofu, cut into ½" planks,1 tablespoon soy sauce,1 tablespoon vegetable oil,Kosher salt,1 teaspoon toasted sesame oil,1 small head of lettuce (such as Little Gem or romaine hearts),1 small carrot, julienned,¼ English hothouse cucumber halved lengthwise seeded sliced into half moons,Lime wedges, mint leaves, and sweet chili sauce (for serving),	DIRECTIONS PreparationPreheat oven to 400º. Place tofu on a paper towel-lined rimmed baking sheet. Top tofu with 2 more layers of paper towels and place a heavy skillet on top. Let drain 15 minutes. Remove paper towels and slice tofu into ½" batons. Toss tofu with soy sauce and vegetable oil on baking sheet; season with salt. Roast tofu, tossing once, until golden brown, 20–25 minutes. Drizzle with sesame oil and toss to coat.Serve tofu with lettuce, carrots, cucumbers, lime wedges, mint, and chili sauce alongside. Assemble just before eating.Do Ahead: Tofu can be roasted 2 days ahead. Cover and chill.
164	/ricotta-toast-pears-honey	Ricotta Toast with Pears and Honey Recipe 	 Bon Appetit	⅓ cup whole-milk ricotta,½ teaspoon finely grated orange zest,Pinch of kosher salt,2 teaspoons honey, plus more for drizzling,2 slices multigrain bread, toasted,1 medium Bartlett pear, thinly sliced,3 tablespoons unsalted, roasted sliced almonds,	DIRECTIONS PreparationCombine ricotta, orange zest, salt, and 2 tsp. honey in a small bowl. Dividing evenly, spread ricotta mixture onto toast. Top with pear, drizzle with honey, and sprinkle with almonds.
173	/yellow-sheet-cake-chocolate-sour-cream-frosting	Yellow Sheet Cake with Chocolate Sour Cream Frosting Recipe 	 Bon Appetit	Nonstick vegetable oil spray,3 cups all-purpose flour,1½ teaspoons baking powder,1 teaspoon baking soda,1 teaspoon kosher salt,1 cup buttermilk,⅓ cup vegetable oil,1 teaspoon vanilla extract,1½ cups granulated sugar,⅓ cup (packed) light brown sugar,¾ cup (1½ sticks) unsalted butter, room temperature,½ vanilla bean, split lengthwise,4 large egg yolks,2 large eggs,14 ounces semisweet chocolate, chopped,¼ cup light corn syrup,2 cups sour cream,1½ teaspoons kosher salt,1½ teaspoons vanilla extract,2¾ cups powdered sugar,¾ cup (1½ sticks) unsalted butter, room temperature,	DIRECTIONS PreparationCakePreheat oven to 350°. Lightly coat a 18x13" rimmed baking sheet with nonstick spray. Line with parchment paper; coat parchment with nonstick spray. Whisk flour, baking powder, baking soda, and salt in a large bowl until no lumps remain. Combine buttermilk, oil, and vanilla in a medium bowl.Combine granulated sugar, brown sugar, and butter in another large bowl. Scrape in seeds from vanilla bean; save pod for another use. Using an electric mixer on medium speed, beat until light and fluffy, about 4 minutes. Add egg yolks and eggs one at a time, beating to blend after each addition. Continue to beat mixture, occasionally scraping down sides and bottom of bowl, until almost doubled in volume and very light, airy, and pale yellow, about 5 minutes. It’s very important that there are no lumps at this stage. The occasional scraping of the bowl, especially the bottom, will help prevent lumps.Reduce speed to low, add dry ingredients in 3 additions, alternating with buttermilk mixture in 2 additions, beginning and ending with dry ingredients. Scrape batter into prepared baking sheet and smooth top.Bake cake, rotating sheet halfway through, until light golden brown, the center springs back when gently pressed, and a tester inserted into the center comes out with a few moist crumbs attached, 20–25 minutes. Transfer baking sheet to a wire rack and let cake cool.Using a long serrated knife, remove any uneven edges or bumps from cake to create a flat surface.Do Ahead: Cake can be baked 1 day ahead. Store tightly wrapped at room temperature, or freeze up to 1 month.Frosting and AssemblyHeat chocolate and corn syrup in a heatproof bowl set over a saucepan of simmering water (water should not touch bottom of bowl), stirring constantly, until chocolate is melted and mixture is smooth; remove from heat.Place sour cream, salt, and vanilla in another heatproof bowl and set over same saucepan of simmering water. Stir until mixture is warm but not hot, about 2 minutes. Add sour cream mixture to chocolate mixture and stir until smooth and glossy.Using an electric mixer on medium speed, beat powdered sugar and butter in a large bowl until light and fluffy, about 3 minutes. Scrape down sides of bowl, then slowly beat in chocolate mixture. Continue beating until no lumps remain, about 2 minutes. Frosting should be smooth and shiny. Cover and chill until slightly firmed up, about 30 minutes. Spread frosting over top of cake.Do Ahead: Cake can be assembled 1 day ahead; chill. Bring to room temperature before serving.
166	/grilled-chicken-wings-with-vinegar-and-chiles	Grilled Chicken Wings with Vinegar and Chiles Recipe 	 Bon Appetit	2 chiles de árbol or ½ tsp. red pepper flakes,2 pounds chicken wings, tips removed, flats and drumettes separated,½ cup rice vinegar,2 tablespoons olive oil,4 garlic cloves, peeled, smashed,1 tablespoon agave syrup (nectar) or honey,2 scallions, thinly sliced, plus more,2 teaspoons Kosher salt, plus more,Freshly ground pepper,2 teaspoons baking soda,2 teaspoons ground cumin,1 teaspoons togarashi or hot paprika,Lime wedges, for serving,	DIRECTIONS PreparationToast chiles in small dry skillet over medium-high heat; let cool slightly and lightly crush. Combine chiles, vinegar, olive oil, garlic, agave, and scallions in a resealable plastic bag. Season with 2 tsp. salt and pepper. Add chicken; seal bag, eliminating air, and shake to distribute ingredients. Chill overnight.Prepare grill for medium-low heat. Remove wings from refrigerator and let come to room temperature, 35-50 minutes. Remove wings from bag and pat dry very well with paper towels. Discard marinade.Mix baking soda, cumin, and togarashi in a large bowl; season with salt. Add wings and toss to coat. Grill wings, turning occasionally, until cooked through and charred in spots, 15-20 minutes. To serve, squeeze lime juice over wings and sprinkle with scallions.
167	/popcorn-herb-salt	Popcorn with Herb Salt Recipe 	 Bon Appetit	2 teaspoons finely chopped fresh rosemary,2 teaspoons finely chopped fresh thyme,1 tablespoons kosher salt,8 cups just-popped popcorn (from ½ cup kernels),¼ cup olive oil,A spice mill or a mortar and pestle,	DIRECTIONS PreparationFinely grind rosemary, thyme, and salt in spice mill or with mortar and pestle.Arrange popcorn on a rimmed baking sheet and drizzle with oil; toss to coat.Sprinkle with some of the herb salt and toss to coat, adding more to taste.
168	/pinto-bean-ham-torta	Pinto Bean and Ham Torta Recipe 	 Bon Appetit	1 tablespoon vegetable oil,2 scallions, trimmed, thinly sliced,1 garlic clove,1 15-oz. can pinto beans, drained, rinsed,4 tablespoons fresh lime juice, divided,Kosher salt, freshly ground pepper,1 cup shredded romaine,½ cup fresh cilantro leaves and tender stems,½ avocado,2 brioche rolls, split, toasted,2 ounces cotija cheese, thinly sliced,2 thin slices black forest ham,6 tortilla chips (optional),	DIRECTIONS PreparationHeat oil in a medium skillet over medium. Add scallions and garlic and cook, stirring often, until softened, about 2 minutes. Add beans and ¼ cup water and cook, stirring and smashing beans with the side of a wooden spoon until mostly mashed, adding more water 1 Tbsp. at a time if needed, until beans are the consistency of loose mashed potatoes. Stir in 1 Tbsp. lime juice and season with salt and pepper.Toss romaine and cilantro with 2 Tbsp. lime juice in a medium bowl and season with salt and pepper. Scoop flesh from avocado into another medium bowl and smash with remaining 1 Tbsp. lime juice with a fork until mostly smooth. Season with salt.Divide bean mixture among bottom halves of rolls and top with cotija, ham, romaine mixture, and chips, if using. Spread avocado mixture on top halves of rolls and close sandwiches.Do Ahead: Mashed beans can be made up to 2 days ahead. Add a little water to loosen if necessary before spreading on rolls.
169	/maple-ginger-cider-switchel	Maple-Ginger Cider Switchel Recipe 	 Bon Appetit	1 5"-piece fresh ginger (about 6 ounces),½ cup apple cider vinegar,3 tablespoons pure maple syrup,1 tablespoon fresh lime or lemon juice,4 cups water or club soda,Mint sprigs (for serving),	DIRECTIONS PreparationPass ginger through a juicer (you should have about ⅓ cup). Combine ginger juice, vinegar, maple syrup, and lime juice in a large pitcher and stir until maple syrup is dissolved. Chill until cold.To serve, dilute with water and pour switchel into ice-filled glasses; garnish with mint.Do Ahead: Base can be made 1 day ahead. Keep chilled.
170	/chicken-sausage-omelet-greens-cheese	Chicken Sausage Omelet with Greens and Cheese Recipe 	 Bon Appetit	2 tablespoons unsalted butter, divided,4 large eggs, beaten to blend, divided,Kosher salt, freshly ground pepper,⅓ cup Muenster cheese, shredded, divided,4 ounces loose chicken-apple sausage, cooked, divided,⅓ cup sautéed greens (such as spinach, kale, or Swiss chard), divided,	DIRECTIONS PreparationMelt 1 Tbsp. butter in an 8" nonstick skillet over medium heat. Season eggs with salt and pepper.Add half of eggs to skillet. Cook eggs, stirring gently with a heatproof spatula, until eggs are lightly scrambled and almost cooked through, about 3 minutes. Spread eggs evenly to cover bottom of skillet.Top eggs with half of Muenster, sausage, and greens. Using spatula, fold over one-third of omelet. Roll omelet onto itself, then slide onto a plate. Repeat with remaining ingredients to make a second omelet.
171	/shelled-bean-and-swiss-chard-panzanella	Shelled Bean and Swiss Chard Panzanella Recipe 	 Bon Appetit	1 pound fresh shelled beans (such as Calypso, Cranberry, or Jacob’s Cattle),¼ celery root (celeriac) peeled cut into large pieces,2 large carrots, peeled halved crosswise,1 large leek split lengthwise,2 shallots peeled,2 garlic cloves smashed,2 bay leaves,2 sprigs thyme,3 tablespoons kosher salt, plus more,½ small loaf country bread, crusts removed, torn into 1–1½-inch pieces (about 6 cups),¾ cup olive oil, divided,Kosher salt,1 red Thai chile, finely chopped,1 small garlic clove, finely grated,½ cup apple cider vinegar,10 cups red Swiss chard, stemmed, torn into 2-inch pieces (from about 2 bunches),8 breakfast radishes, trimmed, thinly sliced lengthwise on a mandoline,1 shallot, peeled, thinly sliced into rings,	DIRECTIONS PreparationBeansCombine beans, celery root, carrots, leek, shallots, garlic, bay leaves, thyme, 3 Tbsp. salt, and 6 cups water in a medium pot. Cover and bring to a boil over medium heat, then lower heat and simmer until beans are tender, 15–45 minutes (fresher beans will cook faster; drier beans will take longer). Season with salt and let beans cool in liquid, about 1 hour.Do Ahead: Beans can be made up to 1 week ahead. Cover and chill.Salad and AssemblyPreheat oven to 425°. Toss bread with ¼ cup oil on a rimmed baking sheet; season with salt. Bake until golden brown, 15–20 minutes.Meanwhile, whisk chile, garlic, vinegar, 1 tsp. salt, and remaining ½ cup oil in a small bowl.Drain beans and carrots; pick out and discard other ingredients. Cut carrots diagonally into 2" pieces. Toss beans and chard with ½ cup dressing in a large bowl, then divide among plates. Top salad with radishes, shallot, carrots, croutons, and more dressing.
172	/roasted-golden-beet-salad-with-pea-shoots-and-fennel-fronds	Roasted Golden Beet Salad with Pea Shoots and Fennel Fronds Recipe 	 Bon Appetit	2 pounds baby golden beets, scrubbed, tops and root ends trimmed,¼ cup olive oil, divided,Kosher salt and freshly ground black pepper,1 tablespoon fresh lemon juice,1 tablespoon red wine vinegar,Pea shoots (tendrils), fennel fronds, and flaky sea salt (for serving),	DIRECTIONS PreparationPreheat oven to 350°. Place beets in a shallow baking dish. Drizzle with 2 Tbsp. oil; season with kosher salt and pepper. Add ½ cup water and roast until beets are tender and a paring knife inserted into the center meets no resistance, 50–60 minutes. Let beets cool slightly, then peel.Cut beets in half and arrange on a platter. Whisk lemon juice, vinegar, and remaining 2 Tbsp. oil in a small bowl; drizzle over beets. Garnish with pea shoots and fennel fronds and season with flaky sea salt.
174	/chicken-thighs-turnip-pear	Chicken with Turnip and Pear Recipe 	 Bon Appetit	3 tablespoons olive oil, divided,4 skin-on, bone-in chicken thighs,Kosher salt, freshly ground pepper,1 large onion, thinly sliced,1 medium pear, peeled, cored, chopped,1 medium turnip, peeled, chopped,4 garlic cloves, finely chopped,½ cup dry white wine,1 teaspoon fresh thyme leaves, plus more for serving,½ cup salted, roasted macadamia nuts, chopped,	DIRECTIONS PreparationACTIVE: 30TOTAL: 45Heat 1 Tbsp. oil in a large skillet over medium-high heat. Season chicken with salt and pepper and cook, skin side down, until skin is browned and crisp, 10–12 minutes. Transfer chicken to a plate.Heat remaining 2 Tbsp. oil in same skillet over medium-high heat. Add onion, pear, turnip, and garlic, season with salt and pepper, and cook, stirring occasionally, until pear and turnip are soft and starting to turn golden brown, 15–20 minutes. Carefully add wine and thyme, then return chicken to skillet, skin side up. Cook until wine is almost completely evaporated and chicken is cooked through, 8–10 minutes. Serve topped with macadamia nuts.
175	/whole-grain-mustard-walnut-vinaigrette	Whole Grain Mustard Walnut Vinaigrette Recipe 	 Bon Appetit	2 tablespoons Dijon mustard,2 tablespoons whole grain mustard,2 tablespoons Sherry vinegar,½ cup olive oil,½ cup walnut oil,Kosher salt and freshly ground pepper,	DIRECTIONS PreparationIn a medium bowl, whisk together Dijon and whole grain mustards, vinegar, olive oil, and walnut oil; season with salt and pepper. Alternatively, place ingredients in a 1-pint jar with a lid and shake vigorously to combine. Refrigerate until ready to use.
176	/carole-lallis-chocolate-bread-pudding	Carole Lalli's Chocolate Bread Pudding Recipe 	 Bon Appetit	6 large slices day-old chocolate bread, cut into 1" pieces,Unsalted butter (for pan),6 large egg yolks,½ cup granulated sugar,2 cups heavy cream,1 cup whole milk,1 tablespoon vanilla extract,2 tablespoons powdered sugar (optional),1 tablespoon unsweetened cocoa (optional),Softly whipped cream (optional),	DIRECTIONS PreparationIf necessary, preheat oven to 300º, spread bread in a single layer on a baking sheet, and bake to dry out bread, stirring twice, 15–20 minutes; do not let bread toast. This step ensures that the bread can absorb the custard rather than just going gummy when combined with the liquid. If your bread is a day or two old, you needn’t bother.Lightly butter a 2-quart baking dish and arrange bread in dish, making sure there are no gaps. Whisk egg yolks in a large bowl, then whisk in granulated sugar; beat about 1 minute to lighten mixture. Whisk in heavy cream, milk, and vanilla extract.Gently pour custard over bread. Place a heavy skillet or baking dish slightly smaller than the one you are using directly on top of bread to weigh down and refrigerate overnight. This allows the bread to fully absorb the custard—if you only have a few hours, that will suffice.Preheat oven to 350º. Remove weight from pudding. Place baking dish in a large roasting pan. Add enough hot water to come halfway up sides of baking dish and carefully transfer to oven. Bake until custard is set around the edges and slightly soft in the center, 40–50 minutes. Remove baking dish from water bath and let cool slightly.Combine powdered sugar and cocoa, if using, in a small bowl. Transfer to a sieve and dust pudding just before serving. Serve warm or at room temperature with whipped cream, if using.
177	/greens-cheese-lasagna	Greens and Cheese Vegetable Lasagna Recipe 	 Bon Appetit	3 tablespoons unsalted butter,3 tablespoons all-purpose flour,3 cups whole milk, warmed,2½ cups grated Parmesan,Kosher salt, freshly ground pepper,12 ounces lasagna noodles,Kosher salt,¼ cup olive oil, plus more for pans,4 garlic cloves, thinly sliced,2 bunches collard greens, thick stems removed, coarsely chopped,2 bunches Tuscan kale, thick stems removed, coarsely chopped,Freshly ground black pepper,2 pounds ricotta,2 large eggs,1 tablespoon fresh thyme leaves,1 teaspoon finely grated lemon zest,8 ounces fresh mozzarella, torn into bite-size pieces,	DIRECTIONS PreparationBéchamelHeat butter in a medium saucepan over medium until foaming. Whisk in flour and cook, whisking constantly, about 1 minute. Add milk 1 cup at a time, whisking to incorporate after each addition. Bring to a simmer and cook, whisking occasionally, until slightly thickened, 6–8 minutes. Remove from heat and add Parmesan, whisking until cheese is melted and sauce is smooth; season béchamel with salt and pepper.Lasagna and AssemblyPreheat oven to 350°. Cook lasagna noodles in a large pot of boiling salted water, stirring occasionally, 2 minutes less than package directions; you want them to be very al dente so they won’t become mushy when baked. Drain noodles and transfer to a lightly oiled baking sheet; turn noodles to coat (this will prevent them from sticking to one another and make them easier to handle).Meanwhile, heat ¼ cup oil in a large skillet over medium-high. Add garlic and cook, stirring constantly, until fragrant, about 1 minute. Add a few handfuls of greens and cook, tossing and adding more greens as they wilt, until all greens are tender, about 5 minutes; season with salt and pepper.Combine ricotta, eggs, thyme, and lemon zest in a medium bowl; season with salt and pepper.Lightly oil a 13x9" pan. Arrange noodles to cover bottom of pan, cutting to fit as needed. Spread one-third of ricotta mixture evenly over noodles, then top evenly with one-third of cooked greens. Spoon one-quarter of béchamel over greens, spreading evenly to cover. Add another layer of noodles. Repeat layers 2 more times, starting with noodles and ending with béchamel. Top with a final layer of noodles, then spread with remaining béchamel. Scatter mozzarella over top.Bake lasagna until bubbling and beginning to brown on top, 45–50 minutes. Let cool at least 20 minutes before serving.
178	/six-layer-chocolate-coconut-cashew-graham-bars	Six-Layer Chocolate-Coconut-Cashew-Graham Bars Recipe 	 Bon Appetit	Nonstick vegetable oil spray,18 graham crackers (about 2 sleeves),½ cup (1 stick) unsalted butter melted slightly cooled,¼ teaspoon kosher salt,6 ounces semisweet chocolate, chopped,1 cup unsalted, roasted cashews, coarsely chopped,1 cup unsweetened coconut flakes,1 cup cornflakes,1 14-ounce can sweetened condensed milk,Flaky sea salt,	DIRECTIONS PreparationPreheat oven to 350°. Lightly coat a 13x9" baking dish with nonstick spray, then line with parchment paper, leaving a 2" overhang on long sides. Coat parchment with nonstick spray.Pulse graham crackers in a food processor until finely ground. Add butter and kosher salt and pulse to combine. Press graham cracker mixture into bottom of prepared baking dish. Scatter chocolate, cashews, coconut, and cornflakes over crust. Pour condensed milk evenly over top.Bake until coconut is pale golden brown, 20–25 minutes. Transfer dish to a wire rack and sprinkle bar with sea salt; let cool. Use parchment paper overhang to lift bar out of pan and onto a cutting board. Trim edges; cut bar into thirty-two 1½" squares.Do Ahead: Bars can be made 5 days ahead. Store tightly wrapped at room temperature.
179	/leche-de-tigre	Leche de Tigre Recipe 	 Bon Appetit	2 cups fresh orange juice,1 cup fresh lime juice,1 3-inch piece turmeric,1 2-inch piece ginger, peeled, thinly sliced,1 jalapeño, seeds removed, chopped,2 garlic cloves,Kosher salt,Chili oil and mint sprigs (for serving),	DIRECTIONS PreparationPurée orange juice, lime juice, turmeric, ginger, jalapeño, and garlic in a blender until smooth. Strain through a fine-mesh sieve into a glass measuring cup or pitcher; season with salt.Divide among glasses and drizzle with chili oil. Garnish with a mint sprig.Do Ahead: Leche de tigre can be made 1 day ahead. Cover and chill.
243	/come-fly-with-us	Come Fly with Us Recipe 	 Bon Appetit	3/4 ounce Pama (pomegranate liqueur),3/4 ounce vodka,1/2 ounce Punt e Mes,1 dash Bittermen's Xocolatl Mole or Angostura bitters,4 ounces sparkling rosé,Orange twist (for serving),	DIRECTIONS PreparationCombine Pama, vodka, Punt e Mes, and bitters in a large glass, mixing glass, or cocktail shaker filled with ice. Stir until outside of glass is frosty, about 30 seconds. Strain into a coupe glass or Champagne flute and top with rosé. Garnish with orange twist.
180	/cherry-lime-hand-pies	Cherry-Lime Hand Pies Recipe 	 Bon Appetit	2½ cups all-purpose flour,1 teaspoon kosher salt,1 cup (2 sticks) chilled unsalted butter, cut into pieces,All-purpose flour (for surface),4 cups pitted fresh or frozen cherries, halved,½ cup granulated sugar,4 tablespoons cornstarch,2 teaspoons finely grated lime zest,2 tablespoons fresh lime juice,½ teaspoon kosher salt,1 large egg, beaten to blend,¼ cup raw sugar,	DIRECTIONS PreparationCrustPulse flour and salt in a food processor just to combine. Add butter and pulse until texture resembles very coarse meal with a few pea-size pieces of butter remaining. Drizzle ¼ cup ice water over and pulse, adding more ice water by the tablespoonful as needed, until dough just holds together when squeezed. Divide dough in half and form into 2 disks, wrap in plastic, and chill until firm, about 2 hours.Do Ahead: Crust can be made 3 days ahead. Keep chilled, or freeze up to 1 month. Let sit at room temperature 15 minutes before rolling out.Filling and AssemblyPreheat oven to 350°. Roll out 1 disk of dough on a floured surface to a 18x12" rectangle. Cut out six 6" rounds; reroll scraps and cut out 2 more rounds. Repeat with remaining disk of dough.Toss cherries, granulated sugar, cornstarch, lime zest, lime juice, and salt in a large bowl to combine. Brush edges of rounds with half of egg and spoon about 2 Tbsp. cherries on one half of each, leaving a ½" border. Fold dough over and press edges to seal, then crimp with your fingers or a fork. Transfer to 2 parchment-lined baking sheets and freeze 15 minutes (this will help pies hold their shape while baking).Brush pies with remaining egg and sprinkle with raw sugar. Cut a few slits in tops of pies to vent. Bake pies, rotating baking sheets halfway through, until juices are bubbling and pastry is golden brown, 35–40 minutes (juices will run onto parchment). Let hand pies cool on baking sheets 5 minutes, then transfer to wire racks. Serve warm or at room temperature.Do Ahead: Pies can be assembled, but not baked, 1 week ahead; cover and freeze. Pies can be baked 1 day ahead; store tightly wrapped at room temperature.
181	/lemon-bars-crowd	Lemon Bars for a Crowd Recipe 	 Bon Appetit	¾ cup (1½ sticks) chilled unsalted butter, cut into pieces,6 tablespoons sugar,1 teaspoon kosher salt,2 large egg yolks,1 teaspoon vanilla extract,2 cups all-purpose flour,1⅓ cups fresh lemon juice,1 teaspoon kosher salt,1½ cups granulated sugar, divided,1 vanilla bean, split lengthwise,6 large egg yolks,2 large eggs,1 cup (2 sticks) chilled unsalted butter, cut into pieces,Powdered sugar (for serving),	DIRECTIONS PreparationCrustPreheat oven to 350°. Using an electric mixer on low speed, beat butter, sugar, and salt in a medium bowl until butter is almost completely smooth, about 2 minutes. Increase speed to medium and beat until butter is creamy, about 2 minutes more. Beat in egg yolks and vanilla. Reduce speed to low, add flour, and beat until no dry spots remain.Firmly press dough into the bottom and ½" up the sides of a 13x9" baking dish (the firmer you press, the easier it will be to cut the crust). Bake crust until golden brown on the bottom and a shade or two darker at the edges, 25-35 minutes. Remove dish from oven and reduce oven to 300°.Filling and AssemblyCombine lemon juice, salt, and ½ cup sugar in a small saucepan. Scrape in seeds from vanilla bean and add pod. Bring to a simmer over medium heat, stirring to dissolve sugar.Meanwhile, whisk egg yolks, eggs, and remaining 1 cup sugar in a medium bowl until no longer grainy and slightly lightened in color, about 2 minutes.Whisking constantly, gradually stream hot lemon mixture into egg mixture, then transfer mixture back to saucepan. Cook over medium heat, whisking constantly, until thickened and marks from whisk are just visible, 5–7 minutes. Remove from heat and whisk in butter, adding a couple of pieces at a time and whisking until incorporated before adding more, until smooth.Strain warm curd through a fine-mesh sieve into warm crust and bake until curd is set around the edges (filling should still wobble when dish is jiggled; it will set completely as it cools), 15–20 minutes. Do not overbake or filling may curdle. Transfer to a wire rack and let cool, about 2 hours, then chill until cold, at least 1 hour.Just before serving, cut lemon bars into thirty-two 1½" squares and dust with powdered sugar.Do Ahead: Lemon bars (without powdered sugar) can be made 3 days ahead. Cover and keep chilled.
182	/deviled-eggs-crispy-shallot-gremolata	Deviled Eggs with Crispy Shallot Gremolata Recipe 	 Bon Appetit	12 large eggs,¾ cup vegetable oil,1 large shallot, thinly sliced into rings,Kosher salt,½ cup mayonnaise,2 teaspoons Dijon mustard,1 tablespoon fresh lemon juice, plus more,2 tablespoons finely chopped fresh chives,2 tablespoons finely chopped fresh parsley,1 teaspoon finely grated lemon zest,A large star tip and a pastry bag,	DIRECTIONS PreparationPlace eggs in a medium pot and cover with water. Bring to a boil, remove from heat, and cover. Let sit 9 minutes. Remove eggs with a slotted spoon and transfer to an ice bath.Meanwhile, heat oil in a small saucepan over medium-high. Add shallots and cook, stirring occasionally, until golden brown and crisp, about 5 minutes. Remove with a slotted spoon and transfer to paper-towels; season with salt and let cool.Peel eggs and halve lengthwise. Pop out yolks and place in a medium bowl; reserve whites. Add mayonnaise, mustard, and lemon juice to yolks and stir with a fork or whisk until very smooth; season with salt and more lemon juice, if desired.Toss chives, parsley, lemon zest, and reserved shallots in a small bowl; season with salt.Fit a pastry bag with a large star tip (or use a resealable plastic bag with a hole cut out in the corner). Scoop egg yolk mixture into pastry bag and pipe into egg whites. Top with shallot gremolata before serving.
183	/corn-and-chickpea-bowl-with-miso-jalapeno-tahini	Corn & Chickpea Bowl with Miso-Jalapeño Tahini Recipe 	 Bon Appetit	1 ¾-inch piece ginger, peeled, finely grated,2 small jalapeños, seeded, chopped,2 small garlic cloves, finely grated,1 cup (packed) cilantro leaves with tender stems,⅓ cup fresh lime juice,⅓ cup tahini,1½ tablespoons miso,Kosher salt,3 tablespoons olive oil, divided, plus more for drizzling,2 garlic cloves, lightly crushed,1 14-ounce can chickpeas rinsed, drained,3 ears of corn, shucked, kernels removed,1 tablespoon za’atar (another flavorful spice blend like curry powder is great here too),Kosher salt,4 cups Little Gem or other small lettuce leaves, torn if large,4 small tomatoes, cut into wedges,2 avocados, cut into wedges,Crumbled feta, lime wedges, and cilantro (for serving),	DIRECTIONS PreparationTahiniPurée ginger, jalapeños, garlic, cilantro, lime juice, tahini, miso, and 3 Tbsp. water in a blender until smooth. Season with salt.Do Ahead: Tahini can be made 1 day ahead. Transfer to an airtight container and chill.Bowl AssemblyHeat 2 Tbsp. oil in a large skillet over medium. Add garlic and cook, turning occasionally, until golden brown, about 4 minutes. Mash garlic with a spoon and stir into oil. Add chickpeas and increase heat to medium-high. Cook, undisturbed, until golden brown and beginning to crisp underneath, about 3 minutes. Toss and continue to cook, tossing occasionally, until golden brown all over, 2–3 minutes more. Add corn along with 1 Tbsp. oil and cook, tossing, until corn kernels are golden around the edges and tender, 5–7 minutes. Sprinkle za’atar over and toss to coat. Season with salt.Lightly drizzle lettuce, tomatoes, and avocado with oil in a large bowl and toss to combine; season with salt.Divide tahini among bowls and top with vegetables and chickpea mixture. Sprinkle with feta. Serve with lime wedges and cilantro alongside.
184	/lemon-thyme-ice-pops	Lemon-Thyme Ice Pops Recipe 	 Bon Appetit	3 small bunches thyme,1¼ cups sugar,2¼ cups fresh lemon juice,Thirty 2-ounce ice-pop molds and wooden sticks,	DIRECTIONS PreparationBring thyme, sugar, and 1¼ cups water to a boil in a small saucepan over medium heat. Reduce heat to low and simmer, stirring occasionally, until sugar is dissolved, about 5 minutes. Let cool, then pluck out thyme sprigs (it’s okay if some leaves stay behind).Blend thyme syrup, lemon juice, and 3 ⅓ cups water in a blender 1 minute. Pour lemon-thyme mixture into ice-pop molds. Cover and insert sticks. Freeze until solid, at least 4 hours. Dip molds briefly in hot water to release pops.Do Ahead: Ice pops can be made 1 week ahead. Keep frozen.
185	/potato-leek-soup-toasted-nuts-seeds	Potato-Leek Soup with Toasted Nuts and Seeds Recipe 	 Bon Appetit	3 large leeks,4 sprigs thyme,2 sprigs rosemary,2 bay leaves,¼ cup (½ stick) unsalted butter,3 celery stalks, chopped,Kosher salt, freshly ground pepper,1 russet potato, peeled, chopped,5 cups (or more) low-sodium chicken broth,½ cup heavy cream,1 tablespoon olive oil,¼ cup almonds, chopped,2 tablespoons raw sunflower seeds,1 tablespoon coriander seeds, crushed,Pinch of sugar,¼ cup crème fraîche,	DIRECTIONS PreparationTrim dark green leaves from leeks; discard all but 2. Tuck thyme, rosemary, and bay leaves inside leek leaves; tie closed with kitchen twine. Thinly slice light and pale-green parts of leeks.Heat butter in a large heavy pot over medium-high. Add celery and sliced leeks and season with salt and pepper. Cook, stirring, until leeks begin to soften, about 5 minutes. Reduce heat to medium-low, add herb bundle, cover pot, and cook, checking and stirring occasionally, until leeks and celery are very soft, 25–30 minutes (this long, slow cooking draws maximum flavor out of the vegetables). Increase heat to medium-high, add potato and 5 cups broth, and bring to a boil. Reduce heat and simmer, stirring occasionally, until potato is very tender, 10–15 minutes. Let cool slightly.Working in batches, purée leek mixture in a blender until very smooth (make sure lid is slightly ajar to let steam escape; cover with a towel). Transfer to a large bowl or pitcher.Pour soup back into pot and add cream. Thin with broth, if needed. Taste and season with salt and pepper; keep warm.Heat oil in a small skillet over medium. Add almonds, sunflower seeds, and coriander seeds and sprinkle sugar over; cook, stirring, until nuts and seeds are golden, about 4 minutes. Transfer nuts to paper towels to drain; season with salt and pepper.Serve soup topped with crème fraîche and nut mixture.Do ahead: Soup and nut mixture can be made 4 days ahead. Let soup cool; cover and chill. Store nut mixture airtight at room temperature.
186	/cooked-death-vegetables	Cooked-to-Death Vegetables Recipe 	 Bon Appetit	1½ pounds cabbage, celery, zucchini, broccoli rabe, green beans, and/or kale,2–3 garlic cloves, smashed,⅓ cup olive oil,Pinch of crushed red pepper flakes (optional),Kosher salt,	DIRECTIONS PreparationCut or tear vegetables into large pieces roughly the same size. Using your hands or a pair of tongs, toss vegetables, garlic, olive oil, and red pepper flakes, if using, in a large Dutch oven to combine; season aggressively with salt and toss again. Place pot over lowest possible heat and cover. Cook until vegetables are collapsed and very tender, checking and stirring gently every half hour or so (they’ll become more delicate as they cook), 1½–2 hours. Season with salt and serve hot or at room temperature.
187	/vanilla-bean-pots-de-creme	Vanilla-Bean Pots de Crème Recipe 	 Bon Appetit	6 cups heavy cream,1½ cups whole milk,¾ teaspoon kosher salt,1 vanilla bean, split lengthwise,18 large egg yolks,¾ cup sugar,Lightly sweetened whipped cream (for serving),Twenty-four 4-ounce ramekins or small heatproof bowls,	DIRECTIONS PreparationPlace a rack in middle of oven and preheat to 300°. Combine cream, milk, and salt in a large saucepan; scrape in vanilla seeds and add pod. Bring to a simmer over medium heat, stirring occasionally.Meanwhile, whisk egg yolks and sugar in a large bowl until yolks look a shade lighter in color, about 4 minutes. Whisking constantly, gradually pour hot cream mixture into yolk mixture; whisk until smooth. Strain through a fine-mesh sieve into a large pitcher.Set ramekins in a roasting pan or large baking dish and divide custard among ramekins. Place roasting pan in oven and carefully pour in hot water to come halfway up sides of ramekins.Bake custards until set around the edges but still wobbly in the center, 25–30 minutes. Let cool 5 minutes in water bath, then transfer to a wire rack and let cool completely. Chill until cold, at least 4 hours.Serve pots de crème topped with whipped cream.Do Ahead: Pot de crème (without whipped cream) can be made 5 days ahead. Cover and keep chilled.
188	/chouquettes-chantilly-cream	Chouquettes with Chantilly Cream Recipe 	 Bon Appetit	½ cup whole milk,6 tablespoons unsalted butter, cut into 1" pieces,1 tablespoon granulated sugar,½ teaspoon kosher salt,1 cup all-purpose flour,6 large eggs, room temperature,Pearl sugar (for serving; optional),Softly whipped, lightly sweetened cream (for serving; optional),A ½"-diameter pastry tip and a pastry bag,	DIRECTIONS PreparationPreheat oven to 425˚. Line a rimmed baking sheet with parchment paper. Fit a large pastry bag with a plain ½" tip.Heat milk, butter, granulated sugar, salt, and ½ cup water in a medium saucepan over medium, stirring occasionally to melt butter. As soon as butter is melted, add flour all at once and stir with a wooden spoon, carefully at first to incorporate, then vigorously, until dough forms a single mass. Continue stirring, slapping dough against sides of saucepan with spoon, until dough leaves a thick film on bottom of pan and pulls away from sides, about 3 minutes (the important thing here is to cook the flour and dry out the dough). Transfer to a medium bowl and let rest 3 minutes.Using a wooden spoon, mix 5 eggs into dough one at a time, making sure to completely incorporate each egg before adding the next. Dough will look broken at first, then homogenized. The final texture should be smooth, glossy, and somewhat stretchy.Spoon dough into prepared pastry bag. Holding bag at an angle so the tip is just touching the prepared baking sheet on one side, gently start to squeeze out dough. Without moving the tip (this will help shape a perfect circle), pipe until you have a 1½" round (you can trace circles on the back of the parchment for extra accuracy). Repeat, staggering rounds and spacing 2" apart.Beat remaining egg in a small bowl until no streaks remain and lightly brush tops of dough. Sprinkle with pearl sugar, if using. Bake 15 minutes, then lower heat to 350˚. Continue to bake until puffs are deep golden brown all over and sound hollow when tapped on the bottom, 15−20 minutes.Remove chouquettes from oven; turn oven off. Poke a small hole in the bottom of each puff with a paring knife and place, hole side up, on baking sheet. Return to still-hot oven, propping door open with a wooden spoon. Let dry out and cool, 30–35 minutes.Serve chouquettes plain or use a serrated knife to cut tops off and spoon or pipe whipped cream into bottom half.Do Ahead: Dough can be made 1 day ahead. Transfer to pastry bag and chill.Variation: Herby Gougères: After adding eggs to dough, mix in 1 cup grated Gruyère, 1 Tbsp. finely chopped fresh chives, and 1 tsp. finely chopped fresh rosemary. Top each puff with a pinch of grated Gruyère before baking.
189	/lentil-soup-sausage-mustard-greens	Lentil Soup with Sausage and Mustard Greens Recipe 	 Bon Appetit	2 tablespoons olive oil, plus more for serving,3 medium carrots, peeled, chopped,1 medium onion, chopped,½ fennel bulb, chopped, plus fennel fronds for serving,3 garlic cloves, finely chopped,Kosher salt, freshly ground pepper,1 pound sweet Italian sausage, casings removed,2 bay leaves,1 cup lentils (such as black beluga, French, brown, or green),½ teaspoon crushed red pepper flakes (optional),8 cups chicken stock or low-sodium chicken broth,1 bunch mustard greens, torn into bite-size pieces,1 teaspoon red wine vinegar,Sour cream and crusty bread (for serving),	DIRECTIONS PreparationHeat 2 Tbsp. oil in a large heavy pot over medium-high. Add carrots, onion, fennel, and garlic and cook, stirring often, until just beginning to soften, about 4 minutes; season with salt and pepper.Add sausage and cook, breaking up with a spoon, until browned, 6–8 minutes. Add bay leaves, lentils, red pepper flakes (if using), and stock and bring to a boil over medium-high, stirring occasionally. Reduce heat to low and simmer until lentils are tender and soup is thickened, 35–40 minutes.Add mustard greens and cook, stirring occasionally, until just wilted, about 2 minutes. Stir in vinegar; season with salt and pepper.Divide soup among bowls. Top with a dollop of sour cream and fennel fronds and drizzle with oil. Serve with bread.Do Ahead: Soup can be made up to 4 days ahead.
190	/chocolate-pots-de-creme	Chocolate Pots de Crème Recipe 	 Bon Appetit	16 ounces semisweet chocolate, chopped,6 cups heavy cream,¾ cup whole milk,¾ teaspoon kosher salt,18 large egg yolks,½ cup sugar,Lightly sweetened whipped cream (for serving),Twenty-four 4-ounce ramekins or small heatproof bowls,	DIRECTIONS PreparationPlace a rack in middle of oven and preheat to 300°. Place chocolate in a large bowl. Bring cream, milk, and salt to a simmer in a large saucepan over medium heat, stirring occasionally.Meanwhile, whisk egg yolks and sugar in another large bowl until yolks look a shade lighter in color, about 4 minutes. Whisking constantly, gradually pout hot cream mixture into yolk mixture; whisk until smooth. Strain through a fine-mesh sieve into bowl with chocolate; let sit 2 minutes. Whisk until chocolate is melted and custard is smooth. Transfer custard to a large pitcher.Set ramekins in a roasting pan or large baking dish and divide custard among ramekins. Place roasting pan in oven and carefully pour in hot water to come halfway up sides of ramekins.Bake custards until set around the edges but still wobbly in the center, 25–30 minutes. Let cool 5 minutes in water bath, then transfer to a wire rack and let cool completely. Chill until cold, at least 4 hours.Serve pots de crème topped with whipped cream.Do Ahead: Pots de crème (without whipped cream) can be made 5 days ahead. Cover and keep chilled.
191	/big-batch-caramelized-onions	Big Batch of Caramelized Onions Recipe 	 Bon Appetit	2 tablespoons olive oil,4 large onions, thinly sliced,Kosher salt, freshly ground pepper,1 tablespoon fresh thyme leaves,3 garlic cloves, thinly sliced,¾ cup dry white wine,	DIRECTIONS PreparationIn a large, heavy-bottomed soup pot or Dutch oven, heat oil over medium heat. Add onions, season with salt and pepper, and cook, stirring occasionally, until onions begin to soften, 5–7 minutes. Stir in thyme and garlic, scraping up any browned bits from bottom or sides of pan.Continue to cook, stirring occasionally, until onions begin to stick to bottom of pot, about 20 minutes. Add ¼ cup wine and cook, stirring, until wine is evaporated and onions begin to stick to bottom of pot (brown spots are good; they’ll give onions great caramel color and flavor). Add ¼ cup wine, cook until evaporated, then add remaining ¼ cup wine. Continue to cook, adding ¼ cup water if onions begin to stick to pot again, until onions are very soft and deep golden brown. Season with salt and pepper.DO AHEAD: Onions can be caramelized up to 5 days ahead. Let cool; cover tightly and refrigerate.
192	/lemon-marshmallow-pie	Lemon Marshmallow Pie Recipe 	 Bon Appetit	6 tablespoons chilled unsalted butter, cut into pieces,3 tablespoons granulated sugar,½ teaspoon kosher salt,1 large egg yolk,½ teaspoon vanilla extract,1 cup all-purpose flour,1 teaspoon poppy seeds (optional),⅔ cup fresh lemon juice,½ teaspoon kosher salt,¾ cup granulated sugar, divided,1 vanilla bean, split lengthwise,3 large egg yolks,1 large egg,½ cup (1 stick) chilled unsalted butter, cut into pieces,1 envelope unflavored powdered gelatin (about 2 ½ tsp.),3 large eggs whites,¼ teaspoon kosher salt,⅔ cup sugar,¼ cup light corn syrup,2 teaspoons vanilla extract,A candy thermometer,	DIRECTIONS PreparationCrustPreheat oven to 350°. Using an electric mixer on low speed, beat butter, sugar, and salt in a medium bowl until butter is almost completely smooth, about 2 minutes. Increase speed to medium and beat until butter is creamy, about 2 minutes more. Mix in egg yolk and vanilla. Reduce speed to low, add flour and poppy seeds, if using, and mix until no dry spots remain.Firmly press dough into a 9" pie dish (the firmer you press, the easier it will be to cut the baked crust). Bake until crust is golden brown on bottom and a shade or two darker at the edges, 25−35 minutes.FillingJust before crust is finished baking, combine lemon juice, salt, and ¼ cup sugar in a small saucepan. Scrape in seeds from vanilla bean and add pod. Bring to a simmer over medium heat, stirring to dissolve sugar.Whisk egg yolks, egg, and remaining ½ cup sugar in a medium bowl until no longer grainy and slightly lightened in color, about 2 minutes.Whisking constantly, gradually stream hot lemon mixture into eggs, then transfer mixture back to saucepan. Cook over medium heat, whisking constantly, until thickened and marks from whisk are just visible, 5–7 minutes. Remove from heat and whisk in butter until smooth, adding a couple of pieces at a time and whisking until incorporated before adding more.Reduce oven temperature to 300˚. Strain warm curd through a fine-mesh sieve into warm crust, filling right to top of crust (do not overfill; you may have a tablespoon or so extra).Bake pie until curd is set around the edges (filling should still wobble when dish is jiggled; it will continue to set as it cools), 15−20 minutes. Do not overbake or filling may curdle.Transfer pie to a wire rack and let cool, about 2 hours, then chill until cold, at least 1 hour.Do ahead: Pie can be baked 1 day ahead. Cover and keep chilled.Marshmallow and AssemblyMake sure curd is chilled and set before preparing marshmallow topping. Place ¼ cup cold water in a small bowl and sprinkle gelatin over top. Let sit 10 minutes to soften.Beat egg whites and salt to soft peaks in the bowl of stand mixer fitted with whisk attachment.Meanwhile, bring sugar, corn syrup, and ¼ cup water to a boil in a small saucepan over medium heat, swirling pan until sugar is dissolved. Attach thermometer to side of saucepan and continue to cook over medium heat until thermometer registers 250°.Remove syrup from heat and add gelatin mixture, stirring to dissolve. With mixer on medium-high, carefully pour syrup into beaten egg whites in a slow, steady stream, aiming for the space between the side of the bowl and the whisk (avoid hitting whisk directly to prevent hot sugar from splattering all over). Continue to beat until mixture is dense and fluffy and very stiff peaks have formed (side of bowl will be cool to the touch), 5–10 minutes. Beat in vanilla.Marshmallow topping will become difficult to work with if given time to set up, so immediately (and quickly) dollop spoonfuls of marshmallow over curd, swirling and making decorative swoops as you go (make sure to extend topping all the way to edge of crust). Let sit until marshmallow is set and firm, at least 2 hours and up to 6 hours.Just before serving, heat broiler. Broil pie until marshmallow is toasted and golden brown in spots (keep a close eye on it to keep it from burning), about 2 minutes.
193	/asian-style-pork-nachos-red-cabbage-scallions	Asian-Style Pork Nachos with Red Cabbage and Scallions Recipe 	 Bon Appetit	Vegetable oil for frying (about 10 cups),6 ounces wonton wrappers, cut into triangles,2 tablespoons vegetable oil,6 cloves garlic, thinly sliced,1 serrano chile, thinly sliced,1 pound ground pork,Kosher salt, freshly ground pepper,4 tablespoons fresh lime juice,2 tablespoons soy sauce,1 tablespoon fish sauce (such as nam pla or nuoc nam),1 teaspoon sugar,1 cup shredded cheddar cheese,1 cup shredded Monterey Jack cheese,⅛ head red cabbage, cored, very thinly sliced,1 bunch scallions, thinly sliced,1 cup cilantro leaves with tender stems,1 tablespoon rice vinegar,1 teaspoon toasted sesame oil,Kosher salt, freshly ground pepper,½ cup sliced pickled jalapeños,Deep-fry thermometer,	DIRECTIONS PreparationWonton ChipsPour oil into a large heavy pot to a depth of 2” and fit with a deep-fry thermometer. Heat over medium-high heat until thermometer registers 350°. Working in batches, add wontons to oil and fry, stirring gently, until chips are puffed and golden, 1–2 minutes. Transfer to a paper towel–lined rimmed baking sheet and let cool.PorkHeat oil in a large skillet over high heat. Add garlic and chile and cook, stirring, until fragrant, about 30 seconds. Add pork, season with salt and pepper, and cook, breaking up into smaller pieces with a spoon and pressing down firmly to help brown, until cooked through and nicely crisped in spots, 8–10 minutes. Add lime juice, soy sauce, fish sauce, and sugar and cook, stirring, until liquid is reduced and glazes pork, about 3 minutes. Transfer to a medium bowl.AssemblyPreheat oven to 425°. Arrange half of chips on a 9½-by-13” foil-lined rimmed baking sheet. Top with half of pork, then half of each cheese. Repeat layering with remaining chips, pork, and cheese. Bake until cheese is melted and bubbling, about 5 minutes.While nachos cook, toss cabbage, scallions, and cilantro with vinegar and sesame oil; season with salt and pepper. Serve nachos topped with cabbage mixture and pickled jalapeños.
194	/mario-batalis-pizza-aglio-olio-e-peperoncino	Mario Batali’s Pizza Aglio, Olio, e Peperoncino Recipe 	 Bon Appetit	2 garlic cloves, thinly sliced,¼–½ Fresno chile, thinly sliced,¼ cup extra-virgin olive oil, plus more for drizzling,1 10” parbaked pizza crust,¼ cup strained tomatoes, preferably Pomi,Flaky sea salt, crushed red pepper flakes, and torn fresh parsley leaves (for serving),	DIRECTIONS PreparationHeat broiler with rack in top position; place sheet of foil on rack below to catch any drips. Combine garlic, chile, and 1/4 cup oil in a small saucepan over low heat and cook until softened, about 4 minutes.Place crust on a baking sheet or pizza peel. Spread tomatoes over crust, leaving a 1/2” border. Scatter some garlic and chile over top, then drizzle with some of the infused oil. Slide pizza onto rack and broil, checking often, until crust is charred and blistered in spots, 6–8 minutes. Using a pair of tongs, remove pizza from oven; sprinkle with salt and red pepper flakes, drizzle with olive oil, and top with parsley.
195	/deep-fried-beets-horseradish-dip	Deep-Fried Beets with Horseradish Dip Recipe 	 Bon Appetit	24 baby beets,2 tablespoons plus ¼ cup olive oil,Kosher salt, freshly ground pepper,½ cup sour cream,4 teaspoons prepared horseradish,1 shallot, finely chopped,1 tablespoon red wine vinegar,2 teaspoons Dijon mustard,1 cup all-purpose flour,3 large eggs,2 cups fine dried breadcrumbs,Vegetable oil (for frying; about 6 cups),A deep-fry thermometer,	DIRECTIONS PreparationPreheat oven to 400°. Place beets in a shallow baking dish. Drizzle with 2 Tbsp. olive oil; season with salt and pepper. Add 1/2 cup water to dish, cover with foil, and roast until beets are tender (a paring knife inserted into center should meet no resistance), 40–50 minutes. Let beets cool slightly, then peel skins.Meanwhile, stir sour cream and horseradish in a small bowl; season with salt and pepper; chill.Whisk shallot, vinegar, mustard, and remaining 1/4 cup olive oil in a medium bowl; season marinade with salt and pepper. Add beets and toss to coat.Place flour in a shallow dish; season with salt and pepper. Lightly beat eggs in a second shallow dish to blend. Place breadcrumbs in a third shallow dish; season with salt and pepper.Fit a large heavy pot with thermometer and pour in enough oil to measure 2". Heat over medium-high until thermometer registers 350°. Working with a few at a time, remove beets from marinade, letting excess drip back into bowl. Dredge in flour, shaking off excess. Dip in eggs, letting excess drip back into bowl, then roll in breadcrumbs to coat. Fry beets, turning occasionally, until breading is golden brown all over, about 2 minutes. Transfer to paper towels to drain; season with salt.Serve fried beets with reserved horseradish dip alongside.Do ahead: Beets can be marinated 2 days ahead. Cover and chill.
196	/popcorn-dried-shrimp-salt	Popcorn with Dried-Shrimp Salt Recipe 	 Bon Appetit	2 tablespoons dried shrimp,1 teaspoon kosher salt,8 cups just-popped popcorn (from ½ cup kernels),¼ cup olive oil,A spice mill or a mortar and pestle,	DIRECTIONS PreparationFinely grind dried shrimp and salt in spice mill or with mortar and pestle.Arrange popcorn on a rimmed baking sheet and drizzle with oil; toss to coat.Sprinkle with some of the dried-shrimp salt and toss to coat, adding more to taste.
198	/scrambled-eggs-caramelized-onions-chevre	Scrambled Eggs with Caramelized Onions and Chèvre Recipe 	 Bon Appetit	4 large eggs,Kosher salt and freshly ground pepper,2 tablespoons chèvre, crumbled,2 tablespoons Big Batch of Caramelized Onions,2 teaspoons olive oil,Small pinch of smoked paprika,Whole parsley leaves (for serving),	DIRECTIONS PreparationWhisk eggs in a medium bowl until frothy; season with salt and pepper. Stir in chèvre, reserving several crumbles for serving. Heat onions in a small nonstick skillet over medium-low heat until warm and pliable, about 2 minutes.Heat oil in a separate nonstick skillet over medium-low heat. Add eggs and cook, stirring occasionally, until large curds form, about 2 minutes. Serve eggs dusted with paprika and topped with onions, remaining chèvre, and parsley leaves.
199	/red-quinoa-parsley-toasted-pine-nuts	Red Quinoa with Parsley and Toasted Pine Nuts Recipe 	 Bon Appetit	2 tablespoons olive oil, plus more for drizzling,1 yellow onion, finely chopped,Kosher salt,¾ teaspoon ground turmeric,Pinch of red pepper flakes, preferably Marash or Aleppo,1¼ cups red quinoa, rinsed,½ cup chopped fresh parsley,¼ cup toasted pine nuts,	DIRECTIONS PreparationHeat oil in a medium saucepan over medium-high heat. Add onion and season with salt. Cook, stirring often, until onion is tender and fragrant but not browned, about 4 minutes. Reduce heat to medium and stir in turmeric and red pepper flakes. Cook until fragrant, about 30 seconds.Add 1½ cups water and bring to a boil. Stir in quinoa and lower heat to a simmer. Cover and cook until quinoa is tender and water is absorbed, 12–15 minutes. Remove from heat. Let stand, covered, 10 minutes. Stir in parsley and pine nuts, and drizzle with oil.
200	/indian-style-nachos-warm-spices-tamarind-chutney	Indian-Style Nachos with Warm Spices and Tamarind Chutney Recipe 	 Bon Appetit	1 15-oz. can chickpeas, rinsed,1 russet potato, peeled, cut into ½” pieces,3 tablespoons olive oil,1 teaspoon garam masala,¼ teaspoon cayenne pepper,Kosher salt, freshly ground pepper,½ cup tamarind concentrate,3 tablespoons dark brown sugar,¼ teaspoon ground coriander,¼ teaspoon ground cumin,¼ teaspoon ground ginger,1    ,Tamarind concentrate, a dark, seedless paste with a tart-sweet flavor, is available at Indian, Middle Eastern, and some Asian markets.,½ cup plain Greek yogurt,1 tablespoon fresh lime juice,½ teaspoon granulated sugar,Kosher salt, freshly ground pepper,6 ounces restaurant-style tortilla chips,1 cup shredded cheddar cheese,1 cup shredded Monterey Jack cheese,1 cup fresh mint leaves,Indian hot pepper or cayenne (optional; for serving),	DIRECTIONS PreparationSpicy Chickpeas and PotatoesPreheat oven to 425°. Toss chickpeas, potato, olive oil, garam masala, and cayenne on a rimmed baking sheet; season with salt and pepper. Roast, tossing once, until potato is tender and chickpeas are golden and crunchy, 20–25 minutes. (Keep oven on; you’ll use it for baking nachos.)Tamarind ChutneyCombine tamarind concentrate, brown sugar, coriander, cumin, ginger, and ¼ cup water in a small saucepan over medium heat. Cook, stirring, until sugar is dissolved and mixture is slightly thickened, about 4 minutes. Transfer to a small bowl and set aside.Chips and AssemblyWhisk together yogurt, lime juice, granulated sugar, and a couple tablespoons water—just enough to thin the yogurt to a good consistency for drizzling. Season with salt and pepper.Arrange half of chips on a 9½-by-13” foil-lined rimmed baking sheet. Top with half of chickpea mixture, then half of each cheese. Repeat layering with remaining chips, chickpeas, and cheese. Bake until cheese is melted and bubbling, about 5 minutes.Serve nachos drizzled with tamarind chutney and yogurt sauce and topped with mint leaves and hot pepper, if using.
201	/hamentaschen	Hamantaschen Recipe 	 Bon Appetit	1½ teaspoons baking powder,¾ teaspoon kosher salt,4 cups all-purpose flour, plus more for surface,1 cup (2 sticks) unsalted butter, room temperature,1 cup sugar,3 large eggs,Date-Orange Filling, Honey-Nut Filling, Poppy Seed Filling, or 1½ cups jam or preserves,3½"-diameter cookie cutter,	DIRECTIONS PreparationWhisk baking powder, salt, and 4 cups flour in a medium bowl. Using an electric mixer on medium-high speed, beat butter and sugar in a large bowl until pale and fluffy, about 5 minutes. Add 2 eggs one at a time, beating to combine after each addition and scraping down sides of bowl.Reduce speed to low and gradually add dry ingredients; mix until dough comes together. Divide dough in half and form into two ¾"-thick disks. Cover and chill at least 2 hours.Place racks in lower and upper thirds of oven; preheat to 350°. Let 1 disk of dough sit at room temperature until softened slightly, about 30 minutes.Roll out dough on a very lightly floured surface to about ¼" thick, dusting with flour as needed (use as little flour as possible). Cut out 3 1/2" rounds with cutter and, using an offset spatula or bench scraper, transfer to 2 parchment-lined baking sheets. Gather up scraps, reroll, and cut out additional rounds.Lightly beat remaining egg in a small bowl to blend. Working a few at a time, brush edge of rounds with egg, then place 1 1/2 tsp. filling in center. Fold sides up to make a triangle, pinching points gently to seal and leaving about 1" surface of filling exposed.Brush sides of folded dough with egg. Bake cookies, rotating baking sheets halfway through, until bottoms are golden brown, 18–22 minutes. Let cool on baking sheets.Do ahead: Dough can be made 2 days ahead; keep chilled. Cookies can be made 2 days ahead; let cool and store airtight at room temperature.
202	/pan-bagnat	Pan Bagnat Recipe 	 Bon Appetit	1 1-pound loaf unsliced French bread, about 14 inches long,1/4 cup extra-virgin olive oil,1/3 cup basil leaves, plus sprigs for garnish,1     ,2 6-ounce cans tuna packed in olive oil, undrained,2 plum tomatoes, diced,2/3 cup coarsely chopped pitted assorted brine-cured olives,1/2 cup chopped sweet onion (such as Vidalia or Maui),2 tablespoons fresh lemon juice,	DIRECTIONS PreparationSlice bread in half lengthwise. Using hands, remove interior of loaf, leaving 3/4-inch shell. Brush interior of both halves with olive oil and line with basil leaves in single layer.Combine undrained tuna, tomatoes, olives, onion, and lemon juice in medium bowl to blend. Season to taste with salt and pepper.Spoon salad evenly into bottom bread shell. Cover with top half and wrap tightly with plastic. Place in shallow baking pan; top with another baking pan and weight with heavy cans. Let stand 20 minutes.Unwrap pan bagnat and cut into 1 1/2-inch slices. Place on platter, garnish with basil sprigs, and serve.
203	/popcorn-nutritional-yeast-aleppo-pepper	Popcorn with Nutritional Yeast and Aleppo Pepper Recipe 	 Bon Appetit	2 tablespoons nutritional yeast,1 teaspoon Aleppo pepper or crushed red pepper flakes,1 teaspoon kosher salt,8 cups just-popped popcorn (from ½ cup kernels),¼ cup olive oil,A spice mill or a mortar and pestle,	DIRECTIONS PreparationFinely grind nutritional yeast, Aleppo pepper, and salt in spice mill or with mortar and pestle.Arrange popcorn on a rimmed baking sheet and drizzle with oil; toss to coat.Sprinkle with some of the nutritional yeast mixture and toss well to coat, adding more nutritional yeast mixture to taste.
204	/big-batch-of-barley	Big Batch of Barley Recipe 	 Bon Appetit	2 cups hulled, hull-less, or pearled barley,Pinch of salt,	DIRECTIONS PreparationBring a pot of lightly salted water to a rolling boil. Stir in 2 cups hulled, hull-less, or pearled barley, reduce heat to a simmer, and cook uncovered until tender, 40–50 minutes. Drain; serve right away or store in an airtight container in the refrigerator or freezer for up to 5 days.
205	/big-batch-steel-cut-oats	Big Batch of Steel-Cut Oats Recipe 	 Bon Appetit	Steel-cut oats,Pinch of salt,	DIRECTIONS PreparationBring 4 cups water to a boil for every cup of oats being cooked. Add a pinch of salt and stir in the oats. Reduce heat to a low simmer and cook, stirring occasionally, to desired texture (20 minutes will give you a pretty creamy result). For later use, let cool to room temperature and store in an airtight container in the refrigerator for up to 5 days. Warm the oats in a small saucepan with ¼ cup water or almond milk.
206	/popcorn-toffee-crack-bars	Popcorn Toffee Crack Bars Recipe 	 Bon Appetit	Nonstick vegetable oil spray,15 graham crackers,4 cups popped popcorn (from ¼ cup kernels),1 cup coarsely chopped salted, roasted peanuts,¾ cup puffed rice cereal,1½ cups (3 sticks) unsalted butter,¾ cup sugar,½ teaspoon Aleppo pepper (optional),1 cup chopped semisweet chocolate or chocolate chips (about 6 oz.),Flaky sea salt (for serving),	DIRECTIONS PreparationPreheat oven to 350°. Line a large rimmed baking sheet with foil and lightly coat with nonstick spray. Arrange graham crackers in a single layer on baking sheet, breaking to fit as needed to cover entire surface. Top with popcorn, peanuts, and puffed rice.Bring butter, sugar, and Aleppo pepper, if using, to a boil in a medium saucepan over medium-high. Once boiling, stir once, then reduce heat and simmer, swirling occasionally, until mixture is golden brown and syrupy, 8–10 minutes.Pour toffee mixture evenly over graham crackers and popcorn mixture. Bake until toffee is slightly darkened in color (the shade of a brown paper bag) and bubbling, 10–12 minutes. Remove from oven and evenly top with chocolate and sprinkle with salt. Let cool in baking sheet before breaking into pieces.Do ahead: Bars can be made 3 days ahead. Store airtight at room temperature.
207	/the-cough-suppressant	The Cough Suppressant Recipe 	 Bon Appetit	1 bunch oregano,1 bunch thyme,1 1” piece ginger, peeled, grated,1 1” piece turmeric, peeled, grated,½ teaspoon black peppercorns,1 small garlic clove, grated,¼ cup honey, preferably raw,¼ cup unsweetened almond milk,3 tablespoons fresh lime or lemon juice,	DIRECTIONS PreparationLightly whack oregano and thyme with a wooden spoon to bruise and release oils. Heat herbs, ginger, turmeric, peppercorns, and 8 cups water in a medium saucepan until an instant-read thermometer registers around 130°—it should be uncomfortably hot to the touch (do not let it boil). Reduce temperature to low and let mixture steep 6 minutes. Add garlic, honey, almond milk, and citrus juice, stirring to dissolve honey. Strain into a pitcher or large heatproof container, pushing on the herbs to squeeze out as much liquid as possible. Divide among mugs.
208	/pumpkin-streusel-muffins	Pumpkin Streusel Muffins Recipe 	 Bon Appetit	¼ cup (½ stick) chilled unsalted butter, cut into pieces,¼ cup (packed) light brown sugar,2 tablespoons all-purpose flour,2 tablespoons whole wheat flour,½ teaspoon kosher salt,¾ cup walnuts, chopped, divided,Nonstick vegetable oil spray (optional),1¼ cups all-purpose flour,½ cup whole wheat flour,2 teaspoons baking powder,1 teaspoon ground cinnamon,1 teaspoon ground ginger,1 teaspoon kosher salt,¼ teaspoon ground allspice,¼ teaspoon ground nutmeg,⅛ teaspoon ground cloves,2 large eggs, room temperature,1 cup (packed) light brown sugar,1 cup canned pure pumpkin,½ cup virgin coconut oil, warmed, slightly cooled,	DIRECTIONS PreparationToppingPulse butter, brown sugar, all purpose flour, whole wheat flour, salt, and ¼ cup walnuts in a food processor until a clumpy mixture forms. Add remaining ½ cup walnuts and pulse just to combine. Transfer to a medium bowl; cover and chill until ready to use.MuffinsPreheat oven to 350°. Coat cups of a standard 12-cup muffin pan with nonstick spray or use paper liners. Whisk all-purpose flour, whole wheat flour, baking powder, cinnamon, ginger, salt, allspice, nutmeg, and cloves in a large bowl.Whisk eggs, pumpkin, brown sugar, and oil in another large bowl until smooth. Mix in dry ingredients. Divide batter among cups of prepared pan and top with streusel. Bake muffins until golden brown and a toothpick inserted into the center of a muffin comes out clean, 25–30 minutes. Serve warm.DO AHEAD: Muffins can be baked 2 days ahead. Keep tightly wrapped at room temperature.
209	/beet-soup-with-caraway	Beet Soup with Caraway Recipe 	 Bon Appetit	1 tablespoon olive oil,1 tablespoon caraway seeds,1 medium onion, coarsely chopped,1 leek, white and pale-green parts only, thinly sliced,Kosher salt and freshly ground black pepper,½ Big Batch of Oven-Steamed Beets chopped,1 cup buttermilk divided plus more for serving,Fresh dill sprigs, cracked pepper (for serving),	DIRECTIONS Preparation Heat oil in a large saucepan over medium heat. Add caraway seeds and cook, stirring, until they start to pop and dance around in the pan, about 1 minute. Quickly add onion, leek, and a splash of water to keep seeds from burning; season with salt and pepper. Cook, stirring occasionally, until onion is soft, 5–7 minutes.Add beets and 2½ cups water to pan; season with salt and pepper. Bring to a boil, reduce heat, and cook, stirring occasionally, until flavors come together, 15–20 minutes.Let mixture cool slightly, then purée in a blender in 2 batches, adding ½ cup buttermilk to each batch. Gently heat soup, adding water to adjust consistency if needed. Serve drizzled with buttermilk and topped with dill sprigs and cracked pepper.
210	/holiday-rum-sparkler	Holiday Rum Sparkler Recipe 	 Bon Appetit	¼ cup honey,2 ounces dark rum,1 ounce apple juice,2 ounces Champagne or sparkling wine,Apple slice and mint sprig (for serving),	DIRECTIONS PreparationHoney SyrupCombine honey and ½ cup warm water in a small bowl; stir until honey is dissolved.CocktailCombine rum, apple juice, and ¼ oz. honey syrup in a cocktail shaker; fill with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a rocks glass filled with ice. Top with Champagne and garnish with apple and mint.
211	/sage-and-anise-stuffing-shortbread	Stuffing Cookies Recipe 	 Bon Appetit	1 cup panko (Japanese breadcrumbs),¾ cup (1½ sticks) unsalted butter, room temperature,¼ cup (packed) light brown sugar,1 tablespoon chopped fresh sage, plus small leaves for garnish,1 teaspoon aniseed,1 teaspoon kosher salt,1 cup all-purpose flour, plus more for surface,1 large egg, beaten to blend,Raw sugar (for sprinkling),A 2¼" cookie cutter,	DIRECTIONS PreparationPreheat oven to 350°. Toast panko on a rimmed baking sheet until golden, 8–10 minutes. Let cool.Using an electric mixer on medium-high speed, beat butter, brown sugar, chopped sage, aniseed, and salt in a large bowl until light and fluffy, about 4 minutes. Reduce speed to low, mix in panko and 1 cup flour. Form dough into a disk, wrap in plastic, and chill until firm, about 2 hours.Roll out dough on a lightly floured surface to about ⅛" thick. Cut out circles with cutter (or any shape you want) and place on a parchment-lined baking sheet, spacing 1" apart (for cookies with sharp edges, chill 15 minutes before baking).Brush rounds with egg and sprinkle with raw sugar and sage leaves. Bake until cookies are golden brown, 15–18 minutes. Let cool.DO AHEAD: Dough can be made 4 days ahead. Keep chilled, or freeze up to 1 month.
212	/rosh-hashanah-cocktail	Happy New Year, Honey Recipe 	 Bon Appetit	2 cinnamon sticks,3 cardamom pods, lightly crushed,3 whole allspice,¼ cup honey,6 ounces fresh blood orange juice,4 ounces applejack brandy,4 ounces bourbon,8-12 ounces hard cider,Apple slices (for serving),	DIRECTIONS PreparationSpiced Honey SyrupBring cinnamon, cardamom, allspice, honey, and 1/2 cup water to a boil in a small saucepan. Reduce heat and simmer 5 minutes. Let cool, then strain into an airtight container; discard solids.AssemblyFor each cocktail, combine 1 1/2 oz. blood orange juice, 1 oz. brandy, 1 oz. bourbon, and 1 Tbsp. spiced honey syrup in a cocktail shaker. Fill shaker with ice and shake until outside of shaker is frosty, about 30 seconds. Strain into a rocks glass filled with ice and top off with hard cider. Garnish with an apple slice.
213	/seared-swordfish-fennel-endive	Seared Swordfish with Fennel and Endive Recipe 	 Bon Appetit	1½ pounds skinless swordfish steak, trimmed of any bloodlines, divided into 5 portions,Kosher salt and freshly ground pepper,2 tablespoons olive oil, divided,1 head fennel, core intact, cut into ½” wedges, plus fennel fronds for serving,2 Belgian endives, cores intact, quartered lengthwise,½ cup homemade chicken stock or low-sodium chicken broth,1 tablespoon white wine,Fresh parsley leaves (for serving),	DIRECTIONS PreparationPreheat oven to 425°. Season fish with salt and pepper. Heat 1 Tbsp. oil in a large ovenproof skillet over medium-high heat. Add fennel and cook until golden brown and crisp-tender, about 4 minute per side. Add endive quarters and let brown on both cut sides, about 2 minutes per side. Transfer vegetables to a plate and wipe out skillet.Heat remaining 1 Tbsp. oil in skillet. Add fish and cook until browned on both sides, about 3 minutes per side. Turn off heat; add chicken stock, fennel, and endive wedges. Transfer skillet to oven and cook until fish is just cooked through, about 5 minutes. Reserve 1 portion of fish for tomorrow’s lunch.Remove vegetables and remaining fish from skillet and whisk wine into liquid. If juices are runny, cook over medium-high heat until sauce is thick and slightly reduced, about 3 minutes.To serve, pour sauce over fish and vegetables; top with parsley leaves and fennel fronds.
214	/gluten-free-lemon-bars	Gluten-Free Lemon Bars Recipe 	 Bon Appetit	¼ cup unsweetened shredded coconut,¾ cup King Arthur Flour gluten free multi-purpose flour,2 tablespoons granulated sugar,⅛ teaspoon kosher salt,1 large egg yolk,¼ cup (½ stick) chilled unsalted butter, cut into pieces,½ vanilla bean, split lengthwise,4 large eggs,1½ cups granulated sugar,2 tablespoons finely grated lemon zest,½ cup fresh lemon juice,2 tablespoons King Arthur Flour gluten free multi-purpose flour,1 teaspoon baking powder,Powdered sugar (for serving),	DIRECTIONS PreparationShortbread CrustPreheat oven to 350°. Toast coconut on a rimmed baking sheet, tossing once, until golden brown, 5–7 minutes.Line an 8x8" baking pan with parchment paper, leaving a generous overhang on all sides. Pulse flour, sugar and salt in a food processor just to combine.Add coconut, egg yolk, and butter and scrape in vanilla seeds (save pod for another use). Process until a dough forms. Gather into a ball and press into bottom of prepared pan. Bake crust until golden brown, 25–30 minutes.FillingWhile crust is baking, process eggs, sugar, lemon zest, lemon juice, flour, and baking powder in a food processor until smooth. Pour filling into warm crust and bake until filling is beginning to brown at the edges and is just set in the center, 25–30 minutes. Transfer pan to a wire rack and let cool. Chill lemon bar until cold, at least 2 hours.Just before serving, dust lemon bar with powdered sugar and cut into 2” squares.DO AHEAD: Lemon bars (without powdered sugar) can be made 3 days ahead. Cover and chill.
215	/gochujang-and-sesame-roasted-winter-squash	Gochujang-and-Sesame-Roasted Winter Squash Recipe 	 Bon Appetit	2 tablespoons sesame seeds,2 tablespoons vegetable oil,1 tablespoon gochujang (Korean hot pepper paste),2 teaspoons soy sauce,1 medium butternut squash, peeled, seeded, sliced ¼” thick,Scallions, thinly sliced,Flaky sea salt (such as Maldon),	DIRECTIONS PreparationACTIVE: 40TOTAL: 40Place racks in upper and lower thirds of oven; preheat to 425°. Whisk sesame seeds, oil, gochujang, and soy sauce in a large bowl. Add squash and toss to coat. Divide squash between 2 rimmed baking sheets, arranging in a single layer. Roast, rotating sheets once, until tender and browned on some edges, 25–30 minutes. Serve topped with scallions and salt.
216	/smoked-salt-furikake	Smoked Salt Furikake Recipe 	 Bon Appetit	2 tablespoons sesame seeds,2 tablespoons bonito flakes (available at most Asian groceries or health food stores),1 sheet toasted nori, torn into small pieces,1 tablespoon smoked sea salt, divided,	DIRECTIONS PreparationToast the sesame seeds in a dry skillet over medium heat. Stir frequently and remove when pale golden, about 1 and ½ minutes. Let cool.In a small food processor, spice grinder or a mortar and pestle, grind the nori, bonito, plus half the salt into a fine powder. Stir together with the cooled toasted seeds and remaining salt.Store in an airtight container.
217	/toasted-pumpkin-seeds	Toasted Pumpkin Seeds Recipe 	 Bon Appetit	Seeds from one pumpkin,1 tablespoon olive oil,Salt and pepper,	DIRECTIONS PreparationScrape seeds and any attached fibers from pumpkin using a large metal spoon. Place seeds in a colander and rinse well to help separate seeds from fibers. Set seeds aside. Cook seeds in a medium saucepan of boiling salted water until beginning to look translucent, 5-7 minutes. Drain and transfer to a paper towel-lined baking sheet; pat well to dry.Preheat oven to 425°. Spread seeds on a rimmed baking sheet, toss with olive oil, and season with salt and pepper. Roast until golden and crisp, 12—15 minutes. Let cool completely.Spice It UpAfter seasoning seeds with olive oil, salt, and pepper, toss with one of the following combinations:1/2 tsp. each turmeric and chile powder1 tsp. Za’atar and 1/2 tsp. finely grated lemon zest1/2 tsp. Aleppo pepper, 1/2 tsp. ground cumin1/2 tsp. ground Szechuan peppercorns1 Tbsp. sugar and 1/4 tsp. cinnamon
218	/pecan-miso-butter-and-jelly-sandwiches	Pecan-Miso Butter and Jelly Sandwiches Recipe 	 Bon Appetit	2 cups pecans,2 teaspoons red or white miso,1 pound seedless black grapes, stems removed,1 2-inch cinnamon stick,Small pinch of kosher salt,8 slices whole wheat bread,	DIRECTIONS PreparationPreheat oven to 300°. Toast pecans on a large rimmed baking sheet, tossing once halfway through, until fragrant and slightly darker, 18–25 minutes. Let cool. Transfer to a food processor and pulse, scraping down as needed, until the texture of peanut butter. Add miso and pulse just to combine.Meanwhile, bring grapes, cinnamon, salt, and 1 cup water to a boil in a medium saucepan. Reduce heat to medium-low and simmer, stirring occasionally, until grapes have burst and liquid is jammy, 25–35 minutes. Let cool, discard cinnamon stick, then mash with a potato masher.Assemble sandwiches with bread, miso-pecan butter, and grape jam.Do Ahead: Pecan butter and grape jam can be made 1 week ahead. Cover and chill.
219	/mole-verde	Mole Verde Recipe 	 Bon Appetit	1 medium chayote, peeled, sliced ¼" thick,4 ounces fresh green beans, trimmed,2 jalapeños,4 tomatillos, husks removed, rinsed,2 garlic cloves, unpeeled,2 tablespoons masa harina,3 cups low-sodium chicken broth, divided,½ cup fresh cilantro leaves,½ cup fresh parsley leaves,2 whole allspice berries,2 whole cloves,Pinch of ground cumin,Kosher salt,Chayote, a squash-like fruit native to Mexico and Central America, can be found at Latin markets and some supermarkets. Masa harina, also known as masa flour, can be found at Latin markets and many supermarkets.,	DIRECTIONS PreparationPlace chayote and green beans in a medium pot and add water to cover by 1". Bring to a boil and cook until tender, about 4 minutes. Drain and transfer to a medium bowl.Cook jalapeños, tomatillos, and garlic in a large skillet, preferably cast iron, over medium heat, turning occasionally, until almost completely blackened, 10–15 minutes. Transfer to separate bowls. Cover jalapeños with plastic and let sit 5 minutes. Remove skins and stems, then cut a slit lengthwise along 1 side and remove seeds and veins. (If you like it spicy, leave a few seeds and veins.) Peel garlic.Meanwhile, purée masa and 2 cups broth in a blender until smooth. Strain through a fine-mesh sieve into a Dutch oven or other large pot set over medium heat. Cook, stirring constantly, until sauce is very thick and you can see the bottom of pot when you stir, about 5 minutes.Meanwhile, purée jalapeños, tomatillos, garlic, cilantro, parsley, allspice, cloves, cumin, and 1 cup broth in clean blender until smooth. Stir into sauce. Reduce heat to low and cook mole until thickened, about 5 minutes. Add more broth, if sauce gets too thick. For optimal color and flavor, be careful not to overcook. Add chayote and green beans and cook until warmed through. Season with salt and serve with meat or fish of choice.
220	/big-batch-of-oven-steamed-beets	Big Batch of Oven-Steamed Beets Recipe 	 Bon Appetit	4 pounds red beets, scrubbed, halved if large,2 tablespoons olive oil,Kosher salt and freshly ground black pepper,Handful of thyme, 1 sprig rosemary, and/or 2 bay leaves,	DIRECTIONS PreparationACTIVE: 15TOTAL: 1Preheat oven to 425°. Toss beets with oil in a 13x9” baking dish; season with salt and pepper. Add whatever herb you're using and ¼ cup water. Cover pan tightly with foil (you want steam to build up in there) and roast beets until a paring knife slips easily through flesh, 60–75 minutes. Remove from oven and let cool in covered pan, which will help loosen the skins. Rub off skins with paper towels.__DO AHEAD:__Beets can be steamed 3 days ahead. Let cool; cover and chill.
221	/gluten-free-vanilla-birthday-cake	Gluten-Free Vanilla Birthday Cake Recipe 	 Bon Appetit	1½ cups (3 sticks) unsalted butter, room temperature, plus more for pans,2 cups King Arthur Flour gluten free multi-purpose flour, plus more for pans,½ cup coconut flour,1 teaspoon xanthan gum,1 teaspoon baking powder,½ teaspoon baking soda,½ teaspoon kosher salt,1½ cups sugar,5 large eggs, room temperature,1 vanilla bean, split lengthwise,2 teaspoon vanilla extract,1 cup buttermilk,1 cup (2 sticks) unsalted butter, room temperature,4½ cups powdered sugar, sifted,2 teaspoons vanilla extract,¼ teaspoon kosher salt,2 tablespoons whole milk,Coconut flour and xanthan gum are available at natural food stores and some supermarkets, or online.,	DIRECTIONS PreparationCakePreheat oven to 325°. Lightly butter two 8"-diameter cake pans and line with parchment rounds; butter and flour parchment. Whisk coconut flour, xanthan gum, baking powder, baking soda, salt, and 2 cups multi-purpose flour in a medium bowl.Using an electric mixer on medium-high speed, beat sugar and 1 1/2 cups butter in a large bowl until light and fluffy, about 5 minutes. Reduce speed to low and add eggs, one at a time, beating to blend between additions. Scrape in vanilla seeds (save pod for another use), add vanilla extract, and mix just to combine. Add dry ingredients in 3 additions, alternating with buttermilk in 2 additions, beginning and ending with dry ingredients. Mix just to combine (batter will be thick), then increase speed to medium-high and beat until smooth, about 1 minute.Divide batter between prepared pans, smooth tops, and bake until golden and a tester inserted into the center comes out clean, 35–40 minutes.Transfer pans to a wire rack and let cakes cool in pans 10 minutes. Turn out cakes onto rack and let cool completely.FrostingUsing an electric mixer on medium-high speed, beat butter in a medium bowl until creamy, about 4 minutes. Reduce speed to low and add sugar, beating until smooth. Mix in vanilla and salt, then add milk 1 Tbsp. at a time, mixing constantly until frosting is thick but spreadable.Using a serrated knife, trim rounded tops from both cakes to make them flat. Place 1 cake layer, trimmed side up, on a platter. Spread frosting over top to coat. Top with second cake layer. Spread remaining frosting evenly over top and sides of cake.DO AHEAD: Cake can be assembled 1 day ahead. Store loosely covered at room temperature.
222	/thanksgiving-butterball-with-chai-spice	Thanksgiving Butterball with Chai Spice Recipe 	 Bon Appetit	½ cup (1 stick) unsalted butter, at room temperature,½ teaspoon ground cinnamon,½ teaspoon ground ginger,¼ teaspoon ground cardamom,¼ teaspoon kosher salt,	DIRECTIONS PreparationStir mix-ins into butter in a small bowl. Cover and chill until ready to use (up to 3 days). Bring to room temperature before serving so butter is easy to spread. Or, if using molds, press butter into molds while still soft and chill until firm. Unmold just before serving.
223	/banana-oat-snack-cake	Banana-Oat Snack Cake Recipe 	 Bon Appetit	6 tablespoons unsalted butter, cut into ½” pieces, melted, plus more for baking dish,1½ cups old-fashioned oats,1 cup all-purpose flour,2 teaspoons baking powder,1 teaspoon ground cinnamon,1 teaspoon kosher salt,1¼ cups (packed) light brown sugar,2 large eggs,1 teaspoon vanilla extract,3 bananas, chopped,	DIRECTIONS PreparationPreheat oven to 350°. Lightly coat an 8x8” baking dish with butter and line with parchment paper. Whisk oats, flour, baking powder, cinnamon, and salt in a large bowl; set aside. Whisk brown sugar, eggs, and vanilla in another large bowl until mixture is smooth.Slowly stream butter into brown sugar mixture, whisking constantly until well blended. Add bananas to dry ingredients; toss to coat. Stir into brown sugar mixture (batter will be thick). Spread batter in prepared dish. Bake until cake is golden brown and the edges start to pull away from sides of dish, 35–40 minutes. Transfer to a wire rack and let cool completely in dish. Cut into 12 servings.
224	/banana-peanut-butter-and-cornflakes	Banana, Peanut Butter and Cornflakes Recipe 	 Bon Appetit	1 banana,2 tablespoons peanut butter,1 cup cornflakes,¼ cup raisins,	DIRECTIONS PreparationSlice ¼” off the end of the unpeeled banana and slide in a wooden ice-pop stick (when peeled, it will look like a banana pop). Spoon peanut butter into a small resealable plastic bag, squeezing it as far toward one corner as possible without cutting the bag. Twist to seal and tie with kitchen twine, trimming excess plastic to make a mini pastry bag. Place cornflakes and raisins in separate containers.To eat, peel banana. Snip the mini pastry bag and squeeze peanut butter onto banana, then dip into cornflakes and raisins.
225	/grilled-clams-chorizo	Grilled Clams with Chorizo Recipe 	 Bon Appetit	½ cup (1 stick) unsalted butter,1 head of garlic, cut in half, horizontally,2 links of fresh Mexican-style chorizo (about 8 oz.),24 cherrystone clams, scrubbed,¼ cup chopped fresh flat-leaf parsley,4 ½” slices country-style bread, grilled or toasted,Lemon wedges, for serving,	DIRECTIONS PreparationCombine butter and garlic, cut side down, in a small saucepot and place over medium heat so the butter melts but does not brown; set aside.Prepare grill for medium heat. Grill chorizo, turning occasionally, until cooked through, 10–12 minutes.Meanwhile, grill clams just until they open, about 2 minutes. As clams open, using tongs, place directly in serving bowls being careful not to spill their juices. Drizzle clams with some of the garlic butter as they come off the grill.Slice each piece of chorizo into 6 pieces, add to clams, drizzle with more garlic butter, and top with parsley. Serve with grilled bread and lemons wedges.
226	/grilled-lamb-kefta	Grilled Lamb Kefta Recipe 	 Bon Appetit	1 teaspoon fennel seed,1 teaspoon cumin seed,1 medium onion, chopped,4 garlic cloves, chopped,1 cup fresh flat-leaf parsley leaves,1 cup fresh cilantro leaves and tender stems, plus more for serving,1 cup fresh mint leaves,1 teaspoon ground coriander,Kosher salt, freshly ground pepper,1½ pounds ground lamb,2 tablespoons olive oil, plus more for grill,¼ cup plain Greek yogurt,¼ cup tahini,Lemon wedges, for serving,Warm pita, for serving,	DIRECTIONS PreparationToast fennel and cumin seeds in a small dry skillet, over medium-high heat, tossing often, until fragrant, about 1 minute; let cool, then chop, or coarsely grind in a spice grinder.Transfer fennel and cumin to a food processor along with onion, garlic, parsley, cilantro, mint, and coriander, and process until very finely chopped, scraping down sides of bowl as needed. Transfer mixture to a large bowl, add lamb, season with salt and pepper, and, using your hands, gently mix together until evenly combined. Chill mixture at least 1 hour.DO AHEAD: Lamb mixture can be made up to 1 day ahead; keep chilled.Prepare grill for medium-high heat and lightly oil grill grates. Divide lamb mixture into 8 portions. Form each portion into a 5”-long sausage shape. Insert a metal skewer lengthwise through each portion. Drizzle with oil and grill, turning occasionally, until just cooked through (do not overcook or the kefta will be dry), 8–10 minutes.Meanwhile, mix together yogurt, tahini, and ¼ cup water in a small bowl until smooth; season with salt and pepper.Serve kefta with yogurt sauce, cilantro, and lemon wedges. Serve with warm pita.
227	/sausage-burgers	Sausage Burgers Recipe 	 Bon Appetit	1½ pounds loose pork sausage,4 Kaiser rolls or burger buns, split and toasted,2 tablespoons olive oil,3 bell peppers, assorted colors, seeded and cut into ½” strips (about 1½ lbs.),1 medium yellow onion, sliced ½” thick,2 tablespoons sherry or red wine vinegar,2 tablespoons honey,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationPrepare grill for medium heat. Form sausage into 4½”-thick patties. Grill patties, moving and flipping as necessary, until completely cooked through, about 5 minutes per side.Heat oil in a large skillet over medium-high heat. Add peppers and onions and cook, stirring often, until wilted and soft, 8–10 minutes. Add vinegar and honey, and cook, stirring, until slightly thickened, about 2 minutes; season with salt and pepper.Serve patties on grilled buns, topped with peppers and onions.
228	/grilled-zucchini-and-ricotta-flatbread	Grilled Zucchini and Ricotta Flatbread Recipe 	 Bon Appetit	2 tablespoons olive oil, plus more for grill,2 large zucchini (about 1 lb.), sliced lengthwise ¼” thick,1 bunch scallions, trimmed (about 6 oz.),Kosher salt, freshly ground black pepper,1 lemon, halved,1 pound prepared pizza dough, room temperature, divided in half,1 garlic clove, halved,6 ounces fresh whole milk ricotta,1 ounce grated asiago cheese or pecorino,Crushed red pepper flakes and torn fresh basil leaves, for serving,	DIRECTIONS PreparationPrepare grill for 2-zone heat (for a charcoal grill, bank coals on 1 side of grill; for a gas grill, leave 1 or 2 burners off); lightly oil grill grates. Toss zucchini and scallions with 2 Tbsp. olive oil; season with salt and pepper. Grill over direct heat, turning often, until zucchini and scallions are tender and charred in spots, about 5 minutes; set aside. Meanwhile, grill lemon halves cut-side down over direct heat until lightly charred, about 4 minutes; set aside. Cut scallions into 2” pieces with scissors.Gently stretch each piece of dough into a rectangle or oval about 14”x8” and transfer to 2 lightly oiled baking sheets. (If dough springs back, cover and let rest 10 minutes, then stretch again, resting as needed). Transfer both pieces of prepared dough to grill over direct heat. Cook until first side is lightly charred and dough is dry and stiff, about 1 minute. Turn and cook just until reverse side has a few light grill marks, about 30 seconds. Transfer to baking sheet and let cool slightly. Rub charred side of dough with garlic and top with grilled vegetables, dividing evenly. Dollop with ricotta and sprinkle with asiago.Return flatbreads to indirect heat; close grill and cook until cheese is warmed through and crust is crispy, about 5 minutes. Transfer to work surface and squeeze charred lemon halves over the flatbread. Sprinkle with red pepper flakes, basil, and salt; drizzle with olive oil.
229	/gilded-youth	Gilded Youth Recipe 	 Bon Appetit	1 ounce rye, such as Bulleit,¾ ounce blood orange or orange juice, freshly squeezed if possible,½ ounce Bonal or Genepy de Alpes,¼ ounce Yellow Chartreuse,Dash Angostura bitters,1½ ounces tepache (click here for recipe),Blood orange wedge, for garnish,	DIRECTIONS PreparationCombine rye, blood orange juice, Bonal, and Chartreuse in a cocktail shaker; fill with ice. Swizzle (stir) until cold and strain into a chilled sour glass, top with crushed ice, and a dash of bitters.
230	/tomato-and-butter-tartine	Tomato and Butter Tartine Recipe 	 Bon Appetit	1 slice rye or white bread,2 tablespoons unsalted butter, softened,Several slices tomato,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationSmear bread with butter and top with sliced tomato. Season with salt and pepper.
231	/ramp-kimchi	Ramp Kimchi Recipe 	 Bon Appetit	1 pound ramps,4 large garlic cloves, finely grated,3 tablespoons gochujang (Korean hot pepper paste),3 tablespoons sugar,4 teaspoons kosher salt,1 tablespoon fish sauce (such as nam pla or nuoc nam),1 tablespoon reduced-sodium soy sauce,2 teaspoons finely grated peeled ginger,½ large head Napa cabbage, cut into 1" pieces (about 6 cups),½ medium daikon (Japanese white radish), peeled, halved lengthwise, thinly sliced into half-moons (about 1 ½ cups),Cheesecloth,	DIRECTIONS PreparationSeparate ramp stems and greens from bulbs; chop bulbs; set aside.Whisk garlic, gochujang, sugar, salt, fish sauce, soy sauce, ginger, and 1 Tbsp. water in large bowl until smooth. Add cabbage, daikon, and reserved ramp bulbs, stems, and leaves and toss to combine. Massage vegetables with your fingers to lightly crush and release liquid.Transfer mixture to a large glass jar, leaving at least 2" headspace. Pack down vegetables to eliminate air gaps and submerge in liquid. Cover jar with cheesecloth and secure with a large rubber band.Let sit out of direct sunlight at room temperature, packing down vegetables once a day to keep submerged, until kimchi tastes tangy and releases bubbles when stirred, 3–5 days. Move to a smaller jar if needed; discard cheesecloth. Cover with a lid and chill.Do ahead: Kimchi can be made 1 month ahead. Keep chilled.
232	/celery-fennel-salad	Celery and Fennel Salad Recipe 	 Bon Appetit	¼ cup pine nuts,1 large fennel bulb, very thinly sliced,6 celery stalks, very thinly sliced,½ cup fresh flat-leaf parsley leaves with tender stems,3 tablespoons fresh lemon juice,3 tablespoons olive oil,Kosher salt, freshly ground pepper,2 ounces Parmesan, shaved,	DIRECTIONS PreparationPreheat oven to 350°. Toast pine nuts on a rimmed baking sheet, tossing occasionally, until golden brown, 8–10 minutes; let cool.Toss fennel, celery, parsley, and pine nuts with lemon juice and oil in a large bowl; season with salt and pepper. Serve salad, topped with Parmesan.
233	/turnips-roasted-garlic-goat-cheese-sesame	Turnips with Roasted Garlic Goat Cheese and Sesame Recipe 	 Bon Appetit	1 head of garlic, halved crosswise,1¼ cups plus 2 tablespoons olive oil, plus more for drizzling,8 ounces goat cheese,Kosher salt, freshly ground pepper,1 tablespoon black and/or white sesame seeds,1 teaspoon finely grated lime zest,1 teaspoon chopped fresh oregano,1 teaspoon fresh thyme leaves,¼ teaspoon sumac,12 ounces small turnips (about 16), peeled, half quartered, half thinly sliced into rounds,1 tablespoon Sherry vinegar or red wine vinegar,Cilantro leaves with tender stems and mint leaves (for serving),Sumac, a tart, citrusy spice sold in ground form, is available at Middle Eastern markets and specialty foods stores, and online.,	DIRECTIONS PreparationHeat oven to 350°. Combine garlic and 1 1/4 cups oil in a small baking dish. Cover dish with foil and roast until garlic is golden brown and tender, 45–50 minutes; let cool.Remove garlic from oil; squeeze cloves from skins and finely chop to a paste. Process in a food processor along with goat cheese, 1/4 cup garlic roasting oil, and 2 Tbsp. water until smooth (mixture should be spreadable); season with salt and pepper.Meanwhile, toast sesame seeds in a dry skillet over medium heat until golden brown, about 1 minute. Transfer to a small bowl and let cool. Mix in lime zest, oregano, thyme, and sumac.Toss turnips in a medium bowl with vinegar and 2 Tbsp. oil; season with salt and pepper. Divide goat cheese mixture among plates, top with turnips, sesame mixture, cilantro, and mint, and drizzle with more oil.Do ahead: Roasted garlic goat cheese can be made 1 day ahead; cover and chill. Bring to room temperature before using. Sesame mixture can be made 4 hours ahead. Store airtight at room temperature.
234	/stir-fried-okra-shallots-chile-ginger	Stir-Fried Okra with Shallots, Chile, and Ginger Recipe 	 Bon Appetit	½ cup vegetable oil,2 large shallots, thinly sliced,4 garlic cloves, thinly sliced,1 serrano chile, thinly sliced,2 tablespoons finely chopped peeled ginger,1 pound fresh okra, halved lengthwise, quartered if large,Kosher salt, freshly ground pepper,2 tablespoons fresh lime juice,Lime wedges (for serving),	DIRECTIONS PreparationHeat 1/4 cup oil in a large skillet over medium-high heat. Cook 1 shallot, 2 garlic cloves, 1/2 chile, and 1 Tbsp. ginger, stirring, 30 seconds. Add half of okra and cook, tossing occasionally, until tender and golden brown, about 4 minutes; season with salt and pepper and transfer to a plate. Repeat with remaining oil, shallot, garlic, chile, ginger, and okra, returning first batch to skillet when second batch has finished cooking.Add lime juice and toss to combine.Serve with lime wedges for squeezing over.
235	/strawberry-graham-scones	Strawberry-Graham Scones Recipe 	 Bon Appetit	1¼ cups all-purpose flour,1¼ cups graham flour or whole wheat pastry flour,1 tablespoon baking powder,1 teaspoon kosher salt,¼ cup plus 1 tablespoon sugar,10 tablespoons chilled unsalted butter, cut into pieces,6 ounces strawberries, hulled, cut into 1/2" pieces (about 1 ½ cups),3/4 cup whole milk,1 large egg yolk,	DIRECTIONS PreparationPreheat oven to 375°. Pulse all-purpose flour, graham flour, baking powder, salt, and ¼ cup sugar in a food processor to combine. Add butter and pulse until the texture of coarse meal with a few pea-size pieces of butter remaining.Transfer mixture to a medium bowl, add strawberries, and toss to combine. Whisk milk and egg yolk in a small bowl. Add milk mixture to dry ingredients, and, using a fork, gently mix just to combine. Using your hands, gently knead a few times just until a shaggy dough comes together.Place a 2 ½x1" round cookie cutter on a parchment-lined baking sheet. Gently press about 1/8 of dough into the cutter (you want to pack dough enough to hold together but not so much that scones will be dense and heavy), then lift cutter straight up, leaving a neat round of dough. Repeat with remaining dough.Sprinkle scones with remaining 1 Tbsp. sugar. Chill in freezer 20 minutes (this will help scones hold their shape).Bake scones until golden brown, 25–30 minutes. Transfer to a wire rack and let cool slightly.DO AHEAD: Scones can be made 2 days ahead. Store airtight at room temperature.
236	/tomato-grilled-cheese-soup	Tomato Grilled-Cheese Soup Recipe 	 Bon Appetit	4 tablespoons (½ stick) unsalted butter, plus ½ cup (1 stick) at room temperature, divided,1 medium red onion, chopped,Kosher salt, freshly ground pepper,2 tablespoons tomato paste,2 28-oz. cans crushed fire-roasted tomatoes,4 cups vegetable broth,2 sprigs thyme,1 bay leaf,2 tablespoons sugar,½ cup heavy cream,16 slices Pullman loaf,16 ounces cheddar, grated,	DIRECTIONS PreparationHeat 4 Tbsp. butter in a Dutch oven or medium stockpot over medium heat. Add onion and cook, stirring often, until softened and lightly browned around the edges, 8–10 minutes. Season with salt and pepper. Add tomato paste and cook, stirring to coat onion, until tomato paste is slightly darkened in color, about 2 minutes. Add canned tomatoes, vegetable broth, thyme, bay leaf, and sugar and bring to a simmer. Season with salt and pepper and cook until flavors are melded, 35–40 minutes. Remove from heat and stir in cream. Remove thyme stems and bay leaf and let cool slightly. Working in batches, purée in a blender until smooth.Heat a dry skillet, preferably cast-iron, over medium heat. Dividing evenly, spread room-temperature butter over bread slices. Top unbuttered side of 8 slices with cheddar, dividing evenly. Top with remaining bread, buttered side up, and cook, turning once, until bread is golden brown and cheese is melted, about 3 minutes per side. Cut sandwiches into soldiers and serve alongside hot soup for dipping.
237	/lentil-and-chickpeas-with-greens	Lentils and Chickpeas with Greens Recipe 	 Bon Appetit	½ cup green lentils,3 tablespoons olive oil, divided,½ bunch greens, such as spinach, kale, or Swiss chard, bottom stems trimmed,Kosher salt, freshly ground pepper,1 15-oz. can chickpeas, rinsed,4 cherry tomatoes, halved or quartered if large,1 tablespoon Parmesan or sharp cheddar, cut into small dice,1 lemon, halved,	DIRECTIONS PreparationCook lentils in a medium pot of salted water until tender, 10–15 minutes; drain and let cool. Heat 1 Tbsp. oil in a medium skillet over medium-high heat. Add greens and cook, stirring occasionally, until wilted and bright green, about 3 minutes. Season with salt and pepper. Combine lentils, chickpeas, and remaining 2 Tbsp. olive oil in a medium bowl; season with salt and pepper. Divide among 2 bowls and top with greens, tomatoes, and Parmesan. Squeeze lemon over.
238	/grilled-little-gem-salad-pita-croutons	Grilled Little Gem Salad with Pita Croutons Recipe 	 Bon Appetit	8 heads Little Gem lettuce (about 1½ lbs.), halved lengthwise,6 tablespoons olive oil, divided, plus more for grill,Kosher salt, freshly ground pepper,2 pocket pitas, split along the seam,3 tablespoons white wine vinegar,2 tablespoons chopped fresh tarragon,1 small shallot, finely chopped,1 teaspoon Dijon mustard,1 cup Sun Gold tomatoes, halved,½ cup whole flat-leaf parsley leaves,2 ounces ricotta salata, crumbled,	DIRECTIONS PreparationPrepare grill for medium heat and lightly oil grates. Toss lettuce with 2 Tbsp. olive oil in a large bowl and season with salt and pepper. Brush pita with 2 Tbsp. olive oil.Grill lettuce, turning once, until outside of lettuce is lightly charred but inside is still firm, about 2 minutes per side; let cool, then separate leaves. Meanwhile, grill pita until crisp, about 1 minute per side. Let cool, then break into bite-size pieces.Whisk together vinegar, tarragon, shallot, mustard, and remaining 2 Tbsp. oil in a large bowl; season with salt and pepper. Add lettuce, tomatoes, parsley, ricotta salata, and pita, and toss to combine.DO AHEAD: Dressing can be made up to 1 day ahead.
239	/tuna-melt	Tuna Melt Recipe 	 Bon Appetit	1 can chunk light tuna,2 tablespoons mayonnaise,1 tablespoon lemon juice,1 tablespoon chopped fresh dill,Kosher salt, freshly ground pepper,Wheat crackers,Havarti cheese, sliced,	DIRECTIONS PreparationThoroughly drain 1 can chunk light tuna and transfer to a medium bowl. Add mayonnaise, lemon juice, and chopped fresh dill. Mix with a fork until tuna is smooth and spreadable; season with salt and pepper. Scoop tuna onto stone-ground wheat crackers and top with sliced Havarti cheese. Toast crackers in a toaster oven until cheese is just melted, about 2 minutes.
240	/summer-babe	Summer Babe Recipe 	 Bon Appetit	2 ounces gin,¾ ounces Génépy des Alpes,¾ ounces fresh lemon juice,Lemon twist (for serving),	DIRECTIONS PreparationCombine gin, Génépy des Alpes, and lemon juice in a cocktail shaker and fill with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a chilled coupe glass and garnish with lemon twist.
241	/artichoke-olive-burrata-pizza	Fresh Artichoke, Olive, and Burrata Pizza  Recipe 	 Bon Appetit	½ teaspoon finely grated lemon zest,1 lemon, halved,2 large artichokes,5 tablespoons olive oil, plus more for baking sheet,Kosher salt, freshly ground pepper,1 pound prepared pizza dough, room temperature, divided into 4 pieces,2 8 oz. balls burrata, torn into 1" pieces,¾ cup green olives (such as Castelveltrano), pitted, very coarsely chopped,1 tablespoon fresh rosemary leaves,	DIRECTIONS PreparationHeat oven to 450°. Squeeze juice from lemon halves into a bowl of water. Using a serrated knife, remove outer leaves from artichokes to expose heart. Trim 3" from top. Trim stems and remove tough outer layer with a vegetable peeler. Halve artichokes lengthwise and remove choke with a spoon. Dip in lemon water to prevent artichokes from browning. Thinly slice and place in a small bowl. Drizzle with 1 Tbsp. oil and toss to coat; season with salt and pepper.Gently stretch each piece of dough into a 9" round and transfer to 2 lightly rimmed oiled baking sheets. (If dough springs back, cover and let rest 10 minutes, then stretch again, resting as needed).Brush with remaining 4 Tbsp. oil; season with salt and pepper. Top with burrata, olives, artichokes, and rosemary. Bake pizza, rotating baking sheet halfway through, until cheese is melted and bubbly and crust is golden brown, 12–15 minutes. Top with lemon zest and season with more pepper.
244	/blt-salad	BLT Salad Recipe 	 Bon Appetit	8 slices bacon,1 4-ounce piece rustic country-style bread,⅓ cup mayonnaise,2 tablespoons fresh lemon juice,Kosher salt, freshly ground pepper,⅓ cup olive oil,Pinch of sugar,¼ bunch or a very small handful of chives,2 romaine hearts,1 pound ripe juicy tomatoes, cut into bite-size wedges or slices,1 large avocado, sliced,	DIRECTIONS Hide All ImagesPreheat oven to 350°. Arrange bacon slices side by side on a small rimmed baking sheet, overlapping slightly if necessary.Bake bacon, removing sheet from oven and turning slices with tongs halfway through, until slices are deep reddish brown with crispy edges, 25–35 minutes. Increase oven temperature to 425°.While bacon is cooking, cut crusts off bread; discard. Tear bread into 1" pieces. Don’t worry if the pieces end up in different shapes and sizes. Irregular is good! You should have about 2 lightly packed cups.Transfer bacon to a paper towel–lined plate and blot with more paper towels to absorb excess fat. The bacon will crisp as it cools. Reserve baking sheet with bacon fat.Scatter bread on reserved baking sheet and toss with tongs until bread is evenly coated in fat.Bake bread, tossing once halfway through, until pieces are golden all over and crisp, 10–15 minutes. Let cool.Meanwhile, whisk ⅓ cup mayonnaise and 2 Tbsp. lemon juice in a medium bowl. Season with salt and lots of pepper, then slowly stream in ⅓ cup oil, whisking until dressing is thick and emulsified. Whisk in a pinch of sugar; set aside.PreviousNextThinly slice enough chives to measure 2 Tbsp. and whisk into bowl with dressing.Slice remaining chives into 1" pieces; set aside.Halve romaine hearts lengthwise, trim off root ends, then cut each half in half again crosswise. Arrange lettuce pieces on a large platter or divide among individual plates. Season with salt and pepper and drizzle about a third of the dressing over top.Arrange tomatoes, avocado, and croutons over and around lettuce pieces.Break up cooled bacon with your hands into rough 1" pieces and scatter over salad. Drizzle with remaining dressing.Sprinkle with reserved chives and serve.
245	/tomatillo-salsa	Tomatillo Salsa Recipe 	 Bon Appetit	2 tablespoons vegetable oil,8 medium tomatillos (about 14 oz.), husked, sliced ½" thick,Kosher salt,1/2 jalapeño, seeds removed if desired, coarsely chopped,1/4 cup fresh cilantro leaves with tender stems,2 tablespoons fresh lime juice,Freshly ground black pepper,	DIRECTIONS PreparationHeat oil in a cast-iron skillet over high heat. Season both sides of tomatillo slices with salt. Cook slices until lightly charred, about 3 minutes per side. Transfer to plate and let cool 10 minutes.Pulse tomatillos, jalapeño, cilantro, and lime juice in a blender until smooth, about 20 seconds; season with salt and pepper.
246	/ancho-chile-salsa	Ancho Chile Salsa Recipe 	 Bon Appetit	2 vine-ripened tomatoes, halved,1 tablespoon vegetable oil,Kosher salt,3 cups water,1 dried ancho chile, seeds removed,1 garlic clove, peeled,1 jalapeño, thinly sliced into rounds, seeds removed if desired,1 teaspoon distilled white vinegar,Freshly ground black pepper,	DIRECTIONS PreparationHeat broiler. Toss tomatoes with oil on a rimmed baking sheet and season with salt. Broil until skins are charred in spots, 6–8 minutes. Let cool.Meanwhile, bring water to a boil in a small saucepan. Add ancho chile and garlic and boil, stirring occasionally, until soft, about 5 minutes. Using a slotted spoon, transfer chile and garlic to a plate; let cool. Reserve cooking liquid.Squeeze tomatoes to remove most seeds and place in blender along with jalapeño, vinegar, ancho chile, garlic, and ¼ cup reserved cooking liquid. Blend, adding more cooking liquid as needed, until smooth, about 30 seconds; season with salt and pepper.
247	/pour-irish-coffee	Pour Over Irish Coffee Recipe 	 Bon Appetit	1 small sugar cube,6 ounces hot freshly brewed coffee,2 ounces GrandTen Distilling South Boston Irish whiskey,Whipped cream (for serving),A few dashes A few dashes Bittermens Xocolatl Mole Bitters (optional; for serving),	DIRECTIONS PreparationPlace sugar cube in an Irish coffee mug. Add coffee and whiskey and stir to combine. Top with whipped cream and bitters, if using.
248	/irish-iced-coffee	Irish Iced Coffee Recipe 	 Bon Appetit	2 ounces Tullamore Dew Irish whiskey,1 teaspoon ground espresso,2 teaspoons demerara sugar,3 ounces cold brew coffee (such as Grady’s),Whipped cream (for serving),	DIRECTIONS PreparationCombine whiskey and espresso in a small bowl; let stand 15 minutes. Strain whiskey through a coffee filter into a cocktail shaker.Meanwhile, stir sugar and 2 tsp. hot water in a small bowl until sugar is dissolved.Add demerara syrup and cold brew to cocktail shaker; fill with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a Collins glass filled with ice and top with whipped cream.
249	/picante-pigeon	Picante Pigeon Recipe 	 Bon Appetit	1–2 jalapeño slices,2 teaspoons sugar,2 ounces tequila reposado,2 ounces fresh pink grapefruit juice,1 ounce fresh lime juice,Grapefruit slice (for serving),	DIRECTIONS PreparationMuddle jalapeño and sugar in a cocktail shaker. Add tequila, grapefruit juice, and lime juice; fill shaker with ice. Shake until outside of shaker is frosty, about 30 seconds. Strain into a rocks glass filled with ice and garnish with grapefruit slice.
250	/whole-grain-pancakes	Whole Grain Pancakes Recipe 	 Bon Appetit	¾ cup whole wheat flour,½ cup all-purpose flour,2 tablespoons sugar,1 teaspoon baking powder,1 teaspoon baking soda,1 teaspoon kosher salt,1 large egg,1½ cups buttermilk,2 cups mixed cooked whole grains, such as barley, farro, rye, spelt, kamut, and/or quinoa,Melted unsalted butter (for pan),Sliced peaches or other stone fruit and pure maple syrup (for serving),	DIRECTIONS PreparationWhisk flours, sugar, baking powder, baking soda, and salt in a large bowl. Whisk egg and buttermilk in a medium bowl. Using a few swift strokes, whisk egg mixture into dry ingredients until combined. Stir in grains (note: you can pulse the grains in a food processor if you’d prefer them in smaller pieces).Heat a large nonstick skillet over medium-high. Lightly brush with butter. Add half of batter to skillet, spreading into an even layer as wide as the skillet. Cook pancake until bubbles have formed and broken across entire surface and underside is golden brown, 4–5 minutes. Using 2 spatulas (or sliding onto a flat plate before inverting back into skillet), flip pancake. Continue to cook until lightly browned underneath, about 1 minute.Transfer pancake to a plate, then repeat with remaining batter. Serve pancakes topped with sliced fruit and syrup.
251	/ricotta-pancakes-with-blueberry-lemon-compote	Ricotta Pancakes with Blueberry-Lemon Compote Recipe 	 Bon Appetit	4 cups fresh blueberries (about 1½ pounds), divided,¼ cup plus 1 tablespoon sugar,1 teaspoon kosher salt, plus more,1½ teaspoons finely grated lemon zest,1 tablespoon fresh lemon juice,4 large eggs, separated,½ cup all-purpose flour,½ cup whole wheat flour,1½ teaspoons baking powder,¼ teaspoon baking soda,1⅓ cups whole-milk fresh ricotta,¾ cup buttermilk,2 teaspoons vanilla extract,Vegetable oil (for griddle),Pure maple syrup and room-temperature butter (for serving),	DIRECTIONS PreparationCook 2 cups blueberries, ¼ cup sugar, and a pinch of salt in a medium saucepan over medium heat, stirring occasionally, until berries start to burst and mixture becomes thick and jammy, 6–8 minutes. Add lemon zest, lemon juice, and 1 cup blueberries. Bring to a boil, then remove from heat. Let compote sit until you are ready to serve.Using an electric mixer on high speed, beat egg whites in a medium bowl until stiff peaks form, 3–5 minutes. Whisk all-purpose flour, whole wheat flour, baking powder, baking soda, and remaining 1 Tbsp. sugar and 1 tsp. salt in a large bowl to combine. Whisk egg yolks, ricotta, buttermilk, and vanilla in another medium bowl.Add egg yolk mixture to dry ingredients and stir with a rubber spatula to incorporate. Fold in one-third of egg whites to lighten, then add remaining egg whites and fold in until no streaks remain.Heat a griddle or a large skillet over medium-low; brush with oil. Working in batches, scoop ½-cupfuls of batter onto griddle. Top each with 2 Tbsp. fresh blueberries. Cook pancakes until bottoms are golden brown and bubbles form on top, about 3 minutes. Flip and cook, reducing heat if browning too quickly, until second sides are golden brown and pancakes are cooked through, about 2 minutes.Serve pancakes with warm compote, maple syrup, and butter.Do Ahead: Compote can be made 2 days ahead. Let cool; cover and chill.
252	/mary-chapman	The Mary Chapman Recipe 	 Bon Appetit	1 red or green Thai chile,2 oz. London dry gin,1 oz. Cocchi Americano,1 stalk lemongrass,	DIRECTIONS PreparationMake a lengthwise slit in chile, but do not cut all the way through (chile should remain intact). Rub the rim of a coupe glass with inside of chile and drop chile into glass.Lightly smash lemongrass with the back of a chef’s knife until split slightly and fragrant. Combine gin and Cocchi in a pint glass or cocktail shaker, fill with ice, and stir with lemongrass stalk until outside of glass is frosty, about 30 seconds. Remove lemongrass; discard. Strain drink into prepared glass with chile.
253	/magic-crispy-chicken	Magic Crispy Chicken Recipe 	 Bon Appetit	1½ pounds boneless, skinless chicken thighs (about 6),1 large egg yolk,3 tablespoons plus ¼ cup mayonnaise,1 tablespoon plus ¼ cup Dijon mustard,1½ teaspoons Diamond Crystal or ¾ teaspoon Morton kosher salt, plus more,Freshly ground black pepper,½ cup olive oil,2 cups panko (Japanese breadcrumbs),1 tablespoon honey,Pinch of cayenne pepper,3 tablespoons finely chopped chives,	DIRECTIONS Hide All ImagesPosition a rack in center of oven; preheat to 450°. Place a wire rack inside a rimmed baking sheet. Place chicken on rack, then pat dry with paper towels.Whisk egg yolk, 3 Tbsp. mayo, 1 Tbsp. mustard, and 1½ tsp. salt in a large bowl. Add several cranks of black pepper and whisk until smooth.Add chicken to bowl and turn pieces several times with tongs until evenly coated; set aside.Heat oil in a medium skillet over medium. After about a minute, test oil to see if it’s hot enough by adding a pinch of panko. If tiny bubbles appear instantly around each bit of panko, you’re good to go. Add remaining panko and cook, stirring constantly with a wooden spoon, until crumbs are golden brown, about 5 minutes. Make sure to get around the edges and incorporate darker crumbs that form at the perimeter.Remove skillet from heat and let cool several minutes. Place skillet on work surface next to bowl of chicken and wire rack.Using tongs, take one piece of chicken at a time and place in skillet. Using one hand, pat surrounding toasted panko over top of thigh, pressing firmly to adhere. Turn chicken and repeat on other side with more crumbs.Lightly shake off excess crumbs. Transfer chicken to wire rack.Repeat with remaining chicken pieces, transferring each to rack and spacing evenly apart. Discard any remaining panko.Transfer sheet to oven and bake chicken until fully cooked through, juices run clear when pierced with a knife, and breadcrumbs have gone a couple of shades past golden into deep brown territory, 15–20 minutes. Let cool.Stir honey, cayenne, and remaining ¼ cup mayonnaise and ¼ cup mustard in a small bowl. Season with black pepper.Stir chives into honey mustard sauce and serve with chicken.PreviousNext
254	/potato-bacon-breakfast-tacos-monterey-jack	Potato-Bacon Breakfast Tacos with Monterey Jack Recipe 	 Bon Appetit	4 ounces bacon (about 6 slices), cut into 1/2" pieces,1 large russet potato, peeled, cut into ¼" pieces,Kosher salt, freshly ground pepper,8 6" flour tortillas, warmed,8 large eggs,2 tablespoons unsalted butter,Monterey Jack or cheddar, shredded (for serving),1 avocado, sliced (for serving),Hot sauce (for serving),	DIRECTIONS PreparationCook bacon, stirring occasionally, until crisp, 6–8 minutes. Using a slotted spoon, transfer to paper towels to drain (do not pour off fat from skillet).Add potatoes to skillet and cook, stirring often, until golden brown and tender, 10–12 minutes. Using a slotted spoon, transfer to a plate; season with salt and pepper.Meanwhile, whisk eggs in a large bowl to blend; season with salt and pepper. Heat butter in a large nonstick skillet over medium heat. Cook eggs, stirring occasionally and scraping bottom of skillet with a heatproof spatula to form large curds, until just set, about 3 minutes. Remove from heat and mix in bacon.Fill tortillas with egg mixture and potatoes and top with cheese, avocado, and hot sauce.
255	/rice-vinegar-pickled-onions	Rice Vinegar–Pickled Onions Recipe 	 Bon Appetit	1 small red onion, thinly sliced,1 cup unseasoned rice vinegar,1/3 cup sugar,1 tablespoon kosher salt,	DIRECTIONS PreparationPlace onions in large heatproof jar.Heat vinegar, sugar, salt, and 1/3 cup water in small saucepan over medium-high heat, whisking occasionally, until sugar and salt are dissolved, about 3 minutes.Pour pickling liquid over onions (onions should be submerged). Let cool.DO AHEAD: Onions can be pickled 2 weeks ahead. Cover and chill. Drain before using.
256	/sponge-cake	Sponge Cake Recipe Recipe 	 Bon Appetit	Nonstick vegetable cooking spray,½ cup whole milk,¼ cup (½ stick) unsalted butter,1½ cups all-purpose flour,2 teaspoons baking powder,3 large eggs, room temperature,¾ teaspoon kosher salt,¾ cup sugar,1 teaspoon vanilla extract,	DIRECTIONS PreparationArrange a rack in center of oven; preheat to 350˚. Lightly coat a 13x9" baking dish with nonstick spray, then line with parchment paper, leaving a 2" overhang on long sides. Lightly coat parchment with nonstick spray.Heat milk and butter in a small saucepan over medium, stirring, until butter is melted. Let cool.Whisk flour and baking powder in a small bowl. Sift through a fine-mesh sieve onto a piece of parchment or waxed paper.Using an electric mixer on low speed, beat eggs in a large bowl, gradually increasing speed to medium-high, until combined. Add salt and continue to beat until mixture begins to foam, about 1 minute. Reduce mixer speed to low and gradually add sugar; increase speed to high and beat until very light and pale yellow, about 4 minutes. Reduce mixer speed to low again and gradually add dry ingredients, using parchment to help guide it into bowl, and beat on medium speed until no lumps remain and batter is very thick. Beat in vanilla and cooled milk mixture just until combined. Scrape sides and bottom of bowl with a spatula, give batter a good stir with spatula, then scrape into prepared pan.Bake cake until top is golden and a tester inserted into the center comes out clean, 15–25 minutes. Let cool.Do Ahead: Cake can be made 1 day ahead. Wrap with plastic and store at room temperature.
257	/warm-milk-punch	Warm Milk Punch Recipe 	 Bon Appetit	Zest of 4 lemons, removed with a peeler,2 tablespoons sugar,1 cup fresh lemon juice,1 cup Demerara Simple Syrup (click for recipe),1 750-ml bottle Pierre Ferrand 1840 Cognac or other full-bodied Cognac, preferably 86–94 proof,750 ml El Dorado 5-year-old rum or other dark rum,3 cups whole milk,Special equipment: cheesecloth,	DIRECTIONS PreparationUsing a wooden spoon, muddle lemon zest and sugar in a medium bowl until fragrant, about 30 seconds. Cover and let sit at least 3 hours and up to 12 hours (longer is better). At this point sugar should be dissolved, leaving a lemon-flavored syrup.Combine lemon syrup, lemon juice, demerara syrup, Cognac, and rum in a large pitcher. Bring milk to a bare simmer in a medium saucepan. Immediately pour milk into Cognac mixture (milk will curdle right away). Cover and chill at least 1 hour and up to 24 hours.Strain mixture through a fine-mesh sieve lined with cheesecloth into a large bowl. Cover and chill until cold (any remaining curds should settle at the bottom of the pitcher).Carefully ladle clarified punch into a clean pitcher, leaving any remaining curds behind. Chill until ready to serve. Reheat gently just before serving and divide among teacups.Do aheadPunch base can be made 1 week ahead. Keep chilled.
287	/tropical-energy-bars	Tropical Energy Bars Recipe 	 Bon Appetit	6 ounces dried no-sugar-added pineapple (about 2 cups), coarsely chopped,2 cups macadamia nuts,1 cup unsweetened coconut flakes,⅓ cup melted virgin coconut oil,1 tablespoon chia seeds,1¼ teaspoons kosher salt,	DIRECTIONS PreparationPulse pineapple in a food processor (it can be very tough, even for a food processor, so pre-chopping gives it a needed head-start; you may also find you need to use long pulses) until finely chopped. Add nuts and pulse until coarsely chopped. Add coconut flakes, oil, chia seeds, and salt. Pulse until a coarse purée forms.Transfer pineapple mixture to a plastic wrap-lined rimmed baking sheet. Top with another piece of plastic wrap and roll or press to a 9x6" rectangle. Chill until firm, about 1 hour.Cut into 12 bars. Wrap each bar in a sheet of parchment-lined foil to take on the go, or roll into balls. Either way, be aware that they soften quickly at room temperature because of the coconut oil.Do Ahead: Bars can be made 3 months ahead. Transfer to an airtight container and chill, or wrap and freeze up to 6 months.
258	/gluten-free-chocolate-tahini-brownies	Gluten-Free Chocolate-Tahini Brownies Recipe Recipe 	 Bon Appetit	3 tablespoons cornstarch,2 tablespoons unsweetened cocoa powder,6 ounces bittersweet chocolate, coarsely chopped,3 tablespoons virgin coconut oil,4 tablespoons tahini, divided,2 large eggs,⅓ cup granulated sugar,¼ cup (packed) light brown sugar,1 teaspoon kosher salt,1 teaspoon vanilla extract,1 tablespoon light agave syrup (nectar),	DIRECTIONS PreparationPreheat oven to 350°. Line an 8x8" baking dish with 2 overlapping pieces of parchment paper, leaving at least a 3" overhang on 2 sides.Whisk cornstarch and cocoa powder in a medium bowl until no lumps remain. Heat chocolate, oil, and 1 Tbsp. tahini in a small saucepan over low, stirring, until melted and smooth.Using an electric mixer on medium-high speed, beat eggs, granulated sugar, and brown sugar in a large bowl until light, smooth, and doubled in volume, 3–4 minutes. Beat in salt and vanilla to combine, then beat in chocolate mixture, scraping down sides as needed, until incorporated. Beat in cornstarch mixture, then increase speed to medium-high and beat until mixture is thick and holds its shape, about 30 seconds.Stir agave syrup and remaining 3 Tbsp. tahini in a small bowl. Scrape batter into prepared baking dish and smooth top. Dollop agave mixture over and swirl into top of batter with a skewer or toothpick.Bake brownies until sides are puffed, top is browned, and a tester inserted into the center comes out with a few moist crumbs attached, 22–26 minutes. Let cool before removing from pan and cutting into 16 squares.Do Ahead: Brownies can be made 3 days ahead. Wrap in plastic and store at room temperature.
259	/spicy-chicken-and-cabbage-salad	Spicy Chicken and Cabbage Salad Recipe 	 Bon Appetit	1 small red onion,2 skinless, boneless chicken breasts (about 1 pound, 5 ounces),3 garlic cloves, smashed,1 red chile, halved, thinly sliced, divided,2 cups cilantro leaves with tender stems, divided,1 tablespoon Diamond Crystal or 1¾ teaspoons Morton kosher salt, divided, plus more,3 tablespoons vegetable oil,⅓ cup peanuts, preferably skin-on,Juice from 1 lime (about 2 tablespoons),½ medium head of green cabbage, very thinly sliced,2 medium Persian cucumbers, thinly sliced on a bias,	DIRECTIONS PreparationCut onion in half. Coarsely chop one half, then thinly slice the other half; set slices aside. Transfer chopped onion to a medium pot. Add chicken, garlic, half of chiles, 1 cup cilantro, 2½ tsp. salt, and 4 cups water. Slowly bring to a bare simmer over medium heat. Once liquid begins to simmer, reduce heat to low and cook until juices run clear when thickest part of chicken is pierced, 10–12 minutes.Transfer chicken to a cutting board and let cool; coarsely shred. Reserve ¼ cup poaching liquid and chill until ready to use. (Strain and reserve any remaining poaching liquid for another use.)Heat oil in small skillet over medium. Cook peanuts, stirring often, until golden, 3–5 minutes. Using a slotted spoon, transfer peanuts to cutting board; coarsely chop. Reserve cooking oil.Whisk chilled poaching liquid, reserved peanut oil, and lime juice in a large bowl. Add cabbage, season with salt, then massage with your hands for a minute to soften. Add cucumbers, chicken, remaining chiles, remaining 1 cup cilantro, reserved sliced onion, and half of peanuts; season with salt and toss to combine. Top with remaining peanuts before serving.Do Ahead: Chicken can be poached 2 days ahead. Let chicken and broth cool separately. Wrap chicken and transfer broth to an airtight container; chill.
260	/green-goddess-whipped-feta-dip	Green Goddess Whipped Feta Dip Recipe 	 Bon Appetit	8 ounces feta,1 cup (or more) buttermilk,2 cups cilantro leaves with tender stems,2 cups parsley leaves with tender stems, plus sprigs for serving,½ cup tarragon leaves,4 oil-packed anchovy fillets, chopped (optional),2 tablespoons finely grated lemon zest,1 tablespoon fresh lemon juice,Kosher salt, freshly ground pepper,Olive oil (for drizzling),Mixed crudité, such as radishes, halved if large, endive, leaves separated, small carrots, scrubbed, trimmed, and/or baby fennel (for serving),	DIRECTIONS PreparationProcess feta and buttermilk in a food processor until smooth. Add cilantro, parsley, tarragon, anchovies (if using), and lemon zest. Continue to process, adding more buttermilk if needed, until mixture is smooth and pale green with small flecks of herbs still visible. Add lemon juice, season with salt and pepper, and process just to combine.Transfer dip to a medium bowl. Drizzle with oil and top with a few sprigs of parsley. Serve on a platter with crudité.Do Ahead: Dip can be made 1 day ahead. Cover and chill.
261	/congee-with-spring-vegetables	Congee with Spring Vegetables and Green Garlic Oil Recipe 	 Bon Appetit	3 pounds chicken wings,½ pound sliced bacon,1 large white onion, halved,1 1-inch piece ginger, peeled, lightly crushed,¾ cup jasmine rice,Kosher salt,1 green garlic stalk, trimmed, coarsely chopped, or 1 small leek plus 1 garlic clove, coarsely chopped,1 small bunch cilantro, coarsely chopped (about 3 cups), plus more for serving,1 cup schmaltz or olive oil,1 tablespoon olive oil,1½ ounces thick-cut bacon, cut into small pieces (about 1 thick slice),2 ounces morel mushrooms, halved if large, or sliced shiitake mushrooms (about 1 cup),½ pound asparagus, trimmed, cut into 1-inch pieces on a steep diagonal,1 cup baby peas, thawed if frozen,	DIRECTIONS PreparationChicken-Bacon StockBring chicken wings, bacon, onion, ginger, and 4 quarts water to a boil in a large stockpot. Reduce heat and simmer, uncovered, skimming off any foam that rises to the surface, until stock is richly flavored and wings are beginning to fall apart, 1½–2 hours. Strain through a fine-mesh sieve into a large bowl (you should have about 3 quarts stock); reserve chicken for another use.Do Ahead: Stock can be made 5 days ahead. Cover and chill, or freeze up to 3 months.Congee and AssemblyBring 1½ quarts chicken-bacon stock to a boil in a small pot. Add rice and bring to a simmer; season with salt. Cook, lowering heat as needed to maintain a gentle simmer and stirring occasionally, until rice is beginning to fall apart and congee is the consistency of a loose porridge, 40–45 minutes. Season again with salt, if needed.Meanwhile, purée green garlic, cilantro, schmaltz, and a pinch of salt in a blender until smooth and very bright green, about 2 minutes. Strain through a fine-mesh sieve into a medium bowl; discard solids. (Note: you will have extra, but you can store it for another use.)Heat olive oil in a medium skillet over medium. Cook bacon, stirring often, until browned and crispy, 6–8 minutes. Transfer bacon to a plate with a slotted spoon. Add mushrooms to skillet and cook, tossing occasionally, until lightly browned, 4–5 minutes. Add asparagus and cook, tossing, until crisp-tender, about 3 minutes; season with salt. Add peas and cooked bacon and toss just to combine.Divide congee among bowls. Top with vegetables, then drizzle with green garlic oil. Top with more cilantro before serving.Do Ahead: Green garlic oil can be made 2 days ahead; cover and chill, or freeze up to 1 month.
262	/basically-burger	Easy Burgers Recipe 	 Bon Appetit	20 ounces ground beef, 80% lean,Kosher salt,2 tablespoons vegetable oil, divided,2 tablespoons plus ½ cup mayonnaise (preferably Hellmann’s),4 potato or soft-seeded hamburger buns,4 slices American cheese,3 tablespoons ketchup,¼ cup sweet pickle relish,1 tablespoon hot sauce, such as Tapatío, Cholula, or Crystal,Freshly ground black pepper,4 large iceberg lettuce leaves, torn into large pieces,¼ medium red onion, sliced as thinly as possible,	DIRECTIONS Hide All ImagesDivide beef into 4 equal pieces. Using both hands, work meat into smooth spheres, compacting very lightly.Place a large sheet of parchment paper, plastic wrap, or foil on your work surface. Place balls on top, spacing evenly. Place another piece of parchment (or whatever you’re using) over and press down to flatten each ball into a patty 5" in diameter.PreviousNextPeel back top sheet and use your fingertips to press a shallow, 2"-wide depression into the center of each patty. The meat will contract and push up in the center as the patties cook; making this little divot helps to keep the burgers flat.Season meat generously with salt. Drizzle patties with 1 Tbsp. oil, dividing evenly.PreviousNextGently flip patties on parchment and season the other side with salt. Drizzle with remaining 1 Tbsp. oil.Using the back of a spoon, spread 2 Tbsp. mayonnaise over both cut sides of all buns, dividing evenly and spreading all around.Heat a large skillet over medium-low and cook half of buns, mayonnaise side down, until golden and crisp around the edges, 2–3 minutes. Transfer to a plate and cook remaining buns; set them aside and increase heat to medium-high.Peel 2 patties off of parchment paper and press down gently into skillet, spacing evenly apart. Cook, without any touching or fussing, until edges are browned and you can see juices pooling in the center of patties, about 5 minutes.Slide a thin metal spatula, preferably a flexible one like a fish spatula, underneath patties and flip them over.Place a slice of cheese over each patty, reduce heat to medium-low, and cover skillet. Cook until cheese is melted, about 1 minute.Transfer patties to a plate. Let rest about 5 minutes. Meanwhile, wipe out skillet with paper towel and repeat cooking process with remaining patties.While burgers are resting, make your secret sauce. Stir ketchup, relish, hot sauce, and remaining ½ cup mayonnaise in a small bowl to combine, then season generously with salt and pepper.WAIT, WHAT IS SPECIAL SAUCE, ANYWAYS?Start to build your burger. Stack 2–3 pieces of lettuce on bottom halves of buns. Place several slices of onion on top of lettuce.Smear a couple of tablespoons of secret sauce on top halves of buns.Place burgers on top of onions, close burgers with top bun, and serve!
263	/eggs-in-purgatory	Eggs in Purgatory Recipe 	 Bon Appetit	¼ cup olive oil, plus more for drizzling,5 garlic cloves, smashed,Kosher salt, freshly ground pepper,½ teaspoon crushed red pepper flakes,20 ounces cherry tomatoes,1 bunch Swiss chard, preferably rainbow,6 large eggs,4 thin slices country-style bread,1 lemon,Flaky sea salt or kosher salt,Handful of basil leaves,	DIRECTIONS PreparationHeat ¼ cup oil in a medium skillet over medium-high. When it just starts to shimmer, add garlic and season generously with kosher salt and black pepper. Cook, stirring constantly, until garlic is just turning golden around the edges, about 2 minutes. Stir in red pepper flakes, then add tomatoes and cook, tossing occasionally, until tomatoes look plumped and some of the skins start to split, about 2 minutes.Reduce heat to medium. Cover pan and cook, stirring tomatoes every couple of minutes and lightly smashing them with a wooden spoon to encourage them to release some juices, until mixture is saucy and tomatoes are slightly deflated but still hold some shape, 5–7 minutes.Meanwhile, strip leaves off Swiss chard stems and tear into bite-sized pieces (or bigger, your call). Reserve stems for your next sauté. Transfer leaves to a medium bowl.Reduce heat under tomatoes to medium-low (sauce should be bubbling gently). Carefully crack eggs into a large measuring glass, then slip one at a time into tomato mixture, spacing them evenly apart around perimeter of pan. Season eggs with salt and pepper, cover pan, and cook until whites are set but yolks are still runny, 4–6 minutes.While eggs are cooking, toast bread until crisp. Drizzle with oil, then firmly rub outside of lemon onto toasts to release aromatic oils from peel (you’ll smell it!). Sprinkle toasts with sea salt.Squeeze about 2 Tbsp. lemon juice over greens, then toss in basil. Drizzle some oil over and season with kosher salt and black pepper. Toss again to combine.Scoop an egg out of pan, spooning it up from underneath to keep the yolk intact, and transfer to a small shallow bowl. Spoon extra sauce around egg and sprinkle with sea salt. Repeat with remaining eggs. Serve with salad and toasts alongside.Do Ahead: Tomato mixture can be made 1 day ahead. Let cool; cover and chill. Reheat over medium until simmering before adding eggs.
264	/tomato-and-roasted-garlic-pie	Tomato and Garlic Pie Recipe 	 Bon Appetit	2½ pounds mixed heirloom tomatoes, cored, sliced ¼-inch thick,3 tablespoons olive oil,¾ teaspoon kosher salt, divided, plus more,¼ teaspoon freshly ground black pepper, plus more,6 garlic cloves,½ cup (1 stick) unsalted butter,9 ounces Stoned Wheat Thins or other whole grain crackers,2 large eggs,10 ounces Taleggio cheese, rind removed, coarsely grated (about 1½ cups),2½ ounces finely crumbled Parmesan (about ½ cup),½ cup mayonnaise,1 tablespoon chopped thyme, plus ½ teaspoon leaves,1 small shallot, thinly sliced,A 9-inch-diameter springform pan,	DIRECTIONS PreparationPlace a rack in middle of oven; preheat to 475°. Arrange tomatoes on a rimmed baking sheet, covering entire surface (it’s okay if they overlap). Drizzle with oil; season with salt and pepper. Roast until tomatoes begin to look dry on top, 25–30 minutes. Let cool.Meanwhile, cook garlic and butter in a small saucepan over medium-low heat, swirling often, until butter foams and milk solids turn golden, 5–8 minutes. Strain through a fine-mesh sieve into a heatproof measuring cup; transfer garlic and toasty bits to a cutting board. Finely chop and set aside.Reduce oven temperature to 375°. Pulse crackers and ¼ tsp. salt in a food processor until fine crumbs form (you should have about 2 cups). Add eggs and 6 Tbsp. garlic butter and pulse until mixture is the consistency of wet sand.Transfer to springform pan. Using a flat-sided measuring cup, press crumbs firmly onto bottom and 1½" up sides of pan. Bake crust until fragrant and edge is just starting to take on color, 8–10 minutes. Transfer pan to a wire rack and let crust cool.Mix Taleggio, Parmesan, mayonnaise, chopped thyme, remaining ½ tsp. salt, remaining ¼ tsp. pepper, and reserved chopped garlic in a medium bowl. Gently dollop half of cheese mixture over bottom of crust, then spread into an even layer with an offset spatula (don’t press too hard or you will break the crust). Layer half of tomato slices over and press down to even out layers. Repeat with remaining cheese mixture and tomatoes. Brush remaining garlic butter over tomatoes. Top with shallot, then scatter thyme leaves over.Bake pie until filling bubbles vigorously and crust is browned, 60–75 minutes. Let cool 1 hour before serving.Do Ahead: Pie can be made 1 day ahead. Cover loosely and chill (it’s really good cold).
265	/pineapple-and-mezcal-tonic	Pineapple and Mezcal Tonic Recipe 	 Bon Appetit	3 cups pineapple juice, chilled,1¾ cups mezcal,½ cup fresh lime juice,1 cup demerara or raw sugar,2 limes, cut into wedges,3 12-ounce cans seltzer,Maraschino cherries and cocktail umbrellas (for serving),	DIRECTIONS PreparationCombine pineapple juice, mezcal, and lime juice in a large pitcher. Cover and chill until cold, about 30 minutes.Place sugar on a small plate. Rub a lime wedge on rim of an 8-oz. glass. Dip rim into sugar. Fill glass with ice cubes and pour in pineapple mixture until glass is two-thirds full. Top with seltzer and stir to combine. Garnish with same lime wedge, a cherry, and a paper umbrella.
266	/caramelized-onions	Caramelized Onions Recipe 	 Bon Appetit	2 large yellow onions, peeled (about 1 pound),2 tablespoons unsalted butter,Kosher salt,Low-sodium chicken broth or water (for pan; optional),	DIRECTIONS Hide All ImagesHalve both onions through root end. Using the tip of your knife, cut a V-shaped notch around root to remove it (this will ensure that all slices separate when you cut the onion).Place 1 onion half on your cutting board so root end is facing you, then thinly slice onion lengthwise, starting at one side and working all the way to the other (so your knife runs through the root halfway through, not starting or ending at the root end). You’re going for slices that are ¼"–⅛" thick.Repeat same slicing procedure for remaining onion halves. It’s a lot of onion! But it will cook down quite a bit, so it’s best to start with a large quantity.Heat 2 Tbsp. butter in a large saucepan over medium until melted and sizzling. You can use a skillet to cook the onions, but a pan with high sides will keep the onions from flipping out onto your stove. Using a pan that also has a wide base gives water room to evaporate, allowing the onions to caramelize rather than steam.Instead of dumping in all of the onions at once, which would fill the pot and make it hard to stir (which would then cause the ones on the bottom to cook faster), start by adding just a couple of large handfuls to the pot. Cook, stirring, until onions are soft and starting to turn translucent, 1–2 minutes. Stir in a few more handfuls of onion and repeat cooking and stirring process until you’ve added all the onions. Season with a pinch of salt.Reduce heat to medium-low and continue to cook onions, stirring every few minutes to prevent them from sticking and coloring too much in any one place, until blonde-colored, 15–20 minutes. This is the point of doneness for French onion soup! If you feel like onions are getting too brown around the edges or they’re sticking, reduce your heat a bit.If you’re going for onions that are both softer and more caramelized (say for a patty melt or onion dip), keep cooking, stirring on the regular, until onions are unmistakably golden brown, another 15–20 minutes. Because most of the water has cooked off at this point, there might be some bare spots where the pot could start to burn. If this happens, stir in a splash of broth or water. The liquid will dissolve the cooked-on bits, which the onions will re-absorb.For extra-dark onions, the kind that make a great burger topping, cook until they start to almost blacken around the edges and go slightly crisp, another 10–15 minutes. This requires constant attention so they don’t burn. No one said caramelized onions were quick!Let onions cool in the saucepan, then use or transfer to an airtight container and chill. They will keep up to 1 week.
267	/coconut-chile-palapa-sauce	Coconut-Chile Palapa Sauce Recipe 	 Bon Appetit	1 fresh coconut,16 red Thai chiles,6 dried shiitake mushrooms,¼ cup vegetable oil,1½ heads of garlic, separated into cloves, peeled, finely chopped,1 2-inch piece ginger, peeled, finely chopped,1 bunch scallions, trimmed, chopped,6 makrut lime leaves, thinly sliced, or 1½ teaspoons finely grated lime zest,3 tablespoons sugar,1 tablespoon Diamond Crystal or 2 teaspoons Morton kosher salt,	DIRECTIONS PreparationCut coconut in half by holding it in one hand and striking firmly with the back (blunt side) of a heavy knife or cleaver, rotating the coconut and hitting around the equator until it splits. Whack coconut halves with the back of knife to loosen meat from shell. Shred coconut meat using the large holes of a box grater or the shredding blade of a food processor.Pulse chiles in a food processor until finely chopped (this is to save your hands and nose from their intense heat; if you chop by hand, use gloves!). Transfer to a small bowl.Grind mushrooms in spice mill or with mortar and pestle (you can also use food processor again) until reduced to a powder.Toast coconut in a dry wok or large cast-iron skillet over medium heat, stirring often, until deeply browned in spots (just this side of burnt) 15–20 minutes. Transfer to another small bowl.Heat oil in wok over medium-low. Cook garlic, ginger, and scallions, stirring constantly, until very fragrant, about 3 minutes. Stir in chopped chiles, mushroom powder, toasted coconut, lime leaves, sugar, and salt. Cook, stirring often, until golden brown and very aromatic, about 5 minutes. Let cool before serving.Do Ahead: Palapa can be made 3 months ahead. Cover and chill.
299	/grape-salsa-with-tarragon	Grape Salsa with Tarragon Recipe 	 Bon Appetit	1 small shallot, finely chopped,2 tablespoons Champagne vinegar,¼ teaspoon kosher salt, plus more,2 cups purple grapes, sliced into rounds,1 serrano chile, seeds removed if desired, finely chopped,1 tablespoon finely chopped tarragon,Freshly ground black pepper,	DIRECTIONS PreparationMix shallot, vinegar, and ¼ tsp. salt in a small bowl. Let sit 10 minutes (soaking the shallot takes out the bite, giving you a more mellow, less raw flavor). Drain, reserving soaking liquid; rinse shallot under cold water.Toss shallot, soaking liquid, grapes, chile, tarragon, and 1 tsp. water to combine in another small bowl; season with salt and pepper. Taste and add a little more vinegar or water to adjust acidity if needed.
268	/smoked-beef-ribs-with-salt-and-pepper	Smoked Beef Ribs Recipe Recipe 	 Bon Appetit	¼ cup whole peppercorns,¼ cup Diamond Crystal or 2½ tablespoons Morton kosher salt,10 pounds bone-in, 10-inch-long beef shortribs (about 6 large),½ cup hot sauce, such as Frank’s,A spice mill or mortar and pestle; a chimney starter if using a charcoal grill, or a smoker box if using a gas grill; hardwood chunks or chips,	DIRECTIONS PreparationGrind peppercorns in spice mill or with mortar and pestle until coarsely ground. Transfer to a small bowl; add salt and stir to combine. Slather ribs with hot sauce and sprinkle all of salt mixture all over ribs.If using a charcoal grill, soak wood in water and fill chimney starter halfway up the side with charcoal; light and let burn until coals are covered with a thin layer of ash. Pour contents of chimney onto one side of grill. Arrange 3 chunks of wood or a handful of chips on top of coals. Place grate on grill and cover grill, positioning vent on lid as far from heat source as possible. (This will help draw the smoke up and over the meat as it rises.)If using a gas grill, prepare grill for medium-low, indirect heat, leaving one or two burners off. Place wood chips in smoker box and set over direct heat; cover grill.Stick an ovenproof probe thermometer through top vent if your grill has one. Let fire cool until thermometer registers 250–275°, adjusting vents on bottom and top of grill or control knobs as needed to maintain temperature, about 30 minutes.Grill ribs bone side down over indirect heat, leaving a small gap between each to allow smoke to circulate, and replenishing wood and adding a coal or two of unlit charcoal as needed, until a nearly black crust forms all over ribs and an instant-read thermometer inserted into the thickest part of each piece registers 185°, 2½–3½ hours.Remove ribs from heat, wrap them individually in foil and return to grill grates. Continue to cook over indirect heat, lowering heat as needed to maintain a temperature as close to 225–250° as possible (or transfer to a 225° oven), until ribs are fork-tender and an instant-read thermometer inserted into the thickest part of each piece registers 195°, 2½–3 hours longer. Let rest in foil 20 minutes before serving.
269	/potato-salad-with-mustard-sauce	Potato Salad with Mustard Sauce Recipe 	 Bon Appetit	1¼ pounds peewee, peanut, or baby potatoes (as small as possible), scrubbed,Kosher salt,2 tablespoons apple cider vinegar,2 tablespoons Dijon mustard,2 tablespoons whole grain mustard,2 tablespoons chopped dill pickles,1 tablespoon pickle brine,2 tablespoons chopped dill, plus more for serving,Freshly ground black pepper,2 cups trimmed watercress,Olive oil (for drizzling),	DIRECTIONS PreparationPlace potatoes in a large pot and cover with cold water. Throw in a palmful of salt and bring to a boil. Reduce heat and simmer until fork-tender, 15–20 minutes. Drain, then let cool slightly (the potatoes should be warm when you dress them, which will help them soak up the flavors).Meanwhile, mix vinegar, Dijon mustard, whole grain mustard, pickles, pickle brine, and 2 Tbsp. dill in a large bowl.Slice potatoes in half and transfer to bowl with vinegar mixture; season with salt and pepper and toss to coat. Let cool.Add watercress and toss to coat. Top with more dill, a good drizzle of oil, and more pepper.Do Ahead: Potato salad, without watercress, can be made 1 day ahead. Cover and chill.
270	/watercress-salad-with-radishes-apples-and-lemon	Watercress Salad with Radishes Recipe 	 Bon Appetit	3 large any color radishes (or 4 regular radishes), unpeeled, thinly sliced,1 firm, tart apple, such as Honeycrisp, Pink Lady, or Braeburn, unpeeled, thinly sliced, seeds removed,½ very thinly sliced, seeds removed, peel and flesh coarsely chopped,1 tablespoon fresh lemon juice,Kosher salt, freshly ground pepper,4 cups picked watercress with tender stems,4 scallions or 2 small spring onions, white and light green parts thinly sliced into rings,2 tablespoons olive oil,	DIRECTIONS PreparationMix radishes, apple, lemon, and lemon juice in a large bowl; season with salt and pepper. Let sit 10 minutes to marinate.Add watercress, scallions, and oil. Season with salt and lots of pepper and toss to coat.
271	/lamb-chops-with-tomato-salad	Lamb Chops with Tomato Salad  Recipe 	 Bon Appetit	2 lamb loin chops (about 10 ounces total),Kosher salt,¼ teaspoon ground cinnamon,1 tablespoon roasted pistachios,2 tablespoons olive oil,1 tablespoon toasted white sesame seeds,Freshly ground black pepper,4 scallions, green parts only, thinly sliced,½ lemon,1 head of Little Gem lettuce or 1 small endive, leaves separated,2 medium heirloom tomatoes (about 10 ounces), cut into 1½–2-inch irregular pieces,A spice mill or mortar and pestle,	DIRECTIONS PreparationSeason lamb all over with salt, then rub with cinnamon, making sure to get into every nook and cranny. Finely grind pistachios in spice mill or with mortar and pestle.Heat oil in a medium skillet over medium until hot and shiny. Cook lamb, turning once, until golden brown, about 3 minutes per side. The goal here is to cook out some of the fat while you brown the meat, so make sure to keep the heat moderate to prevent overcooking before that can happen. Remove from heat and let rest 5 minutes. Reserve 2 Tbsp. pan drippings.Meanwhile, mix pistachios, sesame seeds, and about 6 turns of pepper (1 tsp.) in a medium bowl. Set aside a big pinch of pistachio mixture for serving. Add scallion greens to bowl, along with zest and juice of lemon half. Stir in reserved 2 Tbsp. pan drippings; season with salt. Add lettuce and tomatoes and toss to coat.Sprinkle salad with reserved pistachio mixture. Serve lamb chops (you can slice the meat off, if desired) with tomato salad alongside.
272	/dairy-free-trout-dip	Dairy-Free Trout Dip Recipe Recipe 	 Bon Appetit	1 cup slivered almonds,¼ cup olive oil,½ teaspoon kosher salt, plus more,5 ounces smoked trout, skin and bones removed,2 scallions, dark green and white parts separated, very thinly sliced,½ teaspoon finely grated lemon zest,1 teaspoon fresh lemon juice, plus more,Freshly ground black pepper,	DIRECTIONS PreparationPurée almonds, oil, ½ tsp. salt, and ½ cup water in a high-powered blender on high speed until thick and smooth, about 3 minutes. Transfer almond purée to a medium bowl.Using a fork, smash trout into smaller pieces and mix with scallion whites, lemon zest, 1 tsp. lemon juice, and a big pinch of pepper. Taste and adjust salt and lemon juice accordingly. Transfer to a serving bowl, then top with scallion greens and more pepper.Do Ahead: Dip can be made 2 day ahead. Cover and chill.
273	/berries-with-tea-infused-cream-and-pistachios	Berries with Tea-Infused Cream and Pistachios Recipe 	 Bon Appetit	4 cups mixed berries (such as blueberries, raspberries, halved blackberries, and/or quartered strawberries),1 4-inch rhubarb stalk, thinly sliced on a bias,4 tablespoons sugar, divided,5 teaspoons  (about 3 tea bags) loose Earl Grey tea, divided,Kosher salt,¾ cup half-and-half,⅓ cup whole-milk yogurt (not Greek),¼ cup finely ground roasted pistachios,	DIRECTIONS PreparationToss berries, rhubarb, 3 Tbsp. sugar, 1 tsp. tea, and a pinch of salt in a large bowl. Let sit, tossing occasionally, until berries begin to soften and release some of their juices, 15–20 minutes.Meanwhile, bring half-and-half to a simmer in a small saucepan over medium heat. Remove from heat and stir in remaining 4 tsp. tea and 1 Tbsp. sugar; let steep 4 minutes. Strain through a fine-mesh sieve into a medium bowl, pressing on solids; discard solids. Let cool before whisking in yogurt. (The mixture should have the consistency of heavy cream.) Divide berry mixture among bowls. Top with yogurt mixture and pistachios.
274	/blackberry-pistachio-crumble-bars	Blackberry-Pistachio Crumble Bars Recipe 	 Bon Appetit	1 lemon,1 cup all-purpose flour,1 cup light brown sugar,1½ teaspoons ground cinnamon,½ teaspoon kosher salt, plus more,½ cup (1 stick) unsalted butter, melted, cooled,¾ cup pistachios or sliced almonds,12 ounces blackberries (from 2 6-ounce containers), halved crosswise if large,1 tablespoon cornstarch,	DIRECTIONS Place a rack in center of oven; preheat to 350°. Using a microplane, finely grate zest of lemon into a medium bowl (keep lemon for juicing later).Add 1 cup flour, 1 cup brown sugar, 1½ tsp. cinnamon, and ½ tsp. salt to bowl with zest and toss with your hands to combine and break up any clumps of sugar.Slowly drizzle ½ cup butter into bowl, stirring with a fork, until no dry spots remain and mixture holds together in pebble-size pieces.PreviousNextIf you’re using pistachios, chop on cutting board. It’s okay to have some larger and some finer pieces, but try not to leave any nuts whole. Add to bowl with flour mixture and toss to distribute. If you’re using sliced almonds, no need to chop first–just toss them in.Press half of pistachio crumb mixture (about 1½ cups) evenly across bottom of 8x8" pan. Flatten into pan by pressing very firmly with your fingers and palm. This compact layer will bake into a firm, sturdy bottom crust, and it will be much easier to slice into neat bars. Save remaining crumb mixture for later.Bake until nuts are golden brown and crust is visibly darkened in color, 15–20 minutes. Let cool about 10 minutes. This step firms the crust further, and dries it out, so fruit topping won’t make it soggy.Meanwhile, cut zested lemon in half. Working over another medium bowl, insert fork into lemon flesh and twist it to extract juice from one half (fish out and discard any seeds). You should have about 2 Tbsp. juice. Add 12 oz. blackberries, 1 Tbsp. cornstarch, and a pinch of salt; stir with a rubber spatula to coat berries.Scrape blackberry mixture over slightly cooled crust and use spatula to distribute fruit into an even layer.Using your hands, sprinkle reserved crumb mixture over berries in an even layer.Bake bars until top of crumble is browned, nuts are toasted, and juices from berries are bubbling just a bit around the edges, 25–30 minutes.Let cool completely before serving. Cut into bars or squares.
275	/raspberry-trifle-with-custard-and-whipped-cream	Raspberry Trifle Recipe Recipe 	 Bon Appetit	4 cups whole milk,2 cups heavy cream,¼ cup (½ stick) unsalted butter, cut into pieces,¼ teaspoon kosher salt,1 vanilla bean, split lengthwise,10 large egg yolks,1 cup sugar,¼ cup cornstarch,2 pounds ripe raspberries, divided,¾ cup plus 1 tablespoon sugar,2 cups heavy cream,⅛ teaspoon kosher salt,Sponge cake or store-bought angel food, sponge, or pound cake (at least 4 cups),¼ cup orange liqueur, divided,2 ounces  freeze-dried raspberries or red luster dust (optional),A 3-quart trifle bowl,	DIRECTIONS PreparationCustardStir milk, cream, butter, and salt in a large saucepan, then scrape in vanilla seeds; add pod. Bring to a simmer over medium heat, stirring occasionally, until mixture is warm and butter is melted.Meanwhile, whisk egg yolks and sugar in a medium bowl until very pale and light, about 3 minutes. Add cornstarch, whisking until no dry spots remain. Whisking constantly, gradually add warm milk mixture. Return mixture to saucepan and cook over medium-high heat, whisking constantly, until custard is thick and pudding-like in texture, and begins to boil, about 6 minutes.Strain custard through a fine-mesh sieve into a medium bowl, using a rubber spatula to help press it through. Cover with plastic, pressing directly onto surface, and chill until cold, at least 2 hours.Do Ahead: Custard can be made 3 days ahead. Keep chilled.Compote and AssemblyCook 1 lb. raspberries and ¾ cup sugar in a large saucepan over medium heat, stirring occasionally and skimming foam from surface, until thick and jammy, 6–8 minutes. Remove from heat and let sit 5 minutes. Transfer to a medium bowl and gently fold in remaining 1 lb. raspberries until coated, being careful not to break them up. Cover and chill until cold, about 2 hours.Using an electric mixer on high speed, beat cream, salt, and remaining 1 Tbsp. sugar in a large bowl until stiff peaks form. Cover and chill.Trim edges of 13x9" sponge cake to square off. Cut cake lengthwise into 5 strips about ⅛" thick; these will be placed inside the trifle bowl, flush against the glass, to create the appearance of an even and continuous band of cake for each layer. Cut or tear remaining cake into ½" pieces (you will need about 4 cups).Using an offset spatula, evenly spread ½ cup whipped cream into bottom of trifle bowl. Arrange a strip of cake inside bowl with cut side flush against the glass. Gently press cake into whipped cream to secure. Repeat with another strip of cake, trimming to fit, until cake strips touch at ends to make a continuous ring. Arrange about 2 cups cake pieces in a single layer over cream (and within cake band), pressing gently to secure.Brush 2 Tbsp. orange liqueur over cake layer. Spread half of raspberry compote over, then gently press down into cake layer. Place whole berries against the glass to create a ring of berries (check outside of bowl as you go). Using offset spatula, spread about 2 cups custard over raspberry layer. At this point, your trifle bowl should be a little less than half full. If filling is past that point, hold back a bit on next layers. (On the other hand, if Paul Hollywood is giving you side-eye and you want to win this thing, spoon out some custard to get back down to the midway mark.)Top custard layer with about 1½ cups whipped cream, spreading wall-to-wall in a thin, even layer. Repeat with remaining cake strips, cake pieces, orange liqueur, raspberry compote, and custard. Finally, top with whipped cream. The bowl should now be completely full with cream billowing over the top.Loosely cover trifle with plastic wrap and chill at least 5 hours and up to 12 (it will settle a bit as it chills).For a traditional look, swirl cream decoratively with offset spatula. For a modern presentation, place the dull edge of a knife or other flat-edged tool against top rim of bowl and scrape any excess cream off the edge. This will give you a flat layer of cream perfectly flush with top rim of bowl.If desired, pulverize dried raspberries in a blender on medium-high speed until very finely ground. Transfer to a fine-mesh sieve and dust over trifle until completely covered. Or, for a red disco finish, sprinkle luster dust over trifle, letting a little cream peek through here and there.Serve chilled.
276	/caramelized-banana-and-almond-nice-cream	Caramelized Banana and Almond Nice Cream Recipe 	 Bon Appetit	2 tablespoons virgin coconut oil,3 large ripe but firm bananas, peeled,1 tablespoon dark brown sugar,¼ teaspoon kosher salt,¼ cup coconut cream or coconut milk,¼ cup almond butter,	DIRECTIONS PreparationHeat oil in a medium nonstick skillet over medium. Add bananas and cook, undisturbed, until dark brown underneath, about 3 minutes. Turn and continue to cook, turning occasionally, until caramelized around the edges but still mostly firm, 2–3 minutes more. Add brown sugar and salt and toss just to coat bananas.Transfer bananas (along with any liquid) to a small silpat-lined rimmed baking sheet (or a baking sheet coated lightly with nonstick spray). Freeze until hard, about 3 hours.Let bananas soften just until you’re able to break them into large clumps (they should still be mostly frozen so this is really just a few minutes) and transfer to a food processor. Pulse until finely chopped, scraping down occasionally, then continue to pulse until a smooth paste forms, about 2 minutes. Add coconut cream and pulse until smooth and creamy, about 1 minute more. Add almond butter and pulse just until combined.Transfer nice cream to an airtight container and freeze until firm, at least 3 hours.Do Ahead: Nice cream can be made 2 weeks ahead. Keep frozen. If too hard, let soften for a few minutes before scooping.
277	/rose-aperol-spritz	Rosé-Aperol Spritz Recipe 	 Bon Appetit	¾ cup passion fruit juice, chilled,¼ cup Aperol,¼ cup fresh lime juice,4 teaspoons sugar,1 750ml bottle sparkling rosé, chilled,Ruby red grapefruit wedges (for serving),	DIRECTIONS PreparationWhisk passion fruit juice, Aperol, lime juice, and sugar in a large pitcher until sugar is dissolved. Stir in rosé.Serve spritz in large ice-filled wine glasses. Garnish with a grapefruit wedge.
278	/salmon-burgers-with-pickled-cucumbers-and-watercress	Salmon Burgers Recipe Recipe 	 Bon Appetit	1½ pounds boneless, skinless center-cut salmon, patted dry,5 scallions, green parts finely chopped, white parts thinly sliced,1 1-inch piece ginger, peeled, finely grated,1 garlic clove, finely grated,2 tablespoons plus ⅔ cup mayonnaise,Kosher salt,1 teaspoon toasted sesame oil,4 teaspoons unseasoned rice vinegar, divided,3 medium Persian cucumbers, shaved lengthwise,½ serrano chile, very thinly sliced crosswise,1 teaspoon sugar,¼ cup (or more) vegetable oil,½ cup rice flour,2 cups tender herbs, such as torn mint and/or cilantro leaves with tender stems,¾ cup trimmed watercress,2 teaspoons toasted white sesame seeds (optional),4 brioche buns, lightly toasted,	DIRECTIONS PreparationCut salmon into 2" pieces. Transfer one-third of salmon (about 8 oz.) to a food processor and process, scraping down sides, until mixture is very smooth and paste-like. Add remaining salmon and pulse 4–5 times until pieces are no bigger than ¼" (be careful not to make it too smooth). Transfer to a large bowl.Mix in scallion greens, ginger, garlic, 2 Tbsp. mayonnaise, and 1 tsp. salt; toss to combine. Form mixture into 4 patties about ¾" thick. Transfer to a parchment-lined rimmed baking sheet and cover with plastic wrap. Chill at least 1 hour or up to 3 (you’ll want to chill the patties so that they hold their shape before getting cooked).Meanwhile, mix sesame oil, 1 tsp. vinegar, remaining ⅔ cup mayonnaise, and a pinch of salt in a small bowl; set aside until ready to use.Toss cucumbers with a pinch of salt in another small bowl. Massage with your hands for a few minutes, squeezing lightly to expel water; discard cucumber liquid. Add chile, sugar, and 2 tsp. vinegar to bowl; toss to coat. Chill until ready to assemble burgers.Heat oil in a large nonstick skillet over medium-high until oil begins to shimmer. Remove salmon patties from fridge right before cooking and sprinkle with flour just to coat the outside (you won’t need all of it). The patties will be a little loose but you can always pat them back together with your hands before they hit the pan. Working in batches and adding more oil in between batches if needed, cook patties until golden brown, about 3–4 minutes on each side (you don’t want to overcook).Toss herbs, watercress, sesame seeds, if using, scallion whites, remaining 1 tsp. vinegar, and a pinch of salt in a medium bowl. Build burgers with buns, patties, reserved special sauce, herb mixture, and pickles.
279	/easy-homemade-caesar-dressing	Easy Homemade Caesar Dressing Recipe Recipe 	 Bon Appetit	3 oil-packed anchovy fillets, chopped,1 large garlic clove, chopped,¾ teaspoon (or more) kosher salt,1 large egg yolk,2 tablespoons fresh lemon juice,¾ teaspoon Dijon mustard,¼ cup plus 2 tablespoons vegetable oil,3 tablespoons Parmesan, finely grated,	DIRECTIONS PreparationMound anchovies, garlic, and salt on a cutting board. Using the side of a chef’s knife, mash and chop until well combined, then continue to work mixture, holding knife blade at an angle, until a smooth paste forms. (Alternately, you can use a mortar and pestle or mini chopper to do this step.)Whisk egg yolk, lemon juice, and mustard in a medium bowl. Place a kitchen towel in a medium saucepan, then place bowl in pan. (This holds the bowl in place while you whisk with one hand and pour oil with the other.)Adding drop by drop to start and whisking constantly, drizzle a few drops of oil into yolk mixture. Continue, going slowly, until mixture looks slightly thickened and glossy. Continue to whisk, gradually adding oil in a slow, steady stream until all oil has been used and mixture looks like mayonnaise. Add a dash of water and whisk, adjusting with more water if needed, until dressing is the consistency of heavy cream. Add anchovy mixture and Parmesan and whisk until smooth. Taste and adjust seasoning with salt, if needed.
280	/carrot-ginger-dressing	Carrot-Ginger Dressing Recipe Recipe 	 Bon Appetit	2 medium carrots, peeled, thinly sliced,1 1-inch piece ginger, peeled, thinly sliced,½ large garlic clove,1 tablespoon seasoned rice vinegar,1 tablespoon white miso,2 teaspoons fresh lemon juice,2 teaspoons soy sauce,2 teaspoons toasted sesame oil,½ teaspoon kosher salt,1 tablespoon mayonnaise,	DIRECTIONS PreparationPurée carrots, ginger, garlic, vinegar, miso, lemon juice, soy sauce, sesame oil, salt, and ½ cup water in a blender on high speed until solids are very finely chopped, about 30 seconds (mixture will look grainy and watery, but that’s okay). Add mayonnaise and blend on low speed until smooth and creamy.Do Ahead: Dressing can be made 3 days ahead. Cover and chill.
281	/vinegar-braised-chicken-legs	Vinegar-Braised Chicken Legs Recipe 	 Bon Appetit	4 chicken legs (thigh and drumstick, about 3 pounds total),Kosher salt,1 tablespoon olive oil,8 dried shiitake mushrooms,4 medium shallots, peeled, halved lengthwise,2 3-inch cinnamon sticks,1 2-inch piece ginger, peeled, thinly sliced,1 red chile, sliced,8 garlic cloves, crushed,2 star anise pods,1 cup low-sodium chicken broth,1 cup red wine vinegar,⅓ cup golden raisins,2 tablespoons soy sauce,1 tablespoon light brown sugar,Sliced chives (for serving),	DIRECTIONS PreparationSeason chicken with salt. Heat oil in a large Dutch oven or wide pot over medium-high. Cook chicken, skin side down, until skin is golden brown and very crisp, 10–12 minutes. Transfer chicken skin side up to a plate.Add mushrooms, shallots, cinnamon, ginger, chile, garlic, and star anise to pot. Cook, stirring occasionally, until shallots and garlic are lightly browned, about 4 minutes. Add broth, vinegar, raisins, soy sauce, and brown sugar and stir to dissolve sugar. Nestle chicken legs skin side up back into pot. Bring to a simmer and cook, lowering heat as needed to maintain a gentle simmer, until chicken is very tender (knee joints should flex easily), 60–75 minutes.Heat broiler. Transfer chicken to a foil-lined rimmed baking sheet. Increase heat to medium-high and reduce braising liquid until thick enough to lightly coat a spoon, about 5 minutes. Season with salt, if needed.Broil chicken legs just until skin is crisp again, 30–60 seconds. Transfer chicken to a serving platter and spoon braising liquid around it, topping with shallots and aromatic spices. Serve topped with chives.
282	/shrimp-salad-with-cucumbers	Shrimp Salad with Yogurt Recipe 	 Bon Appetit	1 pound rock shrimp or small shell-on shrimp,Kosher salt,¼ cup whole-milk Greek yogurt,2 tablespoons mayonnaise,2 teaspoons fresh lemon juice,2 tablespoons chopped dill, plus more for serving,Freshly ground black pepper,1 tablespoon finely chopped chives,Olive oil (for drizzling),	DIRECTIONS PreparationCook shrimp in a medium pot of simmering salted water until they curl and are cooked through, about 45 seconds (or 3 minutes if using small shrimp). Transfer to an ice bath to cool, then drain and pat dry. If using small shrimp, peel and devein.Mix yogurt, mayonnaise, lemon juice, and 2 Tbsp. dill in a large bowl. Add shrimp, season with salt and pepper, and toss to coat. Top with more dill and chives. Season with pepper, then drizzle with oil.
283	/pupusas	Pupusas Recipe 	 Bon Appetit	¼ cup plus ⅓ cup vegetable oil, divided,½ medium white onion, halved, broken up into individual layers (petals),1 15-ounce can Central American red beans or red kidney beans,Kosher salt,3 cups instant corn masa flour (such as Maseca Instant Corn Masa Mix),4 ounces grated queso Oaxaca or salted mozzarella (preferably Polly-o; about 1 cup),Salvadoran Cabbage Relish (Curtido) and Salvadoran Salsa Roja (for serving),	DIRECTIONS PreparationHeat ¼ cup oil in a large skillet over medium-high. Cook onion, tossing occasionally, until pieces are charred on all sides, 10–12 minutes (oil will smoke and onion will pop, so be careful). Don’t stop cooking at “browned,” they need to go further.Transfer onion to a blender, reserving oil in pan. Add beans and their liquid to blender and purée, gradually adding ¼ cup warm water if mixture is too thick and blender is struggling, until smooth.Heat onion oil over medium. Transfer bean mixture to skillet and cook, stirring and scraping bottom of pan occasionally, until mixture is the consistency of thick Greek yogurt, 5–10 minutes; season with salt. Let cool (refried beans will thicken as they sit, and that’s exactly what you want); set aside.Using a stand mixer fitted with the paddle attachment, beat masa flour, 3 tsp. salt, and 2⅔ cups hot water on medium speed until dough is very thick and sticky (alternatively, mix in a large bowl about 1 minute). Let rest, uncovered, 15 minutes.Meanwhile, mix cheese and bean mixture in a medium bowl.Combine remaining ⅓ cup oil and 1 cup warm water in a medium bowl. Dip both hands in this mixture and rub your hands together to coat. This will prevent dough from sticking to your hands, and will hydrate dough as you assemble.Divide dough into 12 balls (about ¼ cup each), keeping them covered with a damp towel so they don’t dry out. With 1 ball in the palm of your hand, use your thumb of the opposite hand to create an indentation in the center. Pinch sides to create a well for the filling (it should look like half of a coconut shell). Fill hole with 2 Tbsp. bean mixture. Pinch dough around filling to enclose (it’s okay if some is poking out), then gently flatten to a 4½–5" disk, dipping your hands in oil-water as needed. Repeat with remaining dough and bean mixture (you may have some filling left over).Cook pupusa in a large cast-iron skillet or griddle over medium heat until center slightly puffs up and pupusa is browned in spots, 3–4 minutes per side. If filling leaks out, simply scrape off pan after pupusa has cooked.Serve with cabbage relish and salsa roja alongside.
284	/easy-one-bowl-upside-down-cake	Easy One-Bowl Upside-Down Cake Recipe 	 Bon Appetit	½ cup (1 stick) unsalted butter, melted, divided,2 10-ounce bags frozen sweet cherries or blueberries (no need to thaw),2 tablespoons plus 1 cup sugar; plus more for serving,2 teaspoons finely grated lemon, lime, or orange zest, plus 2 tablespoons fresh juice,2 cups all-purpose flour,2 teaspoons baking powder,½ teaspoon kosher salt,¼ teaspoon baking soda,3 large eggs, room temperature, beaten to blend,2 cups sour cream or whole plain yogurt, room temperature, divided,A 9-inch round cake pan with 2-inch sides or an 8x8-inch square baking pan,	DIRECTIONS PreparationArrange a rack in center of oven; preheat to 425°. Brush 1 Tbsp. butter all around bottom and sides of cake pan (if you don’t have a pastry brush, use your fingertips). Line bottom of pan with parchment paper, smoothing to eliminate air bubbles between parchment and pan.Toss cherries, 2 Tbsp. sugar, 2 Tbsp. lemon juice, and 2 Tbsp. melted butter in cake pan (fruit will clump up when it hits the melted butter, which is fine). Bake, gently shaking pan once halfway through, until fruit juices are thick and bubbling around sides of pan, 40–50 minutes. Let cool. Reduce oven temperature to 350°.Whisk flour, baking powder, salt, baking soda, and 1 cup sugar in a large bowl. Make a well in the center and pour in eggs, 1 cup sour cream, 2 tsp. zest, and remaining 5 Tbsp. melted butter (it’s okay if butter has re-solidified; go ahead and scrape it in there). Starting in the center, whisk to blend egg mixture, then make larger circles outward to incorporate dry ingredients. Whisk several more times until batter is smooth.Carefully dollop large spoonfuls of batter over fruit (it’s okay if pan is still warm and some fruit juices pool around batter); gently smooth surface. Bake cake until top is golden brown and a tester inserted into the center comes out clean, 45–55 minutes. Let cool in pan 10 minutes, then use a paring knife to loosen cake from edge of pan. Place a wire rack over pan, then swiftly invert rack and pan; cake should release from pan on its own. Lift cake pan off cake, peel off parchment, and marvel at your creation. If some of the cherries cling to the parchment, tuck them back into place. Let cake cool completely.Whisk remaining 1 cup sour cream with a tablespoon or two of sugar and dollop on each slice before serving.
285	/roasted-strawberry-and-tahini-buttermilk-shake	Roasted Strawberry and Tahini Buttermilk Shake Recipe 	 Bon Appetit	1 pound strawberries, hulled, halved,3 tablespoons raw sugar,Kosher salt,1 frozen banana,½ cup buttermilk,3 tablespoons tahini,Crushed toasted sesame seeds (for serving; optional),	DIRECTIONS PreparationPreheat oven to 400°. Toss strawberries with sugar and a pinch of salt on a parchment-lined rimmed baking sheet. Let sit, tossing occasionally, until sugar dissolves, about 5 minutes. Roast, tossing halfway through, until strawberries are soft and release their juices, 20–25 minutes. Let cool.Transfer three-quarters of strawberries to a blender. Add banana, buttermilk, tahini, and 1 cup ice; blend until smooth. Using a metal spoon, smash remaining strawberries to a jammy consistency.Divide smoothies and strawberries among glasses and top with sesame seeds, if using.
286	/stir-fried-udon-with-pork	Better-than-Takeout Stir-Fried Udon Recipe 	 Bon Appetit	2 tablespoons vegetable oil, divided,4 cups very coarsely chopped green cabbage (from about ¼ medium head),2 7-ounce packages instant udon noodles, flavor packets discarded,2 teaspoons toasted sesame oil,8 ounces ground pork,5 scallions, white and pale-green parts coarsely chopped, dark-green parts thinly sliced,2 teaspoons finely grated fresh ginger (from a 1-inch knob),1 teaspoon crushed red pepper flakes,⅓ cup mirin,⅓ cup soy sauce,1 tablespoon toasted sesame seeds, plus more for serving,	DIRECTIONS PreparationHeat 1 Tbsp. vegetable oil in a large skillet over medium-high. Add cabbage and cook, tossing often, until edges are browned, about 4 minutes. Reduce heat to low and continue to cook, tossing often, until thickest parts of cabbage leaves are tender, about 4 minutes longer. Remove from heat and set skillet aside.Place udon in a large heatproof bowl (or pot if you don’t have one) and cover with 6 cups boiling water. Let sit 1 minute, stirring to break up noodles, then drain in a colander. Transfer noodles back to bowl and toss with sesame oil. Transfer cabbage to bowl with noodles. Wipe out skillet.Heat remaining 1 Tbsp. vegetable oil in same skillet over medium-high and add pork, breaking up and spreading across surface of pan with a spatula or tongs. Cook pork, undisturbed, until underside is brown, about 3 minutes. The pork will never brown if you’re fussing with it the whole time, so when we say “undisturbed,” that means keep your paws off it and let the heat of the pan and the pork do their thing. When pork is browned, break up meat into small bits. Cook, tossing, just until there’s no more pink, about 1 minute. Add chopped scallions (the pale parts), ginger, and red pepper. Continue to cook, tossing often, until scallions are softened and bottom of skillet has started to brown, about 1 minute. Add udon mixture, mirin, and soy sauce and cook, tossing constantly, until noodles are coated in sauce (be sure to scrape bottom of skillet to dissolve any browned bits), about 45 seconds. Remove from heat and fold in 1 Tbsp. sesame seeds and dark-green parts of scallions. Top with more sesame seeds before serving.
288	/slow-roasted-lapsang-salmon-with-spring-vegetables	Slow-Roasted Lapsang Salmon with Spring Vegetables Recipe 	 Bon Appetit	3 tablespoons (about 6 tea bags) plus ½ teaspoon lapsang tea,1¼ pounds center-cut skinless, boneless salmon fillet,Kosher salt,6 tablespoons olive oil, divided,2 cups sugar snap peas (about 8 ounces), trimmed, thinly sliced on a bias,1 ½-inch piece ginger, peeled, finely grated,1 garlic clove, finely grated,2 tablespoons Champagne or white wine vinegar,Freshly ground black pepper,1 cup pea shoots (tendrils) or trimmed watercress,½ cup mint leaves, torn,1 small watermelon radish, thinly sliced on a mandoline,	DIRECTIONS PreparationCombine 3 Tbsp. tea and 1¼ cups boiling water in a small bowl. Let steep 3 minutes; strain through a fine-mesh sieve into another small bowl, discarding solids. Combine tea and salmon in a large resealable plastic bag. Chill at least 2 hours or preferably overnight.Preheat oven to 300°. Remove salmon from marinade and pat dry. Transfer salmon to a parchment-lined rimmed baking sheet; season with salt. Pour 3 Tbsp. oil over salmon and sprinkle with remaining ½ tsp. tea. Roast until salmon is just cooked through (the tip of a knife will slide through easily and flesh will be slightly opaque), 20–30 minutes for medium-rare.Meanwhile, bring a small pot of heavily salted water a boil. Add sugar snap peas and cook until bright green and crisp-tender, about 2 minutes. Using a slotted spoon, transfer to an ice bath; drain and pat dry.Mix ginger, garlic, and vinegar in a large bowl. Season with salt and a generous amount of pepper; let sit 5 minutes before whisking in remaining 3 Tbsp. oil. Add snap peas, pea shoots, mint, and radish; toss until coated. Taste and adjust seasoning.Transfer salmon to a platter, breaking into large pieces, then scatter salad over.
289	/grilled-broccoli-with-avocado-and-sesame	Grilled Broccoli with Avocado and Sesame Recipe Recipe 	 Bon Appetit	½ cup white balsamic vinegar or unseasoned rice vinegar,¼ cup dry white wine or water,3 tablespoons sugar,1 tablespoon kosher salt,3 jalapeños, halved lengthwise, seeded,1 avocado, halved,1 small garlic clove, finely chopped,¼ cup tahini,1 teaspoon finely grated lemon zest,7 tablespoons fresh lemon juice, divided,⅓ cup cilantro leaves with tender stems, plus more for serving,8 tablespoons olive oil, divided,Kosher salt, freshly ground pepper,1 pound broccoli (about 2 medium heads), stems peeled, heads halved lengthwise,1 medium red onion, sliced into ½-inch rings,1 tablespoon toasted sesame seeds,	DIRECTIONS PreparationPickled JalapeñosBring vinegar, wine, sugar, and salt to a simmer over medium-high heat in a small saucepan. Place jalapeños in a small bowl or jar and pour brine over. Let sit until cool, or at least 1 hour.Do Ahead: Pickled jalapeños can be made 1 week ahead. Cover and chill.Broccoli and DressingPrepare a grill for medium, direct heat. Purée one avocado half, garlic, tahini, lemon zest, 5 Tbsp. lemon juice, ⅓ cup cilantro, 4 Tbsp. oil, and 2 Tbsp. water in a blender, adding a splash of water if needed, until smooth. Season with salt and pepper.Toss broccoli and onion with 2 Tbsp. oil; season with salt and pepper. Grill, turning occasionally, until broccoli crowns are dark brown in places and stems are crisp-tender, 5–7 minutes. Let cool slightly.Coarsely chop broccoli and onion. Toss in a medium bowl with remaining 2 Tbsp. lemon juice and 2 Tbsp. oil; season with salt and pepper.Spread tahini dressing on a serving platter and top with broccoli mixture. Drain some of the pickled jalapeños (you will have extra). Top broccoli mixture with remaining chopped half of avocado, sesame seeds, drained jalapeños, and more cilantro.
290	/toast-with-spring-vegetables	Sheet Pan Toasts with Spring Vegetables and Mashed Peas Recipe 	 Bon Appetit	½ pound small carrots, scrubbed, cut into 1½-inch pieces on a diagonal,5 ounces mushrooms, such as baby trumpets, morels, or shiitakes, halved, sliced if large (about 2½ cups),6 red radishes, halved, quartered if large,¼ cup olive oil, divided, plus more for drizzling,Kosher salt,1 10-ounce package frozen peas,1 garlic clove, finely chopped,½ teaspoon finely grated lemon zest,1 tablespoon fresh lemon juice, plus more for serving,1 ounce coarsely grated Parmesan (about ¼ cup), plus more shaved for serving,Freshly ground black pepper,4 ½-inch-thick slices sourdough bread, such as miche,1 pound asparagus, trimmed, cut into ½-inch-thick pieces,4 scallions, cut into 1-inch pieces,2 tablespoons thinly sliced mint leaves,	DIRECTIONS PreparationPreheat oven to 425°. Toss carrots, mushrooms, radishes, and 2 Tbsp. oil on a large rimmed baking sheet; season with salt. Roast, tossing occasionally, until lightly browned and halfway tender, 15–20 minutes.Meanwhile, mix peas and garlic in a medium bowl. Pour boiling or very hot water over and let stand until peas are thawed, about 5 minutes. Drain well and return to bowl. Add lemon zest, 1 Tbsp. lemon juice, 1 oz. Parmesan, and 2 Tbsp. oil. Mash well, preferably with a potato masher, until mixture is broken down and creamy; season with salt and pepper.Drizzle bread with oil; season lightly with salt. Toss asparagus and scallions with vegetables on baking sheet and arrange bread around the edges. Continue to roast until all vegetables are crisp-tender and browned and bread is lightly toasted, 7–9 minutes longer.Divide mashed pea mixture among bread slices and cut each in half. Mound roasted vegetables on top of peas. Drizzle with oil, then top with mint, more lemon juice, and shaved Parmesan.
291	/gluten-free-pizza-crust	Gluten-Free Pizza Crust Recipe 	 Bon Appetit	2 teaspoons sugar,1 teaspoon instant or active dry yeast,2¼ cups gluten-free baking flour, preferably King Arthur Measure for Measure (about 10 ounces),⅓ cup almond meal,3 tablespoons ground flaxseeds,1 tablespoon Diamond Crystal or 1¾ teaspoons Morton kosher salt,1½ teaspoons baking powder,¼ cup olive oil, plus more for pans,1 tablespoon plus 1½ teaspoons apple cider vinegar,Pizza sauce, cheese, and herbs (for serving),	DIRECTIONS PreparationCombine sugar and 1⅓ cups warm (not hot, ideally about 100°) water in a small bowl. Sprinkle yeast over and let stand until yeast is beginning to foam and smells bready (if it doesn’t foam after 10 minutes, get new yeast).Meanwhile, whisk flour, almond meal, flaxseeds, salt, and baking powder in the bowl of a stand mixer fitted with the paddle attachment. Beat in yeast mixture, followed by ¼ cup oil, then vinegar. Continue to beat on medium speed until dough is smooth and sticky (it will have the consistency of cake batter), 2–3 minutes. Cover bowl with plastic wrap and let rise in a warm place until dough is puffed slightly (it will not rise as dramatically as conventional dough would), and poking a finger into dough reveals it has formed bubbles throughout, 1–1½ hours.Preheat oven to 325°. Lightly coat 2 large heatproof nonstick skillets with oil (sticking can be an issue with this dough, so nonstick baking sheets, or rimmed baking sheets lined with a silpat, are good alternatives). Divide dough between skillets (if you only have 1 skillet, chill remaining dough until ready to use). Using a large offset spatula or rubber spatula lightly coated with oil, spread dough to about ¼" thick. (Cook’s Illustrated also suggests spraying plastic wrap with nonstick spray and pressing onto surface of dough to press flat, which also works well; the point is feel free to get creative.) Cover with plastic wrap and let dough rest until just slightly puffed again, 20–30 minutes.Bake, rotating skillets halfway through, until very lightly browned across the top and top of dough springs back, 30–40 minutes.Carefully arrange a rack in top third of oven; increase temperature to 425°. Top crusts as desired with sauce, cheese, and herbs. Bake pizzas until cheese is melted and bubbling and crust is golden brown and crunchy underneath, 10–12 minutes.Do Ahead: Parbaked crusts can be made 1 month ahead; let cool, then wrap in plastic and freeze. Let crusts come to room temperature. Lightly coat skillets again with oil, top crusts as desired, then bake in a 425° oven 10–12 minutes.
292	/homemade-fig-newtons	Homemade Fig Newtons Recipe 	 Bon Appetit	¾ cup all-purpose flour,¾ cup whole wheat flour,1 teaspoon ground cardamom (optional),¾ teaspoon baking powder,¾ teaspoon kosher salt,10 tablespoons unsalted butter, room temperature,¼ cup (packed) dark brown sugar,3 large egg yolks,3 tablespoons honey,1 teaspoon vanilla extract,½ teaspoon finely grated orange zest,2 pints black figs, trimmed, quartered,¾ cup fresh orange juice,6 tablespoons honey,¼ teaspoon kosher salt,1 large egg,All-purpose flour (for dusting),	DIRECTIONS PreparationDoughWhisk all-purpose and whole wheat flours, cardamom (if using), baking powder, and salt in a medium bowl. Using an electric mixer on medium-high speed, beat butter and brown sugar in a large bowl until light and fluffy, 3–4 minutes. Add yolks and beat until mixture is fluffy, about 2 minutes. Add honey, vanilla, and orange zest and beat until incorporated, about 1 minute. Reduce mixer speed to low and slowly add dry ingredients, beating just to blend (dough will be very soft). Divide dough into thirds and wrap each piece tightly in plastic, flattening into a ½" disk. Chill at least 3 hours.Do Ahead: Dough can be made 3 days ahead. Keep chilled.Filling and AssemblyCook figs, orange juice, honey, and salt in a large saucepan over medium heat, stirring occasionally, until figs are very soft and no liquid remains, 25–30 minutes. Using a potato masher or large spoon, smash figs into small pieces and continue to cook, stirring frequently, until mixture is very thick and paste-like, 5–7 minutes. Scrape jam onto a plate and spread into an even layer; chill, uncovered, until cold, about 1 hour.Beat egg and 1 Tbsp. water in a small bowl. Scrape cold jam into a large zip-top bag or disposable pastry bag and cut a ¾" opening at 1 corner (or the tip if using a pastry bag).This dough will sense your fear, so you have to show it who’s boss. It goes from cold and stiff to room temperature, soft, and hard to manage very quickly. If it gets too soft, put it back in the fridge and chill about 10 minutes. If you think you’ve messed up, gather it into a disk, chill, and roll it out again.Roll out 1 disk of dough on a piece of generously floured parchment or waxed paper to a 10"x4½" rectangle about ⅛" thick. Trim edges to make even. With one of the shorter sides facing you, pipe a 1"-thick line of filling slightly off-center lengthwise down dough. Brush long edge of dough closest to filling with egg wash. Using the parchment to help you, fold opposite side of dough up and over jam, aligning all the edges. Very lightly press to seal, then trim sealed edge to square off. Chill 10 minutes.Place a rack in center of oven; preheat to 325°. Using a bench scraper or knife, cut filled dough crosswise into 1" lengths. Transfer to a rimmed baking sheet and brush with egg wash. Chill while you roll out and fill remaining dough. (If you have any dough scraps and filling left over, repeat process to make a few more cookies.) Place all bars on the same sheet, spacing about ½" apart; they will not spread as they bake. Freeze 10 minutes.Bake bars, rotating sheet halfway through, until golden brown and slightly cracked on top, 14–16 minutes. Let bars cool on sheet 5 minutes, then transfer to a wire rack and let cool completely.Do Ahead: Fig Newtons can be made 1 day ahead. Store in an airtight container at room temperature.
335	/red-snapper-shrimp-and-watermelon-ceviche	Red Snapper, Shrimp, and Watermelon Ceviche Recipe 	 Bon Appetit	6 ounces medium shrimp, peeled, deveined,Kosher salt,6 ounces highest-quality skinless red snapper fillet, cut into ½-inch pieces,1 jalapeño, very thinly sliced into rounds,¼  cup fresh orange juice,½ cup fresh lime juice, plus more for serving,½ small watermelon, cut into 1-inch cubes (about 2 cups),½ small red onion, very thinly sliced,1 avocado, chopped,½ cup coarsely chopped cilantro,Chili oil and plantain chips or tortilla chips (for serving),	DIRECTIONS PreparationCook shrimp in a medium pot of boiling salted water until pink on the outside but just barely cooked on the inside, about 45 seconds. Transfer to an ice bath; drain and pat dry. Cut shrimp into ½" pieces and transfer to a large bowl. Add red snapper, jalapeño, orange juice, and ½ cup lime juice; toss to combine. Chill, tossing occasionally, at least 20 minutes or up to an hour.Add watermelon, onion, and avocado and toss to coat. Season with salt; toss in cilantro.Spoon ceviche into a large shallow bowl or divide among bowls. Drizzle with chili oil and more lime juice. Serve with chips alongside.
293	/kombu-chicken-soup-with-carrots-and-mushrooms	Kombu Chicken Soup with Carrots and Mushrooms Recipe 	 Bon Appetit	10 ounces mature spinach (about 1 bunch), trimmed,3 6x4-inch pieces dried kombu,6 cups homemade or store-bought low-sodium chicken stock,1 cup bonito flakes,2 tablespoons mirin,2 tablespoons soy sauce,Kosher salt,2 boneless, skinless chicken breasts, halved lengthwise, thinly sliced crosswise,1 medium carrot, peeled, cut into 2-inch matchsticks,4 ounces shiitake mushrooms, stemmed, thinly sliced,Toasted sesame seeds (for serving),	DIRECTIONS PreparationHeat ¼ cup water in a large skillet over medium. Once you see steam, add spinach to water and cook, tossing often, until spinach begins to wilt, about 2 minutes (work in batches if necessary). Transfer to a colander and let cool. Squeeze spinach to remove excess water, then coarsely chop; set aside.Bring kombu and stock to a simmer in a large saucepan over low heat. Remove from heat and let sit 10 minutes. Return to a simmer and add bonito flakes. Remove from heat and let sit 2 minutes. Strain kombu mixture through a fine-mesh sieve into a large bowl.Wipe out saucepan and return broth to saucepan. Add mirin and soy sauce; season with salt. Bring to a simmer over medium heat, then add chicken, carrots, and mushrooms. Cook until chicken is cooked through and mushrooms and carrots are just tender, 4–6 minutes.Divide spinach among bowls and ladle in soup. Sprinkle sesame seeds over.Do Ahead: Broth (without vegetables) can be made 2 days ahead. Let cool; cover and chill.
294	/salvadoran-salsa-roja	Salvadoran Salsa Roja Recipe 	 Bon Appetit	5 medium ripe tomatoes, quartered,½ medium white onion, coarsely chopped,2 serrano chiles, coarsely chopped,1 garlic clove,5 teaspoons chicken bouillon powder (optional),2 tablespoons olive oil,	DIRECTIONS PreparationPurée tomatoes, onion, chiles, garlic, and bouillon powder, if using, in a blender until smooth.Heat oil in a large skillet over medium. Carefully pour tomato mixture into pan; it will spit and bubble, so stand back! Cook salsa, stirring occasionally, until thick and darker in color, 20–30 minutes. Let cool and serve at room temperature or chilled.
295	/chicken-curry-pot-pie	Chicken Curry Pot Pie Recipe 	 Bon Appetit	4 tablespoons unsalted butter,1 large onion, chopped,1 green apple, peeled, chopped,1 delicata squash, scrubbed, or 1 small butternut squash, peeled, cut into ¾-inch pieces,3 medium carrots, peeled, cut into 1-inch pieces,1 medium russet potato, peeled, cut into ½-inch pieces,1 small daikon, peeled, cut into ¾-inch pieces,6 garlic cloves, thinly sliced,1 1-inch piece ginger, finely chopped,2 tablespoons curry powder (preferably S&B),2 tablespoons all-purpose flour, plus more for dusting,2 cups low-sodium chicken broth,¼ cup soy sauce,3 tablespoons cornstarch,Kosher salt,1 ½ pounds skinless, boneless chicken thighs, cut into 1-inch pieces,1 sheet frozen puff pastry (one 14-ounce package or half of a 17.3-ounce package) or pie dough,1 large egg, beaten to blend,	DIRECTIONS PreparationPreheat oven to 425°. Heat butter in a large shallow braising pot or large skillet (around 12" in diameter) over medium. Cook onion and apple, stirring often, until very soft, 8–10 minutes. Add squash, carrots, potato, daikon, and garlic and cook, stirring occasionally, until vegetables are partly tender, 12–15 minutes. Add ginger and sprinkle with curry powder and 2 Tbsp. flour; cook, stirring to coat, just until curry powder darkens, about 1 minute. Whisk broth, soy sauce, and cornstarch in a small bowl until smooth. Add broth mixture to pot and bring to a simmer, stirring often. Cook, still stirring frequently, until mixture is very thick. Taste and season with salt, if needed. Add chicken and stir to evenly distribute. The mixture will look so thick at this point that it will seem wrong. Trust us, the vegetables and chicken will release liquid as they cook under the pastry, creating a rich and just-thick-enough sauce as they do so.Roll out puff pastry on a lightly floured surface until large enough to cover pot with an overhang of about 1" on all sides. Drape pastry over pot and press firmly around edges to adhere. Lightly brush with egg and cut 2–3 small slits in the center so that steam can escape.Bake pot pie until crust is golden brown, about 18–22 minutes, then reduce oven temperature to 350° and continue to bake until filling is bubbling around the edges and crust is well browned, 40–45 minutes longer. Let sit 10 minutes before serving.
296	/open-faced-squash-black-bean-sandwich	Open-Faced Roasted Squash Sandwich Recipe 	 Bon Appetit	1 large delicata squash, halved, seeded, sliced ½ inch thick,4 large shallots, cut into ½-inch pieces,6 tablespoons olive oil, divided,1 tablespoon plus 1 teaspoon chili powder, divided,Kosher salt, freshly ground pepper,1 15-ounce can black beans,¼ head of red cabbage, thinly sliced,8 slices whole wheat bread, toasted,Pickled peppers and their brine, sliced avocado, salsa, and cilantro leaves (for serving),	DIRECTIONS PreparationReal Talk: If you can’t find delicata squash, which you can identify by its long oblong shape, pale yellow skin, and distinctive green stripes, that’s totally fine. Acorn or half of a butternut squash will work just great too. And here’s how to chop one up if you’ve never done it before.Preheat oven to 450°. Toss squash, shallots, 3 Tbsp. oil, and 2 tsp. chili powder on a rimmed baking sheet and roast until squash is browned and tender, 15–20 minutes.Meanwhile, combine beans and their liquid with remaining 3 Tbsp. oil and 2 tsp. chili powder in a medium skillet; bring to a boil over medium-high heat. Smash beans with a potato smasher, meat pounder, large spoon, or whatever you’ve got handy until mixture is all nicely smashed and smooth. Continue to cook until mixture is creamy, about 5 minutes.Spread bean mixture onto toast. Toss cabbage with 2 Tbsp. pickled pepper brine in a medium bowl. Pile on cabbage, avocado, salsa, and cilantro over bean mixture. Top with squash mixture and pickled peppers.Do Ahead: Squash can be roasted 1 day ahead; cover and chill. Bean mixture can be made 1 day ahead; cover and chill.
297	/shepherds-pie	Shepherd's Pie Recipe 	 Bon Appetit	3 tablespoons olive oil, divided,6 ounces slab bacon, cut into ½-inch pieces,2 pounds ground lamb or beef,Kosher salt,2 medium onions, finely chopped,1 small fennel bulb, finely chopped,1 large carrot, finely chopped,2 celery stalks, finely chopped,2 tablespoons tomato paste,1 tablespoon all-purpose flour,1 cup dry red wine,2 cups low-sodium chicken broth,1 tablespoon finely chopped rosemary,1 tablespoon thyme leaves,3 pounds Yukon Gold potatoes,Kosher salt,1 cup half-and-half or whole milk,½ cup (1 stick) unsalted butter,2 large egg yolks,½ cup sour cream,Freshly ground black pepper,A potato ricer or food mill,	DIRECTIONS PreparationFillingHeat 1 Tbsp. oil in a large skillet over medium. Cook bacon, stirring often, until browned and crisp, 8–10 minutes. Transfer bacon to a plate with a slotted spoon.Increase heat to medium-high and cook half of ground lamb in same skillet undisturbed until well browned underneath, about 4 minutes. Break up lamb using 2 spoons or spatulas, then continue to cook, tossing occasionally and breaking into small pieces, until nearly cooked through but with some pink still remaining. Season with salt and transfer to plate with bacon. Repeat with another 1 Tbsp. oil and remaining lamb. Resist the temptation to cook all of the lamb in one batch; it will steam instead of searing, and you’ll miss out on the flavor that comes from browning.Heat remaining 1 Tbsp. oil in same skillet and add onions, fennel, carrot, and celery. Season with salt and cook, stirring occasionally, until vegetables are lightly browned and very soft, 12–15 minutes. Add tomato paste and flour and cook, stirring constantly, until paste darkens, about 1 minute. Add wine, bring to a simmer, and cook until reduced by half (it should no longer smell boozy), about 5 minutes. Add broth, rosemary, and thyme; return meat to skillet and simmer, stirring occasionally, until liquid is almost completely evaporated and any remaining sauce is the consistency of gravy, 15–20 minutes. Transfer filling to a 3-qt. baking dish.Do Ahead: Filling can be made 4 days ahead. Let cool; cover and chill.AssemblyPlace potatoes in a large saucepan and add water to cover by at least 2”; season generously with salt. Bring to a boil, reduce heat, and simmer until a paring knife easily slides through potatoes, 25–35 minutes. Let cool slightly.Bring half-and-half and butter to a simmer over medium heat.Halve potatoes, skin and all (skins won’t go through ricer or mill, but you can peel if you really want to), and pass through ricer or food mill set over a large bowl. If you don’t have a ricer or food mill, use a potato masher and aim to get the potatoes as smooth as possible. Mix in warm half-and-half mixture. Whisk egg yolks and sour cream in a small bowl, then mix into potatoes; season with salt and pepper.Carefully top filling with half of mashed potatoes; smooth out over filling so that no meat is peeking up through potatoes. Repeat with remaining potatoes, swirling decoratively.Bake shepherd’s pie until filling is bubbling around edges and top is golden brown, 45–50 minutes.Do Ahead: Pie can be assembled (but not baked) 3 days ahead. Cover and chill.
298	/bittersweet-chocolate-souffles	Bittersweet Chocolate Soufflés Recipe 	 Bon Appetit	1 tablespoon unsalted butter, plus more room temperature for ramekins,¼ cup plus 3 tablespoons sugar, plus more for ramekins and sprinkling,6 ounces bittersweet chocolate (70% cacao), coarsely chopped,2 tablespoons brewed coffee,3 large egg yolks,2 teaspoons vanilla extract,5 large egg whites, room temperature,1 teaspoon kosher salt,1 cup best-quality vanilla ice cream, melted (such as Häagen-Dazs Vanilla Bean),Four 6–7-ounce ramekins,	DIRECTIONS PreparationPreheat oven to 425°. Brush bottoms, sides, and rims of ramekins with butter, using straight upward strokes all the way around. Dust with sugar and tap out excess (the upward strokes and dusting of sugar will give soufflé mixture something to cling to as it climbs above top edge of ramekin); set aside.Heat chocolate, coffee, and remaining 1 Tbsp. butter in a large heatproof bowl set over a large saucepan of barely simmering water (do not let bowl touch water), stirring, until chocolate is melted and mixture is smooth. Let cool slightly.Whisk yolks and vanilla into chocolate mixture. It will look grainy; whisk in 2 tsp. water and the mixture will become smooth and glossy again.Beat egg whites in the very clean bowl of a stand mixer fitted with the whisk attachment on medium speed until frothy, about 30 seconds (you can also use a handheld beater, or do this by hand with a balloon whisk). Add salt and continue to beat on medium-high until soft, creamy peaks form, about 2 minutes. Slowly sprinkle in ¼ cup plus 3 Tbsp. sugar and continue to beat until firm, shiny, glossy peaks form (if they look dry or clumpy, you’ve gone too far; check out this video before you start).Using a large spatula, fold one-third of egg whites into chocolate mixture to lighten. Fold in remaining egg whites in two additions, using large, deliberate strokes all the way to bottom of mixture to incorporate whites without deflating, until barely any streaks remain. Spoon into prepared ramekins, filling them completely and mounding batter over rim. Using a large offset spatula, bench scraper, or back of a chef’s knife, scrape edge across tops of ramekins to level, which will encourage a nice flat top on finished soufflé (discard excess batter, or scrape into another dish and bake separately). Tap ramekins lightly on counter to help settle batter. Sprinkle with more sugar, then gently run your thumb inside rim of ramekin just around lip to create a small circular indentation (this helps soufflés rise with straight sides; be careful not to rub off butter coating underneath).Place ramekins on a rimmed baking sheet and transfer immediately to oven. Reduce temperature to 400° and bake soufflés until they have risen and wobble slightly when jostled, 12–15 minutes. Immediately spoon into centers and pour some melted ice cream inside.
342	/savory-palmiers-with-roasted-garlic-and-rosemary	Savory Palmiers with Roasted Garlic and Rosemary Recipe 	 Bon Appetit	8 garlic cloves, smashed,¼ cup olive oil,1 tablespoon chopped rosemary,½ teaspoon crushed red pepper flakes,Kosher salt,1 17-ounce package frozen puff pastry, preferably all-butter, thawed,All-purpose flour (for surface),1 large egg, beaten to blend,	DIRECTIONS PreparationReal Talk: What the heck is a “palmier”, anyway? These French pastries (pronounced “pahlm-yay” in case your friends ask) are traditionally lacquered  with sugar, then rolled up. They’re also adorably called “elephant ears.” We filled these palmiers with a garlic-rosemary blend to make them less dessert-y. The cook time for the garlic is correct—just be sure to cook it over super-low heat.Preheat oven to 400°. Cook garlic and oil in a small saucepan over low heat until garlic is bubbling around the edges but not taking on color, about 2 minutes. Continue to cook until garlic is softened and tender and your kitchen smells like garlic, 15–20 minutes. Add rosemary, red pepper, and a few generous pinches of salt and increase heat to medium. Cook, stirring occasionally, until rosemary is fragrant and garlic is golden, about 2 minutes. Be patient and let everything cool. Mash garlic mixture with a fork or potato masher to a coarse paste. There’s your filling!Roll out pastry on a lightly floured surface just to smooth out any creases. If you’re using a package of pastry that has 2 sheets, simply stack the sheets and roll out to a rectangle between ¼"–⅛" thick. Smear garlic mixture over pastry in an even layer, spreading to edges (a small offset spatula is good for this).Okay, here comes the fun part: With 1 long side facing you, fold both long sides in toward the center line so the edges meet in the middle (do not overlap); press down gently to flatten. Brush exposed pastry with egg wash (which is just a beaten egg that will make the dough a beautiful color after baking). Now roll the sides you just folded lengthwise toward the center to form a double-spiral log with a seam running down the middle. Squeeze all along length of log to adhere. Roll whole log away from you 90° so seam is facing away from you. Trim about ½" off 1 end to clean up the edge, then slice log crosswise into ½"-thick pieces (you should have about 15).You’re almost done! Transfer pieces cut side up to a parchment-lined baking sheet, spacing about 2" apart. Brush outside edges of pastry with egg wash, avoiding cut sides on top. Chill until pastry is firm, 10–15 minutes.Bake palmiers 10 minutes, then reduce oven temperature to 350° and continue to bake until puffed and golden all over, 20–30 minutes. Let cool before serving.Do Ahead: Palmiers can be baked 8 hours ahead. Let cool, then cover with plastic and let sit at room temperature until ready to serve.
300	/double-almond-chocolate-brownie	Double-Almond Chocolate Brownie Recipe 	 Bon Appetit	½ cup almonds,4 ounces unsweetened chocolate, coarsely chopped,¾ cup (1½ sticks) unsalted butter,⅓ cup unsweetened cocoa powder,1 tablespoon plus 1 teaspoon espresso powder,2 teaspoons vanilla extract,Nonstick vegetable oil spray,5 ounces almond paste,4 large eggs, room temperature,¾ teaspoon kosher salt,1½ cups sugar,1 cup all-purpose flour,¾ cup bittersweet chocolate wafers or chips,	DIRECTIONS PreparationPreheat oven to 350°. Toast almonds on a rimmed baking sheet, tossing halfway through, until golden brown, 8–10 minutes. Let cool, then coarsely chop; set aside.Meanwhile, heat chocolate, butter, and cocoa powder in a medium heatproof bowl set over a medium saucepan of barely simmering water, stirring occasionally, until melted and smooth. Remove from heat and stir in espresso powder and vanilla. Let cool.Increase oven temperature to 375°. Lightly coat an 8x8" baking dish with nonstick spray, then line with parchment paper, leaving a 2" overhang on 2 sides. Coat parchment with nonstick spray.Roll out almond paste between 2 sheets of parchment to an 8x8" square (it will be very thin; it’s okay if there are some holes and/or jagged edges).Using an electric mixer on medium-high speed, beat eggs and salt in a large bowl until foamy, about 5 minutes. Gradually add sugar and continue to beat until very thick and foamy, 5–8 minutes more. Reduce mixer speed to low, add cooled chocolate mixture, and beat to combine. Fold in flour until no streaks remain.Spread half of batter in prepared pan; smooth top. Lay sheet of almond paste over batter. Spread remaining batter over almond paste; smooth surface. For fudgy brownies, bake until edges are slightly puffed but center is still slightly wobbly, 22–25 minutes. For cakey brownies, bake until edges are puffed but center is set, 25–30 minutes. Immediately top with chocolate wafers and let melt, then spread with an offset spatula to cover top of brownie. Top with reserved almonds and let cool.Using parchment overhang, lift brownie out of pan and transfer to a cutting board. Cut into 16 squares.Do Ahead: Brownie can be made 3 days ahead. Wrap tightly in plastic and chill.
301	/one-skillet-corn-chilaquiles	Corn Chilaquiles Recipe 	 Bon Appetit	12 ounces tomatillos,8 scallions, spiky end trimmed, divided,2 ears of corn, husks and silk removed,½ rotisserie chicken,1 lime,3 tablespoons olive oil, divided,1 12-ounce jar pickled jalapeños,½ bunch cilantro, divided,Kosher salt,⅓ cup sour cream,1 9-ounce bag corn tortilla chips,1 ripe avocado,	DIRECTIONS Hide All ImagesTake 10 minutes and prep all of your ingredients. Remove and discard husks from tomatillos and rinse off any sticky residue (don’t worry, it’s normal). Cut larger ones in half and set aside on cutting board. Cut 6 of the 8 scallions into 1" pieces. Thinly slice remaining 2 scallions and set aside on your board. Pull skin and bones off chicken and discard. Shred meat with your fingers and set aside on your cutting board. Cut lime into wedges and set aside.PreviousNextHeat 1 Tbsp. oil in a large skillet over medium until shimmering. Add whole corn cobs, 1" pieces of scallions, and tomatillos (cut side up).Cook, rotating corn and tomatillos and tossing scallions occasionally, until vegetables are lightly charred all over. This will happen at different times. The scallions and tomatillos will cook fastest, 3–4 minutes. As they’re done, transfer them to a large bowl.The corn will take longest, 8–12 minutes total, so keep rotating cobs. When corn is lightly charred all over, transfer to cutting board and let cool; keep skillet close by because you’re going to use it again in a few minutes.Pick a small handful of cilantro leaves and tender stems and set aside. Transfer tomatillos and charred scallions to a blender and add 6 rings of pickled jalapeños (or more if you like it spicy), remaining cilantro, and 2 Tbsp. water. Starting on low speed and eventually increasing to high, blend until mixture is completely smooth. With the motor running, stream in remaining 2 Tbsp. oil to emulsify. Season salsa with salt; set aside.DID YOU MAKE A DOUBLE BATCH OF SALSA? GOOD. HERE’S HOW TO USE IT.PreviousNextTake a few minutes to cut kernels off of the now-cool-enough-to-handle corn cobs. Do this directly on cutting board.Place sour cream in a small bowl and squeeze in juice from 1 or 2 lime wedges, then stir to combine; set aside.PreviousNextHeat reserved skillet over medium-low and pour in salsa directly from blender, scraping in every last bit with a rubber spatula. Cook, stirring often with spatula, until salsa is bubbling around the edges, about 2 minutes.Fold in half of reserved chicken and half of corn kernels.Still working over medium-low heat, fold in all but a handful of the tortilla chips, turning mixture with spatula and breaking up chips into smaller pieces until coated. Make sure to scrape around sides of skillet to incorporate any remaining sauce. If you’re using a thicker tortilla chip, there should be just enough sauce to coat all the chips in a thin layer. If you’re using thinner chips, there’s a chance the mixture will be a little dry, so we recommend adding in batches and holding back some chips if there doesn’t seem to be enough sauce.Remove skillet from heat and tuck remaining chips into top.Now add all the garnishes: Top chilaquiles with remaining chicken and corn, then scatter sliced scallions over. Dot top with more pickled jalapeños. Cut avocado in half, remove pit, and scoop flesh out of skins with a spoon. Cut into slices and arrange over top of skillet. Dollop with sour cream mixture and top with remaining cilantro sprigs. Serve with lime wedges alongside.PreviousNext
302	/overnight-oats-with-soft-cooked-egg-and-miso-braised-kale	Overnight Oats with Soft-Cooked Egg and Miso-Braised Kale Recipe 	 Bon Appetit	4 large eggs, room temperature,1 tablespoon olive oil,1 bunch Tuscan kale, tough stems removed, leaves coarsely chopped,1 tablespoon mirin,1 tablespoon soy sauce,1 tablespoon white miso,Overnight Oats,1 cup plain whole-milk Greek yogurt,Kosher salt,2 scallions, thinly sliced,Furikake seasoning and chili oil (for serving),	DIRECTIONS PreparationCook eggs in a medium saucepan of boiling water for 6 minutes. Immediately transfer to a bowl of ice water and let sit until cool, about 5 minutes. Carefully peel eggs under running water (yolks will be partially set); set aside.Heat oil in a medium saucepan over medium. Add kale and cook, tossing, until wilted, about 2 minutes. Add mirin, soy sauce, miso, and ¼ cup water and stir until miso is dissolved. Bring to a simmer over low heat, partially cover, and cook until kale is tender, 5–10 minutes.Divide oats and yogurt among bowls, spooning yogurt into centers. Spoon kale mixture along with juices over yogurt, then place an egg on top. Season eggs with salt, then top with scallions and furikake. Drizzle with chili oil.Do Ahead: Eggs can be boiled 3 days ahead (do not peel); cover and chill. Braised kale can be made 4 days ahead; cover and chill.
303	/onion-fritters-with-herbs-and-feta	Onion Fritters with Herbs and Feta Recipe 	 Bon Appetit	14 medium scallions, ends trimmed, cut into ¼-inch slices,⅓ cup all-purpose flour,½ teaspoon baking powder,1 cup chopped dill,1 cup chopped parsley,½ cup crumbled Greek feta,2 large eggs, room temperature, beaten to blend,2 tablespoons plus ½ cup olive oil, divided,Kosher salt, freshly ground pepper,Tzatziki sauce (for serving),	DIRECTIONS PreparationRinse and drain scallions. Transfer to a large bowl, then cover with 4 cups hot water. Let sit 15 minutes to soften and mellow in flavor. Drain again and pat dry with paper towels. Wipe bowl dry and return scallions to bowl.Whisk flour and baking powder in a small bowl. Toss dill, parsley, and feta with scallions until combined. Add dry ingredients and toss to coat. Stir in eggs and 2 Tbsp. oil until a very loose batter forms; season generously with salt and pepper.Heat remaining ½ cup oil in a large nonstick skillet over medium. Working in batches, spoon scoops of scallion mixture into skillet (about 1 oz. per fritter), flattening gently with a spatula. Cook until golden brown and fritter holds its shape, 5–7 minutes per side. Transfer to a wire rack; season with salt. Serve tzatziki sauce alongside warm fritters.
304	/cornmeal-jalapeno-biscuits-with-mushroom-gravy	Cornmeal Jalapeño Biscuits with Mushroom Gravy Recipe 	 Bon Appetit	5 tablespoons olive oil,1 pound crimini mushrooms, quartered,Kosher salt,8 ounces maitake or shiitake mushrooms, cut into bite-size pieces,2 tablespoons unsalted butter, cut into pieces,2 large shallots, chopped,6 garlic cloves, thinly sliced,2 large sprigs thyme,4 teaspoons all-purpose flour,1 large onion, thinly sliced,2 large bunches Tuscan kale, ribs and stems removed, thinly sliced,2 bunches collard greens, ribs and stems removed, thinly sliced,1 ¾ cups heavy cream,Freshly ground black pepper,1 ¼ cups all-purpose flour,1 cup fine-grind cornmeal,2 teaspoons baking powder,1 teaspoon kosher salt,1 teaspoon sugar,½ teaspoon baking soda,½ cup (1 stick) chilled unsalted butter, cut into pieces,1 cup buttermilk,4 scallions, chopped,1 jalapeño, seeds removed if desired, finely chopped,4 ounces sharp cheddar, coarsely grated (about 1 ½ cups),	DIRECTIONS PreparationMushroom GravyHeat 2 Tbsp. oil in a large skillet over medium-high. Cook crimini mushrooms, tossing occasionally, until browned and tender, about 5 minutes; season with salt. Transfer to a large plate.Add another 1 Tbsp. oil to same skillet and cook maitake mushrooms, tossing occasionally, until nicely browned, about 5 minutes. Add butter, shallots, garlic, and thyme. Season with salt and cook, reducing heat if needed to avoid scorching and tossing often, until shallots are softened. Sprinkle in flour and toss to coat mushrooms. Transfer to plate with crimini mushrooms. Clean skillet.Combine remaining 2 Tbsp. oil and onion in clean skillet and set over medium heat. Cook, tossing occasionally, until softened, about 4 minutes. Add kale and collard greens a handful at a time, seasoning with pinches of salt as you go and stirring until wilted before adding more. Cook, stirring occasionally, until all greens are tender, 8–10 minutes. Remove from heat and stir in mushrooms, cream, and 2 Tbsp. water; pluck out thyme sprigs. Season gravy generously with salt and pepper. Transfer to a 3-qt. baking dish.Do Ahead: Gravy can be made 1 day ahead. Let cool; cover and chill.Biscuits and AssemblyPreheat oven to 375°. Whisk flour, cornmeal, baking powder, salt, sugar, and baking soda in a medium bowl. Add butter and work into dry ingredients with your fingers until only pea-size pieces remain. Stir in buttermilk with a few swift strokes of a spoon then add scallions, jalapeño, and cheese. Mix gently until no dry spots remain.Divide dough into 8 rough portions (don’t roll into balls) and evenly space on top of mushroom gravy. Bake, rotating once, until biscuits are golden brown and gravy is bubbling around the edges of the pan, 30–35 minutes. Let sit a few minutes before serving.
305	/mango-yogurt-pudding-with-lucuma-and-chia-seeds	Mango-Yogurt Pudding with Lucuma and Chia Seeds Recipe 	 Bon Appetit	3 small very ripe Ataulfo mangoes or 1 Tommy Atkins mango,⅓ cup plain whole-milk Greek yogurt,2 tablespoons lucuma powder,¼ cup fresh lime juice, divided,Kosher salt,2 teaspoons agave syrup (nectar),1 teaspoon chia seeds,½ teaspoon nigella seeds,	DIRECTIONS PreparationPeel mangoes and remove flesh from pits. Cut mangoes into ½" pieces; set aside ½ cup. Purée remaining mango, yogurt, lucuma powder, 2 Tbsp. lime juice, and a pinch of salt in a food processor or blender, scraping down sides and adding a splash of water if needed to loosen, until mixture is smooth. Divide between 2 glasses. Chill pudding 1 hour to firm up, if needed.Toss reserved ½ cup mango with agave syrup, chia seeds, nigella seeds, a tiny pinch of salt, and remaining 2 Tbsp. lime juice in a small bowl. Top pudding with mango mixture.Do Ahead: Pudding can be made 3 days ahead; cover and chill.
306	/posole-verde-with-chicken	Posole Verde with Chicken  Recipe 	 Bon Appetit	¼ cup olive oil,1 large yellow onion, chopped,6 garlic cloves, sliced,2 teaspoons ground coriander,1 teaspoon ground cumin,½ teaspoon dried oregano (preferably Mexican), plus more for serving,1 whole organic chicken (about 4 pounds),1½ pounds tomatillos, husked, rinsed,4 poblano chiles,3 serrano chiles,2 Cubanelle peppers (or 2 more poblanos),2 15-ounce cans golden or white hominy, rinsed,Kosher salt, freshly ground pepper,2 cups cilantro leaves with tender stems, plus more for serving,½ small red onion, very finely chopped,Lime slices (for serving),	DIRECTIONS PreparationHeat oil in a large heavy pot or Dutch oven over medium. Cook yellow onion and garlic, stirring occasionally, until very tender, 12–15 minutes. Add coriander, cumin, and ½ tsp. oregano and cook, stirring constantly, until very fragrant, about 1 minute.Add chicken and 12 cups water. Bring to a simmer and cook, uncovered and reducing heat as needed to maintain a very gentle simmer, until chicken is cooked through (if it isn’t completely submerged, you can turn it once or twice) and legs wiggle easily in their joints, 40–50 minutes. At this point, you can let chicken and broth cool, then chill  overnight.Meanwhile, preheat oven to 425◦. Spread tomatillos, poblano chiles, serrano chiles, and peppers on a large rimmed baking sheet. Roast, tossing once or twice, until tomatillos are tender and peppers are browned and collapsing, 30–40 minutes. Let cool.Transfer chicken to a cutting board, reserving broth, and let cool until easy to handle. Remove meat from bones and shred into bite-size pieces. Discard bones.Split open chiles and peppers and discard stems and seeds. Discard any skin that can be easily peeled off; otherwise, just leave it on. Reserve baking sheet. Purée tomatillos, chiles, and peppers in a blender until smooth. Stir purée into broth and bring to a simmer.Spread hominy in an even layer on reserved baking sheet and roast, tossing once, until lightly toasted, very fragrant, and just beginning to brown around edges of baking sheet, 12–18 minutes. Scrape into pot with broth.Simmer broth, uncovered and seasoning with salt and pepper as needed, until flavors meld and broth is rich tasting, about 20 minutes. Ladle ½ cup broth into blender. Add 2 cups cilantro and purée until smooth and very bright green, at least 1 minute. Stir chicken into broth and heat through, followed by cilantro purée. Season with salt, if needed.Divide posole among bowls. Top with red onion and cilantro and serve with lime wedges alongside.Do Ahead: Chicken can be cooked 3 days ahead; cool in broth, cover, and chill.
307	/shrimp-tostadas-with-herbed-mojo-de-ajo-slaw	Shrimp Tostadas with Herbed Mojo de Ajo Slaw Recipe 	 Bon Appetit	2 guajillo or New Mexico chiles, cut into thin strips,1 garlic clove, grated,1 tablespoon fresh lime juice,1 tablespoon fresh orange juice,1 tablespoon olive oil,1 teaspoon kosher salt,¼ teaspoon freshly ground pepper,1 pound large shrimp, peeled, deveined,6 corn tortillas,½ cup olive oil, divided,6 garlic cloves,1 habanero chile, stemmed, seeded, quartered,¼ cup plus 2 tablespoons fresh lime juice,¼ cup plus 2 tablespoons fresh orange juice,1 teaspoon sugar,¼ teaspoon ground coriander,¼ teaspoon ground cumin,Kosher salt, freshly ground pepper,¼ small head of cabbage, thinly sliced,½ cup mint leaves,½ cup parsley leaves with tender stems,2 tablespoons chopped oregano leaves,¼ cup finely chopped chives, plus more,	DIRECTIONS PreparationShrimpWhisk chiles, garlic, lime juice, orange juice, oil, salt, and pepper in a medium bowl. Add shrimp, toss to coat, and chill, uncovered, at least 30 minutes and up to 1 hour.Mojo de Ajo and AssemblyWhile shrimp is marinating, preheat oven to 450°. Brush tortillas with 1 Tbsp. oil on both sides and arrange on a rimmed baking sheet. Bake until golden brown in spots and crisp, about 10 minutes. Let cool.Meanwhile, heat remaining 7 Tbsp. oil in a small saucepan over low and cook garlic, stirring occasionally, until soft and golden in spots, 10–15 minutes. Let cool slightly. Transfer garlic and oil to a blender and add chile, lime juice, orange juice, sugar, coriander, and cumin. Blend until smooth. Season liberally with salt and pepper.Heat a large skillet over high and cook shrimp until lightly browned and just cooked through, about 1 minute per side. Transfer to a medium bowl.Toss cabbage and ⅓ cup mojo in a medium bowl; season with salt and pepper. Toss in mint, parsley, oregano, and ¼ cup chives just before assembling.Place a small mound of slaw on tortilla and top with shrimp. Drizzle more mojo over shrimp, then top with chives.
308	/no-nut-granola	No-Nut Granola Recipe 	 Bon Appetit	3 cups old-fashioned oats and/or kamut flakes,2 cups mixed seeds, such as pumpkin seeds (pepitas), sunflower seeds, sesame seeds, flaxseeds, and/or hemp seeds,½ cup cacao nibs,½ cup coconut flakes,½ cup olive oil,½ cup pure maple syrup,1 teaspoon (or more) kosher salt,1½ cups mixed dried fruits, such as golden berries, mulberries, figs, dates, raisins, dried sour cherries, apricots, and/or dried mangoes,	DIRECTIONS PreparationPreheat oven to 350°. Line a rimmed baking sheet with parchment paper or foil.Toss oats, seeds, cacao nibs, and coconut flakes in a large bowl. Add oil and syrup and stir until nicely coated. Season with 1 tsp. salt. Scrape onto prepared sheet, reserving bowl, and bake, stirring and rotating sheet from front to back every 10–15 minutes, until golden brown, 25–35 minutes.Meanwhile, cut dried fruit into small pieces (a pair of kitchen shears is great for sticky ingredients like dates and apricots). Transfer to same large bowl.Let granola cool 5 minutes, then carefully transfer to bowl with dried fruit, reserving baking sheet. Toss well to combine, then transfer back to sheet and let cool completely (granola will crisp as it cools). Taste and season with more salt, if desired.Do Ahead: Granola can be made 2 weeks ahead; store airtight at room temperature, or freeze up to 3 months.
309	/ham-and-cheese-toasties-in-a-bread-basket	Ham and Cheese Toasties in a Bread Basket Recipe 	 Bon Appetit	1 white Pullman loaf, unsliced,3 tablespoons unsalted butter, melted,3 tablespoons Dijon mustard,4 ounces thinly sliced Paris ham or prosciutto cotto,1½ ounces Gruyère, thinly sliced,	DIRECTIONS PreparationReal Talk: As long as your loaf is sturdy enough, you could make your perpendicular cuts at the bottom all the way to the other end, instead of stopping at the midway point. We suggest stopping midway to prevent any leakage and to keep the crust as sturdy as possible, but do what you’re most comfortable with. Slice with confidence—all that bread will come out in the end!Heat broiler. Okay, now you’re going to cut out the interior of the bread and remove it as one big rectangle of carby goodness without messing up the outside crust. It helps to check the step-by-step photos for this, but trust us, it’s easier than you think!Using a bread knife, cut horizontally along top of loaf just below where it starts to dome (if your loaf has a flat top, cut across to remove any crust); set top aside and position bread so cut side is facing up (in other words, you’re looking down at the surface of the exposed inner loaf). Working around perimeter of loaf, cut down parallel to sides and about ¼" from edge; try not to cut all the way through or your toasties will fall through the bottom (sad!).Once you’ve gone all the way around, switch to a knife with a pointed tip (either a slicer or a chef’s knife). Insert blade perpendicularly into longer side of loaf about ¼" in from side and ¼" from bottom, but do not push through to crust on opposite side. Slice through bread, cutting parallel to work surface, until you get to the middle of the loaf, then stop. Rotate bread 180° and repeat on opposite side, only cutting to midpoint again. You should be able to lift out the rectangle of bread at this point (if not, retrace all cuts until bread comes loose).Cut rectangle of bread filling into ¼"-thick slices. Brush 1 side of slices with melted butter. Transfer buttered side up to a rimmed baking sheet. Broil slices until golden brown and toasted, about 2 minutes; let cool.Preheat oven to 400°. Smear untoasted side of half (not all!) of bread slices with mustard, then top with ham and cheese, dividing evenly. Close with remaining bread, toasted side up. Cut each sandwich in half on a diagonal, then tuck sandwiches back into hollowed-out loaf, lining them upright and packing in tightly (you may have an extra sandwich that doesn’t fit, so go ahead and eat it). The tops of the sandwiches should be flush with the top of the loaf...amazing, right? Place dome back on top of bread and wrap loosely in foil (poke the top of foil with your knife for steam to escape). Place loaf directly on oven rack and bake until cheese is melted, 25–30 minutes. Remove foil and let loaf stand uncovered for a few minutes to cool, then serve.Do Ahead: Sandwiches can be assembled, placed in bread loaf, and wrapped in foil 1 hour ahead. Bake just before serving.
310	/brown-butter-and-toffee-chocolate-chip-cookies	Brown Butter and Toffee Chocolate Chip Cookies Recipe 	 Bon Appetit	1 cup (2 sticks) unsalted butter,2 cups all-purpose flour,1 teaspoon baking soda,¾ teaspoon kosher salt,1 cup (packed) dark brown sugar,⅓ cup granulated sugar,2 large eggs, room temperature,2 teaspoons vanilla extract,2 chocolate toffee bars, chopped into ¼-inch pieces (preferably Skor),1½ cups chocolate wafers (discs, pistoles, fèves; preferably 72% cacao),Flaky sea salt,	DIRECTIONS PreparationCook butter in a medium saucepan over medium heat, stirring often, until butter foams, then browns, 5–8 minutes. Transfer brown butter to a large bowl; let cool slightly.Whisk flour, baking soda, and kosher salt in a medium bowl.Add brown sugar and granulated sugar to cooled butter. Using an electric mixer on medium speed, beat butter mixture, scraping down sides of bowl, until incorporated, about 1 minute. Add eggs and vanilla and continue to beat until mixture lightens and begins to thicken, about 30 seconds. Reduce mixer speed to low; add dry ingredients and beat, scraping down sides and bottom of bowl, until just combined. Add candy and chocolate wafers and mix to combine with a spoon or spatula. Let sit at room temperature at least 30 minutes to hydrate flour; dough will look very loose but will thicken as it sits.Arrange a rack in center of oven; preheat to 375°. Line a rimmed baking sheet with parchment paper. Using a 1½-oz. ice cream scoop, portion dough and transfer to prepared sheet, spacing about 3½" apart (alternatively, form dough into ping pong ball-sized pieces with your hands). Do not flatten; cookies will spread as they bake. Sprinkle with sea salt.Bake cookies until edges are golden brown and firm but centers are soft, 9–11 minutes. Let cool on sheets 10 minutes, then transfer to a wire rack and let cool completely.Do Ahead: Cookie dough can be made 3 days ahead; cover and chill. Let dough come to room temperature before baking.
311	/puppy-chow-party-mix	Puppy Chow Party Mix Recipe 	 Bon Appetit	1 12-ounce box Rice Chex cereal (about 10 cups),7 ounces bittersweet chocolate (70% cacao), chopped (about 1¼ cups),¾ cup creamy peanut butter,¼ cup (½ stick) unsalted butter,1½ teaspoons kosher salt,1 teaspoon vanilla extract,2½ cups powdered sugar, divided,2 cups peanut or plain M&M’s,2 cups roasted, salted peanuts,2 cups thin pretzel sticks,	DIRECTIONS PreparationPlace cereal in a large bowl. Heat chocolate, peanut butter, butter, and salt in a medium heatproof bowl set over a saucepan of barely simmering water (do not let bowl touch water), stirring, until chocolate is melted and mixture is smooth. Remove from heat and stir in vanilla. Pour chocolate mixture over cereal and toss with 2 spoons or spatulas until coated. Let cool slightly, about 10 minutes.Transfer cereal mixture to a large clean bowl (so powdered sugar doesn’t absorb into chocolate coating from original bowl). Sift ½ cup powdered sugar through a fine-mesh sieve onto cereal, coating entire surface. Toss to coat. Repeat 2 more times.Transfer cereal mixture to 2 parchment-lined sheet trays, spreading evenly. Sift ½ cup powdered sugar over both trays (do not mix). Chill 2 hours or let sit at room temperature overnight (break into individual pieces, but leave some clumps, if sitting out overnight).Transfer cereal mixture and powdered sugar from sheet trays to a large clean bowl and toss to coat. Sift remaining ½ cup powdered sugar over and toss to coat again. Add M&M’s, peanuts, and pretzels; toss to combine.Do Ahead: Puppy chow can be made 2 days ahead. Store in an airtight container at room-temperature.
312	/simple-khichari	Simple Khichari Recipe 	 Bon Appetit	¼ cup red split lentils,¼ cup yellow split mung dal,¼ cup basmati rice,¼ cup white quinoa,2 tablespoons ghee or melted virgin coconut oil,½ teaspoon ground turmeric,6 fresh curry leaves or 2 dried cassia leaves (optional),1 1-inch piece ginger, peeled, very finely chopped (about 1 tablespoon),1 small green Thai chile, finely chopped,2 cups chopped cauliflower florets and/or peeled daikon,1 teaspoon ground fennel seeds,1 teaspoon (or more) Himalayan rock salt (or kosher salt),Cilantro, basil, lime slices, black pepper, and olive oil (for serving),	DIRECTIONS PreparationCover lentils and mung dal with water in a small bowl and let soak 30 minutes. Drain. Meanwhile, rinse rice and quinoa and drain well.Heat ghee in a large pot over medium-low. Add turmeric and toast just until slightly darkened, about 10 seconds. Add curry leaves, if using, ginger, and chile and cook until very fragrant, about 1 minute. Add drained lentils, mung dal, rice, and quinoa and cook, stirring, until nearly dry, 1–2 minutes. Add cauliflower, fennel seeds, 1 tsp. salt, and 4 cups water. Increase heat to medium-high and bring to a boil. Reduce heat and skim off any foam that formed on the surface, then simmer covered until grains and vegetables are very tender, 30–40 minutes; the khichari should be thick, very soft, and just loose enough not to stick to bottom of the pot (add water as needed to loosen). Season with more salt, if needed.Divide among bowls. Top with cilantro, basil, black pepper, and limes. Drizzle with oil.
313	/stovetop-mac-and-cheese	Stovetop Mac and Cheese Recipe 	 Bon Appetit	1 cup whole milk,½ cup heavy cream,½ teaspoon mustard powder,¼ teaspoon cayenne pepper,1 tablespoon cornstarch,8 ounces cream cheese, room temperature, cut into pieces,8 ounces medium cheddar cheese, shredded (about 2½ cups),8 ounces muenster cheese, shredded (about 2 cups),3 ounces Fontina cheese, shredded (about 1 cup; optional),1 pound elbow macaroni,Kosher salt,	DIRECTIONS PreparationSimmer milk, cream, mustard powder, and cayenne in a medium pot over medium heat, stirring and being careful not to let mixture boil, until heated through and well combined, 6–8 minutes. Mix cornstarch and 2 Tbsp. water in a small bowl to make a slurry, then whisk into milk mixture. Bring to a boil and cook, whisking constantly, until mixture thickens, 1–2 minutes. Add cream cheese and cook, whisking occasionally, until mixture is smooth and thick, 2–3 minutes.Reduce heat to medium-low and gradually stir in cheddar, muenster, and Fontina, if using. Cook, stirring occasionally and reducing heat if mixture starts to boil, until cheeses are almost melted (it’s okay if you see a few shreds of unmelted cheese), 4–6 minutes.Meanwhile, cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain and stir into cheese mixture. Gently stir until sauce is smooth and creamy and pasta is evenly coated; taste and season with salt, if needed. Remove from heat; mac and cheese will thicken as it sits. Serve hot.
314	/gochujang-ranch-crispy-chicken-bowl	Gochujang-Ranch Crispy Chicken Bowl Recipe 	 Bon Appetit	¾ cup mayonnaise,½ cup buttermilk,2 tablespoons gochujang (Korean hot pepper paste),2 tablespoons seasoned rice vinegar,2 teaspoons finely grated peeled ginger,1½ teaspoons onion powder,1 teaspoon toasted sesame oil,2 garlic cloves, finely grated,2¼ teaspoons kosher salt, divided, plus more,¼ small head of red cabbage, thinly sliced,Freshly ground black pepper,½ cup (1 stick) unsalted butter,2 cups panko (Japanese breadcrumbs),¼ cup raw sesame seeds,6 skinless, boneless chicken thighs (about 1½ pounds total),1 large egg, beaten to blend,1 tablespoon honey,Cooked rice, sliced scallions, quartered avocado, Sambal Cashews, and lime wedges (for serving),Gochujang, a mixture of miso and hot chiles, can be found at Korean markets and online.,	DIRECTIONS PreparationPlace a rack in middle of oven; preheat to 450°. Whisk mayonnaise, buttermilk, gochujang, vinegar, ginger, onion powder, oil, garlic, and ½ tsp. salt in a medium measuring glass. Taste and season dressing with more salt, if needed. Transfer ½ cup dressing to a medium bowl. Add cabbage and toss to coat; season slaw with salt and pepper. Set aside until ready to serve.Heat butter in a large skillet over medium-high heat. As soon as butter begins to foam, add panko, sesame seeds, and ¼ tsp. salt and toss to coat. Cook, tossing often, until golden brown, 5–7 minutes. Let cool in pan 10 minutes.Meanwhile, place a wire rack inside a rimmed baking sheet. Set chicken on rack and pat dry with paper towels. Whisk egg, honey, ¼ cup dressing, and 1½ tsp. salt in a medium bowl.Toss chicken in egg mixture to coat. Lift chicken from bowl, letting excess drip back into bowl. Coat in panko mixture, pressing to adhere, then return to rack, spacing evenly apart.Bake chicken until cooked through, juices run clear when thighs are pierced with a knife, and panko mixture is slightly darkened in color, 15–20 minutes. Let chicken cool 10 minutes, then slice ½" thick.Divide chicken, slaw, and rice among bowls. Top with scallions, avocado, and cashews. Drizzle with remaining dressing. Serve with lime wedges for squeezing over.Do Ahead: Dressing can be made 8 hours ahead. Cover and chill.
315	/rough-puff-pastry	Rough Puff Pastry Recipe 	 Bon Appetit	1½ cups (3 sticks) unsalted butter, frozen,1 tablespoon sugar,1½ teaspoons kosher salt,2 tablespoons plus 2½ cups all-purpose flour, plus more for dusting,⅓ cup whole milk,	DIRECTIONS PreparationPush butter 1 stick at a time through feeding tube of a food processor fitted with the medium shredding disc to grate (you need to use a bit of force and work quickly, but the food processor can handle it; it’s okay if the ends of each stick don’t make it through). You can also grate frozen butter on the large holes of a box grater; grip butter with a paper towel and work quickly, then freeze again 10 minutes. Transfer grated butter to a medium bowl and toss gently with 2 Tbsp. flour until coated. Transfer to freezer to keep cold.Whisk sugar, salt, and 2½ cups flour in a medium bowl. Add half of frozen butter mixture and toss to coat (return bowl with remaining butter to freezer).Stir milk and ⅓ cup ice water in a measuring cup and drizzle over flour mixture, mixing with a fork until shaggy pieces form. Knead in bowl a couple of times with your hands to form a shaggy dough. Transfer all of the large clumps of dough to a work surface, leaving smaller pieces behind. Drizzle 1 Tbsp. ice water over remaining flour mixture in bowl and knead again to bring together. Add to dough on work surface. Knead dough a couple more times to form a single mass (it’s okay to work dough a bit more than you would for pie dough); the flour should look mostly hydrated with only a couple of dry spots remaining. Press into a 1"-thick square and wrap tightly in plastic. Chill 20–30 minutes.Roll dough on a lightly floured surface to a 18x6" rectangle, dusting underneath with more flour to prevent sticking. Place dough on work surface so short side is facing you. Now imagine that it’s divided into three 6x6" squares stacked in a column.Sprinkle one-quarter (about 1½ oz.) of remaining butter mixture in a single layer inside center square. Fold lower square over butter, lining up outside edges. Sprinkle about one-third (1½ oz. again) of remaining butter over newly folded dough. Fold upper square down and over butter to form a neat 6x6" packet (think of folding a letter; the center does not move).Press dough firmly together on all sides to seal. Rotate dough package 90° counterclockwise so top flap opening is on your right. Roll out dough, dusting with flour as needed, to a 18x6" rectangle again. Repeat folding process, incorporating all remaining butter. Press firmly to seal, wrap in plastic, and chill 20 minutes and up to overnight.Roll out dough on a lightly floured surface to 18x6" rectangle again. Fold in thirds as before (but without incorporating any butter). Rotate 90° counterclockwise as before and roll out to a rectangle again. Repeat folding process one more time. Wrap in plastic and chill at least 20 minutes. Dough is now ready to be rolled out and used.Do Ahead: Rough puff pastry can be made 2 days ahead; keep chilled, or freeze up to 1 month. Thaw overnight in refrigerator before using.
316	/garlic-knots	Garlic Knots Recipe 	 Bon Appetit	1 pound prepared pizza dough, room temperature,All-purpose flour (for dusting),Garlic powder (for dusting),2 tablespoons olive oil, plus more for brushing,¼ cup (½ stick) unsalted butter,5 garlic cloves, finely chopped,2 tablespoons finely chopped parsley,Kosher salt,	DIRECTIONS PreparationDivide dough into 4 pieces, cover with plastic wrap, and let rise 1–1½ hours. Line 2 rimmed baking sheets with parchment paper.Working with 1 piece at a time and keeping remaining pieces covered, roll dough on a lightly floured surface to a 6x4" rectangle. Cut dough into six 4x1" strips. Sprinkle dough all over with garlic powder, then flour. Roll 1 length of dough on work surface with your hands to round out edges (it will look like a worm). Tie into a single knot; the ends should just pass through the center without more than a 1" overhang (this allows the dough to rise in a nice compact shape, and keeping the ends short prevents it from looking like a bow). Transfer to prepared sheet. Repeat with remaining dough. Brush knots with oil, lightly cover with plastic, and let rise in a warm spot until puffed, 1–1½ hours.Preheat oven to 400°. Bake knots until golden brown, 13–15 minutes.Meanwhile, melt butter in a small saucepan over medium heat. Add garlic and cook, stirring, until just softened, about 2 minutes. Remove from heat and stir in parsley and remaining 2 Tbsp. oil; generously season with salt. Transfer butter mixture to a large bowl, add warm knots, and gently toss until coated.
317	/quinoa-banana-muffins	Quinoa-Banana Muffins Recipe 	 Bon Appetit	¾ cup white quinoa,1 teaspoon kosher salt, plus more,Nonstick vegetable oil spray,1¼ cups whole wheat flour,1 teaspoon baking powder,1 teaspoon ground cinnamon,2 very ripe bananas,¼ cup honey,¼ cup (packed) dark brown sugar,1 large egg,½ cup olive oil,1 teaspoon vanilla extract,1 cup blueberries,Raw sugar (for sprinkling),	DIRECTIONS PreparationCook quinoa in a large pot of boiling salted water, stirring occasionally, until tender, 10–12 minutes. Drain well and return to pot. Cover and let steam 10 minutes. Pour off any condensed water, then let cool. Set aside ¼ cup cooked quinoa for topping muffins.Preheat oven to 375°. Coat a standard 12-cup muffin pan with nonstick spray (do not use muffin liners). Whisk flour, baking powder, cinnamon, and remaining 1 tsp. salt in a medium bowl.Mash bananas, honey, and brown sugar in another medium bowl, preferably with a potato masher, until sugar is dissolved and banana is completely mashed. Add egg and continue to mash until combined. Stir in oil and vanilla.Stir banana mixture into dry ingredients just until combined. Stir in blueberries and 2 cups quinoa. Divide batter among muffin cups. Sprinkle lightly with raw sugar and reserved ¼ cup quinoa.Bake muffins until tops are firm, just beginning to brown, and a tester inserted into muffins comes out clean, 30–40 minutes. Let cool slightly before serving.Do Ahead: Quinoa can be cooked 5 days ahead; cover and chill.
318	/ginger-cashew-chicken-curry	Ginger Cashew Chicken Curry Recipe 	 Bon Appetit	1 cup salted, roasted cashews, divided,5 tablespoons unsalted butter, divided,5 teaspoons sambal oelek, divided,Kosher salt,1 pound boneless, skinless chicken thighs, cut into ½-inch pieces,1 large onion, chopped,Freshly ground black pepper,2 tablespoons finely grated peeled ginger,1 tablespoon all-purpose flour,2 cups (or more) milk,2 teaspoons white wine vinegar,Cooked rice (for serving),	DIRECTIONS PreparationReal Talk: The spicy double-roasted cashews are incredibly addictive. Seriously, you should triple the recipe just for snacking purposes. And if you don’t feel like making rice, pick up a couple to-go containers from a neighborhood restaurant.Coarsely chop ½ cup cashews. Melt 1 Tbsp. butter in a large pot over medium heat. Cook chopped cashews and 1 tsp. sambal oelek, stirring occasionally, until nuts begin to toast (yes, you’re double-toasting them), 3–5 minutes. Scrape into a small bowl, season with salt, and set aside.Melt 2 Tbsp. butter in same pot over medium-high heat. Cook half of chicken, stirring occasionally, until just beginning to brown, about 3 minutes. Using a slotted spoon, transfer chicken to a small bowl. Repeat with remaining chicken and 2 Tbsp. butter.Cook onion in same pot, stirring occasionally, until translucent and just tender, 5–8 minutes; season with salt and pepper. Add ginger and remaining 4 tsp. sambal oelek and cook, stirring occasionally, until most of the liquid has evaporated, about 3 minutes. Return chicken and any accumulated juices to pot. Stir in flour to coat and cook until warmed through, about 1 minute. Add milk and remaining ½ cup cashews; gently simmer, adding milk to thin if needed, until sauce is the consistency of heavy cream and chicken is cooked through, about 10 minutes. Season with salt and pepper, then stir in vinegar. Serve with rice and top with reserved cashews.Do Ahead: Curry can be made 1 day ahead; cover and chill.
319	/french-onion-dip	French Onion Dip Recipe 	 Bon Appetit	2 tablespoons olive oil,1 medium onion, finely chopped,2 garlic cloves, finely grated,2 sprigs thyme,1 small shallot, finely chopped,1 cup sour cream,¼ cup finely chopped chives,1 tablespoon fresh lemon juice,Kosher salt, freshly ground pepper,Kettle-cooked potato chips (for serving),	DIRECTIONS PreparationHeat oil in a small skillet over medium. Cook onion, garlic, and thyme, stirring occasionally, until onion is deep golden brown and very soft, 35–40 minutes. Discard thyme and let cool.Mix caramelized onions, shallot, sour cream, chives, and lemon juice in a medium bowl; season with salt and pepper. Let sit 30 minutes to let flavors meld. Serve with potato chips for dipping.Do Ahead: Dip can be made 1 day ahead; cover and chill.
320	/spicy-grilled-cauliflower-steaks	Spicy Grilled Cauliflower Steaks Recipe 	 Bon Appetit	½ cup olive oil, plus more for grill,1 large head of cauliflower (about 2½ pounds),2 canned chipotle chiles in adobo, finely chopped, plus 3 tablespoons adobo sauce,6 garlic cloves, finely grated,6 tablespoons sherry vinegar or red wine vinegar,3 tablespoons mild-flavored (light) molasses,2 tablespoons Diamond Crystal or 1 tablespoon plus ½ teaspoon Morton kosher salt,2 tablespoons paprika,1 tablespoon dried oregano,Lemon wedges (for serving),	DIRECTIONS PreparationPrepare a grill for medium-low, indirect heat (for a charcoal grill, bank coals on one side of grill; for a gas grill, leave one or two burners off); clean and oil grates.Remove toughest outer leaves from cauliflower (leave on any tender inner leaves). Trim stem to create a flat base. Holding cauliflower upright on stem, slice into 4 equal slabs to create steaks.Stir chiles, adobo sauce, garlic, vinegar, molasses, salt, paprika, oregano, and remaining ½ cup oil in a medium bowl to combine.Liberally brush sauce on one side of each cauliflower steak and place steaks, sauce side down, on grill. Brush second side with sauce. Grill cauliflower until charred and beginning to soften, 7–8 minutes. Turn, brush cooked side with sauce, and continue to grill until second side is charred and beginning to soften, 7–8 minutes. Turn again, move over indirect heat, and brush with remaining sauce. Cover grill and continue to grill steaks until tender (a paring knife should slide into centers of steaks with little resistance), 15–20 minutes.Transfer cauliflower steaks to a platter. Serve with lemon wedges for squeezing over.
321	/chicken-and-rice-soup-with-green-chiles-ginger	Chicken and Rice Soup with Green Chiles and Ginger Recipe 	 Bon Appetit	2 teaspoons sugar,1 1-inch piece ginger, peeled, cut into very thin matchsticks,¾ pound boneless, skinless chicken thighs,6 cups homemade chicken stock or low-sodium chicken broth,3 small shallots, halved,4 garlic cloves,¾ cup jasmine rice, rinsed,2 tablespoons fresh lime juice,1 tablespoon (or more) fish sauce,Kosher salt,3 Thai green chiles, thinly sliced crosswise,2 scallions, thinly sliced crosswise,3 tablespoons crushed skin-on, roasted, unsalted peanuts,	DIRECTIONS PreparationCombine sugar and ½ cup hot water in a small bowl, stirring to dissolve sugar. Add ginger and let cool; drain and set aside.Bring chicken, stock, shallots, and garlic to a boil in a large saucepan. Reduce heat and simmer until chicken is cooked through, 20–25 minutes. Transfer chicken and garlic to a cutting board and let cool; discard shallots. Smash garlic to a paste using the side of a chef’s knife; return to saucepan and stir to combine. Shred chicken; set aside.Bring stock mixture to a boil and add rice. Reduce heat and simmer, stirring occasionally, until rice is tender and has broken (soup should have slightly thickened), 30–40 minutes. Stir in lime juice, fish sauce, and reserved chicken; taste and adjust seasonings with more fish sauce and salt if needed.Divide soup among bowls; top with reserved ginger, chiles, scallions, and peanuts.Do Ahead: Soup can be made 3 days ahead; cover and chill. Reheat over medium-low, adding water or stock to thin as needed.
322	/millet-polenta-with-miso-and-scallion-oil	Millet Polenta with Miso and Scallion Oil Recipe 	 Bon Appetit	¾ cup millet,⅓ cup grapeseed or other neutral oil,3 scallions, thinly sliced, plus more for serving,2 tablespoons olive oil,2 medium leeks, thinly sliced (white and light-green parts only),2 garlic cloves, thinly sliced,4 cups  vegetable broth,1 tablespoon plus 1 teaspoon white miso,Freshly ground black pepper,	DIRECTIONS PreparationPulse millet in a blender or food processor until about half of grains are broken. Transfer millet to a small bowl; set aside. Rinse out blender.Heat grapeseed oil in a small saucepan over medium-high until hot. Add 3 sliced scallions and let sizzle just until green parts darken slightly, about 1 minute. Transfer to blender and let cool. Purée until very smooth.Heat olive oil in a large saucepan over medium. Add leeks and garlic and cook, stirring often, until very soft, 8–10 minutes. Add broth and miso and whisk to combine. Bring to a simmer and whisk in reserved millet; season with salt. Bring to a boil, then reduce heat and simmer, uncovered, stirring occasionally, and adding more water by ¼ cupfuls to loosen if needed, until mixture is thick and grains are tender, 40–45 minutes. Taste and season with salt if needed.Divide millet polenta among bowls. Top with scallion oil, more chopped scallions, and black pepper.Do Ahead: Scallion oil can be made 1 week ahead; cover and chill.
447	/achiote-paste	Achiote Paste Recipe 	 Bon Appetit	3 whole cloves,1 bay leaf,¼ cup annatto seeds,2 teaspoons coriander seeds,2 teaspoons cumin seeds,2 teaspoons dried Mexican or Italian oregano,1 teaspoon black peppercorns,1 teaspoon kosher salt,4 garlic cloves,¼ cup distilled white vinegar,1 teaspoon finely grated lime zest,1 teaspoon finely grated orange zest,	DIRECTIONS PreparationBlend cloves, bay leaf, annatto seeds, coriander seeds, cumin seeds, oregano, peppercorns, and salt in a blender on low speed, increasing to high, until finely ground.Add garlic, vinegar, lime zest, and orange zest and continue blending until a coarse paste forms. Transfer to a small airtight container and chill.Do Ahead: Paste can be made 1 month ahead. Store in an airtight container and chill.
323	/juicy-lucy-sliders	Juicy Lucy Sliders Recipe 	 Bon Appetit	8 slices melting cheese (such as American, Swiss, Muenster, cheddar, or pepper Jack), cut in half,2 pounds ground beef chuck (20% fat),Kosher salt, freshly ground pepper,Vegetable oil (for pan),16 potato slider rolls, toasted,Ketchup, mayonnaise, shredded iceberg lettuce, sliced tomato, and dill pickle slices (for serving),	DIRECTIONS PreparationTear halved slices of cheese into even smaller pieces so that you have 16 roughly equal portions. Divide beef into 16 balls (about ¼ cup each). With 1 ball in the palm of your hand, use your pointer finger of the opposite hand to create a small indentation in the center. Fill hole with 1 portion of cheese. Pinch meat around cheese so that it’s in the middle, then gently flatten patty to about ¾" thick. Check to make sure that no cheese is peeking out (if you see any, fix it). Season both sides of patty with salt and pepper. Repeat with remaining beef and cheese.Heat a cast-iron griddle or large heavy skillet over medium until very hot, about 2 minutes. Lightly coat with oil. Working in batches (we recommend testing the first patty before cooking the whole batch because cooking time may vary depending on your stove and pan—cut it in half to see if cheese has melted), cook patties, undisturbed, until outer edges are brown, about 3 minutes. Turn and cook until browned and burger is medium-rare, 2–3 minutes.Serve sliders on rolls with ketchup, mayonnaise, lettuce, tomatoes, and pickles.Do Ahead: Patties can be formed 6 hours ahead; cover with plastic and chill.
324	/overnight-oats-with-banana-maple-syrup-and-tahini	Overnight Oats with Banana, Maple Syrup, and Tahini Recipe 	 Bon Appetit	¼ cup tahini,2 tablespoons (or more) pure maple syrup,2 tablespoons nut milk,½ teaspoon ground cinnamon,Pinch of kosher salt,Overnight Oats,1 cup plain whole-milk Greek yogurt,2 medium bananas, thinly sliced,2 teaspoons toasted sesame seeds,	DIRECTIONS PreparationStir tahini, maple syrup, nut milk, cinnamon, and salt in a small bowl or small measuring cup until smooth. Divide oats and yogurt among bowls, spooning yogurt into centers. Divide banana among bowls and drizzle tahini mixture over. Top with sesame seeds. Drizzle with more maple syrup, if desired.Do Ahead: Tahini mixture can be made 4 days ahead; cover and chill. Rewarm gently before serving.
325	/cream-of-mushroom-soup	Cream of Mushroom Soup Recipe 	 Bon Appetit	½ cup plus 2 tablespoons olive oil, divided,2 pounds mixed mushrooms, such as crimini, shiitake, maitake, and/or oyster, trimmed, torn into bite-sized pieces,Kosher salt, freshly ground pepper,4 medium shallots, chopped,1 large leek, light-green and white parts only, halved, thinly sliced,¼ cup (½ stick) unsalted butter,4 garlic cloves, grated, divided,⅓ cup dry white wine,½ cup all-purpose flour,5 cups low-sodium chicken stock,1½ cups heavy cream,1½ cups whole milk,1 bay leaf,5 sprigs thyme, divided,5 ounces crusty bread, crust removed, cut into 1-inch pieces (about 2 cups),	DIRECTIONS PreparationHeat 3 Tbsp. oil in a large heavy pot over medium-high. Cook half of mushrooms, undisturbed, until browned underneath, 3–4 minutes. Toss and continue to cook, tossing occasionally, until browned on both sides and tender, 4–5 minutes more. Season with salt and pepper and transfer to a medium bowl. Repeat with 3 Tbsp. oil, remaining mushrooms, and salt and pepper. Set aside 1 cup mushrooms; transfer remaining mushrooms to bowl.Heat same pot over medium. Cook shallots, leek, butter, and half of garlic, stirring occasionally, until vegetables are softened but not browned, 4–6 minutes. Add wine and cook, stirring, until liquid is evaporated, 2–3 minutes. Stir in flour and cook until vegetables are coated, about 1 minute. Whisk in stock, cream, and milk and bring to a boil. Add bay leaf, 3 thyme sprigs, and mushrooms (not including the 1 cup) and any accumulated juices. Simmer, uncovered, until soup thickens to a heavy cream consistency, 25–35 minutes. Remove thyme and bay leaf, season with salt and pepper, and add reserved 1 cup mushrooms. Return to a simmer.Meanwhile, pulse bread in a food processor until coarse crumbs form; season with salt and pepper. Heat remaining ¼ cup oil in a large skillet over medium. Cook remaining 2 garlic cloves and 2 thyme sprigs, stirring occasionally, until garlic begins to brown, about 2 minutes. Add breadcrumbs and cook, stirring often, until golden brown and crisp, 7–10 minutes. Transfer breadcrumb mixture to paper towels. Remove thyme; season with salt.Divide soup among bowls, then top with toasted breadcrumbs and a few twists of pepper.
326	/steamed-mackerel-green-chile-dashi	Steamed Mackerel with Green Chile Dashi Recipe 	 Bon Appetit	4 4-ounce boneless, skinless mackerel fillets,Kosher salt,2 dried shiitake mushrooms,1 4x4-inch piece kombu,1 ½-inch piece ginger, finely grated,1 garlic clove, finely grated,3 tablespoons mirin,2 tablespoons soy sauce,¼ teaspoon mild red pepper flakes,½ cup very thinly sliced peeled daikon,½ cup spinach (or kale, cilantro, or parsley), trimmed,½ jalapeño, seeded, chopped,Cilantro leaves (for serving),	DIRECTIONS PreparationSeason fish generously with salt (but don’t go crazy). Let sit 20 minutes to absorb seasoning.Meanwhile, mix mushrooms, kombu, ginger, garlic, mirin, soy sauce, red pepper, and 2 cups water in a medium saucepan fitted with a steamer insert or bamboo steamer. Bring to a simmer over medium heat, discard kombu, and continue to simmer, adjusting heat as needed, until flavors meld, about 5 minutes.Rinse fish and pat dry. Scatter daikon across bottom of steamer insert and lay fish over. Steam fish, maintaining an active simmer in liquid (err on the side of less heat if you aren’t sure), until fish is just opaque at the center and a tester inserted into the thickest part of the fillets meets no resistance, 6–8 minutes.Transfer fish to a plate. Discard mushrooms, then carefully pour steaming liquid into a blender. Add spinach and jalapeño. Remove cap from hole in lid, cover opening with a kitchen towel, and start blender on lowest speed to prevent hot liquid from splashing out the top like a geyser. Gradually increase speed and blend until smooth.Divide fish, daikon, and broth among bowls. Top with cilantro.
327	/rosy-gin-kombucha-cocktail	Rosy Gin-Kombucha Cocktail Recipe 	 Bon Appetit	2 ounces gin,1 ounce Campari,½ ounce fresh lemon juice,½ teaspoon finely grated fresh ginger,5 ounces original kombucha, chilled,Lemon wedges (for serving),	DIRECTIONS PreparationStir gin, Campari, lemon juice, and ginger in a pint glass or measuring cup. Stir in kombucha. Strain through a fine-mesh sieve into an ice-filled Collins glass. Garnish with lemon wedges.
333	/butter-spritz-cookies	Butter Spritz Cookies Recipe 	 Bon Appetit	2¼ cups all-purpose flour,1 teaspoon kosher salt,½ teaspoon baking powder,1 cup (2 sticks) unsalted butter, room temperature,¾ cup sugar,1 large egg,1 teaspoon vanilla extract,Food coloring and colored sugar (optional),A spritz cookie press,	DIRECTIONS PreparationArrange racks in upper and lower thirds of oven; preheat to 350°. Whisk flour, salt, and baking powder in a medium bowl.Using an electric mixer on medium-high speed, beat butter and sugar in a large bowl, scraping down sides occasionally, until pale and very fluffy, about 5 minutes. Add egg and vanilla and continue to beat, scraping down sides once or twice, until mixture is nearly doubled in volume, about 5 minutes more. Reduce mixer speed to low and add dry ingredients. Beat until partly incorporated, then switch to a large spoon and mix until well combined.Divide dough among 3 bowls and add a different food coloring to each, if desired, until you achieve the desired hue. Portion cookies with spritz cookie press according to manufacturer’s instructions on 3 unlined, ungreased baking sheets.Bake cookies, rotating sheets halfway through, until golden brown and set around the edges, 8–10 minutes. Let cool.Do Ahead: Cookies can be made 2 months ahead; store airtight and freeze.
328	/egg-white-cholupa	Egg White Chalupa Recipe 	 Bon Appetit	¼ cup (½ stick) unsalted butter,1 yellow or red bell pepper (or half of each), seeded, finely chopped,1 small red onion, finely chopped,1 jalapeño, seeded, finely chopped,2 garlic cloves, sliced,2 15.5-ounce cans black beans, rinsed, drained,2 cups low-sodium chicken broth or water,2 tablespoons finely chopped cilantro,Kosher salt, freshly ground pepper,Vegetable oil (for frying; about ½ cup),2 corn tortillas,2 tablespoons unsalted butter, divided,6 large egg whites,Kosher salt,¼ cup sour cream,1 cup shredded iceberg lettuce,Hot sauce (for drizzling),1½ ounces shredded ricotta salata (about ⅓ cup),½ avocado, sliced,¼ cup cilantro leaves with tender stems,	DIRECTIONS PreparationStewed Black BeansHeat butter in a large pot over medium. Add bell pepper, onion, jalapeño, and garlic and cook, stirring occasionally, until vegetables are very soft, 10–12 minutes. Add beans and chicken broth. Bring to a simmer and cook, stirring occasionally, until liquid is reduced by half and thickened, 20–25 minutes. Stir in cilantro; season with salt and pepper. Keep warm.AssemblyPour oil into a small skillet to come ¼" up the sides. Heat over medium-high until very hot. Working one at a time, fry tortillas until lightly browned and very crisp, about 1 minute per side. Transfer to paper towels to drain.Melt 1 Tbsp. butter in a small nonstick skillet over medium heat. When butter begins to foam, add 3 egg whites and a pinch of salt and cook, stirring constantly with a rubber spatula and forming a compact bundle, until whites are set but still moist, about 1 minute. Transfer to a plate. Repeat with remaining 1 Tbsp. butter and 3 egg whites.Divide sour cream between tortillas. Top with ½ cup bean mixture, followed by lettuce, egg whites, a drizzle of hot sauce, cheese, avocado, and cilantro.
329	/bacon-butter-radishes	Bacon-Butter Radishes Recipe 	 Bon Appetit	3 tablespoons rendered bacon fat (from about 6 ounces bacon),½ cup (1 stick) unsalted butter, cut into pieces,½ teaspoon hot smoked paprika,½ teaspoon finely grated lime zest,1 teaspoon flaky sea salt, preferably smoked, plus more,1 bunch radishes with greens, scrubbed, tops trimmed to 2 inches,	DIRECTIONS PreparationReal Talk: This recipe requires a little bit of patience as you thicken up the butter. A word of warning: If you wait for a few minutes, then get impatient and place the saucepan in a bowl of ice water (ice bath) to make things go faster, the butter can actually get TOO thick. Be sure to pick one method or the other right off the bat.Heat bacon fat and butter in a small saucepan over low (you only live once, after all) just until butter is melted and combined. Remove from heat and stir in paprika, lime zest, and 1 tsp. salt. Let sit, stirring occasionally, until mixture is the consistency of heavy cream (you can place the saucepan in a bowl of ice water and stir to help speed things up if you’re impatient), about 30 minutes.Dip radishes one at a time into butter, letting excess drip off; if butter starts to set, very gently rewarm over low heat. Transfer radishes to a serving platter and sprinkle with more salt; reserve any leftover butter for another use.Do Ahead: Radishes can be dipped 8 hours ahead; chill. Let come to room temperature before serving.
330	/anise-cookies	Anise Cookies Recipe 	 Bon Appetit	2¼ cups all-purpose flour,1½ teaspoons baking powder,3 large eggs,½ cup granulated sugar,6 tablespoons unsalted butter, melted, cooled,3 tablespoons canola oil,2½ teaspoons anise extract, divided,2 cups powdered sugar,	DIRECTIONS PreparationWhisk flour and baking powder in a medium bowl. Using an electric mixer on medium speed, beat eggs, granulated sugar, butter, oil, and 1½ tsp. anise extract in a large bowl until smooth, light, and foamy, about 2 minutes. Reduce mixer speed to low and add dry ingredients; beat just to combine.Roll tablespoonfuls of dough into balls with your hands. Space at least 1" apart on 2 large parchment-lined baking sheets. Chill until very firm, about 1 hour.Arrange racks in upper and lower thirds of oven; preheat to 350°. Bake cookies, rotating sheets halfway through if coloring unevenly, until golden brown around the edges and tops are firm, 10–12 minutes. Let cool.When cookies are cool, whisk powdered sugar, remaining 1 tsp. anise extract, and 3 Tbsp. water in a large bowl until smooth (glaze should be the consistency of heavy cream; add water by the teaspoonful to loosen if needed). Gently toss cookies in glaze until lightly coated, letting excess drip back into bowl. Transfer to clean parchment-lined baking sheets (you can use a small offset spatula for this, but the glaze is pretty forgiving of any finger marks) and let sit until glaze hardens, about 2 hours.Do Ahead: Cookies, without glaze, can be made 2 months ahead; store airtight and freeze.
331	/classic-miso-soup	Classic Miso Soup Recipe 	 Bon Appetit	1 3x5-inch piece kombu,¾ ounce bonito flakes (about 1½ packed cups),1 tablespoon dried wakame,½ cup silken tofu, cut into ½-inch pieces,¼ cup white miso,1 scallion, very thinly sliced,	DIRECTIONS PreparationCombine kombu and 4 cups water in a medium saucepan. Let sit until kombu softens, 25–30 minutes. Bring to a simmer over medium heat. Immediately remove from heat once water starts simmering; fish out kombu and discard. Add bonito flakes and stir once to submerge them. Bring to a gentle boil, reduce heat, and simmer about 5 minutes. Remove from heat and let steep 15 minutes (this ensures you get the most flavorful broth, or dashi, possible).Meanwhile, combine wakame and 3 Tbsp. water in a small bowl; let sit until wakame is softened; 10–15 minutes.Strain dashi (your broth) through a fine-mesh sieve into a medium bowl. Discard solids, wipe out pot, and return dashi to pot. Add tofu and wakame and bring to a simmer. Remove from heat. Submerge sieve in liquid, add miso to sieve, and stir to liquefy miso (see how to do this here), then press through strainer until miso is dissolved.Divide soup among bowls. Top with scallions.
332	/green-miso-soup-with-soba	Green Miso Soup With Soba Recipe 	 Bon Appetit	1 3x5-inch piece kombu,¾ ounce bonito flakes (about 1½ packed cups),4 ounces dried soba noodles,Kosher salt,1 tablespoon dried wakame,½ cup frozen shelled edamame, thawed,¼ cup white miso,½ cup very finely chopped fresh herbs, such as parsley, cilantro, and/or chives,1 scallion, very thinly sliced,	DIRECTIONS PreparationCombine kombu and 4 cups water in a large pot. Let sit until kombu softens, 25–30 minutes. Bring to a simmer over medium heat. Immediately remove from heat once water starts simmering; fish out kombu and discard. Add bonito flakes and stir once to submerge them. Return to a gentle boil, reduce heat, and simmer about 5 minutes. Remove from heat and let steep 15 minutes (this ensures you get the most flavorful broth, or dashi, possible).Meanwhile, combine wakame and 3 Tbsp. water in a small bowl; let sit until wakame is softened; 10–15 minutes.Cook soba in a medium pot of boiling salted water, stirring occasionally, until al dente, about 6 minutes. Drain, rinse under cold water to stop them from cooking, and drain again. Divide noodles among bowls.Strain dashi through a fine-mesh sieve into a medium bowl. Discard solids, wipe out pot, and return dashi to pot. Add edamame and wakame. Bring to a very gentle simmer. Remove from heat. Submerge sieve in liquid, add miso to sieve, and stir to liquefy miso, then press through strainer until miso is dissolved. Stir in herbs.Ladle soup over soba and top with scallions.
336	/chocolate-sables-with-date-sugar	Chocolate Sablés with Date Sugar Recipe 	 Bon Appetit	1 ounce bittersweet dark chocolate (60–70% cacao),¾ cup all-purpose flour,¼ cup Dutch-processed cocoa powder,½ teaspoon kosher salt,¼ teaspoon baking soda,¾ cup date sugar,10 tablespoons unsalted butter, room temperature,2 large egg yolks,1 teaspoon vanilla extract,1 tablespoon mixed golden flaxseeds, brown flaxseeds, sesame seeds, and/or hemp seeds,½ teaspoon flaky sea salt,	DIRECTIONS PreparationGrate chocolate using the large holes of a box grater. Whisk flour, cocoa powder, kosher salt, and baking soda in a medium bowl.Using an electric mixer on medium-high speed, beat sugar and butter in a large bowl, scraping down sides occasionally, until butter lightens and looks creamy, about 4 minutes. Beat in egg yolks one at a time, beating well between additions. Beat in vanilla and 1 tsp. water. Reduce mixer speed to low and beat in dry ingredients, scraping down sides occasionally, until just combined. Beat in chocolate. Increase speed to medium and beat 30 seconds (this will help develop gluten in the flour, lending a less crumbly texture to the cookies).Transfer dough to a large sheet of parchment paper or plastic wrap. Form dough into a log about 2" thick. Chill until firm, at least 45 minutes.Preheat oven to 350° and line a rimmed baking sheet with parchment. Slice dough with a serrated knife into coins that are a generous ¼" thick. Transfer to prepared baking sheet. Mix seeds and sea salt in a small bowl; sprinkle over cookies.Bake cookies until edges are firm and tops are mostly firm but give just slightly when pressed, 11–13 minutes. Let cool.Do Ahead: Dough can be made 3 days ahead; keep chilled. Sables can be made 4 days ahead; store in an airtight container at room temperature.
337	/blue-cheese-and-bacon-lettuce-boats	Blue Cheese and Bacon Lettuce Boats Recipe 	 Bon Appetit	6 ounces smoky bacon,⅔ cup whole-milk yogurt (not Greek),1 garlic clove, finely grated,2 teaspoons fresh lemon juice,½ teaspoon honey,Kosher salt, freshly ground pepper,6 ounces blue cheese, crumbled, divided,2 heads Little Gem lettuce or romaine hearts, leaves separated,2 tablespoons finely chopped chives,Lemon wedges (for serving),	DIRECTIONS PreparationReal Talk: You can use any kind of lettuce that’s able to hold some weight and can be cut to be handheld, like butter or iceberg—even kale or chard if that’s what you have on hand. Also: Thick-cut bacon is particularly awesome here; just make sure it gets extra-crispy before serving.Cook bacon in a medium saucepan over medium-low heat, turning often, until brown and crisp and fat is rendered, 8–10 minutes. Transfer to paper towels and let cool (reserve rendered fat for another use, or discard, though that’d be sad). Chop bacon and set aside.Using a fork, mix yogurt, garlic, lemon juice, honey, and half of blue cheese in a medium bowl, mashing away to break up cheese. Season with salt and pepper. Spoon 1–2 tsp. yogurt mixture into centers of lettuce leaves, then top with evenly with bacon and remaining cheese. Season with salt and pepper. Transfer lettuce leaves to a fancy serving platter you thought you’d never use and top with chives. Squeeze lemon wedges over and serve.
338	/herbed-cauliflower-rice	Herbed Cauliflower Rice Recipe 	 Bon Appetit	½ large head of cauliflower, broken into florets (about 5 cups),2 tablespoons unsalted butter or olive oil,10 scallions, finely chopped,1 jalapeño, seeds removed, finely chopped,⅓ cup coarsely chopped cilantro, plus whole leaves for serving,Kosher salt, freshly ground pepper,Flaky sea salt (for serving; optional),	DIRECTIONS PreparationFit a food processor with the coarse shredding disc; process cauliflower. You should end up with about 4 cups. Transfer cauliflower to a paper towel–lined rimmed baking sheet and press another layer of paper towel on top to blot any moisture.Heat butter in a large skillet over medium. Once butter begins to foam (or oil is hot), add scallions and jalapeño and cook, stirring occasionally, until scallions are softened, about 5 minutes. Add cauliflower, give pan a shake to combine, and cover. Cook, shaking pan occasionally, until cauliflower is tender, 5–7 minutes. Toss in ⅓ cup chopped cilantro; season with salt and pepper.Transfer cauliflower rice to a platter. Top with cilantro leaves and sea salt, if using.
339	/sweet-potato-turmeric-miso-soup	Sweet Potato–Turmeric Miso Soup Recipe 	 Bon Appetit	1 small sweet potato,1 3x5-inch piece kombu,¾ ounce bonito flakes (about 1½ packed cups),1 5.5-ounce can unsweetened coconut milk,¼ cup white miso,1 tablespoon finely grated fresh turmeric or 1 teaspoon ground turmeric,1 tablespoon fresh lime juice,Toasted coconut flakes, crushed salted, roasted peanuts, and chili oil (for serving),	DIRECTIONS PreparationPreheat oven to 450°. Pierce potato several times with a fork or sharp knife. Roast potato on a rimmed baking sheet until tender, 35–45 minutes. Let cool, then scoop out flesh; discard skin.Meanwhile, combine kombu and 4 cups water in a large pot. Let sit until kombu softens, 25–30 minutes. Bring to a simmer over medium heat. Immediately remove from heat once water starts simmering; fish out kombu and discard. Add bonito flakes and stir once to submerge them. Return to a gentle boil, reduce heat, and simmer about 5 minutes. Remove from heat and let steep 15 minutes (this ensures you get the most flavorful broth, or dashi, possible). Strain dashi through a fine-mesh strainer into a medium bowl. Discard solids; wipe out pot.Transfer dashi to a blender. Add sweet potato, coconut milk, miso, and turmeric. Blend until smooth. Return to pot and bring to a very gentle simmer. Remove from heat and stir in lime juice.Divide soup among bowls. Top with coconut flakes and peanuts, then drizzle with chili oil.
340	/chocolate-cashew-butter	Chocolate-Cashew Butter  Recipe 	 Bon Appetit	1½ cups cashews,¼ cup unsweetened almond milk,3 tablespoons unsweetened cocoa powder,3 tablespoons pure maple syrup,¼ teaspoon kosher salt,	DIRECTIONS PreparationPreheat oven to 350°. Toast cashews on a rimmed baking sheet, tossing once, until golden brown and fragrant, 7–10 minutes. Let cool completely.Process cashews in a food processor, scraping down sides of bowl occasionally, until smooth (this may take up to 8 minutes). Add milk, cocoa powder, maple syrup, and salt. Pulse to combine.Do Ahead: Cashew butter can be made 2 weeks ahead. Cover and chill.
341	/spicy-kimchi-miso-soup	Spicy Kimchi Miso Soup Recipe 	 Bon Appetit	1 3x5-inch piece kombu,¾ ounce bonito flakes (about 1½ packed cups),4 large eggs, room temperature,⅔ cup chopped kimchi,½ cup silken tofu, cut into ½-inch pieces,¼ cup miso,2 tablespoons gochujang,Sesame seeds and toasted sesame oil (for serving),	DIRECTIONS PreparationCombine kombu and 4 cups water in a large pot. Let sit until kombu softens, 25–30 minutes. Bring to a simmer over medium heat. Immediately remove from heat once water starts simmering; fish out kombu and discard. Add bonito flakes and stir once to submerge them. Return to a gentle boil, reduce heat, and simmer about 5 minutes. Remove from heat and let steep 15 minutes (this ensures you get the most flavorful broth, or dashi, possible).Meanwhile, cook eggs in a medium pot of boiling water 6 minutes. Transfer to a bowl of ice water (ice bath) and let sit until cold, about 2 minutes. Peel eggs; set aside.Strain dashi through a fine-mesh sieve into a medium bowl. Discard solids, wipe out pot, and return dashi to pot. Add kimchi and tofu and bring to a very gentle simmer. Remove from heat. Submerge sieve in liquid, add miso and gochujang to sieve, and stir to liquefy both, then press through strainer until pastes are dissolved.Divide soup among bowls. Top with sesame seeds and drizzle with sesame oil. Cut eggs in half and add to bowls.
343	/chilaquiles-casserole	Chilaquiles Casserole Recipe 	 Bon Appetit	2 tablespoons vegetable oil,1 large onion, chopped,6 garlic cloves, thinly sliced,3 tablespoons tomato paste,8 dried guajillo or New Mexico chiles, seeds removed,4 ancho chiles (or use 4 guajillo or New Mexico chiles for a milder flavor), seeds removed,5 cups low-sodium chicken broth,2 tablespoons apple cider vinegar,Kosher salt,1 tablespoon vegetable oil,1 pound fresh chorizo, casings removed,1 13.5-ounce can white or golden hominy, drained,16 tostadas or a 10-ounce bag tortilla chips,1 pound sharp cheddar, coarsely grated (about 5 cups),1 small onion, finely chopped,8 small radishes, trimmed, thinly sliced,2 cups thinly sliced green cabbage,Kosher salt,1 tablespoon apple cider vinegar,½ cup sour cream,2 tablespoons fresh lime juice,1 cup cilantro leaves with tender stems,	DIRECTIONS PreparationSauceHeat oil in a large saucepan over medium-high. Cook onion and garlic, stirring often, until golden brown and tender, 8–10 minutes. Add tomato paste and cook, stirring constantly, until darkened, about 2 minutes. Add guajillo and ancho chiles and broth. Bring to a simmer, cover, and cook, reducing heat as needed to keep at a simmer, until chiles are very tender, 30–40 minutes.Let cool slightly, then purée in a blender. Transfer to a large bowl, stir in vinegar, and season with salt.Do Ahead: Sauce can be made 3 days ahead. Let cool; transfer to an airtight container and chill.AssemblyPreheat oven to 375°. Heat oil in a medium skillet over medium-high. Cook sausage, breaking up with a spoon, until browned and nearly cooked through, 6–8 minutes. Add hominy and cook, stirring occasionally, until posole is beginning to crisp around the edges and chorizo is cooked through, about 4 minutes. Spread about 1 cup sauce in an even layer across the bottom of a 3-qt. baking dish. Add a layer of tostadas, followed by another cup or so of sauce, 1 cup cheese, 2 Tbsp. onion, and one-quarter of chorizo. Repeat layering process until you’ve used remaining tostadas, sauce, cheese, onion, and chorizo. You should have 3–4 layers depending on your dish. Transfer to oven and bake until cheese is melted and sauce is bubbling around the edges, 30–40 minutes.While casserole is baking, place radishes and cabbage in a large bowl, season with a couple of generous pinches of salt, and toss to combine. Let sit until vegetables are beginning to soften, about 5 minutes. Squeeze vegetables with your hands to expel excess water. Drain off as much liquid from vegetables as possible. Add vinegar and toss to coat; season with more salt to taste.Mix sour cream and lime juice in a small bowl; season with salt.To serve, spoon dollops of lime sour cream over casserole and scatter cabbage slaw and cilantro on top.
344	/savory-palmiers-with-parmesan-and-black-pepper	Savory Palmiers with Parmesan and Black Pepper Recipe 	 Bon Appetit	1 17-ounce package frozen puff pastry, thawed,All-purpose flour (for surface),1 large egg, beaten to blend,2 ounces finely grated Parmesan cheese (about ½ cup),1½ teaspoons coarsely ground black pepper,	DIRECTIONS Preparation Real Talk: Yes, rolling up the pastry at both long ends into a log and making fancy palmiers is sure to impress your guests, but if you’re truly in a pinch before party time, you can roll up the log like a cinnamon roll before cutting up into pieces. But only if you’re really that behind!Preheat oven to 400°. Roll out pastry on a lightly floured surface just to smooth out any creases. If you’re using a package of pastry that has 2 sheets, simply stack the sheets and roll out to a rectangle between ¼"–⅛" thick. Brush surface with egg wash (which is just a beaten egg that will make the dough a beautiful color after baking) and sprinkle cheese evenly over, followed by pepper.Okay, here comes the fun part: With 1 long side facing you, fold both long sides in toward the center line so the edges meet in the middle (do not overlap); press down gently to flatten. Brush exposed pastry with egg wash. Now roll the sides you just folded lengthwise toward the center to form a double-spiral log with a seam running down the middle. Squeeze all along length of log to adhere. Roll whole log away from you 90° so seam is facing away from you. Trim about ½” off 1 end to clean up the edge, then slice log crosswise into ½”-thick pieces (you should have about 15).You’re almost done! Transfer pieces cut side up to a parchment-lined baking sheet, spacing about 2" apart. Brush outside edges of pastry with egg wash, avoiding cut sides on top. Chill until pastry is firm, 10–15 minutes.Bake palmiers 10 minutes, then reduce oven temperature to 350° and continue to bake until puffed and golden all over, 20–30 minutes. Let cool before serving.Do Ahead: Palmiers can be baked 8 hours ahead. Let cool, then cover with plastic and let sit at room temperature until ready to serve.
345	/summer-gazpacho	Summer Gazpacho Recipe 	 Bon Appetit	½ English hothouse cucumber, peeled, seeded,½ large red bell pepper, stemmed, seeded,2 pounds very ripe red tomatoes, preferably heirloom, cut into ½-inch wedges, 3 tablespoons seeds reserved,½ large shallot, chopped,1 garlic clove, finely grated,2 tablespoons (or more) sherry or red wine vinegar,Flaky sea salt,3 tablespoons olive oil, plus more for drizzling,Quartered cherry tomatoes, chopped chives, and grilled or toasted country-style bread (for serving),	DIRECTIONS PreparationCut 2" of the cucumber into ¼" pieces and set aside for serving; coarsely chop remaining cucumber and place in a large bowl. Cut one-quarter of the bell pepper into ¼" pieces and set aside for serving; coarsely chop remaining bell pepper and add to bowl with chopped cucumber. Add tomatoes to bowl and toss with shallot, garlic, 2 Tbsp. vinegar, and 1 Tbsp. salt. Let stand 30 minutes at room temperature to let flavors meld.Transfer tomato mixture along with any accumulated juices to a blender. Add 3 Tbsp. oil and purée on medium speed until smooth; season with salt and vinegar, if desired. Strain through a coarse-mesh sieve into a large bowl or pitcher and chill until cool, about 1 hour.Divide gazpacho among bowls. Top with cherry tomatoes, chives, reserved cucumber and red pepper pieces, and tomato seeds; drizzle with oil and season with salt. Serve with bread alongside.Do Ahead: Gazpacho can be made 1 day ahead; cover and chill.
346	/pizzettes	Pizzettes Recipe 	 Bon Appetit	1½ cups all-purpose flour,4 ounces bittersweet chocolate chips,4 ounces roasted, unsalted almonds, finely chopped (about ¾ cup),1 teaspoon baking powder,¼ cup hot strong coffee,¼ cup unsweetened cocoa powder,¾ teaspoon ground cinnamon,¾ teaspoon ground cloves,¾ teaspoon ground nutmeg,½ teaspoon kosher salt,1 large egg,1 large egg yolk,½ cup granulated sugar,⅓ cup vegetable oil,1 teaspoon finely grated lemon zest,1 teaspoon finely grated orange zest,4 ounces bittersweet chocolate chips or chopped chocolate,1 tablespoon unsalted butter,1¼ cups powdered sugar,Colored sanding sugar or sprinkles (for serving),	DIRECTIONS PreparationCookiesPreheat oven to 375°. Mix flour, chocolate chips, almonds, and baking powder in a medium bowl.Whisk coffee and cocoa powder in a large bowl until smooth. Add cinnamon, cloves, nutmeg, and salt and whisk until smooth. Whisk in egg, egg yolk, granulated sugar, oil, and zests.Stir in dry ingredients with a large spoon until just combined; do not overwork dough.Turn dough out onto a work surface. Divide in half, then roll each half into a 1½"-wide log. Flatten to 2" wide. Slice on a bias into 1"-wide cookies. Transfer to parchment-lined rimmed baking sheets, spacing at least 1" apart. Bake cookies until firm around the edges but still soft in the middle, 8–10 minutes. Let cool.Do Ahead: Cookies can be made 2 months ahead; store airtight and freeze.Glaze and AssemblyMelt chocolate and butter in a medium heatproof bowl set over a large saucepan of barely simmering water (do not let water touch bowl); stir constantly until chocolate is melted and smooth (you can also do this in the microwave). Whisk in powdered sugar and 5 Tbsp. boiling water until smooth.Dip tops of cookies into glaze and top with colored sanding sugar or sprinkles. Let cool until glaze is firm, about 2 hours.
347	/curried-potato-tart-with-cilantro-yogurt	Curried Potato Tart with Cilantro Yogurt Recipe 	 Bon Appetit	8 green cardamom pods,2 teaspoons coriander seeds,1 medium onion, chopped,6 garlic cloves, thinly sliced,1 jalapeño, thinly sliced,6 tablespoons unsalted butter,¼ cup olive oil,1 tablespoon brown mustard seeds,1 tablespoon Madras curry powder,Kosher salt, freshly ground peppe,3 pounds red-skinned potatoes, scrubbed,Kosher salt,1 10-ounce package frozen spinach, thawed,1 cup thawed frozen peas,½ cup heavy cream,1 ½ cups plain whole-milk Greek yogurt, divided,Freshly ground black pepper,6 14x12-inch sheets frozen phyllo pastry, thawed,1 small garlic clove,1 cup cilantro leaves with tender stems,2 tablespoons fresh lime juice,A spice mill or a mortar and pestle,	DIRECTIONS PreparationSpiced ButterCrack open cardamom pods and remove black seeds; discard pods. Combine cardamom seeds and coriander seeds in spice mill or mortar and pestle and coarsely grind. Mix in a small saucepan with onion, garlic, jalapeño, butter, oil, mustard seeds, and curry powder. Season generously with salt and pepper. Cook over medium heat, stirring often, until simmering gently and onion is mostly softened, about 5 minutes. Holding back any solids, pour out ⅓ cup butter mixture and set aside for brushing phyllo. Set aside remaining butter mixture with spices for potato filling.Filling and AssemblyPreheat oven to 375°. Place potatoes in a large saucepan and add water to cover by at least 2"; season generously with salt. Bring to a boil, reduce heat, and simmer until potatoes are tender, 30–35 minutes. Let potatoes cool slightly, then cut into large pieces.Toss potatoes, spinach, peas, cream, and ½ cup yogurt in a large bowl to combine. Mix in reserved spice butter with all the spices; season with salt and pepper.Lay out a sheet of phyllo on a work surface and brush generously with some of reserved ⅓ cup spice butter (reheat if it has solidified). Transfer sheet to a large ovenproof skillet or shallow braising dish, letting any excess dough hang over the edges. Repeat with remaining sheets of phyllo, pressing each layer firmly into bottom of skillet. Top with potato filling and fold excess phyllo over filling to form a ruffly edge around the dish and leaving center exposed. Bake until phyllo is golden brown and crisp and filling is lightly browned, 35–45 minutes.While tart is baking, purée garlic, cilantro, lime juice, and remaining 1 cup yogurt in a blender until smooth; season yogurt sauce with salt.Cut tart into wedges and serve with yogurt sauce alongside.
348	/cheesy-zucchini-eggplant-bake	Cheesy Zucchini-Eggplant Bake Recipe 	 Bon Appetit	1 large globe eggplant,2 large zucchini and/or summer squash,24 ounces cherry and/or grape tomatoes,8 garlic cloves, unpeeled,5 tablespoons olive oil, plus more,Kosher salt,8 ounces fresh ricotta (about 1 cup),¾ teaspoon crushed red pepper flakes,8 ounces salted low-moisture mozzarella, grated, divided,1 cup basil leaves, divided,	DIRECTIONS Hide All ImagesPlace racks in upper and lower thirds of oven; preheat to 450°. Cut off stem end of eggplant, then shave a thin slice off of fattest part of bulbous end. Rest eggplant on newly cut side so it doesn’t roll around your board.Cut eggplant crosswise into ½"-thick slices.Repeat same process with zucchini and/or summer squash, trimming stem end, shaving side and resting on flat surface, and slicing crosswise ½" thick.Arrange eggplant slices in a single layer on a rimmed baking sheet, then fit as many pieces of zucchini as possible on same baking sheet, tucking into spaces around eggplant.Place remaining zucchini slices on one half of another rimmed baking sheet, arranging as close together as possible and in a single layer.On empty side of baking sheet, arrange tomatoes and garlic. Drizzle 1 Tbsp. oil over tomatoes and garlic and toss with your hands to coat.Using your hands, smear 2 Tbsp. oil over exposed sides of eggplant and zucchini slices. Eggplant in particular acts like a sponge and will soak up oil in an instant. Since all you want is a thin, even coating, it’s better to smear them with oil rather than to drizzle.Still using your hands, turn eggplant and squash slices over and smear other side with 2 Tbsp. oil. Season all vegetables on both baking sheets with a couple of 4-finger pinches of salt.Place sheet with eggplant on lower rack and sheet with tomatoes on upper rack and roast until eggplant is deeply browned on the underside and tomatoes are lightly blistered, 15–25 minutes.Remove both baking sheets from oven. You’ll notice that the vegetables will have shrunk quite a bit. On baking sheet with eggplant, slide a flexible metal spatula underneath ALL slices and turn them over. Slide rounds over to one side, then transfer zucchini from sheet with tomatoes onto sheet with eggplant, turning them over in the process. You should end up with tomatoes and garlic on one baking sheet, and eggplant and zucchini on the other.Let baking sheet with tomatoes cool, but return baking sheet with eggplant and zucchini to lower rack and roast until second side of eggplant is deeply browned, 10–15 minutes. Let sit until cool enough to handle.Meanwhile, combine 8 oz. ricotta, ¾ tsp. red pepper flakes, and 6 oz. mozzarella in a medium bowl. Drizzle with oil and mix with a fork to combine; season lightly with salt.Using a fork, remove garlic cloves from baking sheet and transfer to a cutting board. Press on skins to force out the soft, caramelized cloves; discard skins. Mash cloves to a paste with fork, then stir into ricotta mixture.Drizzle some oil into a shallow 2-qt. baking dish. Arrange one-third of zucchini and eggplant slices in a single layer.Scatter one-third of blistered tomatoes over, then dollop half of ricotta mixture over tomatoes.Tear one-third of basil leaves and scatter over ricotta.Repeat layering process with half of remaining eggplant and zucchini, all of remaining ricotta mixture, and half of remaining tomatoes and basil. Top with remaining eggplant, zucchini, and tomatoes.Sprinkle remaining 2 oz. mozzarella over and bake until mozzarella is melted and browned in spots and liquid around the edges is bubbling, 15–20 minutes.Let rest 10 minutes, then top with remaining basil and drizzle with a little more oil.
349	/sumac-fried-eggs-with-red-chile-and-garlic	Sumac Fried Eggs with Red Chile and Garlic Recipe 	 Bon Appetit	3 tablespoons olive oil,1 red chile, such as Fresno, thinly sliced,3 garlic cloves, thinly sliced,4 large eggs,Kosher salt,½ teaspoon sumac,Sumac, a tart, citrusy spice generally sold in ground form, can be found at Middle Eastern markets, specialty foods stores, and online.,	DIRECTIONS PreparationHeat oil in a large nonstick skillet over medium-high. Add chile and garlic and cook, stirring often, until chile is slightly softened and garlic is golden and crisp, about 2 minutes (don’t let the garlic get too dark or else it, and the oil, will taste acrid and bitter). Transfer to a small bowl; set aside.Crack eggs into skillet and season with salt. Cook, rotating skillet occasionally, until whites are golden brown and crisp at the edges and set around the yolk (which should be runny), about 2 minutes. Transfer to a large plate. Top with reserved chile mixture. Sprinkle eggs with sumac and serve.
350	/acai-power-house-bowl	Acai Power House Bowl Recipe 	 Bon Appetit	1 banana, frozen,2 4-ounce packets pure, unsweetened acai purée,¾ cup nut, rice, or seed milk,2 Medjool dates, pitted,½ cup chopped frozen mango,½ cup frozen blueberries,½ cup torn kale leaves,¼ cup plain full-fat Greek yogurt,1 tablespoon fresh lime juice,2 teaspoons maca powder,Pinch of kosher salt,Crushed cereal,Golden berries,Toasted coconut flakes,Goji berries,Dried figs,Cocoa nibs,	DIRECTIONS PreparationPlace 2 small serving bowls in freezer to put a hard chill on them (this makes for a better acai bowl since it helps keep mixture tight and prevents melting). Cut off one-quarter of banana and set aside for serving.Using a hammer, rolling pin, or heavy skillet, crush acai packets. Pour milk into a blender. Add acai, dates, mango, blueberries, kale, yogurt, lime juice, maca powder, salt, and remaining frozen banana. Blend on low speed to combine, then gradually work your way up to high (you may need to use the tamping/stirring tool to get everything going). Blend until mixture is well combined and very thick but still spoon-able; don’t overblend or mixture will be too soupy and will begin to warm up from the friction of the blender.Divide acai mixture between chilled bowls and top with different toppings, including reserved banana. You can really use any toppings you want; that’s the best part!
351	/savory-sweet-potato-casserole	Savory Sweet Potato Casserole Recipe 	 Bon Appetit	5 pounds medium sweet potatoes, halved lengthwise,¼ cup rosemary leaves,¼ cup sage leaves,½ cup (1 stick) unsalted butter, divided,1½ cups coarse fresh sourdough breadcrumbs,Kosher salt, freshly ground pepper,4 small or 2 large shallots, chopped,1½ cups heavy cream,2 large eggs, beaten to blend,5 ounces finely grated Parmesan (about 1⅔ cups),1 teaspoon finely grated lemon zest,	DIRECTIONS PreparationArrange racks in upper and lower thirds of oven; preheat to 350°. Prick potato skins with a fork and place cut side down on 2 foil-lined rimmed baking sheets. Roast potatoes, rotating sheets halfway through, until very tender when squeezed, 70–90 minutes. Let cool on sheets. Increase oven temperature to 400°.While potatoes roast, cook rosemary, sage, and 6 Tbsp. butter in a small saucepan over medium heat, stirring occasionally, until butter foams, then browns, and herbs are golden and crisp, about 5 minutes; let cool.Scoop out flesh from potatoes and transfer to a large bowl (discard skins). Spoon about half of warm butter and fried herbs into bowl with potatoes. Add breadcrumbs to saucepan with remaining butter-herb mixture and toss to coat; season with salt and pepper. Transfer to a small bowl.Heat remaining 2 Tbsp. butter in same saucepan over medium. Add shallots and cook, stirring often, until translucent and golden around the edges, about 5 minutes. Add cream and bring to a simmer. Remove from heat and, using an immersion blender, blend cream mixture until smooth. Transfer to bowl with potatoes. Add eggs and Parmesan. Blend with immersion blender until light and smooth. Season with salt and pepper.Transfer potato mixture to a shallow 2-qt. baking dish, smoothing top. Using a spatula or the back of a large spoon, create some peaks and valleys. Top with breadcrumb mixture. Bake casserole until top is golden and crisp, 20–25 minutes. Sprinkle lemon zest over. Let cool 10 minutes before serving.Do Ahead: Casserole, without breadcrumbs, can be made 3 hours ahead. Fully assembled casserole can be made 1 day ahead; cover with foil and chill. Let come to room temperature before baking.
352	/spiced-chickpeas-with-crispy-pita-yogurt-and-brown-butter	Spiced Chickpeas with Crispy Pita, Yogurt, and Brown Butter Recipe 	 Bon Appetit	2 8-inch pita breads, split in half crosswise, torn into 1-inch pieces,⅓ cup plus 2 tablespoons olive oil,Kosher salt, freshly ground pepper,2 16-ounce cans chickpeas, drained,2 garlic cloves, finely grated,¼ teaspoon ground cumin,3 tablespoons unsalted butter,¼ cup raw cashews,3 tablespoons pine nuts,1¼ cups plain, whole-milk (not Greek) yogurt,¼ cup coarsely chopped parsley,¼ cup torn mint leaves, plus sprigs for serving,¼ teaspoon smoked paprika,Radishes with tops and oil-cured olives (for serving),	DIRECTIONS PreparationPreheat oven to 350°. Toss pita pieces with ⅓ cup oil on a rimmed baking sheet; season with salt and pepper. Bake, tossing once, until golden brown and crisp, 12–15 minutes. Transfer to a large bowl.Meanwhile, heat remaining 2 Tbsp. oil in a large skillet over medium. Add chickpeas and garlic and cook, tossing occasionally, until chickpeas are warmed through and scented from the garlic, 4–6 minutes. Add cumin and toss to coat; season with salt. Transfer chickpeas to bowl with pita and toss. Transfer to a platter.Cook butter in a small skillet over medium heat until it foams. Add cashews and pine nuts and continue to cook, stirring often, until butter browns and nuts have slightly darkened, 2–3 minutes.Dollop yogurt over chickpea mixture. Top with parsley, cashew mixture (along with butter), and ¼ cup mint. Sprinkle with paprika. Serve with radishes, olives, and mint sprigs alongside.Do Ahead: Pita chips can be made 1 day ahead. Cover and store in an airtight container.
353	/hot-turmeric-latte	Hot Turmeric Latte Recipe 	 Bon Appetit	½ cup coconut milk,1 tablespoon date sugar or 2 teaspoons raw sugar,4 teaspoons freshly grated turmeric or 1 teaspoon ground turmeric,1 teaspoon freshly grated ginger or ¼ teaspoon ground ginger,⅛ teaspoon Chinese five-spice powder or ground nutmeg,Pinch of kosher salt,	DIRECTIONS PreparationWhisk coconut milk, sugar, turmeric, ginger, five-spice, salt, and ¾ cup water in a small saucepan and bring to a boil. Remove from heat and let mixture steep 5 minutes. Strain through a fine-mesh sieve into a mug and serve.
359	/reuben-dutch-baby	Reuben Dutch Baby Recipe 	 Bon Appetit	4 large eggs,½ cup milk, room temperature,1 teaspoon Dijon mustard, plus more for serving,½ cup all-purpose flour,Kosher salt,4 ounces coarsely grated Swiss cheese (preferably Jarlsberg), divided,½ teaspoon freshly ground black pepper, plus more,2 tablespoons unsalted butter,8 ounces thinly sliced pastrami, divided,Sauerkraut (for serving),	DIRECTIONS PreparationReal Talk: The key to getting a big, light, puffy rise is to make sure the flour is thoroughly incorporated into the egg mixture. Whisk your arm off until zero, absolutely zero, clumps remain.Place a 10" cast-iron skillet in oven; preheat to 425°. Whisk eggs, milk, and 1 tsp. mustard in a medium bowl until smooth. Whisking constantly, gradually add flour, whisking until smooth; season with salt. Stir in half of cheese and ½ tsp. pepper.Carefully remove preheated skillet from oven and add butter; swirl skillet to coat. Drape half of pastrami into skillet (it’s okay if it bends and folds over itself); season with salt and pepper. Pour egg mixture over. Return skillet to oven and bake until Dutch baby is puffed and golden brown, 12–15 minutes.Remove skillet from oven and heat broiler (do not fear the broiler). Drape remaining pastrami over Dutch baby; top with remaining 2 oz. cheese. Broil until cheese is melted, about 3 minutes.Top with sauerkraut and mustard before serving.
354	/kung-pao-cauliflower	Kung Pao Cauliflower Recipe 	 Bon Appetit	2 tablespoons Chinese rice wine or dry sherry,2 teaspoons cornstarch,1 tablespoon plus 2 teaspoons soy sauce,1 tablespoon sherry vinegar,2 teaspoons hoisin sauce,2 teaspoons sugar,1 teaspoon toasted sesame oil,1 medium head of cauliflower (about 1¾ pounds),2 tablespoons vegetable oil, divided,3 ounces slab or thick-cut bacon, chopped,6 dried japones chiles, chiles de árbol, or other red chiles,1 teaspoon Sichuan peppercorns or ½ teaspoon cracked black peppercorns,3 scallions, dark-green and white parts separated, thinly sliced,1 serrano chile, sliced,1 1-inch piece ginger, peeled, finely chopped,2 garlic cloves, sliced,¼ cup unsalted, roasted peanuts,Kosher salt,Steamed white rice (for serving),	DIRECTIONS PreparationStir wine, cornstarch, and 1 Tbsp. soy sauce in a medium bowl; set marinade aside.Stir vinegar, hoisin sauce, sugar, sesame oil, and remaining 2 tsp. soy sauce in a small bowl; set sauce aside.Remove leaves and cut cauliflower into medium florets. Trim woody end of stalk and discard, then cut stalk into ½"-thick pieces. Heat 1 Tbsp. vegetable oil in a wok or large cast-iron skillet over medium-high. Cook cauliflower, tossing occasionally, until browned in places and beginning to soften, 7–9 minutes. Give reserved marinade a stir to reincorporate cornstarch and add cauliflower to bowl; toss to coat. Toss occasionally while you cook the bacon.Reduce heat to medium. Cook bacon and remaining 1 Tbsp. vegetable oil in wok, stirring often, until bacon is browned and crisp, about 5 minutes. Add dried chiles and peppercorns and cook, tossing, just until fragrant (be careful not to burn), about 30 seconds. Transfer bacon, chiles, and peppercorns to a plate, leaving bacon drippings behind.Return cauliflower to wok with a slotted spoon; discard excess marinade. Cook cauliflower, tossing occasionally, until charred in spots and crisp-tender (short of scorching it, don’t worry about letting it go pretty dark), 8–10 minutes. Add scallion whites, serrano chile, ginger, garlic, and peanuts and cook, tossing often, until sauce is fragrant and cauliflower is tender, about 2 minutes. Add bacon mixture and cook, tossing, just until sauce coats cauliflower, about 1 minute; season with salt.Transfer to a serving dish and top with scallion greens. Serve with rice alongside.
355	/chocolate-cream-cheese-frosting	Chocolate Cream Cheese Frosting Recipe 	 Bon Appetit	8 ounces milk chocolate or white chocolate, chopped,⅓ cup whole milk,8 ounces cream cheese, room temperature,6 tablespoons unsalted butter, room temperature,1 teaspoon kosher salt,2 cups powdered sugar,1 tablespoon vanilla extract,	DIRECTIONS PreparationHeat chocolate and milk in a medium heatproof bowl set over a saucepan of barely simmering water, stirring occasionally, until smooth. Set aside to cool.Using an electric mixer on medium-low speed, beat cream cheese, butter, and salt in a large bowl until smooth. Add powdered sugar and beat on low speed until incorporated, then increase speed to medium and beat until light and fluffy, about 2 minutes. Scrape down sides of bowl and add chocolate mixture. Beat just until smooth, then beat in vanilla.Chill frosting, stirring occasionally, until it holds soft peaks, 15–20 minutes for milk chocolate and 50–60 for white chocolate. Beat briefly with electric mixer on low speed until smooth, then spread evenly over cupcakes.
356	/grilled-beef-with-broccoli	Grilled Beef with Broccoli Recipe 	 Bon Appetit	6 garlic cloves, grated,1 3-inch piece ginger, peeled, grated,¾ cup oyster sauce,¾ cup Shaoxing wine (Chinese rice wine),¾ cup soy sauce,¼ cup toasted sesame oil,3 tablespoons mild-flavored (light) molasses,3 tablespoons unseasoned rice vinegar,1½ pounds flank steak,2 medium heads of broccoli (about 1 pound), stems peeled, heads halved lengthwise,Sliced scallions, toasted sesame seeds, and cooked white rice (for serving),	DIRECTIONS PreparationWhisk garlic, ginger, oyster sauce, wine, soy sauce, oil, molasses, and vinegar in a medium bowl. Place steak in a large resealable plastic bag and pour in 2 cups marinade; set remaining marinade aside. Seal bag, turn to coat, and let steak marinate in refrigerator at least 1 hour and up to 12.Prepare a gas grill for 2-zone heat; set one burner at medium and one or two burners at medium-high. Alternatively, prepare a charcoal grill for medium-high heat. Grill steak over medium-high heat, turning occasionally, until charred, 3–5 minutes per side for medium-rare. Transfer to a cutting board and let rest 10 minutes. Slice against the grain into ½"-thick strips.Meanwhile, stir ½ cup reserved marinade and ½ cup water in a small bowl to combine. Brush broccoli all over (crowns and stems) with some of the thinned marinade. Grill over medium heat, turning occasionally and basting frequently with thinned marinade, until charred and tender, about 12 minutes. Transfer to a plater and let cool slightly  before breaking into large pieces.Divide steak and broccoli among plates. Top with scallions and sesame seeds. Serve with rice and remaining marinade alongside.
357	/shrimp-and-pimiento-cheese-grits	Shrimp and Pimiento Cheese Grits Recipe 	 Bon Appetit	Kosher salt, freshly ground pepper,1 cup medium-grind grits (not instant),1 cup pimiento cheese spread,4 teaspoons sambal oelek, divided,1 tablespoon olive oil,4 ounces thick-cut bacon, cut crosswise into ¼-inch strips,1 pound large shrimp (about 20), peeled, deveined, divided,⅓ cup parsley leaves with tender stems, chopped,2 teaspoons fresh lime juice,	DIRECTIONS Preparation<u>Real Talk</u>: This is the time to buy hardwood smoked thick-cut bacon to really impress your friends (if you don’t see it stocked with the cold cuts, go to the butcher counter, smile wide, and ask nicely if they can slice some slab bacon for you). If bacon isn’t your thing, just fry the shrimp in 1 Tbsp. olive oil.Bring 2 tsp. salt, ¼ tsp. pepper, and 4¾ cups water to a boil in a medium saucepan. Whisk in grits. Reduce heat to medium-low, cover, and cook, whisking occasionally, until grits are thick, tender, and creamy, 10–12 minutes. Increase heat to medium, stir in cheese and 2 tsp. sambal oelek, and cook, stirring, until cheese is melted and mixture is smooth, about 2 minutes. Season with salt and pepper; cover and remove from heat.Meanwhile, heat oil in a medium skillet over medium-high. Cook bacon, stirring occasionally, until crispy and golden brown, about 5 minutes. Transfer to paper towels. Do not eat all the bacon.Increase heat to high and cook half of shrimp in same skillet until lightly browned and just cooked through, about 1 minute per side. Transfer to a medium bowl; repeat with remaining shrimp. Cut shrimp into ½" pieces; discard tails. Return shrimp to same bowl, then add parsley, lime juice, bacon, and remaining 2 tsp. sambal oelek; toss to combine. Season with salt and pepper.Divide grits mixture among bowls and top with shrimp mixture.
358	/cacao-coconut-latte	Cacao and Coconut Latte Recipe 	 Bon Appetit	½ cup cacao nibs,¼ cup unsweetened coconut flakes,¼ teaspoon kosher salt,2 tablespoons organic sugar, divided,1 cup hot coconut milk,1 tablespoon virgin coconut oil, melted,	DIRECTIONS PreparationCover cacao nibs, coconut flakes, salt, and 1 Tbsp. sugar with 2 cups boiling water in a medium heatproof bowl. Let steep, uncovered, 5 minutes.Blend cacao nib mixture, coconut milk, coconut oil, and remaining 1 Tbsp. sugar in a blender on high speed until smooth and frothy, about 1 minute. Strain through a fine-mesh sieve, dividing between mugs.
360	/mixed-nut-and-seed-crackers	Mixed Nut and Seed Crackers Recipe 	 Bon Appetit	¾ cup raw cashews,½ cup blanched almonds,½ cup walnuts,¼ cup raw pumpkin seeds (pepitas),2 tablespoons chia seeds,2 tablespoons flaxseeds,3 tablespoons olive oil,1 teaspoon kosher salt,	DIRECTIONS PreparationPulse nuts, pumpkin seeds, chia seeds, and flaxseeds in a food processor until the texture of very coarse sand (mixture should stick together when pinched). With motor running, drizzle in ¼ cup water, then oil and salt. Pulse until a wet dough forms. Scrape out onto a sheet of plastic wrap and form into a log. Roll up, using plastic to form dough into a tight 2" cylinder or square. Freeze until firm enough to slice, about 1 hour.Place a rack in middle of oven and preheat to 350°. Using a serrated knife, slice dough about ¼" thick and place on parchment-lined baking sheets, spacing ½" apart. Bake crackers until edges and bottoms are golden brown, 30–35 minutes. Let cool on baking sheet.Do Ahead: Dough can be made 1 day ahead; keep frozen. Crackers can be baked 4 days ahead; store airtight at room temperature.
361	/shaved-kohlrabi-with-smashed-avocado	Shaved Kohlrabi with Smashed Avocado  Recipe 	 Bon Appetit	2 ripe avocados,1 small green chile (such as serrano), finely grated,1 oil-packed anchovy fillet, finely chopped,1 ½-inch piece ginger, peeled, finely grated,1 garlic clove, finely grated,3 tablespoons coarsely chopped cilantro leaves with tender stems,1 teaspoon finely grated lime zest,¼ cup fresh lime juice, divided,Kosher salt,4 medium kohlrabi, peeled, very thinly sliced,2 tablespoons avocado or grapeseed oil,4 soft-boiled eggs, halved,	DIRECTIONS PreparationUsing a fork, coarsely mash avocados, chile, anchovy, ginger, garlic, cilantro,  2 Tbsp. lime juice, and a generous pinch of salt in a medium bowl.Toss kohlrabi, oil, lime zest, remaining 2 Tbsp. lime juice, and a pinch of salt in another medium bowl.Divide smashed avocado mixture among bowls. Arrange kohlrabi mixture and eggs around avocado and serve.
362	/super-seedy-gluten-free-bread	Super-Seedy Gluten-Free Bread Recipe 	 Bon Appetit	¾ cup steel-cut oats,1 cup plus ¼ cup buttermilk, divided,1 cup teff flour,½ cup flaxseeds,½ cup raw sunflower seeds,½ cup roasted, unsalted almonds, coarsely chopped,½ cup roasted, unsalted pumpkin seeds (pepitas),½ cup walnuts, coarsely chopped,¼ cup flaxseed meal (or grind ¼ cup flaxseeds in a spice mill),¼ cup whole psyllium husks,2 tablespoons chia seeds,1 tablespoon Diamond Crystal or 1¾ teaspoons Morton kosher salt,3 tablespoons pure maple syrup,1 teaspoon instant or active dry yeast,¼ cup olive oil,	DIRECTIONS PreparationMix oats and 1 cup buttermilk in a small bowl. Chill overnight to rehydrate oats.Whisk teff flour, flaxseeds, sunflower seeds, almonds, pepitas, walnuts, flaxseed meal, psyllium husks, chia seeds, and salt in a large bowl.Combine maple syrup and 1 cup warm (not hot, ideally about 100°) water in a small bowl. Sprinkle yeast over and let stand until yeast is beginning to foam and smells bready (if it doesn’t foam after 10 minutes, get new yeast). Stir into dry ingredients along with oil and remaining ¼ cup buttermilk. Add rehydrated oats and stir until combined (if using old-fashioned oats, add them along with 1 cup buttermilk).Cover bowl with plastic wrap and let rise in a warm spot until dough has puffed slightly (it won’t rise like non-gluten-free dough, but if you poke your finger into it, it should feel less dense than before) and there may be some subtle cracks across surface of dough, 1¼–1½ hours.Stir dough gently to deflate, then transfer to an 8x5" loaf pan (dough should reach to about the top of pan and this is fine!). Cover with plastic wrap and let dough rise again until domed slightly, 1–1¼ hours.Preheat oven to 350°. Bake bread until top is dark brown and springs back when pressed and an instant-read thermometer inserted into the center registers 190°, 60–75 minutes. Let cool in pan slightly before slicing.Do Ahead: Bread can be made 2 days ahead. Let cool, then wrap in plastic and chill, or freeze up to 2 months.
363	/chocolate-soy-vegan-ice-cream	Chocolate Soy Vegan Ice Cream Recipe 	 Bon Appetit	4 ounces vegan, soy lecithin-free, dark chocolate, chopped,1 pound silken tofu,½ cup plus 2 tablespoons organic or granulated sugar,3 tablespoons unsweetened cocoa powder,½ teaspoon kosher salt,1 vanilla bean, split lengthwise,¾ cup virgin coconut oil, melted, cooled slightly,An ice cream maker,	DIRECTIONS PreparationHeat chocolate in a heatproof bowl set over a saucepan of barely simmering water (bowl should not touch water), stirring, until melted. Remove from heat and let sit, stirring occasionally, until cool, 10–15 minutes.Transfer melted chocolate to a blender. Add tofu, sugar, cocoa powder, and salt. Scrape in seeds from vanilla bean; reserve pod for another use. Purée until smooth, about 15 seconds. With the motor running on medium speed, slowly stream in oil and purée until thick and creamy, being careful not to overblend or mixture will curdle.Immediately process tofu mixture in ice cream maker according to manufacturer’s directions. (Head’s up: this will take longer than a traditional dairy-based custard to reach soft-serve consistency.) Do not chill before processing or oil will harden into tiny bits and texture will be grainy.Transfer to an airtight container and press plastic wrap directly onto surface. Freeze until firm, at least 4 hours.Do Ahead: Ice cream can be made 1 month ahead; keep frozen.
364	/crispy-baked-chicken-wings	Crispy Baked Chicken Wings Recipe 	 Bon Appetit	1 tablespoon unsalted butter, melted,¼ teaspoon cayenne pepper,¼ teaspoon freshly ground black pepper,¼ teaspoon kosher salt,¼ cup hot pepper sauce (such as Frank's),1 2-inch piece of ginger, peeled, sliced,3 large garlic cloves, crushed,¼ cup honey,2 tablespoons soy sauce,5 pounds chicken wings, tips removed, drumettes and flats separated,2 tablespoons vegetable oil,1 tablespoon kosher salt,½ teaspoon freshly ground black pepper,	DIRECTIONS PreparationBuffalo SauceMix butter, cayenne pepper, black pepper, and salt in a medium bowl; let stand 5 minutes. Whisk in hot sauce; keep warm.Do Ahead: Sauce can be made 1 week ahead. Let cool completely; cover and chill. Rewarm before using.Ginger-Soy GlazeBring ginger, garlic, honey, soy sauce, and ¼ cup water to a boil in a small saucepan, stirring to dissolve honey. Reduce heat to low; simmer, stirring occasionally, until reduced to ¼ cup, 7–8 minutes. Strain into a medium bowl. Let sit 15 minutes to thicken slightly.Do Ahead: Glaze can be made 5 days ahead. Cover; chill. Rewarm before using.WingsPreheat oven to 400°. Set a wire rack inside 2 large rimmed baking sheets. Toss chicken wings, vegetable oil, salt, and pepper in a large bowl to coat. Divide wings between prepared racks and spread out in a single layer.Bake wings until cooked through and skin is crispy, 45–50 minutes.Line another rimmed baking sheet with foil; top with a wire rack. Add half of wings to ginger-soy glaze and toss to evenly coat. Place wings in a single layer on prepared rack and bake until glaze is glossy and lightly caramelized, 8–10 minutes.Toss remaining half of wings in Buffalo sauce. Serve immediately (no need to bake them).
365	/overnight-oats-with-cashews-seeds-and-turmeric	Overnight Oats with Cashews, Seeds, and Turmeric Recipe 	 Bon Appetit	2 tablespoons ghee or olive oil,2 tablespoons chopped raw cashews,1 tablespoon pumpkin seeds (pepitas),1 tablespoon raw sunflower seeds,1 teaspoon poppy seeds,½ teaspoon fennel seeds, finely chopped,½ teaspoon ground turmeric,¼ teaspoon cayenne pepper,Kosher salt,Overnight Oats,1 cup plain whole-milk Greek yogurt,2 tablespoons nutritional yeast,	DIRECTIONS PreparationHeat ghee in a small skillet over medium. Add cashews, pepitas, sunflower seeds, poppy seeds, fennel seeds, turmeric, and cayenne and cook, stirring constantly, until nuts are toasted and seeds are starting to pop, about 4 minutes. Remove from heat; season with salt.Divide oats and yogurt among bowls, spooning yogurt into centers. Sprinkle nutritional yeast over, then top with cashew mixture (drizzle with any leftover ghee, if desired).Do Ahead: Cashew mixture can be made 4 days ahead; cover and chill. Warm to re-liquefy ghee before serving.
428	/spicy-marinara-sauce	Spicy Marinara Sauce Recipe 	 Bon Appetit	1 28-ounce can whole tomatoes,2 tablespoons olive oil,2 tablespoons unsalted butter,1 small onion, finely chopped,3 garlic cloves, thinly sliced,1 tablespoon tomato paste,2 teaspoons sugar,½ teaspoon red pepper flakes,Kosher salt,	DIRECTIONS PreparationPulse tomatoes in a food processor until a smooth purée forms. Heat oil and butter in a medium saucepan over medium-high. Add onion and cook, stirring, until golden and soft, 5–7 minutes. Add garlic and cook, stirring, until softened but not brown, 1–2 minutes. Add tomato paste, sugar, and red pepper flakes; cook, stirring, until sugar dissolves, about 2 minutes. Add tomato purée and season with salt. Reduce heat and simmer, stirring occasionally, until sauce has thickened, 15–20 minutes.Do Ahead: Sauce can be made 3 days ahead. Store in an airtight container and chill, or freeze up to 2 months.
366	/devils-food-cupcakes	Devil’s Food Cupcakes Recipe 	 Bon Appetit	1 cup unsweetened cocoa powder (not Dutch-process),4 large eggs,2 teaspoons vanilla extract,2 cups cake flour,1 cup granulated sugar,1 cup (packed) light brown sugar,2 teaspoons baking powder,1½ teaspoons kosher salt,1¼ teaspoons baking soda,¾ cup (1½ sticks) unsalted butter, melted, cooled,¾ cup buttermilk, room temperature,2 tablespoons vegetable oil,	DIRECTIONS PreparationArrange racks in lower and upper thirds of oven; preheat to 350°. Line two standard 12-cup muffin tins with cupcake liners.Whisk cocoa powder and ¾ cup hot water (or brewed coffee) in a small bowl until smooth; whisk in eggs and vanilla.Whisk flour, granulated sugar, brown sugar, baking powder, salt, and baking soda in the bowl of a stand mixer fitted with the whisk attachment. Add butter, buttermilk, and oil and beat on medium-low speed, scraping down sides of bowl, until flour is evenly distributed and mixture is smooth. Add cocoa powder mixture and beat just until smooth.Divide batter evenly among muffin cups, filling two-thirds full (a level ⅓ cup batter per cupcake). Bake, rotating pans halfway through, until cupcakes have domed and spring back when touched in the center, 20–25 minutes. Transfer to a wire rack and let cool.Do Ahead: Cupcakes can be made 1 day ahead. Store airtight at room temperature.
367	/sriracha-braised-brisket-sandwiches	Sriracha-Braised Brisket Sandwiches Recipe 	 Bon Appetit	1 5–6-pound brisket, first-cut, untrimmed,2 tablespoons Diamond Crystal or 1 tablespoon Morton kosher salt,2 tablespoons light brown sugar,1 tablespoon ground cumin,1 large onion, peeled, thinly sliced,8 garlic cloves, crushed,½ cup seasoned rice vinegar,½ cup soy sauce,2 tablespoons Worcestershire sauce,⅔ cup Sriracha, plus more for serving,12 potato rolls, toasted,	DIRECTIONS Hide All ImagesRemove brisket from its packaging and pat dry with paper towels. Lay brisket flat on your cutting board so that one of the longer sides is closest to you and layer of white fat is facing down. Take a close look at the meat itself—you’ll notice that there are long “grains” (thread-like muscle fibers) running left to right across length of brisket. You are going to “slice against the grain,” which means positioning your knife blade perpendicular to the direction of the fibers, into 2"-wide pieces. You do this so that when you go to shred the meat at the end, the fibers don’t stretch a mile long and they’re a manageable length for sandwiches.Place brisket halves in a large bowl and sprinkle with salt, brown sugar, and cumin. Use your hands to really massage the meat and work in all the salt and spices so every little spot is coated. Get in there! Set brisket aside for a moment.Mix onion, garlic, vinegar, soy sauce, Worcestershire, ⅔ cup Sriracha, and 1 cup water in a large Dutch oven or stockpot.Using tongs, nestle brisket into pot so fattier sides are facing up and pieces fit together in a single layer. The meat should be barely submerged in liquid, so add a little more water if that’s not the case (depending on size of your pot).Bring to a simmer over medium heat, then reduce heat to achieve a very gentle simmer.Cover pot and cook brisket, peeking inside occasionally to make sure heat isn’t too high or low—you want a couple of areas in the pot to be gently bubbling. If bubbles are roiling all over the place, reduce heat. If you see no bubbles at all, increase slightly. If liquid drops below top of meat, add a little more water to keep barely submerged.After 2 hours, check meat for doneness. Poke a fork into a few pieces and twist the tines to see if the meat will easily separate into shreds. If not, that means it’s still tough. Keep cooking, checking again every 15 minutes or so. This could take up to an hour more.Turn off heat and position lid so that it’s cracked open a bit. Let brisket cool until no longer steaming hot, about 30–40 minutes. Cover and chill overnight.The next day, remove pot from refrigerator and uncover. There will be an layer of solidified orange fat on the surface (the color is from the Sriracha!). Using a fork, lift off fat in large pieces and discard.Reheat brisket in pot over low until meat is warmed all the way through, 30–40 minutes. Transfer meat to a rimmed baking sheet. If meat is too hot to touch, let cool for a few minutes until you can handle it.Using your fingers or 2 forks, separate muscle fibers into shreds and return to pot. Remove any pieces of fat and discard.Return pot to low heat and bring liquid to a gentle simmer, tossing meat with tongs to encourage it to soak up juices. Add more Sriracha to taste.Serve over toasted buns with even more Sriracha, if desired.
368	/minestrone-soup-with-acorn-squash	Minestrone Soup with Acorn Squash Recipe 	 Bon Appetit	¼ cup olive oil,4 ounces sliced pastrami, cut into ¼-inch strips,1 large onion, chopped,1 teaspoon sambal oelek,¾ acorn squash, cut into ¾-inch pieces, or 10 ounces pre-cubed butternut squash,Kosher salt, freshly ground pepper,5 tomatoes from one 28-ounce can whole peeled tomatoes,4 sprigs basil,2 15-ounce cans butter beans, rinsed, drained,	DIRECTIONS PreparationReal Talk: Read between the lines and stay open to improvisation, and you’ll be able to make a hearty soup anytime, out of (almost) anything. In place of the pastrami, think of another cured meat that will crisp nicely (hello, bacon); the squash could be any root vegetable, really, and the beans are variable too.Heat oil in a large pot over medium-high. Cook pastrami, tossing occasionally, until just beginning to brown, about 3 minutes. Add onion and cook, stirring occasionally, until tender, 6–8 minutes. Stir in sambal oelek and cook until fragrant, about 1 minute. Add squash and cook, stirring occasionally, until just beginning to soften, about 5 minutes. Season with salt and pepper.Add tomatoes, breaking into small pieces with a spoon, then stir in basil and 4 cups water. Reduce heat and simmer until squash is tender, 15–20 minutes. Discard basil. Add beans and cook until heated through, about 3 minutes. Season to taste.Do Ahead: Minestrone can be made 1 week ahead; cover and chill, or freeze up to 3 months.
369	/chopped-liver	Chopped Liver Recipe 	 Bon Appetit	3 large eggs,5 tablespoons schmaltz (chicken fat) or unsalted butter, divided,3 medium yellow onions, sliced,2 tablespoons white wine vinegar,1 pound chicken livers, rinsed, patted dry,Kosher salt, freshly ground pepper,1 tablespoon prepared horseradish,½ teaspoon garlic powder,½ teaspoon mustard powder,¼ teaspoon paprika,Toasted rye bread and sliced red onion (for serving),Flaky sea salt,	DIRECTIONS PreparationCook eggs in a saucepan of boiling water 10 minutes. Transfer to a bowl of ice water to cool. Peel eggs.Meanwhile, heat 3 Tbsp. schmaltz in a large skillet over medium heat. Cook yellow onions, stirring often, until caramelized and very soft, 14–18 minutes. Add vinegar and toss to coat. Let cool. Wipe out skillet and reserve.Season livers with kosher salt and pepper. Heat remaining 2 Tbsp. schmaltz in same skillet over medium-high. Cook livers until browned on both sides but still pink in center, about 2 minutes per side. Transfer to a plate and let cool.Pulse half of livers, half of cooked onions, and 1 ½ eggs in a food processor just until a coarse purée forms. Transfer to a medium bowl. Repeat with remaining livers, onions, and eggs. Stir horseradish, garlic powder, mustard, and paprika into chopped liver; season with kosher salt and pepper.Serve chopped liver on bread topped with red onion and seasoned with sea salt and pepper.Do Ahead: Chopped liver can be made 3 days ahead. Cover and chill.
370	/no-cook-peach-mousse	No-Cook Peach Mousse Recipe 	 Bon Appetit	¼ cup chilled bourbon,1 packet unflavored powdered gelatin,1 pound ripe peaches (about 4 medium), or 12 ounces frozen sliced peaches, thawed, plus 2 more peaches for garnish,⅔ cup plus ¼ cup peach or apricot jam,¼ cup mint leaves, plus sprigs for serving,3 tablespoons fresh lemon juice, divided,1½ cups cold heavy cream,Pinch of kosher salt,	DIRECTIONS Pour ¼ cup bourbon into a small saucepan and sprinkle gelatin over. Let soak to soften gelatin, about 10 minutes.Meanwhile, score skins of 1 lb. peaches with a sharp knife in a large “X” pattern on pointy (non-stem) end and place in a colander in sink. (If you’re using frozen peaches, skip this and proceed with step 5.)Heat a kettle (or saucepan) full of water until water boils, then pour over peaches to loosen skin. Rinse peaches in cold water.Slip blade of a paring knife underneath loosened cross-hatched peach skin and peel back to remove. If peels are stubbornly stuck, use a vegetable peeler. Cut peaches into wedges; discard pits.Blend peach flesh, ⅔ cup jam, ¼ cup mint leaves, and 2 Tbsp. lemon juice in a blender on highest speed until smooth. Leave blender jar on the base because you’re about to come back to it.PreviousNextGently heat saucepan with gelatin mixture over low, swirling, just until granules dissolve and mixture is translucent. Don’t blast the heat because this can destroy the setting power of the gelatin and it might ignite the bourbon! Keep it low.Stream gelatin mixture into blender with the motor on low speed.Transfer peach mixture to a large bowl and chill in freezer, stirring with a spatula every 5 minutes, until mixture is thick enough that you can see the bottom of bowl as you stir (be sure to scrape against sides and bottom of bowl with spatula where mixture has become more solid), 15–20 minutes total. As it cools, gelatin will start to set and mixture will thicken.While peach mixture hangs out in freezer, whip 1½ cups cream and a pinch of salt in another large bowl with a whisk. You can do this in a mixer, but in a large bowl starting with cold cream, it should only take a few minutes by hand. Work in a vigorous figure-eight pattern, switching hands if needed, until cream firmly holds marks of whisk and gently slumps into a soft, cloud-like peak as it falls off whisk. Chill cream as you wait for peach mixture to thicken.WANT TO MAKE PERFECT WHIPPED CREAM EVERY TIME? WE GOT YOU.PreviousNextWhen peach mixture is ready, place it next to bowl of whipped cream on your work surface. Whisk about one-third of cream into peach mixture until incorporated.Scrape peachy cream back into bowl with plain cream. Using spatula, fold it all together until barely any streaks remain. At this point you want to work fairly quickly so cream doesn’t deflate and mousse stays nice and light.Spoon mixture into serving glasses, cover loosely with plastic wrap, and chill until gelatin is completely set, at least 4 hours.About 15 minutes before serving, slice 2 peaches into thin wedges and toss in a medium bowl with remaining ¼ cup jam and 1 Tbsp. lemon juice.PreviousNextSpoon peach wedges and their jammy juices over set mousse and garnish with mint sprig.Do Ahead: Mousse can be made 2 days ahead. Keep covered and chill.
371	/halibut-foil-packs-with-chile-butter	Halibut Foil Packs with Chile Butter Recipe 	 Bon Appetit	1 1-pound skinless, boneless halibut fillet, cut crosswise into 4 equal pieces,Kosher salt, freshly ground pepper,12 ounces baby bok choy, quartered (halved if very small),½ medium onion, thinly sliced,1 garlic clove, finely chopped,¼ cup (½ stick) unsalted butter, room temperature,1 tablespoon ancho chile powder,2½ teaspoons Dijon mustard,1 teaspoon white wine vinegar,Four 12" sheets of foil,	DIRECTIONS PreparationReal Talk: Halibut is a firm-fleshed, flaky white fish. If you can’t find it, use something similar, like cod, hake, or salmon (not white, but texturally similar). If you use a thinner fish (like flounder), you’ll have to reduce the cook time; check it after 6–7 minutes.Pat halibut dry with paper towels; season with salt and pepper. Chill, uncovered, 30 minutes.Meanwhile, preheat oven to 450°. Cook bok choy in a large pot of boiling salted water until bright green but still very firm, about 1 minute. Transfer to a paper towel-lined rimmed baking sheet to drain. Cook onion in same pot of boiling salted water until heated through, about 30 seconds; transfer to same sheet.Mix garlic, butter, chile powder, mustard, vinegar, and ½ tsp. salt in a small bowl until combined.Lay out four 12" sheets of foil. Divide bok choy among sheets; top each with a piece of halibut and a schmear of ancho butter. Top with onions. Fold edges up and over to create packets; pinch seams closed. Transfer packets to a rimmed baking sheet and bake until fish has cooked through (remove 1 packet, carefully unwrap, then press fish with your finger; it should easily flake apart), 8–10 minutes. Remove from oven and let sit unopened 2 minutes to steam.Divide fish and vegetables among plates, then pour juices over.
435	/crisp-waffles	Crisp Waffles Recipe 	 Bon Appetit	1¼ cups weak (soft) wheat flour (6½ ounces),Generous pinch of kosher salt,Generous pinch of sugar,1¼ cups cream,Melted unsalted butter (for brushing),	DIRECTIONS PreparationPour ¾ cup + 1 Tbsp. water into a large bowl. Stir in flour, salt, and sugar to form a batter.Using an electric mixer on medium-high speed, whip cream in another large bowl until soft peaks form; fold into batter (it should be fully combined, but not overmixed).Heat waffle iron to proper working temperature and brush very lightly with butter. Pour in a suitable amount of batter and cook until waffle is nice and golden. Repeat with remaining batter.
372	/sea-dog	Sea Dog Recipe 	 Bon Appetit	1 pound skinless, boneless cod fillet, cut crosswise into 8 strips,Kosher salt, freshly ground black pepper,1 cup all-purpose flour,1 cup cornstarch,1 tablespoon Old Bay seasoning,2 teaspoons baking powder,1 teaspoon sweet paprika,½ teaspoon garlic powder,½ teaspoon onion powder,¼ teaspoon baking soda,¼ teaspoon cayenne pepper,12 ounces pale ale,3 tablespoons malt or cider vinegar,Vegetable oil (for frying; about 3 quarts),8 New England–style split-top hot dog buns,4 tablespoons unsalted butter, room temperature,Tartar Sauce, shredded lettuce, and lemon wedges (for serving),A deep-fry thermometer,	DIRECTIONS PreparationLightly season cod with salt and black pepper. Transfer to a wire rack set inside a rimmed baking sheet. Chill, uncovered, at least 1 hour or up to overnight (this air-dries the surface so the batter will adhere better to the fish).Whisk flour, cornstarch, Old Bay, baking powder, paprika, garlic powder, onion powder, baking soda, cayenne, 2½ tsp. salt, and ½ tsp. black pepper in a medium bowl. Add beer and vinegar and whisk just until combined and no lumps remain.Fit a large heavy pot with thermometer; pour in oil to a depth of 3". Heat over medium-high until thermometer registers 375°. Working in batches, dip fish into batter, allowing excess batter to drip back into bowl. Lower carefully into oil and fry until light golden brown and just cooked through, 3–4 minutes. Transfer to paper towels to drain.Heat a large skillet over medium. Spread bottom and sides of each bun with butter. Toast buns, pressing down lightly, until golden, about 2 minutes per side.Generously spread some tartar sauce in each bun; top with lettuce and a fried fish fillet. Serve with lemon wedges and additional tartar sauce alongside.
373	/crisp-and-crunchy-chicken-salad	Chicken Salad Recipe 	 Bon Appetit	4 skin-on, bone-in chicken thighs (about 1½ pounds total),Kosher salt,2 teaspoons mustard seeds,1 teaspoon fennel seeds,1 bunch scallions,3 small cucumbers (such as Persian or kirby),1 bunch small radishes (such as red, Easter Egg, or icicle), trimmed,1 kohlrabi or ½ fennel bulb, 4-inch piece daikon, 1 watermelon radish, or 1 medium beet, trimmed,3 tablespoons (or more) red wine vinegar,Handful of salted pita chips, lightly crushed (for serving),	DIRECTIONS PreparationHeat a medium heavy skillet, preferably cast iron, over medium.Meanwhile, place chicken thighs, skin side down, on a work surface. Using a paring knife and working one at a time, cut a ½"-deep slash on both sides of thigh bone. This will help the thighs cook a little more quickly and evenly. If there is excess skin extending beyond thigh meat, trim and add to skillet to render. (If you don’t have any extra chicken fat, a drizzle of olive oil, 1 tsp. schmaltz, or 1 tsp. coconut oil can be used to grease pan.)Season chicken on both sides with salt and sprinkle with mustard and fennel seeds, patting to adhere. Cook chicken, skin side down, in pan, without turning, until skin is very deeply browned and crisp and chicken is about 75% cooked through, 18–20 minutes. The goal during this stage is to allow the chicken skin to render most of its fat, which you can’t really rush. Some seeds will end up sizzling in the pan instead of staying stuck to the chicken, which is fine and flavors the oil. If it looks or smells like they’re burning, though, skim them out with spoon. Turn chicken and cook on second side until just cooked through, 3–4 minutes longer. Transfer to a platter and let rest 10 minutes.While chicken is cooking and/or resting, cut scallions crosswise into ½" pieces; you can go most of the way up to the dark green tips. Cut cucumbers into 1" pieces. Slice radishes and kohlrabi thin enough to be flexible but still crunchy (use a mandoline if you have one, but they should not be paper thin, or else they’ll get floppy when dressed). Transfer vegetables to a salad bowl you’re planning to serve from and add vinegar and a pinch of salt; toss to combine.Cut chicken into 2 long strips by cutting along both sides of the bone. (If your knife blade is dull, use a serrated knife, which will saw through the skin without separating it from the flesh.) Slice off whatever meat is attached to the topside and underside of bone. Cut chicken crosswise into 1½–2" pieces.Gently toss warm chicken and pita chips into bowl with vegetables. Taste salad and season with more vinegar and/or salt, as needed.
374	/cheddar-walnut-scones	Cheddar–Walnut Scones Recipe 	 Bon Appetit	½ cup walnuts,1½ cups whole wheat flour,2 tablespoons sugar,4½ teaspoons baking powder,1½ teaspoons kosher salt,1½ cups all-purpose flour, plus more for surface,½ cup (1 stick) unsalted butter, chilled, cut into pieces,6 ounces aged sharp cheddar, coarsely grated,1¾ cups chilled heavy cream, plus more for brushing,Flaky sea salt,Apple Butter (for serving),	DIRECTIONS PreparationPreheat oven to 350°. Toast walnuts on a rimmed baking sheet, tossing once, until golden brown and fragrant, 7–10 minutes. Let cool, then chop.Whisk whole wheat flour, sugar, baking powder, kosher salt, and 1½ cups all-purpose flour in a large bowl. Add butter and toss to coat. Using your fingers, work butter into dry ingredients until pieces are pea-size. Add cheese and walnuts and toss to coat. Drizzle 1¾ cups cream over and mix with a wooden spoon until dough just begins to come together.Turn out dough and any loose flour onto a lightly floured work surface. Briefly knead to bring dough together. Roll dough to ¾" thick (the shape doesn’t matter). Using a bench scraper to help lift dough, fold in half and rotate 90°. Roll to ¾" thick, fold in half, and rotate again. Repeat process 2 more times for a total of 4 folds, lightly dusting with more flour as needed; this will create lots of flaky layers. Flatten dough to a ¾"-thick rectangle, about 10x7". Chill, uncovered, at least 1 hour.Preheat oven to 425°. Trim dough to 9x6", then halve lengthwise. Cut each half into thirds crosswise to form six 3" squares. Halve each on a diagonal (you should have 12 triangles).Transfer dough to a parchment-lined rimmed baking sheet. Brush with cream and sprinkle with sea salt. Bake scones, rotating sheet halfway through, until tops are golden brown, 16–18 minutes. Transfer scones to a wire rack and let cool. Serve with Apple Butter.Do Ahead: Dough can be made 1 day ahead; wrap tightly and chill. Scones, without brushing, can be made 1 day ahead; store in an airtight container or tightly wrapped at room temperature.
375	/classic-tartar-sauce	Classic Tartar Sauce Recipe 	 Bon Appetit	1 small shallot, finely chopped,1 garlic clove, finely grated,1 cup mayonnaise,2 tablespoons finely chopped caper berries or capers,2 tablespoons finely chopped pickles,1 tablespoon finely chopped chives,1 tablespoon finely chopped parsley,1 tablespoon fresh lemon juice,1 teaspoon Dijon mustard,1 teaspoon whole grain mustard,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationWhisk shallot, garlic, mayonnaise, caper berries, pickles, chives, parsley, lemon juice, Dijon mustard, and whole grain mustard in a small bowl until combined. Season with salt and pepper.Do Ahead: Tartar sauce can be made 1 week ahead. Cover and chill.
376	/quick-aleppo-dill-pickles	Quick Aleppo Dill Pickles Recipe 	 Bon Appetit	8 Persian cucumbers, quartered lengthwise,¼ cup coarsely chopped fresh dill,2½ cups distilled white vinegar,⅓ cup sugar,1 garlic clove, finely grated,1 tablespoon Aleppo pepper,1 tablespoon fresh lemon juice,1 tablespoon kosher salt,1 teaspoon crushed red pepper flakes,1 teaspoon freshly ground black pepper,Za’atar and flaky sea salt (for serving),Za’atar, a Middle Eastern spice blend that includes sumac, herbs, and sesame seeds, can be found at Middle Eastern markets, specialty foods stores, and online.,	DIRECTIONS PreparationPack cucumber and dill into a large heatproof jar. Bring vinegar, sugar, garlic, Aleppo pepper, lemon juice, kosher salt, red pepper flakes, and black pepper to a boil in a medium saucepan, stirring to dissolve sugar. Let cool slightly, then pour brine over cucumbers to submerge. Seal jar and chill at least 30 minutes.To serve, remove cucumber spears from brine, lightly shaking off excess liquid but leaving on any seasonings; sprinkle with za’atar and sea salt.Do Ahead: Cucumber can be made 2 days ahead. Remove from brine (do not dry) and chill in an airtight container.
377	/oysters-casino	Oysters Casino Recipe 	 Bon Appetit	8–12 slices bacon,½ cup butter, divided,⅓ cup chopped green pepper,2 tablespoons chopped chives,4 tablespoons chopped parsley,24 oysters on the half shell,Rock salt,Fresh lemon juice,	DIRECTIONS PreparationPlace strips of bacon in a cold skillet and cook them over low heat just until fat is transparent. Remove from pan and cut each strip into 1" diamonds (you’ll need one piece of bacon to top each oyster). Add 2 Tbsp. butter to the skillet and heat over medium. Add green pepper and cook gently until barely soft. Transfer green pepper to a small bowl and mix with chives and parsley, then blend thoroughly with remaining butter.Preheat oven to 450°. Arrange oysters on beds of rock salt (put rock salt in pie plates or in a long, shallow baking tin); dampen salt slightly. Top each oyster with a spoonful of butter mixture, a piece of bacon, and a few drops of lemon juice. Bake until bacon is crisp and oysters are thoroughly heated, 5–10 minutes.
378	/pao-de-queijo-brazilian-cheese-bread	Pão de Queijo (Brazilian Cheese Bread) Recipe 	 Bon Appetit	½ cup whole milk,¼ cup (½ stick) unsalted butter,1½ teaspoons kosher salt,2 cups tapioca flour,2 large eggs,5 ounces fresh farmer's cheese, crumbled (about 1 cup),2 ounces crumbled Parmesan (about ½ cup),	DIRECTIONS PreparationArrange a rack in center of oven; preheat to 425°. Heat milk, butter, salt, and ¼ cup water in a large saucepan over medium-high, stirring occasionally, until butter is melted and mixture begins to boil, about 4 minutes. Remove from heat and add flour; vigorously stir with a wooden spoon until dough is dry and shaggy, about 10 seconds. Transfer to the bowl of a stand mixer fitted with the paddle attachment or a large bowl. Let cool 5 minutes.Beat mixture on low speed just until dough starts to come together, about 30 seconds (alternatively, vigorously stir with a wooden spoon). Add eggs, one at a time, and continue to beat on low speed until incorporated (dough will look broken at first, then come together). Continue to beat on low speed until dough is smooth, sticky, and somewhat stretchy; do not overbeat or dough will lose its stretch. Add farmer cheese and Parmesan and beat on low speed until evenly distributed.Using a 1⅓-oz. ice cream scoop, portion dough and transfer to a parchment-lined rimmed baking sheet, spacing about 2" apart (alternatively, form dough into ping pong ball-sized pieces with your hands).Bake 5 minutes, then reduce oven temperature to 350° and continue to bake until pão are very light brown, with some darker brown speckles all over (that’s the cheese), and sound hollow when tapped on the bottom, 20−25 minutes. Let cool 10 minutes before serving.
379	/white-cupcakes	White Cupcakes Recipe 	 Bon Appetit	3¼ cups cake flour,1¾ cups sugar,1 tablespoon baking powder,1 teaspoon kosher salt,½ teaspoon baking soda,1 cup (2 sticks) unsalted butter, room temperature,1 cup buttermilk, room temperature,2 tablespoons vegetable oil,5 large egg whites,1 large egg,2 teaspoons vanilla extract,1 teaspoon almond extract (optional),	DIRECTIONS PreparationArrange racks in lower and upper thirds of oven; preheat to 350°. Line two standard 12-cup muffin tins with cupcake liners.Whisk flour, sugar, baking powder, salt, and baking soda in the bowl of a stand mixer fitted with the whisk attachment. Add butter, buttermilk, and oil; beat on medium speed, scraping down sides of bowl, until smooth.Whisk egg whites, egg, vanilla extract, and almond extract, if using, in a medium bowl until smooth. Add egg mixture to flour mixture in 2 additions, beating well between additions. Continue to beat on medium speed until mixture is homogenous and very thick, about 2 minutes.Divide batter evenly among muffin cups, filling two-thirds full (a level ⅓ cup batter per cupcake). Bake, rotating pans halfway through, until cupcakes have domed and spring back when touched in the center, 20–25 minutes. Transfer to a wire rack and let cool.Do Ahead: Cupcakes can be made 1 day ahead. Store airtight at room temperature.
380	/hermit-slices	Hermit Slices Recipe 	 Bon Appetit	Nonstick vegetable cooking spray,1½ cups all-purpose flour,2 teaspoons ground cinnamon,¾ teaspoon kosher salt,½ teaspoon baking soda,½ teaspoon ground ginger,½ teaspoon ground nutmeg,¾ cup (packed) light brown sugar,11 tablespoons unsalted butter, room temperature, divided,1 large egg,¼ cup light (unsulphured) molasses,1 teaspoon vanilla extract,1 cup walnuts, coarsely chopped,⅓ cup raisins,¼ cup powdered sugar,	DIRECTIONS PreparationPreheat oven to 350°. Line a 13x9x2" baking dish with 2 layers of parchment paper or foil, leaving a generous overhang on long sides. Lightly coat with nonstick spray.Whisk flour, cinnamon, salt, baking soda, ginger, and nutmeg in a medium bowl.Using an electric mixer on medium-high speed, beat brown sugar and 10 Tbsp. butter in a large bowl, scraping down sides occasionally, until pale and fluffy, about 4 minutes. Add egg and continue to beat, scraping down sides once or twice, until incorporated and smooth, about 2 minutes. Add molasses and vanilla and beat until combined. Add dry ingredients and mix on low speed until just blended. Add walnuts and raisins and mix with a large spoon until no spots of flour remain.Transfer dough to prepared baking dish, spreading evenly across bottom. Bake until top springs back slightly and is slightly darker and edges are firm, 20–30 minutes.Meanwhile, melt remaining 1 Tbsp. butter in a small saucepan over medium heat. Cook, swirling occasionally, until butter foams, then browns, about 4 minutes. Whisk in powdered sugar and 1 Tbsp. water to form a smooth glaze. Brush over hermits and let cool completely. Using parchment overhang, carefully remove hermits and cut into 3½x1½" bars.Do Ahead: Hermits, without glaze, can be made 2 months ahead; store airtight and freeze.
381	/best-oatmeal-raisin-cookies	Best Oatmeal-Raisin Cookies Recipe 	 Bon Appetit	2 cups old-fashioned oats,1 cup pecans, chopped,1 cup all-purpose flour,1 teaspoon kosher salt,½ teaspoon baking soda,½ teaspoon ground cinnamon,⅛ teaspoon freshly ground nutmeg,¾ cup (1½ sticks) unsalted butter, room temperature,¾ cup (packed) light brown sugar,¼ cup granulated sugar,1 large egg, room temperature,2 tablespoons pure maple syrup,2 teaspoons vanilla extract or paste,1 cup raisins, dried sour cherries, and/or dried cranberries,	DIRECTIONS PreparationPreheat oven to 425°. Spread oats on a rimmed baking sheet and toast until lightly golden, about 6 minutes. Add pecans, toss to combine, and continue toasting until pecans are fragrant and oats are deep golden brown, about 6 minutes more. Let cool sightly.Whisk flour, salt, baking soda, cinnamon, and nutmeg in a medium bowl; stir in oats and pecans.Using an electric mixer on medium speed, beat butter, brown sugar, and granulated sugar in a large bowl, scraping down sides of bowl, until light and fluffy, 3–4 minutes. Add egg, syrup, and vanilla and beat until incorporated, about 1 minute. Reduce speed to low; add dry ingredients and raisins and continue to beat, scraping down sides and bottom of bowl, until just combined. Let sit at room temperature at least 1 hour to hydrate oatmeal.Preheat oven to 350°. Line 2 rimmed baking sheets with parchment paper. Using a 2-oz. ice cream scoop, portion cookies and place on sheets, spacing 3" apart (or measure out mounded scoops with a ¼-cup measuring cup). Do not flatten; cookies will spread as they bake.Bake cookies, rotating sheets halfway through, until edges are golden brown and firm but centers are soft, 15–17 minutes. Let sit on sheets 10 minutes, then transfer to wire racks; let cool.Do Ahead: Cookie dough can be made 3 days ahead; cover and chill. Let dough come to room temperature before baking.
382	/shaved-squash-salad-with-tomatoes-and-ricotta-salata	Shaved Squash Salad  Recipe 	 Bon Appetit	1 garlic clove, finely grated,1 teaspoon finely grated lemon zest,¼ cup fresh lemon juice,1 teaspoon Dijon mustard,1 teaspoon sugar,¾ teaspoon crushed red pepper flakes,⅓ cup plus 2 tablespoons olive oil,1 teaspoon kosher salt, plus more,1 pint mixed heirloom cherry tomatoes, halved,1½ pounds mixed summer squash, such as zucchini, yellow crookneck, and/or pattypan,4 ounces ricotta salata, shaved,Torn basil leaves and chopped chives (for serving),	DIRECTIONS PreparationWhisk garlic, lemon zest, lemon juice, mustard, sugar, red pepper, ⅓ cup oil, and 1 tsp. salt in a small bowl until salt and sugar dissolve.Toss tomatoes and remaining 2 Tbsp. oil in a medium bowl; season with salt.Thinly shave squash on a mandoline or with a very sharp knife, some lengthwise, making long ribbons, and some crosswise, making thin rounds.Arrange squash on plates so ribbons curl and twist. Spoon tomato mixture over. Drizzle with dressing, then top with ricotta salata, basil, and chives.
383	/mezcal-marinated-fajitas	Mezcal-Marinated Fajitas Recipe 	 Bon Appetit	2 canned chipotle chiles in adobo, smashed,4 garlic cloves, finely grated,½ cup fresh lime juice,½ cup mezcal,¼ cup fish sauce,¼ cup fresh orange juice,¼ cup soy sauce,2 teaspoons dried oregano, preferably Mexican,1 teaspoon cumin,1 teaspoon kosher salt, plus more,1½ pounds skirt steak,1 large white onion, halved, sliced ⅓ inch thick,6 tablespoons olive oil, divided,Freshly ground black pepper,1 medium green bell pepper, ribs and seeds removed, sliced ⅓ inch thick,1 medium red bell pepper, ribs and seeds removed, sliced ⅓ inch thick,Bacon-Fat Flour Tortillas or store-bought tortillas, sour cream, grated cheddar, Pico de Gallo, BA’s Best Guacamole, and Roasted Tomato–Cashew Salsa (for serving),	DIRECTIONS PreparationWhisk chiles, garlic, lime juice, mezcal, fish sauce, orange juice, soy sauce, oregano, cumin, and 1 tsp. salt in a medium bowl. Place steak in a resealable plastic bag and pour in marinade. Seal and turn to coat. Chill at least 1 hour and up to 8 hours.Prepare a gas grill for 2-zone heat; set one burner at medium-high and one or two burners at high. Alternatively, prepare a charcoal grill for high heat. Grill steak over high heat, turning occasionally, until charred, 2–3 minutes per side for medium-rare. Transfer to a cutting board and let rest 10 minutes. Slice against the grain into ½"-thick strips.Toss onions and 3 Tbsp. oil in a medium bowl to coat; season with salt and black pepper. (If you have a perforated grill pan, now’s the time to pull it out!) Grill over medium-high heat, tossing occasionally, until charred and tender, 6–10 minutes. Transfer to a large plate.Toss bell peppers and remaining 3 Tbsp. oil in a medium bowl to coat; season with salt and black pepper. Grill over medium-high heat, tossing occasionally, until charred and tender, 6–10 minutes. Arrange on plate next to onions.Serve steak and grilled onions and bell peppers with tortillas, sour cream, cheese, pico de gallo, guacamole, and salsa alongside for assembling fajitas.
384	/master-poached-chicken	Best Poached Chicken Recipe Recipe 	 Bon Appetit	4 skinless, boneless chicken breasts (about 2¼ pounds),3 medium carrots, peeled, cut into 1½-inch irregular pieces,1 head of garlic, split crosswise,1 tablespoon Diamond Crystal or 1¾ teaspoons Morton kosher salt,⅔ cup dill fronds, divided,1 tablespoon fresh lemon juice,Freshly ground black pepper,Olive oil (for drizzling),	DIRECTIONS PreparationBring chicken, carrots, garlic, salt, ⅓ cup dill, and 5 cups water to a bare simmer in a medium pot over medium heat. (It will take some time for the liquid to come to a simmer,be patient, if you rush it, the chicken will be tough) Once liquid begins to simmer, reduce heat to low and cook until juices run clear when thickest part of chicken is pierced, 10–12 minutes.Meanwhile, coarsely chop remaining ⅓ cup dill. Remove pan from heat and stir in lemon juice; pick out and discard dill. Transfer chicken and garlic to a cutting board and let cool slightly. Smash garlic using the side of a chef’s knife and stir back into poaching liquid. Cut chicken crosswise into thin slices.Divide chicken among bowls. Pour some of the poaching liquid over chicken, then top with chopped dill, pepper, and a drizzle of oil.Do Ahead: Chicken can be poached 2 days ahead. Let chicken and broth cool separately. Wrap chicken and transfer broth to an airtight container; chill.
385	/scallion-pancakes	Scallion Pancakes Recipe 	 Bon Appetit	1 garlic clove, minced,½ cup soy sauce,1½ teaspoons minced fresh cilantro,1 teaspoon Asian sesame oil,1 teaspoon minced green onion,1 teaspoon minced peeled fresh ginger,1 teaspoon sugar,¼ teaspoon ground toasted Sichuan peppercorns,Hot chili paste (such as sambal oelek) or hot chili sauce (such as Sriracha),2 cups all-purpose flour, plus more for dusting,2 teaspoons kosher salt,3 teaspoons Asian sesame oil,1 teaspoon ground Sichuan peppercorns,1 cup minced green onions,3 tablespoons peanut oil, divided,	DIRECTIONS PreparationDipping SauceWhisk garlic, soy sauce, cilantro, oil, onion, ginger, sugar, and peppercorns in a medium bowl to blend. Season sauce to taste with chili paste.Do Ahead: Sauce can be made 1 day ahead. Cover and chill.PancakesSprinkle a work surface generously with flour. Place 2 cups flour in a large bowl. Add 1 cup hot water and blend until dough forms (dough will be sticky). Transfer dough to work surface; divide in half.Shape each dough half into a smooth ball; flatten each to a 6" disk. Sprinkle each with 1 tsp. salt, then drizzle each with 1½ tsp. sesame oil. Press and smear salt and oil into tops of disks. Sprinkle each disk with ½ tsp. peppercorns, then ½ cup green onions; press into surface of dough. Roll up each disk into a log and seal ends. Roll out each log to a 10"-long rope. Shape into a coil, then a ball.Sprinkling with flour as needed, roll out each ball of dough to a ¼"-thick round, 8–9" in diameter.Do Ahead: Dough can be made 1 day ahead. Enclose each dough round in plastic wrap and chill.Heat 1½ Tbsp. peanut oil in a large skillet over medium. Add 1 pancake to skillet. Cook until bottom is brown and crisp, 3–5 minutes. Turn pancake over. Cook until bottom is brown and crisp, 3–5 minutes more. Transfer to a cutting board. Repeat with remaining peanut oil and second pancake. Cut warm pancakes into wedges and serve with reserved dipping sauce.
386	/spicy-pasta-with-shrimp-and-tomatoes	Spicy Pasta with Shrimp and Tomatoes Recipe 	 Bon Appetit	¼ cup olive oil,1 pound large shrimp (about 20), peeled, deveined, divided,12 ounces fideo, vermicelli, or angel hair pasta, broken into 3-inch pieces,1 medium red onion, chopped,3 tablespoons fish sauce,2 teaspoons sambal oelek,1½ cups canned whole peeled tomatoes (about 10 tomatoes), plus purée,¼ cup parsley, chopped,Kosher salt, freshly ground pepper,Lime wedges (for serving),	DIRECTIONS PreparationReal Talk: If you really, really, truly don’t have time to cook and want to shave off 15 minutes of prep time, buy cleaned and deveined shrimp. Boom. You are so welcome.Heat oil in a large pot over high. Cook half of shrimp until lightly browned and just cooked through, about 1 minute per side; transfer to a plate with a slotted spoon. Repeat with remaining shrimp; set aside.Reduce heat to medium-high and cook pasta, stirring to coat in oil, until noodles begin to brown and smell toasted, about 4 minutes. Add onion and cook, stirring occasionally, until onion is just tender, about 4 minutes. Add fish sauce and sambal oelek and cook, stirring, until sambal turns brick red, about 1 minute. Add tomatoes, breaking up with a spoon, then stir in 3 cups water. Bring to a boil, then reduce heat to medium-low, cover, and simmer until pasta is tender and coated with sauce, about 10 minutes. Stir in parsley; season with salt and pepper.Transfer pasta mixture to a serving platter; top with shrimp. Serve with lime wedges alongside.
387	/caramel-corn-popcorn-balls	Caramel Corn Popcorn Balls Recipe 	 Bon Appetit	Nonstick vegetable oil spray,8 cups popped popcorn (from ½ cup kernels),⅔ cup coarsely chopped smoked almonds,1 cup sugar,¼ cup (½ stick) unsalted butter, cut into pieces,1 cup mini marshmallows,4 teaspoons finely chopped rosemary,1½ teaspoons kosher salt,⅛ teaspoon cayenne pepper (optional),¼ teaspoon baking soda,	DIRECTIONS PreparationLightly coat a large nonreactive bowl with nonstick spray. Add popcorn and almonds and toss to combine.Combine sugar, butter, and ¼ cup water in a medium saucepan. Bring to a boil, stirring to completely dissolve sugar. Once sugar is dissolved and mixture is clear, cook, without stirring, until mixture begins to caramelize in spots, about 3 minutes. Continue to cook, stirring occasionally with a heatproof spatula to ensure even caramelization, until caramel is light amber, about 4 minutes.Using heatproof spatula, stir in marshmallows, rosemary, salt, and cayenne, if using. Cook, stirring occasionally, until caramel is smooth, about 1 minute.Remove from heat and stir in baking soda (mixture will bubble). Immediately pour over popcorn mixture and toss with 2 heatproof spatulas (the caramel will become very stretchy, with lots of thin webs of sticky stuff). Spray hands with nonstick spray and form popcorn mixture into 2" balls (you should have about 14 balls). Transfer to a rimmed baking sheet and let sit at least 30 minutes before serving.Do Ahead: Popcorn balls can be made 5 days ahead. Cover and store at room temperature.
388	/green-beans-and-cucumbers-with-miso-dressing	Green Beans and Cucumbers with Miso Dressing Recipe 	 Bon Appetit	3 Persian cucumbers or ½ English hothouse cucumber,Kosher salt,1 pound green beans, trimmed,1 1½-inch piece ginger, peeled, finely grated,1 serrano or Fresno chile, finely grated,1 garlic clove, finely grated,⅓ cup unseasoned rice vinegar,¼ cup white miso,¼ cup olive oil,½ teaspoon toasted sesame oil,Toasted sesame seeds and sliced scallions (for serving),	DIRECTIONS PreparationLightly smash cucumbers with a rolling pin, then tear into bite-size pieces. Toss with a pinch of salt in a medium bowl. Let sit to allow salt to penetrate.Meanwhile, place green beans in a large resealable plastic bag, seal, and smash with rolling pin until most of the beans are split open and bruised. Whisk ginger, chile, garlic, vinegar, miso, olive oil, and sesame oil in a medium bowl until smooth. Add dressing to beans and toss around in bag to coat; season with salt.Drain cucumbers and add to bag with beans. Shake gently to combine. Transfer salad to a platter and top with sesame seeds and scallions.
389	/malted-black-white-milkshake	Malted Black and White Milkshake Recipe 	 Bon Appetit	1 pint vanilla ice cream,6 tablespoons BA's Best Hot Fudge or prepared hot fudge, warmed,¼ cup plus 1 tablespoon heavy cream,3 tablespoons malted milk powder,Crushed malted milk balls (for serving; optional but highly recommended),	DIRECTIONS PreparationPlace two 8-oz. glasses in freezer and chill 30 minutes.Let ice cream sit at room temperature 5–10 minutes to soften slightly.Meanwhile, mix fudge and 1 Tbsp. cream in a small bowl until smooth, silky, and pourable.Scoop ice cream into a blender. Add malted milk powder and remaining ¼ cup cream and purée, stopping to tamp down ice cream as needed, until smooth but very thick (if you blend for too long, mixture will warm up and become soupy).Drizzle inside of each chilled glass with about 2 Tbsp. fudge mixture so fudge is running down the sides and pooling in the bottom of the glass. Divide milkshake between glasses. Drizzle each with remaining fudge mixture, then sprinkle with malted milk balls, if using.
390	/spiced-baby-eggplants	Spiced Baby Eggplants Recipe 	 Bon Appetit	1 1-inch piece ginger, peeled, finely grated,2 garlic cloves, finely grated,1 teaspoon ground coriander,1 teaspoon ground cumin,½ teaspoon ground turmeric,5 tablespoons olive oil, divided, plus more for serving,1 teaspoon Kashmiri chili powder or sweet smoked paprika, plus more for serving,1½ pounds Indian eggplants (about 12),Kosher salt,Raita and coarsely chopped cilantro (for serving),	DIRECTIONS PreparationMix ginger, garlic, coriander, cumin, turmeric, 2 Tbsp. oil, and 1 tsp. chili powder in a small bowl.Quarter eggplants lengthwise through rounded bottom, stopping ½" short of the stem. Gently pry quarters open without detaching flesh from stem; season with salt. Spoon spice mix into each eggplant, making sure inside flesh is coated.Heat 3 Tbsp. oil in a large skillet, preferably nonstick, over medium-high. Cook eggplants in a single layer, turning occasionally, until golden brown all over, 8–10 minutes total. Reduce heat to low and add ¼ cup water. Cover and cook, turning eggplants halfway through, until tender, 12–16 minutes.Spoon raita on a platter. Arrange eggplants over, then top with cilantro. Sprinkle with more chili powder and drizzle with oil.
391	/grilled-citrus-shrimp-lettuce-cups	Grilled Shrimp Lettuce Cups Recipe 	 Bon Appetit	1 small shallot, finely chopped,1 5-inch lemongrass stalk, tough outer layers removed, finely chopped (about 2 tablespoons),1 Thai chile, thinly sliced,½ cup fresh lime juice,½ cup fresh orange juice,2 teaspoons finely chopped peeled ginger,1 teaspoon (or more) kosher salt,1 pound large shrimp, peeled, deveined, tails removed,2 teaspoons toasted sesame oil,Cooked white rice, Little Gem lettuce leaves, sliced cucumber or julienned carrot, lime wedges, mint or basil sprigs, and toasted sesame seeds (for serving),	DIRECTIONS PreparationWhisk shallot, lemongrass, chile, lime juice, orange juice, ginger, and salt in a small bowl. Reserve half of marinade for serving; cover and leave at room temperature until ready to use. Pour remaining marinade over shrimp in a medium bowl and toss to coat. Cover and chill 30 minutes.Prepare a grill for medium-high heat. Grill shrimp until lightly charred and cooked through, 1–2 minutes per side. Transfer shrimp to a large bowl and toss with sesame oil; season with salt, if needed.Serve shrimp with rice, lettuce, cucumber or carrot, lime wedges, mint or basil, sesame seeds, and reserved marinade for making lettuce cups.
392	/grilled-pimiento-cheese-sandwiches-with-apple-cherry-chutney	Grilled Pimiento Cheese Sandwiches with Apple–Cherry Chutney Recipe 	 Bon Appetit	2 tablespoons olive oil, plus more for brushing,1 Granny Smith apple, peeled, cored, cut into ¼-inch pieces,¼ medium red onion, chopped,Kosher salt, freshly ground pepper,1 teaspoon sambal oelek,½ teaspoon ancho chili powder,3 whole peeled tomatoes (from one 28-ounce can),⅓ cup dried sour cherries,¼ cup mayonnaise,8 slices whole wheat or white bread,1⅓ cups pimiento cheese spread, divided,	DIRECTIONS Preparation: The secret grilled cheese ingredient is mayonnaise. It will get the outside of this sandwich perfectly browned and insanely toasty. If you really hate mayo (we know there are some of you out there), use room-temperature butter instead.Heat 2 Tbsp. oil in a medium skillet over medium-high. Cook apple (which lends sweet and sour flavors to the chutney) and onion, stirring occasionally, until soft and lightly browned, 6–8 minutes; season with salt and pepper. Stir in sambal oelek and chili powder and cook until fragrant, about 1 minute. Add tomatoes and cook, breaking up with a spoon, until beginning to darken and juices have evaporated, about 4 minutes. Add cherries and ½ cup water, season with salt and pepper, and cook, stirring, until thick and jammy, 5–7 minutes. Transfer to a serving bowl; set aside.Meanwhile, spread mayonnaise on 1 side of each slice of bread. Turn 4 slices mayonnaise side down, then evenly spread about ⅓ cup pimiento cheese on plain side. Top with 4 remaining bread slices, mayonnaise side up.Brush a medium skillet with oil and heat over medium. Cook 2 sandwiches until golden brown on both sides, about 3 minutes per side. Brush skillet with oil and repeat with remaining sandwiches.Cut sandwiches in half and serve with chutney alongside for dippage purposes.Do Ahead: Chutney can be made 1 week ahead; cover and chill, or freeze 1 month.
393	/curry-poached-chicken-with-rice-and-scallions	Curry-Poached Chicken Recipe Recipe 	 Bon Appetit	8 scallions (about 1 bunch), divided,4 skinless, boneless chicken breasts (about 2¼ pounds),3 garlic cloves, smashed,1 3-inch piece ginger, peeled, smashed to pieces, thinly sliced,2 tablespoons mild curry powder,1 tablespoon Diamond Crystal or 1¾ teaspoons Morton kosher salt, divided, plus more,Juice from 1 orange (about ¼ cup),Juice from 1 lime (about 2 tablespoons),Freshly ground black pepper,Warm jasmine rice (for serving),	DIRECTIONS PreparationCoarsely chop 4 scallions and transfer to a medium pot. Add chicken, garlic, ginger, curry powder, 2½ tsp. salt, and 4 cups water. Slowly bring to a bare simmer over medium heat. Once liquid begins to simmer, reduce heat to low and cook until juices run clear when thickest part of chicken is pierced, 10–12 minutes.Meanwhile, thinly slice remaining scallions. Whisk orange juice and lime juice in a small bowl; season with salt and 8 turns of a pepper mill, or about ¾ tsp. (you want a lot of pepper!).Transfer chicken to a cutting board and let cool slightly. Strain poaching liquid through a fine-mesh sieve into a small bowl. Cut chicken crosswise into thin slices.Divide rice and chicken among bowls and top with sliced scallions. Spoon poaching liquid and some of the citrus juice over chicken and rice before serving.Do Ahead: Chicken can be poached 2 days ahead. Let chicken and curry cool separately. Wrap chicken and transfer curry to an airtight container; chill.
394	/spiced-cranberry-apple-relish	Spiced Cranberry Apple Relish Recipe 	 Bon Appetit	8 oranges,1 pound fresh cranberries,2 large apples, peeled, cored, thinly sliced (about 3 cups),1½ cups sugar,Finely grated peel of 1 lemon,Finely grated peel of 1 orange,Fresh juice of 1 orange plus enough water to yield 1 cup,1 2" cinnamon stick,	DIRECTIONS PreparationTo make the orange cups, cut blossom end from orange about ⅓–½ the distance from the top. Carefully ream out juice or cut out meat with curved grapefruit knife. Then scrape clean with a large spoon. Edges may be notched with kitchen shears or paring knife; for scalloped (rounded) edges, use coin to outline pattern, then cut around pattern.Wash and pick over cranberries. Combine cranberries, apples, sugar, lemon peel, orange peel, orange juice, and cinnamon in saucepan; bring to a boil, stirring until sugar dissolves. Boil rapidly until cranberry skins pop and apples are transparent, 5–8 minutes. Transfer to a medium bowl and let cool, then cover and chill thoroughly. Remove cinnamon stick before serving.
395	/corn-flake-cake	Brown Butter Corn Flake Cake Recipe 	 Bon Appetit	5 large ears of corn, husked, kernels cut from cobs (about 5 cups),1½ cups (3 sticks) unsalted butter, plus more for pan,½ cup cornmeal, preferably fine-grind, plus more for pan,1½ cups all-purpose flour,1¾ teaspoons kosher salt,1½ teaspoons baking powder,1½ cups (packed) dark brown sugar,⅓ cup granulated sugar,3 large eggs,1 tablespoon vanilla extract,2 cups Corn Flakes,	DIRECTIONS PreparationPlace a rack in middle of oven; preheat to 475°. Line a rimmed baking sheet with foil and spread out corn kernels on baking sheet. Roast, tossing halfway through, until slightly dried and beginning to brown around the edges, about 20 minutes. Let sit until cool enough to handle. Transfer to a food processor and pulse until finely chopped and only a few whole kernels remain.Meanwhile, cook 1½ cups butter in a medium saucepan over medium heat, stirring often, until butter foams, then browns, 8–10 minutes. Transfer brown butter to a large bowl; let cool slightly.Reduce oven temperature to 350°. Butter a 13x9" baking pan, then dust with cornmeal. Whisk flour, salt, baking powder, and remaining ½ cup cornmeal in a medium bowl.Add brown sugar and granulated sugar to brown butter. Using an electric mixer on medium speed, beat just to incorporate the sugar, about 1 minute. Add eggs and vanilla and beat on high speed until light and creamy, about 4 minutes (this may seem like a long time, but it's necessary to get a thick cake). Reduce speed to low; add corn and beat to evenly distribute. Add dry ingredients and beat, occasionally scraping sides and bottom of bowl, just until combined. Scrape batter into prepared pan. Evenly scatter Corn Flakes over batter.Bake cake until Corn Flakes are lightly toasted on edges and a tester inserted into the center comes out clean, 35–45 minutes. Let cool before serving.Do Ahead: Cake can be made 1 day ahead. Wrap with plastic and store at room temperature.
396	/sesame-tempeh-slaw	Sesame Tempeh Slaw Recipe 	 Bon Appetit	2 tablespoons soy sauce,1 tablespoon fresh lime juice,1 tablespoon mirin,1 tablespoon toasted sesame oil,½ teaspoon freshly grated ginger,4 ounces tempeh, crumbled,Shredded cabbage, sliced carrot, sliced cucumber, sliced radish, cilantro leaves, and mint leaves (for serving),	DIRECTIONS PreparationCombine soy sauce, lime juice, mirin, sesame oil, and ginger in a resealable plastic bag. Add tempeh, seal, and lightly shake to coat. Chill at least 3 hours.Place cabbage in a medium bowl. Arrange tempeh, carrot, cucumber, and radish over cabbage. Drizzle with remaining marinade and top with cilantro and mint.Do Ahead: Tempeh can be marinated 1 day ahead. Cover and chill.
397	/adult-spaghettios	Adult "SpaghettiOs" Recipe 	 Bon Appetit	2 28-ounce cans whole peeled tomatoes,¼ cup panko (Japanese breadcrumbs),1 tablespoon coarsely grated Parmesan, plus more for serving,½ teaspoon dried oregano,¼ teaspoon garlic powder,¼ teaspoon crushed red pepper flakes, plus more,Kosher salt,1 large egg, beaten to blend,5 tablespoons heavy cream,1 pound ground beef chuck (20% fat),2 tablespoons olive oil,½ medium onion, finely chopped,1 large garlic clove, finely grated,Freshly ground black pepper,2 tablespoons tomato paste,2 teaspoons sweet paprika,1 tablespoon sugar,4 large sprigs basil,12 ounces anelletti, ditalini, or other short tubular pasta,	DIRECTIONS PreparationPurée tomatoes in a food processor until mostly smooth; there should still be some dime-sized pieces remaining. Set aside.Whisk panko, cheese, oregano, garlic powder, ¼ tsp. red pepper flakes, and 1½ tsp. salt in a medium bowl. Whisk in egg and cream. Add beef and mix with your hands until just combined, being careful not to overwork (if packed too firmly, meatballs will be dense). Form into 1"-diameter balls (you should have about 24); transfer to a plate.Heat oil in a large skillet, preferably cast iron, over medium-high. Cook meatballs, turning occasionally, until lightly browned on all sides but not fully cooked through, about 5 minutes. Transfer to another plate.Cook onion and garlic in same skillet, stirring occasionally, until onion is translucent and begins to soften, about 5 minutes; season with salt and pepper. Add tomato paste and cook until brick red, about 1 minute. Add paprika and a pinch of red pepper flakes and cook until fragrant, about 1 minute. Add sugar, basil, and reserved tomato purée. Reduce heat and simmer until sauce is slightly reduced and flavors have melded, about 20 minutes. Add meatballs and any accumulated juices; continue to cook until meatballs are cooked through, 5–10 minutes.Meanwhile, cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain and return to pasta pot. Pour sauce and meatballs over pasta and stir to combine. Transfer to a platter and top with cheese.
398	/the-swing-state	The Swing State Cocktail Recipe 	 Bon Appetit	4 ounces overproof bourbon, such as Old Grand-Dad 114 Proof Bourbon, divided,2 ounces sweet vermouth, such as Atsby Armadillo Cake, divided,1 ounce fresh orange juice, divided,½ ounce fresh lemon juice, divided,½ ounce simple syrup, divided,6 dashes Peychaud’s bitters, divided,8 ounces lager, such as Yuengling,Small orange wedges (for garnish),American flags and patriotic straws (for serving; optional),	DIRECTIONS PreparationFill a gallon-sized, resealable plastic bag with about 4 cups ice cubes. Using a rolling pin, crack (don’t crush) ice. You can also do this by wrapping a clean kitchen towel around the cubes and smacking them, but be prepared for ice shards to escape out the sides.Fill 2 pint glasses with cracked ice. Combine 2 oz. bourbon, 1 oz. vermouth, ½ oz. orange juice, ¼ oz. lemon juice, ¼ oz. simple syrup, and 3 dashes bitters in a cocktail shaker. Fill shaker with cracked ice, cover, and shake vigorously until outside of shaker is very cold, about 20 seconds. Pour into prepared glass. Repeat with remaining 2 oz. bourbon, 1 oz. vermouth, ½ oz. orange juice, ¼ oz. lemon juice, ¼ oz. simple syrup, and 3 dashes bitters. Top with lager and more ice. Garnish with orange wedges; serve with American flags and patriotic straws, if desired.
399	/creamy-corn-chowder	Creamy Corn Chowder Recipe 	 Bon Appetit	8 ears of corn,2 Parmesan rinds (about 4 ounces; optional),4 ounces shiitake mushrooms, stems removed and reserved, caps cut into ¼-inch pieces,2 sprigs thyme,1 bay leaf,Kosher salt,5 tablespoons unsalted butter, room temperature, divided,Freshly ground black pepper,¼ cup dry white wine,4 ounces thick-cut bacon, cut into ¼-inch pieces,1 pound russet potatoes, peeled, cut into ½-inch pieces,3 shallots, thinly sliced,1 medium leek, white and pale-green parts only, quartered lengthwise, thinly sliced,2 garlic cloves, finely grated,2 Fresno chiles, seeded, finely chopped,2 tablespoons all-purpose flour,2 cups heavy cream,1 tablespoon chopped marjoram,Chopped parsley and crushed oyster crackers (for serving),	DIRECTIONS PreparationCut kernels from cobs and place in a large bowl. Place cobs in a medium pot and add Parmesan rinds, if using, mushroom stems, thyme, bay leaf, 2 tsp. salt, and 8 cups water. Bring to a boil, then reduce heat to medium-low and simmer, stirring occasionally, until broth is fragrant and reduced by half, 40–50 minutes. Strain through a fine-mesh sieve into a medium bowl; discard solids and set broth aside.Meanwhile, heat 4 Tbsp. butter in a large heavy pot over medium-high. Add corn kernels, season generously with salt and pepper, and cook, stirring occasionally, until corn is tender and juices have evaporated and browned on the bottom of the pot, 12–15 minutes. Reserve ½ cup corn for serving; transfer remaining corn to a medium bowl.Add wine to pot and cook, scraping up browned bits, until liquid is syrupy, about 2 minutes. Scrape into bowl with remaining corn.Heat remaining 1 Tbsp. butter in same pot over medium and cook bacon until golden brown and fat has rendered, about 6 minutes. Add potatoes, shallots, leek, garlic, and chopped mushrooms and cook, stirring occasionally, until vegetables have softened but haven’t taken on any color, 12–15 minutes. Add chiles and cook until fragrant and softened, about 3 minutes. Stir in flour and cook until nutty and fragrant, about 1 minute. Add reserved broth, bring to a boil, and cook, stirring occasionally, until potatoes are fork-tender, 10–15 minutes. Add cream and corn mixture and cook, stirring, until chowder has thickened, 5–10 minutes. Remove from heat and stir in marjoram. Let sit 15 minutes before serving.Divide chowder among bowls. Top with parsley, oyster crackers, and reserved ½ cup corn; season with pepper.
400	/hard-cider-gravy	Hard-Cider Gravy Recipe 	 Bon Appetit	10 tablespoons (1¼ sticks) unsalted butter, divided,Neck and giblets from 1 turkey (optional),8 garlic cloves, peeled, crushed,4 sprigs rosemary,4 cups low-sodium chicken broth,½ cup all-purpose flour,2 cups hard cider,¼–½ cup roast turkey pan drippings (optional),Kosher salt and freshly ground black pepper,	DIRECTIONS PreparationHeat 1 Tbsp. butter in a medium saucepan over medium-high heat. Add turkey neck and giblets, if using, and cook, turning occasionally, until golden brown and browned bits form on bottom of saucepan, 5–8 minutes. Add garlic and rosemary, and cook, stirring, until fragrant, about 2 minutes.Add broth and bring to a broil; reduce heat and simmer until reduced to about 2½ cups, 20–25 minutes. Strain stock through a fine-mesh sieve into a large measuring cup or medium bowl; discard solids. Cover and keep stock warm.Heat remaining 9 Tbsp. butter in another medium saucepan over medium heat. Add flour and cook, whisking constantly, until flour is a deep golden brown, 8–10 minutes. Gradually whisk in warm stock. Add cider and pan drippings and bring to a boil. Reduce heat and simmer until flavors meld and stock is thickened, 25–30 minutes; season with salt and pepper.
401	/chocolate-cashew-vegan-ice-cream	Chocolate Cashew Vegan Ice Cream Recipe 	 Bon Appetit	1 vanilla bean, split lengthwise,1 cup raw cashews,4 ounces vegan, soy lecithin-free, dark chocolate, chopped,½ cup plus 2 tablespoons organic or granulated sugar,3 tablespoons unsweetened cocoa powder,½ teaspoon kosher salt,1 cup virgin coconut oil, melted, cooled slightly,An ice cream maker,	DIRECTIONS PreparationPlace vanilla bean and cashews in a large bowl and add 2 cups boiling water. Cover and let sit at room temperature at least 12 hours (hydrating the cashews thoroughly is key for a silky, smooth ice cream).Heat chocolate in a heatproof bowl set over a saucepan of barely simmering water (bowl should not touch water), stirring, until melted. Remove from heat and let sit, stirring occasionally, until cool, 10–15 minutes.Transfer melted chocolate and cashews and their soaking liquid to a blender. Scrape in seeds from vanilla bean; discard pod. Add sugar, cocoa powder, and salt. Purée until smooth, about 30 seconds. With the motor running on medium speed, slowly stream in oil and purée until thick and creamy.Immediately process cashew mixture in ice cream maker according to manufacturer’s directions. (Head’s up: this will take longer than a traditional dairy-based custard to reach soft-serve consistency.) Do not chill before processing or oil will harden into tiny bits and texture will be grainy.Transfer to an airtight container and press plastic wrap directly onto surface. Freeze until firm, at least 4 hours.Do Ahead: Cashews can be soaked 3 days ahead; cover and chill. Ice cream can be made 1 month ahead; keep frozen.
402	/ochazuke-japanese-steeped-rice	Ochazuke (Japanese Steeped Rice) Recipe 	 Bon Appetit	2 cups warm sushi rice, divided,Kosher salt,3 tablespoons neutral oil,¼ cup white soy sauce or 3 tablespoons regular soy sauce, plus more for brushing,4 large eggs,10 ounces mature spinach (about 1 bunch), trimmed,½ cup green tea, such as hojicha, genmaicha, or unro,6 scallions, dark-green parts only, very thinly sliced crosswise,Pickled ginger, furikake seasoning or toasted sesame seeds, and shredded toasted nori (for serving),1 dried shiitake mushroom (optional),	DIRECTIONS PreparationScoop ½ cup rice onto a clean surface. Dampen your hands in a small bowl of salted water (this will prevent the rice from sticking to them and season them slightly). Firmly compress rice into a tight ball, then press down on surface to gently flatten to a 2½–3" round. Repeat with remaining rice to form 4 rice cakes.Heat oil in a large skillet, preferably nonstick, over medium-high. Brush one side of rice cakes with soy sauce. Cook, soy sauce side down, until edges are golden brown and crisp, 5–6 minutes. Brush tops of rice cakes with soy sauce. Turn and cook remaining side until golden brown and crisp, another 5–6 minutes. Remove from heat.Meanwhile, pour water into a large saucepan to a depth of 2". Bring to a boil, then reduce heat so water is at a gentle simmer. Crack an egg into a small bowl, then gently slide egg into simmering water. Repeat with remaining eggs, waiting until whites of eggs in water are opaque before adding the next (about 30 seconds apart). Poach, shaping with a slotted spoon if needed, until whites are set but yolks are still runny, about 3 minutes. Using slotted spoon, transfer eggs to paper towels as they are done.Add spinach to saucepan and cook until just wilted, 20–30 seconds. Drain; let cool slightly, then squeeze out excess water with your hands.Heat 3 cups water in a small saucepan over high until right when water starts to steam (an instant-read thermometer will register 172°). Add tea and let steep 2 minutes. Strain through a fine-mesh sieve into a small bowl; discard solids. Stir in remaining ¼ cup soy sauce.Divide rice cakes, spinach, and eggs among bowls. Pour tea mixture over, then top with scallions, pickled ginger, furikake, and nori. Finely grate mushroom over with a microplane just before serving, if using.
403	/pasta-with-no-cook-tomato-sauce	Pasta with No-Cook Tomato Sauce Recipe 	 Bon Appetit	1½ pounds tomatoes, any shape (larger than cherry), preferably slightly overripe so they feel like full water balloons,1 garlic clove,2 tablespoons unsalted butter, cut into small pieces,4 teaspoons red wine vinegar,½ teaspoon crushed red pepper flakes,¼ cup olive oil, plus more for drizzling,4 ounces finely grated Parmesan (about 1 cup), divided,Kosher salt,12 ounces strand pasta, such as bucatini, spaghetti, or linguini,1 cup basil leaves, torn,	DIRECTIONS Hide All ImagesCut tomatoes in half through the equator (in other words, not through the core, but across the midline). Hold halves in your palms and gently squeeze over a bowl to squeeze out seeds and surrounding juice/jelly.HOW TO GET THE SEEDS OUT OF TOMATOESCasually and imperfectly chop seeded tomatoes so you have some pieces that are very small and some pieces that are a bit larger, but everything should be smaller than an acorn.Transfer tomatoes to a large bowl and mash mixture several times with the back of a large spoon or potato masher to release more juices (you can also just use your hands).Finely grate garlic into bowl with tomatoes with a microplane or fine grater, then add butter, vinegar, red pepper, ¼ cup oil, and half of Parmesan. Season with several pinches of salt, then toss with a large spoon to combine.Cover bowl with plastic and let sit at room temperature at least 30 minutes and up to 5 hours. This lets the flavors marry and tomato juices exude (because we want a saucy pasta).Bring a large pot of water to a boil (4–6 qt.) and add a small fistful of salt. Cook pasta until al dente (follow package instructions).As soon as pasta is ready, use tongs to transfer noodles to bowl with tomatoes and TOSS TOSS TOSS. You want the hot pasta to melt the cheese and butter, which will thicken the sauce.Taste pasta and season with more salt, if needed, then toss in basil.Using tongs, portion pasta into shallow bowls, then spoon remaining tomatoes and juices over.Top with remaining 2 oz. Parmesan, then drizzle with oil.
404	/grilled-pork-tenderloin-sandwiches	Grilled Pork Tenderloin Sandwiches Recipe 	 Bon Appetit	1 oil-packed anchovy fillet,Kosher salt,1 cup mayonnaise,3 tablespoons fresh lemon juice,2 garlic cloves, finely grated,¼ cup chopped basil, plus more for serving,2 tablespoons chopped chives, plus more for serving,Freshly ground black pepper,2 tablespoons fennel seeds,1 teaspoon crushed red pepper flakes,2 tablespoons Diamond Crystal or 3½ teaspoons Morton kosher salt, plus more,2 pork tenderloins (about 1½ pounds each),Vegetable oil (for grill),1 ciabatta loaf, halved lengthwise,6 cups mature arugula leaves with tender stems,Torn basil leaves, chopped chives, and lemon wedges (for serving),A spice mill or mortar and pestle,	DIRECTIONS PreparationBasil-Chive AioliUsing the flat side of a knife, smash anchovy and ½ tsp. salt on a cutting board until a paste forms. Scrape into a medium bowl. Add mayonnaise, lemon juice, garlic, ¼ cup basil, and 2 Tbsp. chives and whisk to combine. Season with salt and pepper; cover and chill until ready to serve.Do Ahead: Aioli can be made 1 day ahead. Keep chilled.Pork and AssemblyGrind fennel seeds and red pepper in spice mill or with mortar and pestle until coarsely ground. Transfer to a small bowl. Mix in 2 Tbsp. salt. Rub mixture all over pork and let sit, uncovered, 1 hour, or chill up to 8.Prepare a grill for medium heat; thoroughly clean grates and brush with oil. Grill pork, turning every 4 minutes, until lightly charred on all sides and an instant-read thermometer inserted into the center of the loin registers 130°, 15–20 minutes. Let rest 10 minutes, then cut into very thin slices.Grill bread halves on both sides until lightly charred and warmed through, about 1 minute per side.Spread about ½ cup aioli over cut sides of both bread halves. Layer arugula over, then top with sliced pork, basil, chives, and a squeeze of lemon. Serve any remaining aioli alongside.
405	/bas-best-pina-colada	BA's Best Piña Colada Recipe 	 Bon Appetit	½ fresh pineapple, peeled, cut into 1½-inch pieces,6 ounces sweetened cream of coconut (preferably Coco López),2 ounces unsweetened coconut milk,8 ounces white rum,2 tablespoons fresh lime juice,2 ounces dark rum (optional),Maraschino cherries and lime wedges (for serving),	DIRECTIONS PreparationPlace pineapple pieces in a resealable plastic bag, laying them flat. Freeze until solid, at least 3 hours.Shake cream of coconut and coconut milk in their cans before measuring. Purée pineapple, cream of coconut, coconut milk, white rum, lime juice, and 3 cups ice (about 15 oz.) in a blender until smooth. Transfer blender cup to freezer and freeze until mixture is thickened (it should be the consistency of a milkshake), 25–35 minutes.Blend again until mixture is the perfect slushy frozen drink consistency. Divide among glasses. Top off each with ½ oz. dark rum, if using, and garnish each with a cherry and lime wedge.Do Ahead: Pineapple can be chopped 3 months ahead. Keep frozen.
406	/bas-best-lemonade	BA's Best Lemonade Recipe 	 Bon Appetit	½ cup sugar,3 lemons, zest removed in wide strips,¾ cup fresh lemon juice (from about 3 lemons),Lemon slices (for serving),	DIRECTIONS PreparationBring sugar and ½ cup water to a boil in a medium saucepan, stirring occasionally, until sugar dissolves. Let cool 5 minutes. Add lemon zest and let sit 30 minutes to steep.Strain lemon syrup through a fine-mesh sieve into a pitcher; discard zest. Add lemon juice and 3 cups water and stir to combine.Serve lemonade over ice garnished with lemon slices.
407	/swordfish-steaks-cherry-tomatoes-capers	Swordfish Steaks with Cherry Tomatoes and Capers Recipe 	 Bon Appetit	4 tablespoons olive oil, divided,1–2 1-inch-thick swordfish steaks (about 1½ pounds total),Kosher salt, freshly ground pepper,½ small red onion, finely chopped,4 oil-packed anchovy fillets, drained, finely chopped,2 15-ounce can cherry tomatoes, drained,2 tablespoons drained capers,2 tablespoons Sherry vinegar or red wine vinegar,2 tablespoons oregano leaves,Lemon wedges (for serving),	DIRECTIONS PreparationACTIVE: 15TOTAL: 30Heat broiler. Drizzle 2 Tbsp. oil in a 2-qt. baking dish. Add swordfish steaks and turn to coat; season with salt and pepper.Toss onion, anchovies, tomatoes, capers, vinegar, and remaining 2 Tbsp. oil in a medium bowl; season with salt and pepper and arrange around fish.Broil until fish is golden brown and tomatoes are starting to blister, 5–8 minutes. Turn fish and broil until fish is opaque throughout and tomatoes have burst and are blistered in spots, 5–7 minutes.Top with oregano and serve with lemon wedges for squeezing over.
408	/falafel-fritters-bowl-with-cucumbers-and-yogurt-sauce	Falafel Fritters Recipe 	 Bon Appetit	2 15-ounce cans chickpeas, drained,1 large egg,2 tablespoons cornstarch,2 teaspoons ground cumin,¼ cup finely chopped parsley, plus 1 cup whole leaves with tender stems,¾ cup plain whole-milk Greek yogurt, divided,Kosher salt, freshly ground pepper,1 medium red onion,8 tablespoons olive oil, divided,2 tablespoons fresh lemon juice (from about ½ lemon), plus wedges for serving,4 Persian cucumbers or ½ English hothouse cucumber, cut into 1-inch irregular pieces,	DIRECTIONS Hide All ImagesMix chickpeas, egg, cornstarch, cumin, ¼ cup chopped parsley, and ¼ cup yogurt in a large bowl. Generously season with salt and pepper.Finely chop half of onion and measure out ¼ cup. Add to bowl with chickpea mixture. Reserve other half for later.Using a potato masher, mash mixture until you’ve broken up almost all of the chickpeas and a thick, coarse paste forms. Some of the chickpeas can be left in larger pieces with a few left whole, but you want everything more or less mashed up.Using your hands, a scoop, or a measuring cup, portion mixture into 16 more-or-less even balls (each ball should be a scant ¼ cup; don’t fill the measuring cup up all the way!). Roll each ball gently between your palms and transfer to a rimmed baking sheet or plate.Press down on balls with your palm to flatten to a ½"-thick patty. If mixture is super sticky and coats your hands, dampen your hands with a bit of cold water and try again.Heat a large skillet (preferably cast iron) over medium-high. Add 3 Tbsp. oil and swirl skillet to coat. When oil is hot, add half of fritters, spacing evenly apart, and press down on top of each with a spatula to flatten into discs. Be careful as you do this because mixture is wet and may splatter.Cook fritters until dark golden brown and crisp on first side, 3–5 minutes. If you’re dealing with annoying oil splatter, reduce heat to medium. Slide a thin metal spatula underneath fritters and gently turn over.Cook fritters on second side until browned and crisp, 3–5 minutes. Transfer fritters to a plate or wire rack (if you have one).Repeat cooking process with 3 Tbsp. oil and remaining fritters.Stir remaining ½ cup yogurt and 1 Tbsp. lemon juice in a small bowl; season with salt and pepper.WE'RE JUST REALLY INTO YOGURT SAUCEThinly slice remaining red onion. Transfer to a large bowl, then add cucumbers and remaining 1 cup parsley, 1 Tbsp. lemon juice, and 2 Tbsp. oil. Season with salt and pepper, then toss gently to combine.Divide cucumber mixture and fritters among bowls. Spoon yogurt sauce alongside and serve with lemon wedges.
409	/coffee-soy-vegan-ice-cream	Coffee Soy Vegan Ice Cream Recipe 	 Bon Appetit	1 pound silken tofu,½ cup plus 2 tablespoons organic or granulated sugar,4 tablespoons instant espresso powder,½ teaspoon kosher salt,1 vanilla bean, split lengthwise,¾ cup refined coconut oil, melted, cooled slightly,An ice cream maker,	DIRECTIONS PreparationPlace tofu, sugar, espresso powder, and salt in a blender. Scrape in seeds from vanilla bean; reserve pod for another use. Purée until smooth, about 15 seconds. With the motor running on medium speed, slowly stream in oil and purée until thick and creamy, being careful not overblend or mixture will break and curdle.Immediately process tofu mixture in ice cream maker according to manufacturer’s directions. (Head’s up: this will take longer than a traditional dairy-based custard to reach soft-serve consistency.) Do not chill before processing or oil will harden into tiny bits and texture will be grainy.Transfer to an airtight container and press plastic wrap directly onto surface. Freeze until firm, at least 4 hours.Do Ahead: Ice cream can be made 1 month ahead; keep frozen.
416	/apple-butter	Apple Butter Recipe 	 Bon Appetit	6 pounds mixed sweet and tart apples, unpeeled, uncored, chopped,6 cups apple cider,1 cup raw or granulated sugar,1 3-inch cinnamon stick,3 whole cloves,½ teaspoon kosher salt,1 tablespoon apple cider vinegar,	DIRECTIONS PreparationBring apples, cider, sugar, cinnamon, cloves, and salt to a boil in a large wide pot. Cook over medium-high heat, stirring occasionally, until most of the liquid has evaporated and apples are very soft, 1–1½ hours.Discard cinnamon stick. Pass apple mixture through the fine disk of a food mill, or strain through a coarse-mesh sieve, pressing with a rubber spatula. Discard peel, seeds, and cloves.Preheat oven to 350°. Transfer apple mixture to a 13x9" baking pan and bake, stirring every 30 minutes, until reduced by half and very thick and dark amber, 1½–2 hours. Stir in vinegar; let cool in pan.Do Ahead: Apple butter can be made 1 month ahead; transfer to an airtight container and chill, or freeze up to 3 months.
410	/classic-spinach-salad	Classic Spinach Salad Recipe 	 Bon Appetit	1 medium shallot, thinly sliced,¼ cup white wine vinegar,¼ teaspoon crushed red chile flakes,½ teaspoon sugar, plus more,Kosher salt,8 ounces thick-cut bacon, cut into ½-inch pieces,1 pound shiitake mushrooms, stemmed, large caps torn into 1-inch pieces, small caps left whole,1 garlic clove, smashed,Freshly ground black pepper,½ cup buttermilk,½ cup sour cream,¼ cup mayonnaise,1 tablespoon fresh lemon juice,½ teaspoon garlic powder,½ teaspoon onion powder,¼ cup finely chopped mixed herbs, such as basil, chives, and/or dill,2 large bunches mature spinach, stemmed, torn into 2-inch pieces,	DIRECTIONS PreparationCombine shallot, vinegar, chile flakes, ½ tsp. sugar, and ½ tsp. salt in a small nonreactive bowl; let sit at room temperature until ready to use.Meanwhile, cook bacon in a large skillet over medium heat, stirring often, until fat has rendered and bacon is browned and crisp, 8–10 minutes. Transfer bacon to paper towels. Pour off 1 Tbsp. fat; set aside for dressing.Return skillet to medium heat and add mushrooms and garlic to remaining bacon fat; season with salt and pepper. Cook, stirring occasionally, until mushrooms are golden brown, 6–8 minutes.Whisk buttermilk, sour cream, mayonnaise, lemon juice, garlic powder, onion powder, and reserved bacon fat in a medium bowl until smooth. Season with salt and pepper. Stir in herbs; cover and chill until cold, at least 30 minutes.Transfer shallot to a large bowl; discard vinegar mixture. Add spinach, dressing, bacon, and mushrooms and toss to coat. Divide salad among plates.Do Ahead: Dressing can be made 1 day ahead. Cover and chill.
411	/white-skillet-pizza-with-spring-greens-and-an-egg	White Skillet Pizza with Spring Greens and an Egg Recipe 	 Bon Appetit	2 garlic cloves, finely grated,⅓ cup olive oil,12 ounces grated low-moisture mozzarella (about 3 cups),5½ ounces grated Fontina (about 2 cups),All-purpose flour (for dusting),1 pound 6 ounces store-bought pizza dough, halved, room temperature,Cornmeal (for sprinkling),Kosher salt, freshly ground pepper,3 spring onions, thinly sliced, divided,4 ounces young broccoli rabe (about half a bunch), trimmed, divided, or 3 cups torn Tuscan kale or Swiss chard, divided,8 oil-packed anchovy fillets (optional), divided,2 large eggs,Finely grated Parmesan (for serving),1½ teaspoons finely chopped oregano, divided,1 lemon,	DIRECTIONS PreparationPlace a rack in upper third of oven; preheat to 500°. Place a 12" cast-iron skillet in oven and preheat 10 minutes.Meanwhile, mix garlic and oil in a small bowl. Mix mozzarella and Fontina in a medium bowl.Using lightly floured hands, stretch 1 piece of dough out on a lightly floured surface to an 11" round.Remove skillet from oven and sprinkle pan with cornmeal (enough to cover most of the surface). Carefully set dough snugly in pan; it’s okay if some of the dough overlaps. Brush dough with garlic-oil (you won’t need all of it); season with salt and pepper. Top dough with 2 cups cheese mixture, half of spring onions, half of broccoli rabe, and 4 anchovies, if using. Top with another ½ cup cheese mixture; season with more pepper.Bake pizza until crust is beginning to turn golden and cheese is melted, 6–8 minutes. Crack 1 egg into center of pizza; season with salt. Continue to bake until whites are just set and crust is golden brown, 5–6 minutes.Transfer pizza to a cutting board and brush edges with more garlic-oil (reserve remaining garlic-oil for second pizza). Top pizza with Parmesan and half of oregano. Using a microplane, grate a little bit of lemon zest over top of pie.Sprinkle cast-iron pan with cornmeal and make a second pizza with remaining dough and toppings.
412	/sticky-rice	Sticky Rice  Recipe 	 Bon Appetit	3 cups water,1 teaspoon salt,1 1/2 cups short-grain rice (such as sushi rice),	DIRECTIONS PreparationBring water to boil in small saucepan. Stir in salt and rice; bring to boil. Cover, reduce heat to low, and simmer until water is absorbed and rice is tender, about 17 minutes. Remove pan from heat.
413	/colcannon	Colcannon Recipe 	 Bon Appetit	5 medium Yukon Gold potatoes (about 1¾ pounds),Kosher salt,6 tablespoons unsalted butter, divided,2 leeks, white and pale-green parts only, sliced in half lengthwise, thinly sliced crosswise,2 garlic cloves, thinly sliced,2 cups (packed) shredded savoy cabbage (from about ¼ large head), divided,1¼ cups milk,½ cup heavy cream,Freshly ground black pepper,1 scallion, thinly sliced,	DIRECTIONS PreparationCover potatoes with water in a small pot; season with salt. Bring to a boil over medium-high heat, then reduce heat and simmer until a paring knife slides easily through the flesh, 30–40 minutes. Drain, let cool slightly, and peel.Meanwhile, melt 4 Tbsp. butter in a large saucepan over medium heat. Add leeks and cook, stirring frequently, until very soft, 8–10 minutes. Add garlic and cook, stirring frequently, until garlic is fragrant and leeks are just beginning to brown around the edges, about 3 minutes longer. Add 1 cup cabbage and cook, stirring constantly, until wilted. Add milk and cream and bring to a simmer.Add potatoes and remaining 1 cup cabbage, then coarsely mash with a potato masher. Season with salt and pepper.Transfer colcannon to a large serving bowl. Top with remaining 2 Tbsp. butter and sprinkle with scallion.
414	/coffee-cashew-vegan-ice-cream	Coffee Cashew Vegan Ice Cream Recipe 	 Bon Appetit	1 vanilla bean, split lengthwise,1 cup raw cashews,½ cup plus 2 tablespoons organic or granulated sugar,4 tablespoons instant espresso powder,½ teaspoon kosher salt,1 cup refined coconut oil, melted, cooled slightly,An ice cream maker,	DIRECTIONS PreparationPlace vanilla bean and cashews in a large bowl and add 2 cups boiling water. Cover and let sit at room temperature at least 12 hours (hydrating the cashews thoroughly is key for a silky, smooth ice cream).Transfer cashews and their soaking liquid to a blender. Scrape in seeds from vanilla bean; discard pod. Add sugar, espresso powder, and salt. Purée until smooth, about 30 seconds. With the motor running on medium speed, slowly stream in oil and purée until thick and creamy.Immediately process cashew mixture in ice cream maker according to manufacturer’s directions. (Head’s up: this will take longer than a traditional dairy-based custard to reach soft-serve consistency.) Do not chill before processing or oil will harden into tiny bits and texture will be grainy.Transfer to an airtight container and press plastic wrap directly onto surface. Freeze until firm, at least 4 hours.Do Ahead: Cashews can be soaked 3 days ahead; cover and chill. Ice cream can be made 1 month ahead; keep frozen.
415	/direwolf-bread	Direwolf Bread Recipe 	 Bon Appetit	1 cup all-purpose flour, plus more for dusting,2 cups whole wheat flour,1 cup rye or whole wheat flour,2 tablespoons light brown sugar,4 teaspoons baking powder,1 teaspoon kosher salt,½ teaspoon baking soda,4 tablespoons (½ stick) unsalted butter, cut into pieces, room temperature, plus more, melted, for brushing,1 cup dark Belgian ale (such as St Bernadetus quadruple ABT 12),1 cup buttermilk,3 tablespoons fresh lemon juice,Nonstick vegetable oil spray,Black or white flaky sea salt,1 pink peppercorn (optional),	DIRECTIONS PreparationPreheat oven to 350°. Lightly dust a parchment-lined baking sheet with all-purpose flour.Whisk whole wheat flour, rye flour, brown sugar, baking powder, kosher salt, baking soda, and 1 cup all-purpose flour in a large bowl, breaking up brown sugar lumps with your fingers, until combined. Work in 4 Tbsp. butter with your fingers until pea-size pieces remain. Make a well in the center and add beer, buttermilk, and lemon juice. Mix with a wooden spoon until a sticky dough forms and no streaks of flour remain.If using the wolf template, cut it out. Transfer dough to prepared pan. Using wet hands, pat dough to a 15x9" oval, making sure dough is smooth and an even thickness. Lightly spray back of template with nonstick spray and lightly dust with all-purpose flour. Place template, floured side down, over dough. Using a sharp paring knife, trace template with an up and down sawing motion, cleaning knife frequently with warm water to get a smoother cut. Gather scraps and pat into a small oval; transfer oval to another parchment-lined baking sheet.Brush loaves with melted butter and sprinkle with sea salt. Press 1 pink peppercorn into wolf dough (this will be the eye). Bake loaves, rotating sheets halfway through, until golden brown, 55–70 minutes. Let cool on sheets.If making a standard loaf, transfer dough to prepared pan. Using wet hands, pat dough to a 14x5" rectangle, making sure dough is smooth and an even thickness. Brush with melted butter and sprinkle with sea salt. Bake until golden brown, 55–70 minutes. Let cool in pan.
417	/protein-packed-trail-mix	Protein-Packed Trail Mix Recipe 	 Bon Appetit	1 15.5-ounce can chickpeas, rinsed,2 tablespoons olive oil, divided,Kosher salt, freshly ground pepper,½ cup almonds,½ cup cashews,½ cup shelled pistachios,¼ teaspoon cayenne pepper,¼ teaspoon ground cardamom,8 dried mission figs, halved,4 dried Turkish figs, thinly sliced,½ cup dried apricots,⅓ cup dried mulberries,¼ cup dried goji berries,¼ cup golden raisins,	DIRECTIONS PreparationPreheat oven to 350º. Place chickpeas on a paper towel-lined rimmed baking sheet and let drain (you want to make sure they’re very dry). Discard paper towel and toss chickpeas with 1 Tbsp. oil; generously season with salt and pepper. Roast chickpeas on baking sheet, tossing once halfway through, until crisp and golden brown, 50–60 minutes. Let cool.Meanwhile, toss almonds, cashews, and remaining 1 Tbsp. oil on another rimmed baking sheet; season with salt (about 1 tsp.) and toss again. Toast 8 minutes, then add pistachios and give pan a shake to combine. Continue to toast until cashews are golden and mixture is fragrant, 2–4 minutes.Transfer nuts to a medium bowl and toss with cayenne and cardamom while still hot. Mix in mission figs, Turkish figs, apricots, mulberries, goji berries, raisins, and salted chickpeas.Do Ahead: Trail mix can be made 3 days ahead. Cover and store in a dry place.
418	/fava-bean-asparagus-salad	Fava Bean and Asparagus Salad Recipe 	 Bon Appetit	¼ cup coarsely chopped raw pistachios,1½ cups shelled fava beans (from about 1 ½ pounds pods),Kosher salt,1 small shallot, finely chopped,2 tablespoons Champagne or white wine vinegar,Freshly ground black pepper,⅓ cup olive oil,1 bunch asparagus, sliced thinly lengthwise on a mandoline,2 cups trimmed watercress or arugula,½ cup mint leaves,2 tablespoons tarragon leaves,2 tablespoons chive blossoms (optional),	DIRECTIONS PreparationPreheat oven to 350°. Toast pistachios on a rimmed baking sheet, tossing occasionally, until fragrant but not browned, 5–8 minutes. Let cool.Cook fava beans in a large saucepan of boiling salted water until tender, about 4 minutes. Using a slotted spoon, transfer to a colander set in a bowl of ice water. Drain, remove skins, and transfer beans to a small bowl.Combine shallot and vinegar in another small bowl; season with salt and pepper and set aside at least 10 minutes. Whisk oil into shallot mixture; season vinaigrette with salt and pepper.Combine beans, asparagus, watercress, mint, and tarragon in a large bowl; add vinaigrette and pistachios and toss to combine. Transfer to a serving platter and top with chive blossoms, if using.
419	/sour-cherry-and-bacon-pizza	Sour Cherry and Bacon Pizza Recipe 	 Bon Appetit	2 oil-packed anchovy fillets, drained, finely chopped,2 garlic cloves, finely grated,¾ cup whole milk ricotta,1¾ teaspoons kosher salt,¼ teaspoon freshly ground black pepper,2½ ounces crumbled Parmesan, divided (about ½ cup),All-purpose flour (for dusting),1 pound, 6 ounces store-bought pizza dough, halved, room temperature,½ pound thick-cut bacon, preferably smoked, cut into ¾-inch pieces,3 cups torn Swiss chard or Tuscan kale, divided (from 1 bunch),1 cup fresh sour cherries, washed, pitted, or frozen sour cherries, thawed, drained (about 7 ounces),¼ cup pickled jalapeños, drained, divided,8 ounces grated low-moisture mozzarella (about 2 packed cups), divided,	DIRECTIONS PreparationPlace a rack in upper third of oven; preheat to 500°. Mix anchovies, garlic, ricotta, salt, pepper, and half of Parmesan in a small bowl.Cook bacon in a 12" cast-iron skillet over medium-high heat, stirring occasionally, until fat is rendered and bacon is golden brown and crispy, 7–9 minutes. Transfer to a paper towel-lined plate.While bacon is cooking, use lightly floured hands on a lightly floured surface to stretch 1 piece of dough to an 11" round.Drain all but a couple teaspoons of pan drippings into a small bowl. Heat pan over medium-high until fat begins to smoke, about 1 minute. Remove from heat, then carefully set dough snugly in hot pan; it’s okay if some overlaps. Dollop half of anchovy mixture over dough and smear to cover. Top with half of chard, half of cherries, half of jalapeños, and half of bacon. Sprinkle half of mozzarella and 2 Tbsp. Parmesan over.Bake pizza until crust is golden brown and cheese is browned in spots, 10–12 minutes.Transfer pizza to a cutting board and lightly brush edges with some reserved bacon fat.Heat 2 tsp. reserved bacon fat in pan over medium-high until it begins to smoke, about 3 minutes. Make a second pizza with remaining dough and toppings.
420	/herby-avocado-hummus	Herby Avocado Hummus Recipe 	 Bon Appetit	½ large ripe avocado,1 15½-ounce can chickpeas, rinsed, drained,⅓ cup tahini, well mixed,¼ cup plus 1 tablespoon fresh lime juice,1 garlic clove, finely grated or smashed to a paste with flat side of knife on cutting board,¾ teaspoon (or more) kosher salt,10 cranks freshly ground black pepper,¼ teaspoon ground cumin,1 cup cilantro leaves with tender stems,2 tablespoons olive oil, plus more for drizzling,Toasted pumpkin seeds (pepitas; for serving),	DIRECTIONS PreparationProcess avocado, chickpeas, tahini, lime juice, garlic, salt, pepper, cumin, and 1 cup cilantro in a food processor until smooth, about 1 minute. With the motor running, stream in 2 Tbsp. oil, then continue to process until hummus is very light and creamy, about 1 minute longer. Taste and season with salt, if needed.Transfer hummus to a shallow bowl. Top with pepitas and cilantro and drizzle with more oil.Do Ahead: Hummus can be made 4 days ahead. Transfer to an airtight container, cover surface with plastic, and chill.
421	/sweet-spicy-chex-mix	Sweet-and-Spicy Chex Mix Recipe 	 Bon Appetit	2 cups corn Chex cereal,2 cups rice Chex cereal,2 cups mixed unsalted nuts (such as pecans and cashews),2 cups small checkerboard pretzels or other small pretzels,½ cup roasted edamame or roasted green peas (not wasabi flavor),½ cup smoked almonds,6 garlic cloves, finely grated,½ cup (1 stick) unsalted butter, melted,6 tablespoons Worcestershire sauce,¼ cup hot sauce (such as Frank’s Hot Sauce),¼ cup (packed) light brown sugar,4 teaspoons kosher salt,1 teaspoon onion powder,½ teaspoon freshly ground black pepper,Pinch of cayenne pepper,2 tablespoons nutritional yeast,2 cups dried sour cherries or cranberries,	DIRECTIONS PreparationPosition racks in upper and lower thirds of oven; preheat to 250°. Toss corn Chex, rice Chex, nuts, pretzels, edamame, and almonds in a large bowl.Whisk garlic, butter, Worcestershire, hot sauce, brown sugar, salt, onion powder, black pepper, and cayenne in a small bowl. Pour over cereal mixture and gently toss with a rubber spatula until coated.Divide mixture between 2 rimmed baking sheets and spread in an even layer. Bake party mix, stirring every 15 minutes and rotating trays from front to back and top to bottom halfway through, until dry and toasted, about 1 hour. Sprinkle with nutritional yeast, toss, and let cool on baking sheets (it will become crisp as it cools).Transfer party mix to a large serving bowl. Add cherries and toss until combined.Do Ahead: Party mix, without cherries, can be made 1 week ahead. Store airtight at room temperature. Add cherries just before serving.
422	/frose-frozen-rose-wine	Frosé (Frozen Rosé) Recipe 	 Bon Appetit	1 750 ml bottle hearty, bold rosé (such as a Pinot Noir or Merlot rosé),½ cup sugar,8 ounces strawberries, hulled, quartered,2½ ounces fresh lemon juice,	DIRECTIONS PreparationPour rosé into a 13x9" pan and freeze until almost solid (it won't completely solidify due to the alcohol), at least 6 hours.Meanwhile, bring sugar and ½ cup water to a boil in a medium saucepan; cook, stirring constantly, until sugar dissolves, about 3 minutes. Add strawberries, remove from heat, and let sit 30 minutes to infuse syrup with strawberry flavor. Strain through a fine-mesh sieve into a small bowl (do not press on solids); cover and chill until cold, about 30 minutes.Scrape rosé into a blender. Add lemon juice, 3½ ounces strawberry syrup, and 1 cup crushed ice and purée until smooth. Transfer blender jar to freezer and freeze until frosé is thickened (aim for milkshake consistency), 25–35 minutes.Blend again until frosé is slushy. Divide among glasses.Do Ahead: Rosé can be frozen 1 week ahead.
423	/beet-and-ricotta-hummus	Beet and Ricotta Hummus Recipe 	 Bon Appetit	1 baseball-sized red beet (about 6 ounces), scrubbed,1 15½-ounce can chickpeas, rinsed, drained,⅓ cup tahini, well mixed,¼ cup fresh lemon juice,¼ cup ricotta,1 garlic clove, finely grated or smashed to a paste with flat side of knife on cutting board,1 teaspoon (or more) kosher salt,10 cranks freshly ground black pepper,¼ teaspoon ground coriander,Mint leaves, poppy seeds, and olive oil (for serving),	DIRECTIONS PreparationPreheat oven to 425°. Wrap beet tightly in foil and place on a foil-lined rimmed baking sheet. Roast until the tines of a fork slide easily into the center of beet, 60–70 minutes. Let sit until cool enough to handle.Meanwhile, process chickpeas, tahini, lemon juice, ricotta, garlic, salt, pepper, and coriander in a food processor until smooth.Using a paper towel, rub beet to remove skin (it should slip off easily and any staining to your hands will be temporary). Trim root end and cut beet into 8 pieces; add to food processor. Process until mixture is smooth, about 2 minutes. Taste and season with salt, if needed.Transfer hummus to a shallow bowl. Top with mint and poppy seeds and drizzle with oil.Do Ahead: Hummus can be made 4 days ahead; transfer to an airtight container and chill.
424	/roasted-brussels-sprouts	Roasted Brussels Sprouts Recipe 	 Bon Appetit	3 pounds brussels sprouts, trimmed, halved, quartered if large,5 tablespoons olive oil,2 teaspoons kosher salt,½ teaspoon freshly ground black pepper,	DIRECTIONS PreparationPreheat oven to 450°. Toss brussels sprouts, oil, salt, and pepper on a rimmed baking sheet. Roast, tossing occasionally, until tender and browned, 35–45 minutes.
425	/masa-shortcake-macerated-strawberries	Masa Shortcake with Macerated Strawberries Recipe 	 Bon Appetit	Nonstick vegetable oil spray,1 cup all-purpose flour, plus more for pan,1 cup half-and-half,½ cup (1 stick) unsalted butter, melted,1 teaspoon finely grated lemon zest,1 cup masa harina,4 teaspoons baking powder,¾ teaspoon kosher salt,⅓ cup sugar,2 tablespoons fresh lemon juice,6 sprigs thyme,½ vanilla bean, split lengthwise,1 pint strawberries, hulled, quartered,Softly whipped cream and finely grated lemon zest (for serving),1 jumbo 6-cup muffin pan,	DIRECTIONS PreparationShortcakesPreheat oven to 450°. Spray muffin cups lightly with nonstick spray. Flour cups, tapping out excess.Whisk half-and-half, butter, and lemon zest in a medium bowl. Whisk masa harina, baking powder, salt, and 1 cup flour in a large bowl. Make a well in the center and pour in half-and-half mixture. Mix with a wooden spoon just until incorporated. Divide batter evenly among muffin cups. Bake shortcakes until golden brown and have risen, 15–20 minutes. Let cool 5 minutes in pan, then transfer pan to a wire rack.Strawberries and AssemblyCombine sugar, lemon juice, thyme, and ⅓ cup water in a small saucepan. Scrape in vanilla seeds; add pod. Bring to a simmer, stirring to dissolve sugar. Remove from heat and let sit until thyme has infused, 25–30 minutes. Strain through a fine-mesh sieve into a medium bowl; discard solids. Let cool to room temperature. Add strawberries and let macerate 30 minutes.Split shortcakes in half lengthwise. Top with strawberries and whipped cream. Garnish with lemon zest.Do Ahead: Thyme syrup can be made 1 week ahead. Cover and chill.
426	/skirt-steak-preserved-lemon-butter-sesame-cauliflower	Skirt Steak with Preserved Lemon Butter and Sesame Cauliflower Recipe 	 Bon Appetit	½ preserved lemon, seeded, finely chopped,4 tablespoons (½ stick) unsalted butter, room temperature,2 teaspoons thyme leaves,½ teaspoon finely grated lemon zest,Kosher salt, freshly ground pepper,1 medium head of cauliflower, cut into florets,4 tablespoons olive oil, divided,Kosher salt, freshly ground pepper,1 garlic clove, grated,2 tablespoons fresh lemon juice,2 tablespoons toasted sesame seeds, chopped,1½ pounds skirt steak, cut into 4 pieces,¼ cup chopped parsley,	DIRECTIONS PreparationACTIVE: 40TOTAL: 1Preserved Lemon ButterFinely chop preserved lemon, butter, thyme, and lemon zest on a cutting board, mashing into a smooth paste. Transfer to a small bowl; season with salt and pepper.Do Ahead: Preserved lemon butter can be made 3 days ahead. Cover and chill.Cauliflower and SteakPreheat oven to 425°. Toss cauliflower and 2 Tbsp. oil on a large rimmed baking sheet; season with salt and pepper. Roast, tossing occasionally, until cauliflower is golden brown and edges are crisp, 30–35 minutes.Meanwhile, combine garlic, lemon juice, sesame seeds, and 1 Tbsp. oil in a small bowl; set aside.Heat remaining 1 Tbsp. oil in a large skillet over medium-high. Season steaks with salt and pepper and cook to desired doneness, about 4 minutes per side for medium-rare. Transfer steaks to a cutting board and top with preserved lemon butter; let rest at least 5 minutes before slicing.Drizzle reserved sesame seed mixture over cauliflower, scatter parsley over, and toss to combine. Serve steaks with cauliflower and any remaining preserved lemon butter alongside.
427	/bas-best-onion-rings	BA's Best Onion Rings Recipe 	 Bon Appetit	1 large sweet onion,2 cups buttermilk,¼ cup cornmeal,1 teaspoon baking powder,½ teaspoon smoked paprika,1½ (or more) cups all-purpose flour, divided,1½ teaspoons kosher salt, plus more,1 cup chilled club soda,¾ cup (or more) chilled lager,Vegetable oil (for frying; about 8 cups),Buttermilk Ranch Dressing (for serving),A deep-fry thermometer,	DIRECTIONS PreparationSlice onion into ½"-thick rounds and separate into individual rings. Place in a large bowl and pour in buttermilk (they should be submerged). Chill 30 minutes.Whisk cornmeal, baking powder, paprika, ¾ cup flour, and 1 ½ tsp. salt in a medium bowl. Whisking constantly, gradually add club soda and lager (it’s okay if a few lumps remain). Mixture should be the consistency of thin crêpe batter; whisk in more beer or flour as needed. (Be careful not to overmix.)Place remaining ¾ cup flour in a shallow bowl. Fit a large pot with thermometer and pour in oil to come 2" up sides. Heat over medium-high until thermometer registers 375°. Working in batches (don’t overcrowd the pot or oil temperature will drop and onions may stick together), remove onion rings from buttermilk, letting excess drip back into bowl. Dredge in flour, shaking off excess, then dip into batter, letting excess drip back into bowl. Fry, turning occasionally with chopsticks or a slotted spoon, until crust is golden brown, puffed, and crisp, about 2 minutes.Transfer onion rings to a wire rack set inside a rimmed baking sheet; season immediately with salt. Serve with Buttermilk Ranch Dressing.
429	/bas-best-masala-chai	BA's Best Masala Chai Recipe 	 Bon Appetit	1 1½-inch piece fresh ginger, unpeeled, coarsely grated,1 3-inch cinnamon stick, lightly crushed with the flat side of a knife,6 teaspoons loose strong black tea (such as Assam) or 6 tea bags (such as PG Tips),14 green cardamom pods, lightly crushed, or ¾ teaspoon cardamom seeds, lightly crushed,2¾ cups milk,¼ cup pure maple syrup,	DIRECTIONS PreparationBring ginger, cinnamon, and 3½ cups water to a boil in a medium saucepan over medium-high heat. Lower heat and simmer rapidly, stirring occasionally, until liquid is reduced by a third and very fragrant, about 20 minutes.Remove pan from heat, stir in tea and cardamom, and let steep 2 minutes.Return pan to medium-high heat and stir in milk and maple syrup. Cook, stirring occasionally and keeping a close watch, until mixture begins to foam up and boil, about 5 minutes. Immediately remove from heat and let sit 5 minutes. Strain chai through a fine-mesh sieve into a teapot or pitcher and serve.
430	/summer-greens-mustardy-potatoes-six-minute-egg	Summer Greens with Mustardy Potatoes and Six-Minute Egg Recipe 	 Bon Appetit	4 large eggs,2 ounces sliced or slab bacon, cut crosswise into ¼-inch strips,¾ pound tiny potatoes, halved if larger than a ping pong ball,Kosher salt, freshly ground pepper,1 small shallot, finely chopped,2 tablespoons whole grain mustard,1 tablespoon (or more) white wine vinegar,4 cups (lightly packed) summer greens, such as arugula, baby romaine, and/or mustard greens,2 cups mixed herb leaves, such as parsley, chives, and/or chervil,	DIRECTIONS PreparationCarefully lower eggs into a medium saucepan of boiling water and cook 6 minutes. Drain and transfer eggs to a bowl of ice water; set aside.Meanwhile, cook bacon in a large skillet over medium heat, stirring occasionally, until fat is starting to render but bacon is not yet crisp, about 4 minutes. Add potatoes; season with salt and pepper. Cook, shaking pan occasionally, until potatoes are tender and cooked through, 8–10 minutes. Remove from heat and add shallot, mustard, and vinegar; toss to coat.Toss greens and herbs in a large bowl, add warm potatoes and toss again to coat; season with salt, pepper, and more vinegar, if desired. Peel and halve eggs; arrange over potatoes and greens.
431	/spicy-harissa-carrot-hummus	Spicy Carrot Hummus  Recipe 	 Bon Appetit	2 medium carrots, peeled, ends trimmed (about 4 ounces),1 15½-ounce can chickpeas, rinsed, drained,⅓ cup tahini, well mixed,¼ cup fresh lemon juice,1 garlic clove, finely grated or smashed to a paste with flat side of knife on cutting board,1 tablespoon (or more) harissa, Sriracha, or gochujang,¾ teaspoon (or more) kosher salt,¼ teaspoon ground cumin,2 tablespoons olive oil, plus more for drizzling,Toasted sunflower seeds and chopped parsley (for serving),	DIRECTIONS PreparationPreheat oven to 425°. Place carrots in the center of a large square of foil and drizzle with 2 Tbsp. water. Wrap foil around carrots to make a tightly sealed packet. Place on a foil-lined rimmed baking sheet and roast until carrots are very tender, 40–50 minutes. Let sit until cool enough to handle.Process roasted carrots, chickpeas, tahini, lemon juice, garlic, harissa, salt, and cumin in a food processor until mixture is smooth, about 1 minute. With the motor running, stream in 2 Tbsp. oil, then continue to process until hummus is very light and creamy, about 1 minute longer. Taste and season with salt, if needed. Add more harissa to make hummus spicier, if desired, then process to incorporate, just a few seconds longer.Transfer hummus to a shallow bowl. Top with sunflower seeds and parsley and drizzle with oil.Do Ahead: Hummus can be made 4 days ahead. Transfer to an airtight container and chill.
432	/dandelion-date-blue-cheese-salad-brown-butter-croutons	Dandelion, Date, and Blue Cheese Salad with Brown Butter Croutons Recipe 	 Bon Appetit	2 tablespoons unsalted butter,2 tablespoons olive oil,1 cup day-old bread, torn into ¾-inch pieces,Kosher salt, freshly ground pepper,1 tablespoon Sherry vinegar or red wine vinegar,1 tablespoon (or more) fresh lemon juice,1 large bunch dandelion greens, mature spinach, or arugula, trimmed, leaves torn into 2-inch pieces,5 Medjool dates, pitted, torn into pieces,2 ounces mild dry blue cheese,	DIRECTIONS PreparationACTIVE: 20TOTAL: 20Cook butter in a medium skillet over medium heat until it foams, then browns and starts to smell nutty, about 4 minutes. Add oil and swirl to combine. Place 2 Tbsp. brown butter in a salad bowl; set aside.Add bread to skillet, season with salt and pepper, and toss to coat. Cook bread, tossing occasionally, until golden brown and crunchy, about 5 minutes (croutons will crisp more as they cool). Set aside.Whisk vinegar and lemon juice into reserved browned butter; season dressing with salt and pepper. Add dandelion greens and dates and toss to coat. Taste and season with salt, pepper, and more lemon juice, if desired. Add croutons and blue cheese and gently toss to coat.
433	/curried-sweet-potato-hummus	Curried Sweet Potato Hummus Recipe 	 Bon Appetit	1 small sweet potato, scrubbed (about 4 ounces),1 15½-ounce can chickpeas, rinsed, drained,⅓ cup tahini, well mixed,¼ cup fresh lime juice,1 garlic clove, finely grated or smashed to a paste with flat side of knife on cutting board,1 teaspoon curry powder,1 teaspoon (or more) kosher salt,10 cranks freshly ground black pepper,⅛ teaspoon cayenne pepper,2 tablespoons melted virgin coconut oil,Crushed roasted, salted cashews, crushed red pepper flakes, and olive oil (for serving),	DIRECTIONS PreparationPreheat oven to 425°. Prick potato all over with a fork and wrap tightly in foil. Place on a foil-lined rimmed baking sheet and roast until the tines of a fork slide easily into the center of potato, 60–70 minutes. Let sit until cool enough to handle.Meanwhile, process chickpeas, tahini, lime juice, garlic, curry powder, salt, black pepper, and cayenne in a food processor until smooth.Halve potato lengthwise and scoop out ½ cup flesh (discard skin). Add to food processor and process until mixture is smooth, about 1 minute. With the motor running, stream in coconut oil, then continue to process until hummus is very light and creamy, 1–2 minutes longer. Taste and season with salt, if needed.Transfer hummus to a shallow bowl. Top with cashews and red pepper and drizzle with olive oil.Do Ahead: Hummus can be made 4 days ahead. Transfer to an airtight container and chill.
434	/potato-salad-smoked-salmon-everything-bagel-spice	Potato Salad with Lox and Everything-Bagel Spice Recipe 	 Bon Appetit	2 pounds Peewee or peanut potatoes,Kosher salt,½ cup crème fraîche,1 teaspoon finely grated lemon zest,¼ cup olive oil, plus more for drizzling,5 small radishes, trimmed, cut into wedges,Freshly ground black pepper,1 teaspoon dried minced garlic,1 teaspoon dried minced onion,1 teaspoon poppy seeds,1 teaspoon toasted sesame seeds,½ teaspoon flaky sea salt,4 ounces thinly sliced smoked salmon, torn into small pieces,¼ cup chopped dill,	DIRECTIONS PreparationPlace potatoes in a large pot and pour in cold water to cover; season with salt. Bring to a boil; reduce heat and simmer until tender, 10–15 minutes. Drain; let cool.Meanwhile, mix crème fraîche, lemon zest, and ¼ cup oil in a large bowl. Add potatoes and radishes and toss to coat; season with salt and pepper.Combine dried garlic, dried onions, poppy seeds, sesame seeds, and sea salt in a small bowl.To serve, layer potatoes with pieces of smoked salmon, spice mix, and dill on a platter and drizzle with more oil.Do Ahead: Potato salad can be dressed 1 day ahead; cover and chill. Add dill, spice mix, and smoked salmon just before serving.
436	/mozzarella-sticks	Mozzarella Sticks Recipe 	 Bon Appetit	1 pound mozzarella (preferably Polly-o),¾ cup all-purpose flour,3 large eggs,3 tablespoons whole milk,2 cups panko (Japanese breadcrumbs),1½ teaspoons garlic powder,1½ teaspoons onion powder,1 teaspoon dried basil,1 teaspoon dried oregano,1 teaspoon dried parsley,1 teaspoon dried thyme,Vegetable oil (for frying; about 6 cups),Kosher salt,Spicy Marinara Sauce (for serving),A deep-fry thermometer,	DIRECTIONS PreparationCut mozzarella into 3x½" pieces. Place flour in a shallow dish. Whisk eggs and milk in another shallow dish. Mix panko, garlic powder, onion powder, basil, oregano, parsley, and thyme in third shallow dish.Working with one piece of mozzarella at a time, dredge in flour, shaking off excess. Dip in egg mixture, then coat in panko mixture, pressing to adhere. Repeat steps for a second coating. Transfer to a wire rack set inside a rimmed baking sheet. Repeat with remaining mozzarella. Transfer rack with mozzarella to freezer and freeze at least 1 hour.Fit a large pot with deep-fry thermometer and pour in oil to come 2" up sides. Heat over medium-high until thermometer registers 350°. Working in batches, fry mozzarella, turning occasionally, until golden brown and crisp, 2–2½ minutes. Transfer to a paper towel-lined plate and season with salt while still hot. Serve with Spicy Marinara Sauce.Do Ahead: Mozzarella sticks can be breaded 3 days ahead; keep frozen.
437	/crispy-potato-salad-chiles-celery-peanuts	Crispy Potato Salad with Chiles, Celery, and Peanuts Recipe 	 Bon Appetit	2 pounds baby fingerling potatoes, sliced crosswise ¾ inch thick,Kosher salt,3 tablespoons vegetable oil,2 red chiles (such as serrano or Holland), thinly sliced,1 garlic clove, finely grated,½ cup unseasoned rice vinegar,2 teaspoons light brown sugar,1 teaspoon finely grated peeled ginger,½ cup unsalted, roasted peanuts, coarsely chopped,2 celery stalks, sliced in half lengthwise, thinly sliced on a diagonal, plus ½ cup celery leaves,1 cup coarsely chopped cilantro,½ cup torn mint leaves,	DIRECTIONS PreparationPlace potatoes in a large pot and pour in cold water to cover; season with salt. Bring to a boil; reduce heat and simmer until tender, 10–15 minutes. Drain; let cool.Heat oil in a large skillet over medium-high. Cook potatoes, tossing occasionally, until golden brown and crisp, 8–10 minutes; season with salt.Meanwhile, bring chiles, garlic, vinegar, brown sugar, and ginger to a simmer in a small saucepan over medium-low heat, stirring, until sugar dissolves, about 2 minutes.Toss potatoes, warm vinegar mixture, and peanuts in a large bowl; let cool slightly. Add celery, celery leaves, cilantro, and mint and toss again to combine. Taste and season with salt if needed.Do Ahead: Potatoes can be boiled 1 day ahead; cover and chill.
438	/potato-salad-old-bay-potato-chips	Potato Salad with Old Bay and Potato Chips Recipe 	 Bon Appetit	2 pounds small waxy potatoes, scrubbed, halved,Kosher salt,¼ cup cup olive oil, plus more for drizzling,1 small red onion, thinly sliced,¼ cup apple cider vinegar,1 tablespoon whole grain mustard,1 teaspoon Old Bay seasoning,1 teaspoon (or more) coarsely ground black pepper,Pinch of cayenne pepper,2 cups kettle-cooked potato chips,¼ cup coarsely chopped parsley,3 tablespoons finely chopped chives,	DIRECTIONS PreparationPlace potatoes in a large pot and pour in cold water to cover; season with salt. Bring to a boil; reduce heat and simmer until tender, 15–18 minutes. Drain and return to pot to dry out; let cool.Meanwhile, heat ¼ cup oil in a medium skillet over medium-high. Add onion; season with salt. Cook, stirring occasionally, until soft, about 5 minutes.Transfer onion to a large bowl. Stir in vinegar, mustard, Old Bay, black pepper, and cayenne. Add potatoes, potato chips, parsley, and chives to vinaigrette and toss to combine. Taste and season with salt and black pepper if needed; drizzle with more oil.Do Ahead: Vinaigrette can be made 3 days ahead; cover and chill.
439	/dominique-ansels-rainbow-mille-feuille	Dominique Ansel's Rainbow Mille-Feuille Recipe 	 Bon Appetit	2 cups whole milk,12 large egg yolks,1⅓ cups granulated sugar,¼ cup cornstarch,¾ cup (1½ sticks) unsalted butter, cut into pieces,2 packages frozen puff pastry (preferably Dufour), thawed,Powdered sugar (for dusting),¼ cup fruit purée or preserves,3–5 drops food coloring,5 pastry bags or resealable plastic bags,	DIRECTIONS PreparationBring milk to a simmer in a medium saucepan over medium heat. Meanwhile, vigorously whisk egg yolks, granulated sugar, and cornstarch in a medium bowl until light in color and well incorporated. Whisking constantly, stream one-third of warmed milk into yolk mixture and whisk until well blended. Return pot with remaining milk to medium-low heat and add yolk mixture. Cook, whisking constantly, until pastry cream is very thick (think pudding) and begins to bubble, about 4 minutes.Remove from heat and whisk in butter until fully incorporated. Line a rimmed baking sheet or large shallow bowl with plastic wrap and spread pastry cream directly on plastic (the more spread out the pastry cream is, the faster it will cool). Cover with another piece of plastic wrap, pressing it directly against the surface to prevent a skin from forming, and chill at least 2 hours.Meanwhile, preheat oven to 375°. Unfold each puff pastry onto a parchment-lined rimmed baking sheet. Using a fork, dock both pieces of dough, making rows across the surface about 1" apart. Bake puff pastry until golden brown, 25–35 minutes. Remove baking sheets from oven and dust pastry lightly with powdered sugar. Return to oven and bake until sugar is caramelized, 1–2 minutes. Transfer sheets to wire racks and let cool.Fold pastry cream with fruit purée (if using preserves, finished pastry cream will have some fruit pieces in it) in a medium bowl. Divide pastry cream among 5 small bowls (you should have about 4 cups pastry cream to make 5 colors). Add food coloring 1 drop at a time and mix until desired color is achieved. (Some good combinations: raspberry and red; blueberry and blue/purple; apricot and orange.) Transfer each color to a piping bag and chill until ready to use.Using a serrated knife, cut each puff pastry into six 4x6" rectangles. Place a rectangle of pastry on a plate or platter. Cut off a small corner of piping bag and pipe the first layer of pastry cream on puff pastry, leaving a ⅛" border. Place another pastry rectangle on top, then pipe the next flavor of pastry cream. Repeat with remaining pastry rectangles and creams, creating 6 layers and ending with puff pastry. Dust top layer of puff pastry with powdered sugar. Serve immediately.Do Ahead: Pastry cream can be made up to 5 days ahead; store in an airtight container and chill.
440	/bas-best-cream-scones	BA's Best Cream Scones Recipe 	 Bon Appetit	¼ cup granulated sugar,2 teaspoons baking powder,½ teaspoon baking soda,½ teaspoon kosher salt,3 cups all-purpose flour, plus more for surface,½ cup (1 stick) chilled unsalted butter, cut into pieces,1 large egg, beaten to blend,1¼ cups heavy cream, plus more for brushing,Demerara or raw sugar (for sprinkling),	DIRECTIONS PreparationPreheat oven to 375°. Whisk granulated sugar, baking powder, baking soda, salt, and 3 cups flour in a large bowl to combine. Add butter and toss to coat. Using your fingers or a pastry blender, work butter into flour until only pea-size pieces remain. Make a well in the center; add egg and 1¼ cups cream and mix with a fork, incorporating dry ingredients a little at a time, until a shaggy dough forms (it’s okay if it looks a little dry; don’t overwork). Lightly knead dough in bowl until it just comes together.Turn out onto a lightly floured surface and pat into a 1"-thick round. Cut into 8 wedges and transfer to a parchment-lined baking sheet. Brush dough with cream and sprinkle with demerara sugar. Bake scones until golden brown, 25–30 minutes.Do Ahead: Scones can be made 1 day ahead. Store lightly covered at room temperature.VariationsLemon-Rosemary: Whisk 2 tsp. finely grated lemon zest and 2 tsp. finely chopped fresh rosemary into flour mixture before adding butter.Cinnamon-Chocolate: Toss 1 cup chopped bittersweet chocolate and 1 tsp. ground cinnamon into flour mixture after working in butter.Double Ginger: Whisk 2 Tbsp. finely chopped candied ginger and 1 Tbsp. finely grated peeled ginger into flour mixture before adding butter.Mixed Berry: Toss 1 cup fresh or frozen berries, cut into pieces if large, into flour mixture after working in butter.Pecan-Oat: Toss ¾ cup old-fashioned oats and ¾ cup chopped toasted pecans into flour mixture before adding butter. Sprinkle ¼ cup oats along with demerara sugar over scones before baking.
446	/herbed-baked-brie	Herbed Baked Brie Recipe 	 Bon Appetit	1 2.2-pound wheel of brie (or 8-ounce rounds),6 sprigs rosemary,6 sprigs thyme,2 tablespoons olive oil,Cranberry-Pear Mostarda, Thyme-Roasted Walnuts, sliced pear, crackers, and sliced baguette (for serving),	DIRECTIONS PreparationPlace brie on a plate and freeze until very firm, about 30 minutes.Preheat oven to 350°. Cut off top rind of brie with a sharp knife (it’s okay if you can’t get the rind off in one piece; brie will smooth out as it bakes).Toss rosemary, thyme, and oil on a parchment-lined rimmed baking sheet until coated. Spread herbs evenly on parchment. Place brie in the center so that it covers about half of the herbs. Bake until cheese is melted, 15–20 minutes. Remove from oven and let rest to firm up slightly, about 5 minutes (if you skip this step, you risk spilling molten cheese all over your cutting board).Strip leaves from uncovered herbs and sprinkle over brie. Using parchment and a wide spatula, carefully slide brie and covered herbs onto a cutting board.Arrange mostarda, walnuts, pear slices, crackers, and baguette slices around cutting board; serve brie warm.
441	/giant-chocolate-chip-skillet-cookie	Giant Chocolate Chip Skillet Cookie Recipe 	 Bon Appetit	1 cup semisweet chocolate wafers (discs, pistoles, fèves),½ cup plus 2 tablespoons dark brown sugar,⅓ cup granulated sugar,¼ cup (½ stick) plus 2 tablespoons unsalted butter, room temperature,¾ teaspoon kosher salt,1 large egg, room temperature,1½ teaspoons vanilla paste or extract,1 cup all-purpose flour,¼ teaspoon baking soda,Flaky sea salt,	DIRECTIONS PreparationPlace a rack in lowest position in oven; preheat to 375°. Coarsely chop chocolate, leaving several wafers whole; set aside.Mix brown sugar, granulated sugar, butter, and kosher salt in a large bowl until no large lumps remain, about 1 minute. Stir in egg and vanilla until egg is incorporated and mixture is very loose and resembles cake batter, about 30 seconds. Add flour and baking soda and mix until dough comes together and no streaks remain, about 30 seconds. Stir in ¾ cup chocolate, reserving remaining chocolate, until evenly distributed.Scrape batter into a 10" cast-iron skillet (or use a stainless steel skillet coated with nonstick vegetable oil spray). Pat batter into skillet with damp hands, pressing into an even layer so dough extends to sides of pan. Scatter remaining chocolate over cookie and sprinkle with sea salt.Bake cookie until outer edges are browned and slightly puffed, 20–25 minutes (15–18 minutes for stainless steel). Let cool in skillet 1 hour (if you can resist). Serve in skillet or turn out; cut into wedges.
442	/spicy-sausage-and-white-bean-soup	Spicy Sausage and White Bean Soup Recipe 	 Bon Appetit	2 tablespoons olive oil,1 pound hot turkey or Italian sausage, casings removed, chopped,1 large onion, finely chopped,2 large peppers (red, orange, or yellow), finely chopped,2–3 carrots, finely chopped,4 garlic cloves, finely chopped,2 tablespoons finely chopped sage,1 tablespoon finely chopped rosemary,½ teaspoon kosher salt,½ teaspoon freshly ground black pepper,¼ teaspoon red pepper flakes,4 cups homemade chicken stock or low-sodium chicken broth,1 14-ounce can petite diced tomatoes,3 15-ounce cans cannellini beans, drained, rinsed,½ cup unsweetened almond milk,1 pound baby spinach,¼ cup grated Parmesan,	DIRECTIONS PreparationHeat oil in a large stockpot over medium. Cook sausage, stirring occasionally, until browned, about 10 minutes. Transfer sausage to a plate. Add onion, peppers, carrots, and garlic to pot and cook, stirring frequently, until onions are tender, about 8 minutes.Add sage, rosemary, salt, black pepper, and red pepper flakes. Stir in chicken stock, tomatoes and their juices, and reserved sausage. Bring to a boil, then reduce heat and simmer until flavors have melded, about 15 minutes.Using a fork, coarsely mash beans from 1 can and add to sausage mixture. Stir in almond milk and remaining 2 cans of beans; let simmer 10 minutes.Divide spinach among bowls, then ladle soup over spinach. Top soup with Parmesan.
443	/tacos-al-pastor	Tacos al Pastor Recipe 	 Bon Appetit	1 large white onion, halved,1 pineapple, peeled, cut crosswise into 1/2-inch-thick rounds,1/2 cup fresh orange juice,1/4 cup distilled white vinegar,1/4 cup guajillo chile powder,3 garlic cloves, halved,2 teaspoons coarse kosher salt,1 teaspoon dried oregano (preferably Mexican),1 teaspoon ground cumin,1 large or 2 small chipotle chiles and 1 to 2 teaspoons adobo from canned chipotle chiles in adobo,1 2 1/2-to 3-pound boneless pork loin, cut into 1/2-inch slices,1/4 cup chopped fresh cilantro,Corn tortillas,Smoky Two-Chile Salsa (click for recipe),Lime wedges,	DIRECTIONS PreparationCoarsely chop 1 onion half. Coarsely chop 2 pineapple rounds, discarding core; cover and chill remaining pineapple. Place chopped onion and chopped pineapple in blender. Add orange juice and next 7 ingredients; puree marinade until smooth. Place pork in large resealable plastic bag. Add marinade and seal bag, releasing excess air. Turn to coat. Chill at least 4 hours and up to 1 day.Prepare barbecue (medium-high heat). Grill remaining pineapple until warm and slightly charred, 4 to 6 minutes per side. Grill pork with some marinade still clinging until slightly charred and cooked through, 2 to 4 minutes per side. Transfer pineapple and pork to work surface; chop pineapple into 1/2-inch cubes, discarding cores. Chop pork. Transfer to platter; toss to combine.Meanwhile, finely chop remaining onion half and place in medium bowl. Add cilantro; toss to combine. Grill tortillas until warm and slightly charred, about 10 seconds per side.Serve pork-pineapple mixture with onion-cilantro relish, Smoky Two-Chile Salsa, and lime wedges.
444	/chicken-scarpariello	Chicken Scarpariello with Sausage and Peppers Recipe 	 Bon Appetit	1½ pounds fingerling potatoes, halved lengthwise,6 tablespoons extra-virgin olive oil, divided,Kosher salt, freshly ground pepper,3 links sweet Italian sausage,6 skin-on, bone-in chicken thighs,2 large onions, chopped,½ large red bell pepper, chopped,6 garlic cloves, finely grated,1 cup dry white wine,1 cup low-sodium chicken broth,½ cup chopped hot, sweet pickled Peppadew peppers in brine,¼ cup white wine vinegar,3 sprigs rosemary,Chopped parsley (for serving),	DIRECTIONS PreparationArrange racks in upper and lower thirds of oven; preheat to 450°. Toss potatoes with 3 Tbsp. oil on a rimmed baking sheet; season with salt and pepper. Arrange cut side down and roast on lower rack until tender and cut sides are browned, 20–30 minutes; set aside.Meanwhile, heat remaining 3 Tbsp. oil in a large skillet over medium-high. Cook sausages, turning occasionally, until browned on all sides, 6–8 minutes (they will not be fully cooked). Transfer to a plate.Season chicken on both sides with salt and pepper. Cook in same skillet, turning occasionally, until golden brown on both sides, 8–10 minutes (they will also be undercooked). Transfer to plate with sausage.Cook onions, bell pepper, and garlic in same skillet over medium-high heat, stirring occasionally and scraping bottom of pan, until tender and beginning to brown, 10–12 minutes. Add wine and cook, stirring occasionally, until reduced and you can no longer smell the alcohol, about 8 minutes. Add broth, peppers, vinegar, and rosemary and bring to a boil; cook until slightly reduced, about 5 minutes. Nestle chicken into onion mixture, then transfer skillet to upper rack of oven and roast chicken 10 minutes. Add sausages to skillet, pushing them into onion mixture, and continue to roast until chicken is cooked through and an instant-read thermometer inserted into thickest part of thigh registers 165°, 5–10 minutes.Top with parsley and serve with roasted potatoes alongside.
445	/cranberry-pear-mostarda	Cranberry-Pear Mostarda Recipe 	 Bon Appetit	½ cup dry white wine,½ cup sugar,1 Bosc pear, peeled, cored, cut into ½-inch pieces,12 ounces fresh or frozen cranberries, thawed, divided,1 tablespoon mustard seeds,1 teaspoon dry mustard,Pinch of cayenne pepper,Kosher salt, freshly ground pepper,	DIRECTIONS PreparationCook wine and sugar in a medium saucepan over medium-high heat, stirring occasionally, until mixture boils, about 4 minutes. Add pear and half of the cranberries and cook, stirring frequently, until cranberries have burst and pears begin to soften, 5–8 minutes. Stir in remaining cranberries and bring to a boil.Remove pan from heat and stir in mustard seeds, dry mustard, and cayenne; season with salt and pepper. Let sit, uncovered, at room temperature until cool (flavor will develop as it sits). Transfer to a medium serving bowl and serve at room temperature.Do Ahead: Mostarda can be made 5 days ahead. Cover and chill. Bring to room temperature before serving.
448	/fettuccine-ai-frutti-di-mare	Fettuccine ai Frutti di Mare Recipe 	 Bon Appetit	3 tablespoons olive oil,1 large onion, chopped,4 garlic cloves, crushed,Kosher salt, freshly ground pepper,2 oil-packed anchovy fillets, chopped,1 tablespoon tomato paste,5 cups canned diced tomatoes, plus ½ cup tomato juice,3 tablespoons chopped basil,¼ teaspoon red pepper flakes,½ cup clam juice,½ cup dry white wine,12 small clams, such as Manila or littleneck, scrubbed,16 mussels, scrubbed, debearded,10 ounces large shrimp, peeled, deveined,10 ounces bay scallops,12 ounces fresh fettuccine (or 8 ounces dried),5 ounces baby spinach leaves,	DIRECTIONS PreparationHeat oil in a large saucepan over medium. Cook onion and garlic, stirring, until onions are translucent, 5–8 minutes; season with salt and pepper. Add anchovies and tomato paste and cook, stirring, until color deepens, about 2 minutes.Stir in tomatoes, tomato juice, basil, red pepper flakes, and 2 tsp. salt. Bring to a boil, then reduce heat and simmer until sauce is thickened, about 15 minutes.Add clam juice and wine and bring to a boil; cook 2 minutes. Lower heat and bring to a rapid simmer. Add clams and cook until they open, 8–10 minutes. Transfer clams to a large warm bowl; discard any that do not open.Add mussels and cook until they open, 3–5 minutes. Transfer mussels to bowl with clams; discard any that do not open.Return sauce to a boil, add shrimp and scallops, cover, and remove from heat. Let sit until shrimp and scallops are cooked through, 5–8 minutes. Transfer shrimp and scallops to another large warm bowl.Meanwhile, cook fettuccine in a large pot of boiling salted water until barely al dente, about 2 minutes if using fresh pasta, reserving 2 Tbsp. pasta cooking liquid.Return sauce to a boil, add spinach, and cook until spinach is wilted, about 1 minute. Add pasta and pasta cooking liquid; simmer until sauce thickens, 2–5 minutes. Add shrimp and scallops and continue cooking until well combined, 30–60 seconds. Transfer pasta mixture to a large bowl; season with salt and pepper. Arrange clams and mussels over pasta.Do Ahead: Sauce can be made 2 days ahead. Let cool, store in an airtight container, and chill, or freeze up to 3 months.
449	/savory-fondue-babka	Savory Fondue Babka Recipe 	 Bon Appetit	½ cup milk, warmed to 100°,2¼ teaspoons active dry yeast,2 large eggs,1 tablespoon Diamond Crystal or 1¾ teaspoons Morton kosher salt,1 teaspoon sugar,2½ cups all-purpose flour,7 tablespoons  unsalted butter, cut into small pieces, room temperature, plus more for bowl,Nonstick vegetable oil spray,1 garlic clove, finely grated,1 tablespoon apricot eau de vie or kirsch,1 tablespoon fresh lemon juice,All-purpose flour (for dusting),3 ounces grated Emmenthal cheese (about 1 cup),3 ounces grated Gruyère (about 1 cup),Freshly ground black pepper,1 large egg yolk,A 9x5" loaf pan,	DIRECTIONS PreparationDoughWhisk milk and yeast in the bowl of a stand mixer (or large bowl if kneading by hand). Let sit until foamy, about 10 minutes.Whisk eggs, salt, and sugar in a small bowl. Add egg mixture and flour to yeast mixture. Mix with a wooden spoon until a shaggy dough forms. Beat with dough hook on medium speed (dough will be very dry and shaggy), adding 7 Tbsp. butter one piece at a time, until dough is smooth, elastic, and very tacky but pulls away from sides of bowl, about 10 minutes. (Alternatively, knead dough on a lightly floured surface until smooth and elastic, about 10 minutes.)Grease a large bowl with butter; transfer dough to bowl. Cover with plastic wrap and let sit in a warm place until doubled in size, about 1 hour.Do Ahead: Dough can be made 1 day ahead; cover and chill.Filling and AssemblyLightly coat loaf pan with nonstick spray, then line with parchment paper, leaving a 2" overhang on long sides. Coat parchment with nonstick spray.Mix garlic, eau de vie, and lemon juice in a small bowl. Turn out dough onto a lightly floured surface. Roll out to a 16x10" rectangle and orient so long side is facing you. Brush garlic mixture over dough, going all the way to the edges. Top with cheese and generously season with pepper. Roll up dough away from you like a jelly roll, pulling lightly on it as you roll to maintain thickness. (Use a metal bench scraper if needed to help dough release from surface.)Using a serrated knife, cut log in half lengthwise so layers of cheese and dough are exposed. Arrange halves cut side up and side by side. Place one half over the other to make a narrow X, then twist the two ends on one side twice. Repeat on opposite side. (You should have a total of 4 twists.)Transfer dough to prepared pan. Spray plastic wrap with nonstick spray and loosely drape over pan. Let sit in a warm place until almost doubled in size, about 1 hour.Preheat oven to 375°. Beat egg yolk with 1 Tbsp. water in a small bowl. Brush dough with egg wash. Bake babka until top is golden brown, 25–35 minutes. Transfer pan to a wire rack and let babka cool in pan 15 minutes. Turn out onto a wire rack using parchment overhang and running a paring knife around edges to help loosen, if needed. Let cool completely before slicing.
450	/corned-beef	Corned Beef  Recipe 	 Bon Appetit	5 dried chiles de árbol,1 1-inch piece fresh ginger, peeled, coarsely chopped,1 3-inch cinnamon stick,10 cardamom pods,8 dried bay leaves,3 tablespoons whole peppercorns,2 tablespoons coriander seeds,2 tablespoons mustard seeds,1 tablespoon allspice berries,1 tablespoon juniper berries,1 teaspoon whole cloves,1 14.9-ounce can Guinness draught,½ cup (packed) light brown sugar,5 teaspoons pink curing salt,2½ cups kosher salt, plus more,1 5–6 pound untrimmed flat-cut beef brisket,	DIRECTIONS PreparationPickling SpiceToast chiles, ginger, cinnamon stick, cardamom, bay leaves, peppercorns, coriander seeds, mustard seeds, allspice berries, juniper berries, and cloves in a large dry skillet over medium heat, shaking pan occasionally, until spices start to jump in pan and are fragrant, 3–5 minutes (don’t let them burn). Transfer to a mortar and pestle and coarsely crush about 1 minute (or crush with a knife).Brine and BrisketWhisk Guinness, brown sugar, curing salt, 2½ cups kosher salt, and 1 gallon water in a large pot or container (at least 8 quarts) until sugar and salts are dissolved. Scoop out ½ cup pickling spice and set aside in a small bowl or jar (you won’t need it again until it’s time to cook the corned beef). Add remaining spice mixture and brisket to brine and weigh down with a plate to keep it submerged (it’s okay if brisket needs to be crammed into the container, just don’t fold it; you can also cut it in half if you can’t find a large enough container). Cover with plastic wrap or a lid and chill, flipping meat once a day, 5–6 days.Bring a large pot of lightly salted water to a simmer. Remove brisket from brine and rinse thoroughly under cold water; discard brine. Add brisket to simmering water along with reserved ½ cup spice mixture and cook, covered, until corned beef is fork-tender and easily shreds with the grain, 4–4½ hours.Slice corned beef against the grain and serve.Do Ahead: Corned beef can be cooked 1 week ahead; cover with plastic and chill.
451	/ham-and-sausage-jambalaya	Ham and Sausage Jambalaya Recipe 	 Bon Appetit	1 pound andouille or other smoked sausage,1 pound smoked ham, cut into 1-inch pieces,1 tablespoon unsalted butter,1 white onion, finely chopped,3 celery stalks, finely chopped,1 green bell pepper, cored, finely chopped,1 red bell pepper, cored, finely chopped,Kosher salt,3 plum tomatoes, seeded, finely chopped,3 garlic cloves, finely chopped,1 jalapeño, finely chopped,2 tablespoons tomato paste,1 teaspoon finely chopped thyme,4½ cups low-sodium chicken stock,3 cups long-grain rice, rinsed,4 bay leaves,10 dashes hot sauce (preferably Tabasco),Freshly ground black pepper,1 pound medium shrimp, peeled, deveined,¼ cup chopped scallions,½ cup chopped parsley leaves with tender stems, divided,Lemon wedges (for serving),	DIRECTIONS PreparationCook sausage and ham in a large pot over medium heat, stirring occasionally, until browned, about 12 minutes; transfer to a plate. Wipe out pot.Melt butter in same pot over medium-high heat. Cook onion, celery, green pepper, red pepper, and 1 tsp. salt, stirring frequently, until onion is translucent, 10–12 minutes. Stir in tomatoes, garlic, jalapeño, tomato paste, and thyme; cook until heated through, about 1 minute. Season with salt.Add chicken stock and bring to a boil. Stir in rice, bay leaves, and hot sauce. Season with salt and pepper.Return to a boil, then reduce heat to low and simmer, covered, 15 minutes. Uncover and stir in reserved sausage and ham. Cook until heated through, about 5 more minutes.Add shrimp, scallions, and ¼ cup parsley. Stir a few times to allow shrimp to begin cooking, then cover pot, turn off heat, and let jambalaya sit until shrimp are cooked through, 15–18 minutes. Transfer to a large bowl, then top with remaining ¼ cup parsley. Serve with lemon wedges alongside.
452	/mushroom-toasts-with-watercress-and-chives	Mushroom Toasts Recipe Recipe 	 Bon Appetit	6 tablespoons olive oil, divided, plus more for drizzling,4 ¾-inch-thick slices country-style bread,1 garlic clove,Kosher salt,2 tablespoons unsalted butter,12 ounces mixed mushrooms, such as morels, chanterelles, crimini, and/or      maitake, coarsely chopped,1 medium shallot, finely chopped,1 tablespoon dry white wine,1 cup crème fraîche or sour cream,1 teaspoon chopped thyme,½ teaspoon finely grated lemon zest,Freshly ground black pepper,1 cup (loosely packed) trimmed watercress, torn,2 teaspoons fresh lemon juice,1 tablespoon finely chopped chives,	DIRECTIONS PreparationHeat 3 Tbsp. oil in a medium skillet over medium-high. Working in batches, fry bread until golden, about 2 minutes per side. Transfer bread to a plate; wipe out skillet. Rub garlic clove onto bread, then season with salt. Using a paring knife, poke holes all over bread (so it can soak up all the sauce).Heat butter and 3 Tbsp. oil in same skillet over medium-high. Add mushrooms and shallot and cook, stirring occasionally, until most of the mushrooms are golden brown and slightly crisp, 6–8 minutes. Add wine and cook until evaporated, about 30 seconds. Add crème fraîche and cook, stirring occasionally, until sauce is slightly thickened but still loose and velvety, 3–5 minutes. Stir in thyme and lemon zest, then remove from heat; season with salt and pepper.Toss watercress, lemon juice, and a pinch of salt in a small bowl. Drizzle with oil.Divide mushroom mixture among toasts. Top with chives and watercress salad.
453	/corned-beef-and-cabbage-egg-rolls	Corned Beef and Cabbage Egg Rolls Recipe 	 Bon Appetit	¼ cup Dijon mustard,2 tablespoons French’s yellow mustard,1 tablespoon plus 1 teaspoon unseasoned rice vinegar,1 tablespoon plus 1 teaspoon mustard powder,¼ teaspoon cayenne pepper,2 cups coarsely chopped cooked cabbage (about 7 ounces),1 cup (packed) coarsely chopped cooked corned beef (about 5 ounces),½ cup coarsely chopped cooked carrots (about 3 ounces),Kosher salt, freshly ground pepper,6 wonton wrappers,Neutral oil (for frying; about 4 cups),A deep-fry thermometer,	DIRECTIONS PreparationEgg Roll Mustard SauceWhisk Dijon mustard, yellow mustard, rice vinegar, mustard powder, and cayenne in a small bowl until smooth. Chill until ready to use.Do Ahead: Sauce can be made 2 days ahead; cover and chill.Egg Rolls and AssemblyPlace cabbage, corned beef, and carrots in a food processor; season with salt and pepper. Pulse until pieces are slightly smaller than pea-size.Working one at a time, place wonton wrapper on a work surface with 1 corner facing you. Place 2.5 oz. (about ⅓ cup) filling in center of wrapper and shape into a horizontal 4"-long log. Dip your fingers in water and lightly brush top, left, and right corners of wrapper. Roll bottom corner up and over filling, then tuck under filling. Fold left and right corners tightly over filling to enclose, then continue to roll bundle away from you, tucking as you go, to create a classic egg roll shape. Both sides should be as close to sealed as possible; use a little water to pinch and patch.Fit a medium pot with deep-fry thermometer and pour in oil to come halfway up the sides. Heat over high until thermometer registers 350°. Reduce heat to medium. Working in batches, fry egg rolls until lightly browned and crisp, 3–4 minutes. Transfer to a wire rack and let cool slightly before serving; the finished texture should be crispy but still have a little chew to it. Serve with sauce alongside.
454	/oddfellows-waffle-cones	OddFellows' Waffle Cones Recipe 	 Bon Appetit	¾ cup all-purpose flour,½ teaspoon kosher salt,¼ teaspoon ground cinnamon,¾ cup plus 2 Tbsp. powdered sugar, divided,3 large egg whites,5 tablespoons unsalted butter, melted,Nonstick vegetable oil spray,A waffle-cone maker,	DIRECTIONS PreparationWhisk flour, salt, cinnamon, and ¾ cup powdered sugar in a medium bowl. Using an electric mixer on medium-high speed, beat egg whites and remaining 2 Tbsp. powdered sugar in a large bowl to stiff, fluffy peaks. Fold dry ingredients into egg white mixture until just blended. Fold in butter and mix until all is incorporated.Spray a waffle-cone maker with nonstick spray and heat to medium. Using ¼ cup batter per batch, make waffle cones one at a time and according to manufacturer’s instructions, baking to desired doneness and molding them while still warm.
455	/dale-taldes-mickey-ds-style-fried-apple-pies	Dale Talde's Mickey D's–Style Fried Apple Pies Recipe 	 Bon Appetit	1 stick (¼ pound) unsalted butter,1½ cups firmly packed light brown sugar,5 sweet-tart apples, like Granny Smith, peeled, cored, cut into ¼-inch cubes (about 7 cups),1 teaspoon kosher salt,½ teaspoon ground cinnamon,12–16 defrosted frozen plain roti paratha or roti canai,½ cup turbinado sugar, such as Sugar in the Raw brand,Vegetable oil (for deep frying),A deep-fry thermometer,Roti is available at Asian markets and online.,	DIRECTIONS PreparationMake the FillingMelt butter in a wide skillet over medium heat. Add brown sugar and stir well, breaking up clumps. Let mixture simmer until sugar has mostly dissolved, about 5 minutes. Raise heat to medium-high, stir in apples, salt, and cinnamon, and cook, stirring occasionally, until apples are tender but not mushy, about 8 minutes. The sugar will seize up but will melt into the liquid that the apples release as they cook. Transfer mixture to a bowl and let it cool completely.Do Ahead: You can keep the filling in the fridge for up to 3 days.Form the PiesWork with one roti at a time, keeping it between the plastic squares it comes in (roti is very sticky) and keeping the others in the fridge as you form each pie. Put a roti on a work surface. Use your palm to stretch roti slightly, starting in the center and applying gentle pressure as you move toward the edges.Peel off top layer of plastic. Stir filling, then add 3 Tbsp.–¼ cup (depending on diameter of roti) of filling to the center of the roti. Holding two corners of the remaining plastic square, fold roti over filling to form a semicircle, gently forcing air out but keeping filling in. Firmly press rounded edge of roti to create a seal, then crimp with a fork. Use a sharp knife to make three slashes on the top (so it doesn’t burst), cutting through roti layer and leaving ½" or so between slashes. Sprinkle some sugar (about 1 tsp.) on top, then fold plastic over and use your hands to gently press so sugar adheres. Do the same on the other side of the pie.Repeat with remaining roti and filling. Chill pies in the fridge for at least 30 minutes before frying.Do Ahead: You can keep the pies covered in the fridge for up to 12 hours, or freeze them—first uncovered on a plate, then in bags with parchment paper in between the pies—for up to 3 months.Fry the PiesPreheat oven to 200°F and set a rack over a baking sheet. Pour enough oil into a large pot to reach a depth of about 3". Set pot over medium-high heat and bring oil to 350°F (use a deep-fry thermometer). Fry pies 4 or so at a time, carefully turning them over halfway through if they float to the surface, until golden brown and crispy, 3–4 minutes per batch. (If you're frying frozen pies, they'll take about 6 minutes.)Transfer them to rack and keep them warm in oven. Let oil come back to 350°F between batches. Let them cool slightly before you eat.
456	/true-vanilla-ice-cream	True Vanilla Ice Cream Recipe 	 Bon Appetit	1 cup whole milk,1/4 cup sugar,Pinch of kosher salt,1/2 vanilla bean, split lengthwise, or 1 tsp. vanilla extract,5 large egg yolks,1/4 cup sugar,1 1/2 cups heavy cream,	DIRECTIONS PreparationInstructionsCombine cream, milk, sugar, and salt in a medium saucepan. Scrape in seeds from vanilla bean; add pod or add vanilla extract. Bring mixture just to a simmer, stirring to dissolve sugar. Remove from heat. If using vanilla bean, cover; let sit 30 minutes.Whisk egg yolks and sugar in a medium bowl until pale, about 2 minutes. Gradually whisk in ½ cup warm cream mixture. Whisk yolk mixture into remaining cream mixture. Cook mixture over medium heat, stirring constantly, until thick enough to coat a wooden spoon, 2–3 minutes.Strain custard into a medium bowl set over a bowl of ice water; let cool, stirring occasionally. Process custard in an ice cream maker according to manufacturer’s instructions. Transfer to an airtight container; cover. Freeze until firm, at least 4 hours and up to 1 week.Cherry-Bourbon Ice CreamMAKES ABOUT 4 CUPSCook 1 1/2 cups halved pitted cherries, 2 tablespoons sugar, and 1 tablespoon water in a small saucepan over medium heat, stirring occasionally, until syrupy, 8–10 minutes. Remove from heat and stir in 1 tablespoon bourbon; let cool. Process custard and fold in cherry mixture just before transferring to freezer.Chocolate-Malt Ice CreamMAKES ABOUT 4 CUPSStrain hot custard over 6 ounces chopped bittersweet chocolate in a medium bowl; let stand 5 minutes, then whisk to combine. Let cool over a bowl of ice water. Process custard, adding in 1 cup chopped malted milk balls at the end.Coffee StracciatellaMAKES ABOUT 4 CUPSMix 2 teaspoons instant espresso powder into strained, hot custard until dissolved; cool over ice bath. Once custard is frozen to desired consistency in ice cream maker, gradually pour in 3 ounces melted bittersweet chocolate; process until ice cream is flecked with chocolate, 2 minutes longer.PistachioMAKES ABOUT 4 CUPSOnce custard is frozen to desired consistency in ice cream maker, add 1 cup chopped unsalted raw pistachios; process just until combined.
457	/bas-best-hot-chocolate	BA's Best Hot Chocolate Recipe 	 Bon Appetit	3 tablespoons cocoa powder (preferably Dutch-processed), plus more for serving,3 cups whole milk,6 ounces semisweet chocolate (preferably Scharffen Berger), finely chopped,3 tablespoons demerara or granulated sugar,Lightly sweetened whipped cream (for serving),	DIRECTIONS PreparationBring ¾ cup water to a simmer in a medium saucepan over medium-high heat. Whisk in 3 Tbsp. cocoa powder until no lumps remain, then add milk and return to a simmer. Whisk in chocolate and sugar and cook, whisking frequently, until mixture is smooth and creamy and chocolate is melted, about 5 minutes.Divide hot chocolate among mugs. Top with whipped cream and dust with cocoa powder.
\.


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('recipes_recipe_id_seq', 457, true);


--
-- Data for Name: tagrecipes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tagrecipes (tagrecipe_id, tag_id, recipe_id) FROM stdin;
1	8	1
2	11	1
3	12	1
4	7	1
5	14	1
6	18	1
7	16	1
8	4	1
9	1	1
10	5	1
11	15	1
12	13	1
13	9	1
14	17	1
15	10	1
16	2	1
17	6	1
18	19	1
19	20	1
20	3	1
22	32	2
23	37	2
24	25	2
25	14	2
26	38	2
27	26	2
28	23	2
29	5	2
30	34	2
31	31	2
32	35	2
33	24	2
34	33	2
35	29	2
36	2	2
37	41	2
38	40	2
39	27	2
40	30	2
41	12	2
42	43	3
43	54	3
44	42	3
45	19	3
46	57	3
47	50	3
48	46	3
49	48	3
50	55	3
51	49	3
52	45	3
53	3	3
54	6	3
55	52	3
56	44	3
57	51	3
58	65	4
59	66	4
60	67	4
61	63	4
62	58	4
63	25	4
64	59	4
65	64	4
66	68	4
67	62	4
68	12	4
69	66	5
70	65	5
71	67	5
72	58	5
73	71	5
74	72	5
75	31	5
76	59	5
77	64	5
78	68	5
79	12	5
80	65	6
81	66	6
82	67	6
83	59	6
84	62	6
85	88	7
86	89	7
87	87	7
88	8	7
90	68	8
91	88	8
92	15	8
93	93	8
94	48	8
95	92	8
96	51	8
97	111	9
98	12	9
99	100	9
100	5	9
101	106	9
102	14	9
103	98	9
104	101	9
105	10	9
106	93	9
107	18	9
108	30	9
109	109	9
110	107	9
112	111	10
113	12	10
114	118	10
115	122	10
116	113	10
117	5	10
118	114	10
119	128	10
120	120	10
121	14	10
122	126	10
123	116	10
124	117	10
125	121	10
126	119	10
127	127	10
128	125	10
130	138	11
131	133	11
132	139	11
133	12	11
134	131	11
135	136	11
136	135	11
137	132	11
138	111	11
140	111	12
141	12	12
142	152	12
143	66	12
144	5	12
145	14	12
146	154	12
147	155	12
148	147	12
149	119	12
150	141	12
151	142	12
152	148	12
153	150	12
154	145	12
155	68	12
157	160	13
158	35	13
159	147	13
160	148	13
161	165	13
162	162	13
163	8	13
164	158	13
165	163	13
166	172	14
167	14	14
168	13	14
169	49	14
170	168	14
171	167	14
172	68	14
174	1	15
175	175	15
176	179	15
177	176	15
178	14	15
179	35	15
180	30	15
181	183	15
182	93	15
183	12	15
184	186	16
185	167	16
186	13	16
187	187	16
188	58	16
189	191	16
190	68	16
191	188	16
192	193	17
193	197	17
194	58	17
195	202	17
196	200	17
197	198	17
198	201	17
199	199	17
200	194	17
201	195	17
202	68	17
203	51	17
204	205	18
205	167	18
206	215	18
207	49	18
208	16	18
209	14	18
210	212	18
211	71	18
212	207	18
213	216	18
214	20	18
215	51	18
216	163	18
217	218	19
218	224	19
219	220	19
220	219	19
221	225	19
222	222	19
223	221	19
224	50	19
225	68	19
227	205	20
228	227	20
229	236	20
230	237	20
231	187	20
232	145	20
233	18	20
234	148	20
235	30	20
236	68	20
237	92	20
238	232	20
239	163	20
240	243	21
241	197	21
242	163	21
243	237	21
244	246	21
245	242	21
246	2	21
247	8	21
249	66	22
250	65	22
251	67	22
252	255	22
253	59	22
254	64	22
255	68	22
256	12	22
257	66	23
258	65	23
259	260	23
260	35	23
261	59	23
262	67	23
263	64	23
264	68	23
265	12	23
266	205	24
267	269	24
268	71	24
269	93	24
270	273	24
271	274	24
272	272	24
273	68	24
274	51	24
275	163	24
276	8	25
277	68	25
278	205	25
279	35	25
280	93	25
281	186	25
282	283	25
283	30	25
284	188	25
285	163	25
286	8	26
287	294	26
288	66	26
289	122	26
290	35	26
291	290	26
292	298	26
293	287	26
294	199	26
295	120	26
296	128	26
297	269	26
298	12	26
299	27	27
300	187	27
301	5	27
302	306	27
303	306	27
304	305	27
305	8	27
306	25	27
308	314	28
309	315	28
310	15	28
311	311	28
312	219	28
313	308	28
314	8	28
315	218	28
317	68	29
318	8	29
319	326	29
320	321	29
321	14	29
322	13	29
323	145	29
324	167	29
325	290	29
326	49	29
327	127	29
328	319	29
329	142	29
330	12	29
331	8	30
332	343	30
333	338	30
334	331	30
335	6	30
336	58	30
337	187	30
338	15	30
339	49	30
340	19	30
341	55	30
342	195	30
343	51	30
344	44	30
345	356	31
346	361	31
347	44	31
348	359	31
349	344	31
350	3	31
351	197	31
352	358	31
353	345	31
354	350	31
355	357	31
356	346	31
357	347	31
358	48	31
359	355	31
360	51	31
361	354	31
363	362	32
364	356	32
365	367	32
366	8	32
367	51	32
368	354	32
369	44	32
370	372	33
371	370	33
372	8	33
373	218	33
375	375	34
376	125	34
377	381	34
378	383	34
379	3	34
380	305	34
381	8	34
382	158	34
383	51	34
384	354	34
385	15	35
386	387	35
387	372	35
388	8	35
389	218	35
391	225	36
392	224	36
393	142	36
394	394	36
395	372	36
396	370	36
397	8	36
399	8	37
400	294	37
401	400	37
402	246	37
403	20	37
404	405	37
405	187	37
406	51	37
407	12	37
408	410	38
409	38	38
410	8	38
411	218	38
413	417	39
414	372	39
415	370	39
416	220	39
417	8	39
418	218	39
420	314	40
421	315	40
422	15	40
423	311	40
424	219	40
425	308	40
426	8	40
427	218	40
429	381	41
430	383	41
431	15	41
432	435	41
433	199	41
434	429	41
435	48	41
436	8	41
437	273	41
438	158	41
439	51	41
440	314	42
441	315	42
442	187	42
443	372	42
444	370	42
445	8	42
446	218	42
448	451	43
449	272	43
450	205	43
451	447	43
452	8	43
453	453	43
454	158	43
455	163	43
456	460	44
457	394	44
458	372	44
459	370	44
460	220	44
461	8	44
462	218	44
464	464	45
465	3	45
466	260	45
467	205	45
468	8	45
469	158	45
471	472	46
472	172	46
473	205	46
474	8	46
475	51	46
476	163	46
477	315	47
478	479	47
479	187	47
480	8	47
482	356	48
483	57	48
484	44	48
485	120	48
486	311	48
487	488	48
488	8	48
489	481	48
490	354	48
491	495	49
492	491	49
493	15	49
494	120	49
495	311	49
496	50	49
497	498	49
498	308	49
499	48	49
500	8	49
501	218	49
502	502	49
504	508	50
505	507	50
506	49	50
507	8	50
508	68	50
509	354	50
510	51	50
511	381	50
512	383	50
513	519	51
514	356	51
515	513	51
516	57	51
517	44	51
518	311	51
519	518	51
520	488	51
521	8	51
522	354	51
523	51	51
524	530	52
525	356	52
526	57	52
527	44	52
528	311	52
529	488	52
530	8	52
531	523	52
532	354	52
533	51	52
534	218	53
535	142	53
536	540	53
537	18	53
538	220	53
539	536	53
540	8	53
542	542	54
543	326	54
544	44	54
545	548	54
546	541	54
547	547	54
548	8	54
549	544	54
550	354	54
551	92	54
552	51	54
553	8	55
554	218	55
556	8	56
557	557	56
558	561	56
559	13	56
560	273	56
561	14	56
562	199	56
563	68	56
564	51	56
565	68	57
566	8	57
567	224	57
568	565	57
569	571	57
570	569	57
571	218	57
572	142	57
574	14	58
575	574	58
576	577	58
577	578	58
578	8	58
579	12	58
580	582	59
581	583	59
582	57	59
583	584	59
584	48	59
585	8	59
586	218	59
588	356	60
589	592	60
590	44	60
591	49	60
592	195	60
593	8	60
594	51	60
595	354	60
596	600	61
597	326	61
598	605	61
599	595	61
600	205	61
601	128	61
602	8	61
603	66	61
604	453	61
605	158	61
606	163	61
607	354	61
608	613	62
609	356	62
610	57	62
611	44	62
612	311	62
613	488	62
614	8	62
616	356	63
617	57	63
618	44	63
619	311	63
620	488	63
621	8	63
622	619	63
623	51	63
624	148	64
625	540	64
626	220	64
627	8	64
628	218	64
630	88	65
631	629	65
632	260	65
633	205	65
634	8	65
635	66	65
636	163	65
637	354	65
638	642	66
639	54	66
640	44	66
641	640	66
642	187	66
643	8	66
644	51	66
645	356	67
646	57	67
647	44	67
648	311	67
649	18	67
650	488	67
651	8	67
652	354	67
653	232	67
654	8	68
655	68	68
656	653	68
657	183	68
658	215	68
659	655	68
660	273	68
661	187	68
662	212	68
663	326	68
664	659	68
665	191	68
666	216	68
667	657	68
668	163	68
669	51	68
670	13	69
671	356	69
672	15	69
673	44	69
674	57	69
675	672	69
676	669	69
677	48	69
678	8	69
679	51	69
680	679	70
681	38	70
682	394	70
683	372	70
684	370	70
685	8	70
686	218	70
688	187	71
689	394	71
690	691	71
691	372	71
692	8	71
693	218	71
695	314	72
696	18	72
697	8	72
698	697	72
699	218	72
700	523	72
701	383	72
702	88	73
703	243	73
704	15	73
705	44	73
706	197	73
707	702	73
708	8	73
710	713	74
711	8	74
712	218	74
713	92	74
714	51	74
715	44	74
716	120	75
717	715	75
718	721	75
719	719	75
720	8	75
721	44	75
722	51	75
723	356	76
724	715	76
725	721	76
726	719	76
727	8	76
728	44	76
729	51	76
730	148	77
731	326	77
732	736	77
733	745	77
734	735	77
735	319	77
736	731	77
737	117	77
738	205	77
739	518	77
740	737	77
741	729	77
742	8	77
743	163	77
744	12	77
745	188	77
746	354	77
747	188	78
748	163	78
749	205	78
750	748	78
751	751	78
752	8	78
753	453	78
754	158	78
756	8	79
757	218	79
758	760	79
759	523	79
760	51	79
761	383	79
762	569	80
763	659	80
764	106	80
765	163	80
766	767	80
767	205	80
768	8	80
769	453	80
770	158	80
771	51	80
772	780	81
773	605	81
774	595	81
775	774	81
776	205	81
777	776	81
778	8	81
779	453	81
780	158	81
781	92	81
782	51	81
783	163	81
784	314	82
785	15	82
786	8	82
787	697	82
788	218	82
789	523	82
791	8	83
792	697	83
793	218	83
794	523	83
795	383	83
796	760	83
797	54	84
798	799	84
799	44	84
800	120	84
801	429	84
802	305	84
803	8	84
804	51	84
805	13	85
806	806	85
807	547	85
808	8	85
809	218	85
811	58	86
812	813	86
813	89	86
814	811	86
815	815	86
816	8	86
818	8	87
819	44	87
820	819	87
821	825	87
822	824	87
823	822	87
824	721	87
825	354	87
826	51	87
827	68	88
828	8	88
829	836	88
830	827	88
831	2	88
832	14	88
833	837	88
834	9	88
835	147	88
836	835	88
837	188	88
838	187	88
839	12	88
840	354	88
841	8	89
842	565	89
843	736	89
844	49	89
845	14	89
846	148	89
847	29	89
848	354	89
849	12	89
850	68	90
851	218	90
852	851	90
853	565	90
854	571	90
855	142	90
856	8	90
858	314	91
859	147	91
860	811	91
861	8	91
862	697	91
863	218	91
865	68	92
866	8	92
867	354	92
868	92	92
869	867	92
870	14	92
871	274	92
872	142	92
873	51	92
874	68	93
875	8	93
876	877	93
877	491	93
878	6	93
879	878	93
880	51	93
881	92	93
882	885	94
883	659	94
884	884	94
885	888	94
886	882	94
887	8	94
888	33	94
889	29	94
890	12	94
891	68	95
892	8	95
893	167	95
894	502	95
895	893	95
897	8	96
898	14	96
899	737	96
900	176	96
901	502	96
902	93	96
903	58	96
904	191	96
905	188	96
906	12	96
907	8	97
908	907	97
909	116	97
910	595	97
911	287	97
912	120	97
913	375	97
914	142	97
915	128	97
916	269	97
917	68	97
918	51	97
919	92	97
920	12	97
921	163	97
922	8	98
923	68	98
924	381	98
925	326	98
926	2	98
927	565	98
928	18	98
929	92	98
930	51	98
931	383	98
932	68	99
933	8	99
934	120	99
935	160	99
936	58	99
937	93	99
938	199	99
939	168	99
941	583	100
942	224	100
943	187	100
944	507	100
945	8	100
946	218	100
948	949	101
949	950	101
950	8	101
951	44	101
952	954	101
953	58	101
954	52	101
955	951	101
957	314	102
958	315	102
959	187	102
960	142	102
961	507	102
962	50	102
963	960	102
964	8	102
965	218	102
967	8	103
968	967	103
969	595	103
970	970	103
971	973	103
972	35	103
973	135	103
974	66	103
975	600	103
976	68	103
977	12	103
978	8	104
979	191	104
980	20	104
981	246	104
982	986	104
983	145	104
984	14	104
985	176	104
986	577	104
987	12	104
988	990	105
989	44	105
990	721	105
991	49	105
992	776	105
993	48	105
994	92	105
995	8	105
997	8	106
998	218	106
999	951	106
1000	523	106
1001	187	106
1002	619	106
1004	68	107
1005	8	107
1006	1011	107
1007	381	107
1008	1009	107
1009	200	107
1010	3	107
1011	6	107
1012	1014	107
1013	49	107
1014	811	107
1015	354	107
1017	1022	108
1018	1017	108
1019	1021	108
1020	109	108
1021	8	108
1022	25	108
1024	58	109
1025	1026	109
1026	44	109
1027	367	109
1028	52	109
1029	48	109
1030	8	109
1031	1025	109
1033	88	110
1034	1041	110
1035	57	110
1036	44	110
1037	595	110
1038	574	110
1039	269	110
1040	49	110
1041	8	110
1042	354	110
1043	51	110
1044	356	111
1045	1048	111
1046	1044	111
1047	1045	111
1048	218	111
1050	218	112
1051	326	112
1052	224	112
1053	187	112
1054	1053	112
1055	571	112
1056	49	112
1057	8	112
1059	491	113
1060	35	113
1061	1067	113
1062	679	113
1063	162	113
1064	14	113
1065	199	113
1066	1066	113
1067	187	113
1068	774	113
1069	1071	113
1070	8	113
1071	51	113
1073	1073	114
1074	218	114
1075	224	114
1076	1077	114
1077	93	114
1078	1080	114
1079	655	114
1080	8	114
1082	1086	115
1083	68	115
1084	8	115
1085	990	115
1086	574	115
1087	160	115
1088	1091	115
1089	513	115
1090	548	115
1091	50	115
1092	1077	115
1093	92	115
1094	51	115
1095	44	115
1096	260	116
1097	93	116
1098	713	116
1099	851	116
1100	8	116
1101	218	116
1103	1109	117
1104	172	117
1105	187	117
1106	5	117
1107	1106	117
1108	40	117
1109	128	117
1110	8	117
1111	163	117
1112	201	118
1113	736	118
1114	14	118
1115	154	118
1116	142	118
1117	176	118
1118	145	118
1119	8	118
1120	66	118
1121	163	118
1122	12	118
1123	1128	119
1124	359	119
1125	1127	119
1126	319	119
1127	255	119
1128	12	119
1129	131	119
1130	1134	119
1131	1125	119
1132	132	119
1133	305	119
1134	33	119
1136	315	120
1137	218	120
1138	120	120
1139	187	120
1140	18	120
1141	1138	120
1142	49	120
1143	8	120
1145	8	121
1146	68	121
1147	273	121
1148	1144	121
1149	1147	121
1150	1148	121
1151	51	121
1152	163	121
1153	1156	122
1154	990	122
1155	44	122
1156	721	122
1157	49	122
1158	48	122
1159	92	122
1160	8	122
1162	1161	123
1163	13	123
1164	1167	123
1165	8	123
1166	1168	123
1167	12	123
1168	163	123
1169	354	123
1170	46	124
1171	15	124
1172	198	124
1173	199	124
1174	1175	124
1175	507	124
1176	8	124
1177	1169	124
1178	381	124
1179	383	124
1180	44	124
1181	51	124
1182	642	125
1183	44	125
1184	479	125
1185	1186	125
1186	1187	125
1187	1185	125
1188	8	125
1189	51	125
1190	1189	126
1191	1009	126
1192	338	126
1193	8	126
1194	383	126
1195	381	126
1196	44	126
1197	51	126
1198	46	127
1199	120	127
1200	187	127
1201	93	127
1202	1203	127
1203	1206	127
1204	1197	127
1205	8	127
1206	68	127
1207	92	127
1208	51	127
1209	354	127
1210	315	128
1211	356	128
1212	15	128
1213	1209	128
1214	1210	128
1215	507	128
1216	8	128
1217	760	128
1218	51	128
1219	1225	129
1220	827	129
1221	1230	129
1222	359	129
1223	344	129
1224	4	129
1225	355	129
1226	319	129
1227	133	129
1228	1220	129
1229	345	129
1230	350	129
1231	163	129
1232	5	129
1233	1242	129
1234	1229	129
1235	306	129
1236	306	129
1237	72	129
1238	729	129
1239	2	129
1240	1219	129
1241	1223	129
1242	12	129
1243	51	129
1244	92	129
1245	205	130
1246	8	130
1247	1245	130
1248	188	130
1249	163	130
1250	243	131
1251	1248	131
1252	13	131
1253	1167	131
1254	162	131
1255	197	131
1256	142	131
1257	163	131
1258	16	131
1259	669	131
1260	8	131
1261	1251	131
1262	66	131
1263	970	131
1264	12	131
1265	15	132
1266	435	132
1267	1263	132
1268	50	132
1269	1268	132
1270	8	132
1271	44	132
1272	51	132
1273	62	132
1274	356	133
1275	15	133
1276	479	133
1277	1209	133
1278	507	133
1279	8	133
1280	760	133
1281	1263	134
1282	199	134
1283	1268	134
1284	8	134
1285	44	134
1286	51	134
1287	62	134
1288	44	135
1289	715	135
1290	721	135
1291	719	135
1292	8	135
1293	51	135
1294	642	136
1295	356	136
1296	44	136
1297	62	136
1298	1297	136
1299	1296	136
1300	1300	136
1301	8	136
1302	51	136
1303	57	137
1304	1301	137
1305	14	137
1306	1305	137
1307	199	137
1308	255	137
1309	574	137
1310	1302	137
1311	713	137
1312	8	137
1313	1308	137
1314	163	137
1315	51	137
1316	1156	138
1317	126	138
1318	58	138
1319	8	138
1321	557	139
1322	605	139
1323	595	139
1324	8	139
1325	453	139
1326	158	139
1327	92	139
1328	354	139
1329	51	139
1330	315	140
1331	356	140
1332	949	140
1333	44	140
1334	1332	140
1335	8	140
1336	697	140
1338	3	141
1339	1339	141
1340	736	141
1341	1336	141
1342	8	141
1343	383	141
1344	381	141
1345	125	142
1346	1349	142
1347	135	142
1348	1344	142
1349	8	142
1350	481	142
1351	51	142
1352	68	142
1353	12	142
1354	163	142
1355	35	143
1356	1353	143
1357	8	143
1358	51	143
1359	92	143
1360	1361	144
1361	1353	144
1362	8	144
1363	51	144
1364	92	144
1365	12	144
1366	1364	145
1367	274	145
1368	8	145
1369	66	145
1370	453	145
1371	158	145
1372	12	145
1373	354	145
1374	1376	146
1375	218	146
1376	142	146
1377	951	146
1378	571	146
1379	8	146
1381	1381	147
1382	1376	147
1383	218	147
1384	1384	147
1385	142	147
1386	811	147
1387	50	147
1388	8	147
1389	502	147
1391	57	148
1392	1398	148
1393	246	148
1394	135	148
1395	176	148
1396	851	148
1397	8	148
1398	51	148
1399	12	148
1400	163	148
1401	1364	149
1402	1405	149
1403	1219	149
1404	51	149
1405	12	149
1406	158	149
1407	92	149
1408	163	149
1409	642	150
1410	362	150
1411	54	150
1412	356	150
1413	592	150
1414	57	150
1415	44	150
1416	1186	150
1417	347	150
1418	507	150
1419	48	150
1420	51	150
1421	400	151
1422	1021	151
1423	1353	151
1424	8	151
1425	51	151
1426	12	151
1427	163	151
1428	68	151
1429	139	152
1430	187	152
1431	246	152
1432	1431	152
1433	1427	152
1434	72	152
1435	8	152
1436	25	152
1437	51	152
1438	163	152
1439	12	152
1440	1384	153
1441	187	153
1442	507	153
1443	960	153
1444	1441	153
1445	8	153
1446	218	153
1448	88	154
1449	1451	154
1450	1446	154
1451	18	154
1452	237	154
1453	1457	154
1454	272	154
1455	8	154
1456	139	154
1457	51	154
1458	12	154
1459	163	154
1460	119	155
1461	3	155
1462	255	155
1463	136	155
1464	8	155
1465	33	155
1466	970	155
1467	12	155
1468	163	155
1469	1302	156
1470	1021	156
1471	1353	156
1472	867	156
1473	8	156
1474	51	156
1475	12	156
1476	1474	157
1477	1134	157
1478	8	157
1479	66	157
1480	453	157
1481	158	157
1482	12	157
1483	356	158
1484	44	158
1485	1487	158
1486	1210	158
1487	1486	158
1488	8	158
1490	13	159
1491	1494	159
1492	735	159
1493	776	159
1494	8	159
1495	51	159
1496	68	159
1497	92	159
1498	12	159
1499	163	159
1500	659	160
1501	1499	160
1502	1044	160
1503	867	160
1504	1507	160
1505	8	160
1506	158	160
1507	51	160
1508	92	160
1509	12	160
1510	163	160
1511	383	160
1512	54	161
1513	356	161
1514	592	161
1515	44	161
1516	574	161
1517	48	161
1518	8	161
1520	400	162
1521	1526	162
1522	735	162
1523	128	162
1524	8	162
1525	51	162
1526	68	162
1527	92	162
1528	12	162
1529	163	162
1530	1531	163
1531	163	163
1532	776	163
1533	8	163
1534	92	163
1535	51	163
1536	160	164
1537	243	164
1538	381	164
1539	199	164
1540	451	164
1541	578	164
1542	8	164
1543	1534	164
1544	383	164
1545	51	164
1546	44	165
1547	479	165
1548	721	165
1549	1544	165
1550	8	165
1551	523	165
1553	460	166
1554	1022	166
1555	13	166
1556	162	166
1557	199	166
1558	9	166
1559	128	166
1560	729	166
1561	8	166
1562	66	166
1563	12	166
1564	92	167
1565	51	167
1566	8	167
1568	659	168
1569	34	168
1570	1570	168
1571	1531	168
1572	1336	168
1573	163	168
1574	1566	168
1575	653	168
1576	8	168
1578	1580	169
1579	811	169
1580	1581	169
1581	8	169
1582	218	169
1583	68	169
1585	243	170
1586	381	170
1587	3	170
1588	1587	170
1589	40	170
1590	8	170
1591	383	170
1592	354	170
1593	34	171
1594	191	171
1595	35	171
1596	1596	171
1597	13	171
1598	255	171
1599	1601	171
1600	117	171
1601	205	171
1602	1594	171
1603	8	171
1604	51	171
1605	12	171
1606	163	171
1607	106	172
1608	187	172
1609	205	172
1610	8	172
1611	51	172
1612	92	172
1613	163	172
1614	542	173
1615	642	173
1616	54	173
1617	356	173
1618	44	173
1619	1613	173
1620	8	173
1621	544	173
1623	1624	174
1624	1625	174
1625	8	174
1626	10	174
1627	66	174
1628	12	174
1629	158	174
1630	25	174
1632	1134	175
1633	1635	175
1634	109	175
1635	8	175
1636	453	175
1637	158	175
1639	642	176
1640	191	176
1641	1640	176
1642	44	176
1643	8	176
1644	51	176
1645	383	176
1646	381	176
1647	44	176
1648	1656	177
1649	1653	177
1650	1499	177
1651	1651	177
1652	216	177
1653	246	177
1654	713	177
1655	578	177
1656	8	177
1657	51	177
1658	12	177
1659	163	177
1660	542	178
1661	642	178
1662	1156	178
1663	356	178
1664	513	178
1665	44	178
1666	1487	178
1667	8	178
1668	544	178
1670	8	179
1671	68	179
1672	1668	179
1673	565	179
1674	120	179
1675	1669	179
1676	14	179
1677	18	179
1678	760	179
1679	92	179
1680	542	180
1681	642	180
1682	1680	180
1683	44	180
1684	142	180
1685	8	180
1686	544	180
1687	51	180
1688	542	181
1689	642	181
1690	44	181
1691	187	181
1692	48	181
1693	8	181
1694	544	181
1696	3	182
1697	1695	182
1698	145	182
1699	8	182
1700	383	182
1701	51	182
1702	68	183
1703	8	183
1704	120	183
1705	1669	183
1706	14	183
1707	148	183
1708	565	183
1709	274	183
1710	595	183
1711	1067	183
1712	1716	183
1713	1144	183
1714	212	183
1715	2	183
1716	659	183
1717	283	183
1718	142	183
1719	51	183
1720	163	183
1721	542	184
1722	44	184
1723	187	184
1724	541	184
1725	8	184
1726	544	184
1727	25	184
1728	92	184
1729	51	184
1730	119	185
1731	255	185
1732	1302	185
1733	8	185
1734	970	185
1735	12	185
1736	163	185
1737	1361	186
1738	780	186
1739	1499	186
1740	1219	186
1741	8	186
1742	1223	186
1743	51	186
1744	92	186
1745	12	186
1746	542	187
1747	57	187
1748	44	187
1749	507	187
1750	48	187
1751	8	187
1752	544	187
1754	1751	188
1755	44	188
1756	1755	188
1757	1754	188
1758	8	188
1759	383	188
1760	1764	189
1761	1759	189
1762	713	189
1763	40	189
1764	8	189
1765	970	189
1766	12	189
1767	163	189
1768	542	190
1769	356	190
1770	1771	190
1771	44	190
1772	8	190
1773	544	190
1775	5	191
1776	8	191
1777	453	191
1778	158	191
1780	1751	192
1781	1784	192
1782	44	192
1783	187	192
1784	1210	192
1785	1783	192
1786	8	192
1788	1792	193
1789	1791	193
1790	1787	193
1791	8	193
1792	1790	193
1793	702	193
1794	33	193
1795	12	193
1796	13	194
1797	1795	194
1798	1457	194
1799	2	194
1800	8	194
1801	51	194
1802	12	194
1803	163	194
1804	106	195
1805	27	195
1806	410	195
1807	1134	195
1808	1613	195
1809	8	195
1810	51	195
1811	737	196
1812	8	196
1813	188	196
1814	659	197
1815	106	197
1816	1339	197
1817	71	197
1818	205	197
1819	109	197
1820	8	197
1821	453	197
1822	158	197
1823	92	197
1824	51	197
1825	163	197
1826	12	197
1827	381	198
1828	1305	198
1829	3	198
1830	5	198
1831	8	198
1832	453	198
1833	158	198
1834	383	198
1835	51	198
1836	731	199
1837	806	199
1838	767	199
1839	8	199
1840	453	199
1841	158	199
1842	92	199
1843	51	199
1844	163	199
1845	12	199
1846	1067	200
1847	1847	200
1848	1791	200
1849	1787	200
1850	1850	200
1851	8	200
1852	702	200
1853	51	200
1854	12	200
1855	163	200
1856	44	201
1857	1263	201
1858	1268	201
1859	8	201
1860	62	201
1861	125	202
1862	191	202
1863	1865	202
1864	355	202
1865	237	202
1866	5	202
1867	653	202
1868	2	202
1869	1245	202
1870	188	202
1871	383	202
1872	163	202
1873	1870	203
1874	8	203
1875	92	203
1876	51	203
1877	1878	204
1878	381	204
1879	8	204
1880	453	204
1881	158	204
1882	92	204
1883	51	204
1884	12	204
1885	381	205
1886	1884	205
1887	200	205
1888	8	205
1889	453	205
1890	158	205
1891	383	205
1892	92	205
1893	51	205
1894	356	206
1895	1487	206
1896	1787	206
1897	1300	206
1898	8	206
1899	44	206
1900	582	207
1901	1784	207
1902	14	207
1903	120	207
1904	199	207
1905	187	207
1906	142	207
1907	16	207
1908	38	207
1909	1197	207
1910	8	207
1911	25	207
1912	218	207
1913	92	207
1914	51	207
1915	1914	208
1916	15	208
1917	23	208
1918	990	208
1919	44	208
1920	1922	208
1921	120	208
1922	1927	208
1923	584	208
1924	1625	208
1925	1924	208
1926	109	208
1927	8	208
1928	383	208
1929	381	208
1930	51	208
1931	106	209
1932	1009	209
1933	491	209
1934	464	209
1935	255	209
1936	8	209
1937	453	209
1938	970	209
1939	158	209
1940	51	209
1941	12	209
1942	163	209
1943	88	210
1944	199	210
1945	951	210
1946	8	210
1947	218	210
1949	1952	211
1950	27	211
1951	949	211
1952	44	211
1953	1955	211
1954	1053	211
1955	702	211
1956	815	211
1957	8	211
1958	51	211
1959	1914	212
1960	88	212
1961	583	212
1962	46	212
1963	1580	212
1964	15	212
1965	1922	212
1966	199	212
1967	1668	212
1968	8	212
1969	218	212
1971	1968	213
1972	260	213
1973	188	213
1974	751	213
1975	8	213
1976	453	213
1977	158	213
1978	12	213
1979	1977	214
1980	513	214
1981	949	214
1982	44	214
1983	354	214
1984	187	214
1985	48	214
1986	8	214
1988	745	215
1989	269	215
1990	306	215
1991	290	215
1992	72	215
1993	8	215
1994	12	215
1995	453	215
1996	158	215
1997	51	215
1998	92	215
1999	1999	216
2000	1998	216
2001	8	216
2002	453	216
2003	158	216
2004	188	216
2005	2004	217
2006	8	217
2008	8	218
2009	68	218
2010	653	218
2011	954	218
2012	595	218
2013	2007	218
2014	15	218
2015	191	218
2016	163	218
2017	51	218
2018	92	218
2019	13	219
2020	2020	219
2021	1044	219
2022	2023	219
2023	132	219
2024	669	219
2025	2024	219
2026	8	219
2028	106	220
2029	8	220
2030	453	220
2031	92	220
2032	51	220
2033	12	220
2034	1009	221
2035	54	221
2036	513	221
2037	44	221
2038	354	221
2039	48	221
2040	8	221
2042	58	222
2043	813	222
2044	46	222
2045	15	222
2046	89	222
2047	120	222
2048	8	222
2050	243	223
2051	613	223
2052	54	223
2053	15	223
2054	44	223
2055	197	223
2056	200	223
2057	702	223
2058	48	223
2059	8	223
2061	243	224
2062	613	224
2063	197	224
2064	163	224
2065	1071	224
2066	2062	224
2067	8	224
2069	1022	225
2070	1109	225
2071	2066	225
2072	14	225
2073	731	225
2074	2067	225
2075	8	225
2076	188	225
2077	12	225
2078	148	226
2079	679	226
2080	162	226
2081	260	226
2082	735	226
2083	2083	226
2084	18	226
2085	731	226
2086	1147	226
2087	729	226
2088	274	226
2089	8	226
2090	273	226
2091	1	226
2092	12	226
2093	163	226
2094	827	227
2095	2099	227
2096	735	227
2097	199	227
2098	653	227
2099	40	227
2100	729	227
2101	8	227
2102	33	227
2103	163	227
2104	12	227
2105	2104	228
2106	125	228
2107	1446	228
2108	2109	228
2109	1431	228
2110	1457	228
2111	578	228
2112	729	228
2113	8	228
2114	1223	228
2115	383	228
2116	12	228
2117	51	228
2118	163	228
2119	139	228
2120	314	229
2121	417	229
2122	50	229
2123	1332	229
2124	372	229
2125	370	229
2126	8	229
2127	218	229
2129	243	230
2130	197	230
2131	163	230
2132	2	230
2133	8	230
2134	1534	230
2135	383	230
2136	51	230
2137	780	231
2138	89	231
2139	2137	231
2140	736	231
2141	120	231
2142	745	231
2143	2145	231
2144	117	231
2145	2143	231
2146	290	231
2147	305	231
2148	8	231
2150	600	232
2151	260	232
2152	246	232
2153	731	232
2154	806	232
2155	205	232
2156	8	232
2157	158	232
2158	51	232
2159	163	232
2160	148	233
2161	1305	233
2162	142	233
2163	18	233
2164	16	233
2165	518	233
2166	2160	233
2167	8	233
2168	158	233
2169	25	233
2170	51	233
2171	12	233
2172	163	233
2173	383	233
2174	13	234
2175	120	234
2176	142	234
2177	2172	234
2178	145	234
2179	669	234
2180	305	234
2181	8	234
2182	51	234
2183	12	234
2184	163	234
2185	381	235
2186	383	235
2187	44	235
2188	2183	235
2189	702	235
2190	305	235
2191	547	235
2192	8	235
2193	51	235
2194	243	236
2195	2195	236
2196	57	236
2197	197	236
2198	163	236
2199	653	236
2200	2	236
2201	8	236
2202	970	236
2203	25	236
2204	51	236
2205	163	236
2206	12	236
2207	243	237
2208	2195	237
2209	1067	237
2210	1499	237
2211	197	237
2212	187	237
2213	1764	237
2214	163	237
2215	246	237
2216	748	237
2217	2	237
2218	8	237
2219	2211	237
2220	51	237
2221	12	237
2222	163	237
2223	383	237
2224	381	237
2225	2222	238
2226	735	238
2227	212	238
2228	1134	238
2229	731	238
2230	1147	238
2231	578	238
2232	205	238
2233	145	238
2234	729	238
2235	655	238
2236	2	238
2237	8	238
2238	163	238
2239	383	238
2240	12	238
2241	51	238
2242	243	239
2243	197	239
2244	163	239
2245	8	239
2246	188	239
2247	224	240
2248	187	240
2249	372	240
2250	8	240
2251	218	240
2253	2253	241
2254	1451	241
2255	139	241
2256	237	241
2257	1457	241
2258	2256	241
2259	305	241
2260	8	241
2261	51	241
2262	12	241
2263	163	241
2264	13	242
2265	89	242
2266	172	242
2267	1669	242
2268	142	242
2269	669	242
2270	8	242
2272	314	243
2273	311	243
2274	308	243
2275	8	243
2276	218	243
2278	8	244
2279	294	244
2280	205	244
2281	1128	244
2282	2276	244
2283	191	244
2284	215	244
2285	93	244
2286	49	244
2287	183	244
2288	2282	244
2289	212	244
2290	2	244
2291	659	244
2292	163	244
2293	12	244
2294	148	245
2295	89	245
2296	142	245
2297	1044	245
2298	2294	245
2299	2024	245
2300	8	245
2302	13	246
2303	89	246
2304	1669	246
2305	1044	246
2306	2294	246
2307	669	246
2308	2	246
2309	8	246
2311	314	247
2312	8	247
2313	697	247
2314	218	247
2315	523	247
2317	8	248
2318	697	248
2319	218	248
2320	523	248
2321	383	248
2322	760	248
2323	1077	249
2324	1669	249
2325	142	249
2326	8	249
2327	218	249
2329	68	250
2330	8	250
2331	1011	250
2332	6	250
2333	49	250
2334	3	250
2335	1009	250
2336	2334	250
2337	58	250
2338	548	250
2339	811	250
2340	383	250
2341	381	250
2342	51	250
2343	1011	251
2344	8	251
2345	2351	251
2346	49	251
2347	187	251
2348	3	251
2349	6	251
2350	578	251
2351	20	251
2352	1009	251
2353	811	251
2354	383	251
2355	51	251
2356	381	251
2357	13	252
2358	224	252
2359	154	252
2360	713	252
2361	8	252
2362	218	252
2364	294	253
2365	8	253
2366	66	253
2367	55	253
2368	1134	253
2369	215	253
2370	1955	253
2371	199	253
2372	147	253
2373	183	253
2374	12	253
2375	1128	254
2376	381	254
2377	383	254
2378	2195	254
2379	3	254
2380	1044	254
2381	1302	254
2382	1507	254
2383	8	254
2385	89	255
2386	1044	255
2387	5	255
2388	2386	255
2389	287	255
2390	8	255
2392	8	256
2393	54	256
2394	6	256
2395	3	256
2396	49	256
2397	195	256
2398	44	256
2399	1384	257
2400	187	257
2401	507	257
2402	960	257
2403	8	257
2404	218	257
2406	68	258
2407	8	258
2408	2402	258
2409	354	258
2410	45	258
2411	592	258
2412	356	258
2413	990	258
2414	274	258
2415	3	258
2416	460	258
2417	44	258
2418	8	259
2419	205	259
2420	5	259
2421	66	259
2422	14	259
2423	13	259
2424	148	259
2425	774	259
2426	565	259
2427	780	259
2428	326	259
2429	68	259
2430	163	259
2431	12	259
2432	8	260
2433	283	260
2434	1009	260
2435	148	260
2436	30	260
2437	655	260
2438	186	260
2439	2431	260
2440	93	260
2441	2436	260
2442	188	260
2443	8	261
2444	68	261
2445	2439	261
2446	1128	261
2447	5	261
2448	120	261
2449	127	261
2450	14	261
2451	148	261
2452	114	261
2453	375	261
2454	121	261
2455	12	261
2456	354	261
2457	294	262
2458	8	262
2459	20	262
2460	2454	262
2461	2458	262
2462	172	262
2463	212	262
2464	5	262
2465	2453	262
2466	321	262
2467	215	262
2468	12	262
2469	68	263
2470	8	263
2471	14	263
2472	176	263
2473	1594	263
2474	3	263
2475	191	263
2476	187	263
2477	125	263
2478	51	263
2479	12	263
2480	383	263
2481	381	263
2482	8	264
2483	1783	264
2484	2	264
2485	14	264
2486	877	264
2487	20	264
2488	246	264
2489	215	264
2490	25	264
2491	145	264
2492	51	264
2493	163	264
2494	383	264
2495	8	265
2496	218	265
2497	394	265
2498	219	265
2499	565	265
2500	49	265
2501	142	265
2502	2498	265
2503	1680	265
2505	294	266
2506	8	266
2507	5	266
2508	58	266
2510	68	267
2511	8	267
2512	89	267
2513	513	267
2514	13	267
2515	114	267
2516	14	267
2517	120	267
2518	128	267
2519	49	267
2521	8	268
2522	2518	268
2523	38	268
2524	878	268
2525	1161	268
2526	172	268
2527	907	268
2528	354	268
2529	68	269
2530	8	269
2531	1302	269
2532	893	269
2533	2222	269
2534	1134	269
2535	2386	269
2536	464	269
2537	2533	269
2538	383	269
2539	163	269
2540	51	269
2541	354	269
2542	8	270
2543	205	270
2544	117	270
2545	88	270
2546	187	270
2547	93	270
2548	2533	270
2549	128	270
2550	163	270
2551	51	270
2552	92	270
2553	383	270
2554	8	271
2555	68	271
2556	1	271
2557	15	271
2558	574	271
2559	269	271
2560	128	271
2561	187	271
2562	212	271
2563	2	271
2564	205	271
2565	163	271
2566	12	271
2567	68	272
2568	8	272
2569	2569	272
2570	160	272
2571	2571	272
2572	2562	272
2573	128	272
2574	2431	272
2575	93	272
2576	188	272
2577	68	273
2578	8	273
2579	44	273
2580	2577	273
2581	429	273
2582	49	273
2583	1441	273
2584	273	273
2585	574	273
2586	51	273
2587	294	274
2588	8	274
2589	187	274
2590	6	274
2591	201	274
2592	15	274
2593	58	274
2594	574	274
2595	822	274
2596	45	274
2597	193	274
2598	383	274
2599	51	274
2600	381	274
2601	8	275
2602	2596	275
2603	1771	275
2604	57	275
2605	48	275
2606	55	275
2607	49	275
2608	45	275
2609	2597	275
2610	54	275
2611	2598	275
2612	44	275
2613	68	276
2614	8	276
2615	990	276
2616	44	276
2617	2613	276
2618	201	276
2619	58	276
2620	92	276
2621	354	276
2622	8	277
2623	2623	277
2624	2624	277
2625	225	277
2626	565	277
2627	49	277
2628	2620	277
2629	218	277
2631	68	278
2632	8	278
2633	2631	278
2634	128	278
2635	120	278
2636	14	278
2637	215	278
2638	122	278
2639	287	278
2640	326	278
2641	2642	278
2642	49	278
2643	319	278
2644	2533	278
2645	269	278
2646	2099	278
2647	188	278
2648	12	278
2649	163	278
2650	8	279
2651	557	279
2652	186	279
2653	14	279
2654	55	279
2655	93	279
2656	2222	279
2657	246	279
2659	8	280
2660	557	280
2661	35	280
2662	120	280
2663	14	280
2664	287	280
2665	595	280
2666	93	280
2667	290	280
2668	122	280
2669	215	280
2670	68	280
2672	68	281
2673	8	281
2674	66	281
2675	2683	281
2676	114	281
2677	145	281
2678	15	281
2679	120	281
2680	13	281
2681	14	281
2682	2669	281
2683	119	281
2684	167	281
2685	2062	281
2686	290	281
2687	201	281
2688	183	281
2689	12	281
2690	68	282
2691	8	282
2692	205	282
2693	737	282
2694	273	282
2695	215	282
2696	93	282
2697	464	282
2698	183	282
2699	188	282
2700	163	282
2701	5	283
2702	8	283
2703	34	283
2704	2697	283
2705	2705	283
2706	2458	283
2707	2294	283
2708	51	283
2709	163	283
2710	12	283
2711	967	284
2712	8	284
2713	44	284
2714	54	284
2715	1680	284
2716	2351	284
2717	2709	284
2718	3	284
2719	1613	284
2720	273	284
2721	6	284
2723	68	285
2724	8	285
2725	2719	285
2726	547	285
2727	49	285
2728	613	285
2729	1009	285
2730	274	285
2731	269	285
2732	381	285
2733	51	285
2734	967	286
2735	8	286
2736	118	286
2737	780	286
2738	150	286
2739	2736	286
2740	128	286
2741	120	286
2742	176	286
2743	116	286
2744	290	286
2745	269	286
2746	12	286
2747	68	287
2748	8	287
2749	193	287
2750	394	287
2751	1624	287
2752	513	287
2753	990	287
2754	2748	287
2756	68	288
2757	8	288
2758	1441	288
2759	2631	288
2760	2763	288
2761	120	288
2762	14	288
2763	167	288
2764	2759	288
2765	18	288
2766	117	288
2767	188	288
2768	163	288
2769	12	288
2770	8	289
2771	68	289
2772	1669	289
2773	167	289
2774	10	289
2775	49	289
2776	659	289
2777	14	289
2778	274	289
2779	2431	289
2780	93	289
2781	148	289
2782	1361	289
2783	5	289
2784	269	289
2786	8	290
2787	68	290
2788	35	290
2789	114	290
2790	117	290
2791	121	290
2792	14	290
2793	2431	290
2794	93	290
2795	246	290
2796	191	290
2797	1534	290
2798	375	290
2799	128	290
2800	18	290
2801	163	290
2802	51	290
2803	68	291
2804	8	291
2805	1457	291
2806	2802	291
2807	49	291
2808	1169	291
2809	354	291
2810	1014	291
2811	893	291
2812	20	291
2813	12	291
2814	139	291
2815	8	292
2816	338	292
2817	6	292
2818	58	292
2819	201	292
2820	3	292
2821	199	292
2822	48	292
2823	2819	292
2824	2822	292
2825	1175	292
2826	1668	292
2827	44	292
2828	8	293
2829	970	293
2830	748	293
2831	973	293
2832	41	293
2833	116	293
2834	66	293
2835	35	293
2836	114	293
2837	269	293
2838	68	293
2839	12	293
2840	163	293
2841	8	294
2842	2294	294
2843	2	294
2844	5	294
2845	13	294
2846	14	294
2848	8	295
2849	1230	295
2850	2859	295
2851	5	295
2852	88	295
2853	72	295
2854	35	295
2855	1302	295
2856	2137	295
2857	14	295
2858	120	295
2859	155	295
2860	290	295
2861	45	295
2862	66	295
2863	2857	295
2864	3	295
2865	12	295
2866	967	296
2867	8	296
2868	51	296
2869	653	296
2870	72	296
2871	145	296
2872	34	296
2873	780	296
2874	191	296
2875	659	296
2876	2294	296
2877	148	296
2878	163	296
2879	12	296
2880	8	297
2881	1230	297
2882	1128	297
2883	1	297
2884	1161	297
2885	5	297
2886	260	297
2887	35	297
2888	600	297
2889	17	297
2890	498	297
2891	6	297
2892	2256	297
2893	25	297
2894	1302	297
2895	55	297
2896	1613	297
2897	12	297
2898	163	297
2899	8	298
2900	44	298
2901	347	298
2902	49	298
2903	356	298
2904	523	298
2905	3	298
2906	48	298
2907	721	298
2909	68	299
2910	8	299
2911	354	299
2912	92	299
2913	145	299
2914	167	299
2915	2007	299
2916	2642	299
2917	655	299
2919	713	300
2920	8	300
2921	2402	300
2922	160	300
2923	356	300
2924	592	300
2925	479	300
2926	195	300
2927	2925	300
2928	3	300
2929	49	300
2930	6	300
2931	2914	300
2932	44	300
2934	294	301
2935	8	301
2936	2024	301
2937	128	301
2938	1716	301
2939	66	301
2940	142	301
2941	1669	301
2942	148	301
2943	1613	301
2944	1792	301
2945	659	301
2946	2940	301
2947	51	301
2948	383	301
2949	381	301
2950	163	301
2951	12	301
2952	68	302
2953	200	302
2954	3	302
2955	8	302
2956	1499	302
2957	595	302
2958	12	302
2959	383	302
2960	2966	303
2961	713	303
2962	8	303
2963	128	303
2964	6	303
2965	464	303
2966	283	303
2967	3	303
2968	2956	303
2969	51	303
2970	163	303
2971	12	303
2972	8	304
2973	1230	304
2974	114	304
2975	145	304
2976	14	304
2977	25	304
2978	5	304
2979	1499	304
2980	1653	304
2981	57	304
2982	2969	304
2983	2977	304
2984	799	304
2985	1009	304
2986	128	304
2987	1669	304
2988	2195	304
2989	20	304
2990	51	304
2991	383	304
2992	381	304
2993	12	304
2994	68	305
2995	8	305
2996	2994	305
2997	273	305
2998	565	305
2999	460	305
3000	2748	305
3001	2995	305
3002	51	305
3003	381	305
3004	383	305
3005	44	305
3006	68	306
3007	8	306
3008	3014	306
3009	5	306
3010	14	306
3011	679	306
3012	162	306
3013	16	306
3014	66	306
3015	2024	306
3016	970	306
3017	13	306
3018	3005	306
3019	148	306
3020	142	306
3021	12	306
3022	8	307
3023	68	307
3024	13	307
3025	14	307
3026	565	307
3027	1668	307
3028	737	307
3029	882	307
3030	49	307
3031	679	307
3032	162	307
3033	780	307
3034	18	307
3035	16	307
3036	183	307
3037	188	307
3038	68	308
3039	8	308
3040	3041	308
3041	200	308
3042	3035	308
3043	3038	308
3044	513	308
3045	811	308
3046	198	308
3047	92	308
3048	51	308
3049	381	308
3050	967	309
3051	8	309
3052	1022	309
3053	191	309
3054	653	309
3055	2222	309
3056	1336	309
3057	20	309
3058	3054	309
3059	381	309
3060	383	309
3061	713	310
3062	8	310
3063	44	310
3064	949	310
3065	825	310
3066	6	310
3067	49	310
3068	3	310
3069	195	310
3070	3061	310
3071	1300	310
3072	356	310
3074	8	311
3075	202	311
3076	356	311
3077	1071	311
3078	48	311
3079	52	311
3080	3061	311
3081	774	311
3082	3071	311
3083	44	311
3084	8	312
3085	68	312
3086	3091	312
3087	1764	312
3088	1847	312
3089	127	312
3090	767	312
3091	152	312
3092	155	312
3093	120	312
3094	13	312
3095	400	312
3096	2137	312
3097	260	312
3098	148	312
3099	125	312
3100	142	312
3101	51	312
3102	92	312
3103	12	312
3104	163	312
3105	8	313
3106	3103	313
3107	57	313
3108	147	313
3109	45	313
3110	1026	313
3111	2195	313
3112	3105	313
3113	3108	313
3114	3071	313
3115	12	313
3116	8	314
3117	215	314
3118	1009	314
3119	745	314
3120	287	314
3121	120	314
3122	14	314
3123	780	314
3124	1955	314
3125	269	314
3126	66	314
3127	3	314
3128	199	314
3129	127	314
3130	128	314
3131	659	314
3132	1156	314
3133	142	314
3134	12	314
3135	163	314
3136	8	315
3137	2857	315
3138	58	315
3139	49	315
3140	6	315
3141	338	315
3143	8	316
3144	577	316
3145	6	316
3146	58	316
3147	14	316
3148	3071	316
3149	51	316
3150	3142	316
3151	68	317
3152	8	317
3153	1927	317
3154	767	317
3155	15	317
3156	613	317
3157	199	317
3158	3	317
3159	2351	317
3160	381	317
3161	383	317
3162	51	317
3163	1156	318
3164	66	318
3165	155	318
3166	6	318
3167	120	318
3168	507	318
3169	5	318
3170	127	318
3171	126	318
3172	167	318
3173	8	318
3174	967	318
3175	12	318
3176	2569	319
3177	8	319
3178	5	319
3179	14	319
3180	25	319
3181	145	319
3182	1613	319
3183	183	319
3184	93	319
3185	1792	319
3186	3071	319
3188	8	320
3189	907	320
3190	400	320
3191	13	320
3192	14	320
3193	167	320
3194	3192	320
3195	9	320
3196	16	320
3197	187	320
3198	12	320
3199	92	320
3200	51	320
3201	8	321
3202	970	321
3203	49	321
3204	120	321
3205	66	321
3206	145	321
3207	14	321
3208	41	321
3209	127	321
3210	142	321
3211	736	321
3212	13	321
3213	128	321
3214	774	321
3215	12	321
3216	68	322
3217	8	322
3218	3219	322
3219	128	322
3220	255	322
3221	14	322
3222	101	322
3223	595	322
3224	92	322
3225	51	322
3226	12	322
3227	163	322
3228	3230	323
3229	2099	323
3230	8	323
3231	20	323
3232	1161	323
3233	3234	323
3234	2454	323
3235	215	323
3236	212	323
3237	2	323
3238	2386	323
3239	12	323
3240	8	324
3241	68	324
3242	274	324
3243	811	324
3244	15	324
3245	613	324
3246	269	324
3247	200	324
3248	273	324
3249	51	324
3250	381	324
3251	383	324
3252	8	325
3253	970	325
3254	114	325
3255	145	325
3256	255	325
3257	14	325
3258	10	325
3259	41	325
3260	57	325
3261	24	325
3262	25	325
3263	191	325
3264	3071	325
3265	12	325
3266	68	326
3267	8	326
3268	3272	326
3269	188	326
3270	114	326
3271	973	326
3272	120	326
3273	14	326
3274	116	326
3275	290	326
3276	176	326
3277	2137	326
3278	748	326
3279	1669	326
3280	148	326
3281	12	326
3282	68	327
3283	8	327
3284	218	327
3285	224	327
3286	3281	327
3287	93	327
3288	120	327
3289	187	327
3291	68	328
3292	8	328
3293	827	328
3294	5	328
3295	1669	328
3296	14	328
3297	3297	328
3298	148	328
3299	882	328
3300	3290	328
3301	1613	328
3302	212	328
3303	3294	328
3304	659	328
3305	383	328
3306	12	328
3307	8	329
3308	967	329
3309	1022	329
3310	1128	329
3311	58	329
3312	9	329
3313	142	329
3314	117	329
3316	8	330
3317	949	330
3318	950	330
3319	3	330
3320	3319	330
3321	495	330
3322	52	330
3323	44	330
3325	8	331
3326	967	331
3327	595	331
3328	970	331
3329	973	331
3330	3330	331
3331	776	331
3332	128	331
3333	68	331
3334	12	331
3335	188	331
3336	967	332
3337	970	332
3338	8	332
3339	973	332
3340	3333	332
3341	3343	332
3342	595	332
3343	319	332
3344	128	332
3345	68	332
3346	188	332
3347	12	332
3348	163	332
3349	8	333
3350	2623	333
3351	949	333
3352	950	333
3353	44	333
3355	8	334
3356	294	334
3357	135	334
3358	40	334
3359	34	334
3360	1499	334
3361	246	334
3362	3353	334
3363	176	334
3364	187	334
3365	12	334
3366	8	335
3367	68	335
3368	737	335
3369	3376	335
3370	1669	335
3371	1668	335
3372	565	335
3373	536	335
3374	71	335
3375	659	335
3376	148	335
3377	1792	335
3378	188	335
3379	12	335
3380	729	335
3381	3366	335
3382	68	336
3383	8	336
3384	44	336
3385	356	336
3386	592	336
3387	55	336
3388	48	336
3389	3035	336
3390	949	336
3392	1128	337
3393	967	337
3394	1022	337
3395	8	337
3396	273	337
3397	14	337
3398	187	337
3399	199	337
3400	3388	337
3401	212	337
3402	183	337
3404	68	338
3405	400	338
3406	128	338
3407	1669	338
3408	148	338
3409	8	338
3410	12	338
3411	92	338
3412	51	338
3413	8	339
3414	595	339
3415	970	339
3416	867	339
3417	973	339
3418	141	339
3419	565	339
3420	513	339
3421	774	339
3422	967	339
3423	68	339
3424	12	339
3425	188	339
3426	163	339
3427	8	340
3428	68	340
3429	1156	340
3430	582	340
3431	592	340
3432	811	340
3433	58	340
3435	967	341
3436	8	341
3437	973	341
3438	3	341
3439	605	341
3440	776	341
3441	595	341
3442	745	341
3443	269	341
3444	122	341
3445	188	341
3446	12	341
3447	8	342
3448	967	342
3449	1755	342
3450	14	342
3451	2256	342
3452	176	342
3453	2857	342
3454	1022	342
3455	51	342
3456	8	343
3457	1230	343
3458	2940	343
3459	5	343
3460	14	343
3461	17	343
3462	13	343
3463	167	343
3464	1109	343
3465	3460	343
3466	3005	343
3467	2195	343
3468	117	343
3469	780	343
3470	1613	343
3471	565	343
3472	148	343
3473	12	343
3474	2857	344
3475	1755	344
3476	246	344
3477	481	344
3478	1022	344
3479	8	344
3480	967	344
3481	51	344
3482	827	345
3483	191	345
3484	183	345
3485	326	345
3486	14	345
3487	3486	345
3488	145	345
3489	837	345
3490	2	345
3491	167	345
3492	8	345
3493	51	345
3494	1168	345
3495	12	345
3496	92	345
3497	949	346
3498	950	346
3499	8	346
3500	2914	346
3501	160	346
3502	523	346
3503	15	346
3504	23	346
3505	584	346
3506	2819	346
3507	2431	346
3508	44	346
3509	8	347
3510	1230	347
3511	46	347
3512	679	347
3513	5	347
3514	14	347
3515	1669	347
3516	58	347
3517	155	347
3518	1302	347
3519	748	347
3520	121	347
3521	57	347
3522	273	347
3523	1755	347
3524	148	347
3525	565	347
3526	12	347
3527	51	347
3528	163	347
3529	383	347
3530	294	348
3531	8	348
3532	4	348
3533	1223	348
3534	72	348
3535	1349	348
3536	14	348
3537	578	348
3538	176	348
3539	216	348
3540	125	348
3541	1651	348
3542	354	348
3543	642	348
3544	51	348
3545	12	348
3546	163	348
3547	139	348
3548	8	349
3549	68	349
3550	381	349
3551	3	349
3552	13	349
3553	14	349
3554	2160	349
3555	383	349
3556	51	349
3557	354	349
3558	669	349
3559	8	350
3560	68	350
3561	3557	350
3562	613	350
3563	435	350
3564	2994	350
3565	2351	350
3566	1499	350
3567	273	350
3568	142	350
3569	51	350
3570	381	350
3571	383	350
3572	8	351
3573	815	351
3574	867	351
3575	1302	351
3576	2256	351
3577	1053	351
3578	27	351
3579	145	351
3580	57	351
3581	246	351
3582	187	351
3583	12	351
3584	51	351
3585	163	351
3586	8	352
3587	68	352
3588	381	352
3589	1147	352
3590	1067	352
3591	14	352
3592	162	352
3593	1156	352
3594	806	352
3595	273	352
3596	18	352
3597	9	352
3598	117	352
3599	237	352
3600	163	352
3601	12	352
3602	232	352
3603	8	353
3604	68	353
3605	141	353
3606	49	353
3607	120	353
3609	1128	354
3610	400	354
3611	13	354
3612	45	354
3613	14	354
3614	120	354
3615	3619	354
3616	774	354
3617	127	354
3618	128	354
3619	122	354
3620	837	354
3621	290	354
3622	49	354
3623	8	354
3624	12	354
3625	356	355
3626	1026	355
3627	44	355
3628	367	355
3629	3627	355
3630	52	355
3631	8	355
3632	3629	355
3633	1025	355
3635	8	356
3636	14	356
3637	120	356
3638	3644	356
3639	3637	356
3640	290	356
3641	122	356
3642	3192	356
3643	287	356
3644	3642	356
3645	1361	356
3646	128	356
3647	269	356
3648	127	356
3649	12	356
3650	967	357
3651	1128	357
3652	20	357
3653	142	357
3654	731	357
3655	126	357
3656	737	357
3657	8	357
3658	188	357
3659	3038	358
3660	513	358
3661	49	358
3662	141	358
3663	990	358
3664	68	358
3665	8	358
3666	92	358
3667	51	358
3668	760	358
3669	383	358
3670	20	359
3671	2222	359
3672	3	359
3673	6	359
3674	507	359
3675	1134	359
3676	98	359
3677	8	359
3678	967	359
3679	383	359
3680	381	359
3681	68	360
3682	8	360
3683	1156	360
3684	160	360
3685	109	360
3686	877	360
3687	2004	360
3688	2748	360
3689	1014	360
3690	354	360
3691	92	360
3693	68	361
3694	8	361
3695	659	361
3696	13	361
3697	14	361
3698	186	361
3699	120	361
3700	142	361
3701	148	361
3702	3690	361
3703	3	361
3704	163	361
3705	188	361
3706	68	362
3707	8	362
3708	200	362
3709	1009	362
3710	1014	362
3711	160	362
3712	1091	362
3713	3701	362
3714	109	362
3715	2748	362
3716	811	362
3717	1169	362
3718	191	362
3719	354	362
3720	381	362
3721	383	362
3722	356	363
3723	592	363
3724	990	363
3725	3725	363
3726	44	363
3727	721	363
3728	49	363
3729	776	363
3730	48	363
3731	8	363
3733	359	364
3734	1787	364
3735	66	364
3736	12	364
3737	8	365
3738	68	365
3739	200	365
3740	152	365
3741	1156	365
3742	1091	365
3743	3701	365
3744	3733	365
3745	179	365
3746	147	365
3747	273	365
3748	51	365
3749	381	365
3750	383	365
3751	642	366
3752	201	366
3753	1009	366
3754	592	366
3755	44	366
3756	8	366
3757	1025	366
3759	294	367
3760	8	367
3761	3758	367
3762	653	367
3763	201	367
3764	162	367
3765	5	367
3766	14	367
3767	287	367
3768	290	367
3769	3759	367
3770	298	367
3771	3234	367
3772	163	367
3773	3769	368
3774	125	368
3775	34	368
3776	5	368
3777	126	368
3778	970	368
3779	72	368
3780	2	368
3781	8	368
3782	12	368
3783	191	369
3784	3	369
3785	410	369
3786	3783	369
3787	5	369
3788	9	369
3789	167	369
3790	8	369
3791	381	369
3792	44	370
3793	294	370
3794	8	370
3795	315	370
3796	3792	370
3797	1138	370
3798	1175	370
3799	93	370
3800	18	370
3801	57	370
3802	672	370
3804	3802	371
3805	58	371
3806	3809	371
3807	2222	371
3808	188	371
3809	14	371
3810	3808	371
3811	1134	371
3812	5	371
3813	167	371
3814	8	371
3815	967	371
3816	12	371
3817	147	372
3818	835	372
3819	45	372
3820	188	372
3821	6	372
3822	187	372
3823	212	372
3824	3823	372
3825	3824	372
3826	9	372
3827	8	372
3828	619	372
3829	12	372
3830	163	372
3831	68	373
3832	8	373
3833	66	373
3834	1134	373
3835	179	373
3836	128	373
3837	326	373
3838	117	373
3839	3690	373
3840	260	373
3841	3826	373
3842	1792	373
3843	205	373
3844	163	373
3845	58	374
3846	2195	374
3847	20	374
3848	57	374
3849	2183	374
3850	49	374
3851	109	374
3852	8	374
3853	381	374
3854	383	374
3855	51	374
3856	183	375
3857	2222	375
3858	14	375
3859	187	375
3860	215	375
3861	1134	375
3862	731	375
3863	2386	375
3864	132	375
3865	145	375
3866	8	375
3868	326	376
3869	464	376
3870	2386	376
3871	176	376
3872	1144	376
3873	51	376
3875	1022	377
3876	1128	377
3877	183	377
3878	3878	377
3879	731	377
3880	481	377
3881	815	377
3882	8	377
3883	188	377
3884	8	378
3885	191	378
3886	58	378
3887	3882	378
3888	3	378
3889	20	378
3890	246	378
3891	51	378
3892	381	378
3893	642	379
3894	1009	379
3895	44	379
3896	3	379
3897	8	379
3898	1025	379
3900	949	380
3901	950	380
3902	8	380
3903	15	380
3904	120	380
3905	584	380
3906	3192	380
3907	109	380
3908	2062	380
3909	52	380
3910	44	380
3912	1680	381
3913	15	381
3914	44	381
3915	3	381
3916	811	381
3917	584	381
3918	954	381
3919	2062	381
3920	48	381
3921	8	381
3922	1168	381
3924	8	382
3925	205	382
3926	68	382
3927	14	382
3928	2431	382
3929	93	382
3930	2222	382
3931	49	382
3932	176	382
3933	1349	382
3934	72	382
3935	3933	382
3936	3294	382
3937	125	382
3938	183	382
3939	163	382
3940	51	382
3941	8	383
3942	13	383
3943	3944	383
3944	14	383
3945	565	383
3946	219	383
3947	736	383
3948	1668	383
3949	290	383
3950	16	383
3951	162	383
3952	3642	383
3953	5	383
3954	827	383
3955	882	383
3956	1613	383
3957	2195	383
3958	2294	383
3959	3955	383
3960	12	383
3961	8	384
3962	967	384
3963	66	384
3964	35	384
3965	14	384
3966	464	384
3967	93	384
3968	68	384
3969	12	384
3970	1022	385
3971	3977	385
3972	3971	385
3973	3968	385
3974	2569	385
3975	344	385
3976	358	385
3977	3976	385
3978	1011	385
3979	359	385
3980	1242	385
3981	1229	385
3982	132	385
3983	128	385
3984	3973	385
3985	306	385
3986	306	385
3987	12	385
3988	51	385
3989	163	385
3990	736	386
3991	142	386
3992	5	386
3993	731	386
3994	135	386
3995	126	386
3996	737	386
3997	2	386
3998	8	386
3999	967	386
4000	188	386
4001	12	386
4002	160	387
4003	147	387
4004	1210	387
4005	2256	387
4006	49	387
4007	8	387
4008	44	387
4009	111	388
4010	12	388
4011	326	388
4012	4009	388
4013	120	388
4014	13	388
4015	14	388
4016	287	388
4017	595	388
4018	269	388
4019	128	388
4020	68	388
4021	51	388
4022	92	388
4023	12	388
4024	57	389
4025	44	389
4026	4020	389
4027	721	389
4028	8	389
4030	68	390
4031	120	390
4032	14	390
4033	679	390
4034	162	390
4035	4	390
4036	1847	390
4037	148	390
4038	8	390
4039	92	390
4040	51	390
4041	4029	390
4042	4030	390
4043	8	391
4044	145	391
4045	154	391
4046	13	391
4047	565	391
4048	1668	391
4049	120	391
4050	737	391
4051	122	391
4052	127	391
4053	4037	391
4054	326	391
4055	35	391
4056	142	391
4057	18	391
4058	269	391
4059	68	391
4060	188	391
4061	12	391
4062	163	391
4063	88	392
4064	191	392
4065	20	392
4066	1680	392
4067	4056	392
4068	215	392
4069	5	392
4070	126	392
4071	2	392
4072	8	392
4073	967	392
4074	51	392
4075	12	392
4076	163	392
4077	8	393
4078	66	393
4079	128	393
4080	14	393
4081	120	393
4082	155	393
4083	50	393
4084	142	393
4085	127	393
4086	68	393
4087	12	393
4088	163	393
4089	88	394
4090	15	394
4091	4088	394
4092	4089	394
4093	50	394
4094	815	394
4095	8	394
4096	51	394
4098	8	395
4099	54	395
4100	44	395
4101	1716	395
4102	799	395
4103	6	395
4104	201	395
4105	49	395
4106	3	395
4107	195	395
4108	202	395
4110	780	396
4111	35	396
4112	148	396
4113	326	396
4114	120	396
4115	565	396
4116	163	396
4117	18	396
4118	116	396
4119	117	396
4120	122	396
4121	290	396
4122	8	396
4123	51	396
4124	92	396
4125	163	396
4126	125	397
4127	20	397
4128	57	397
4129	3	397
4130	14	397
4131	136	397
4132	5	397
4133	16	397
4134	1955	397
4135	9	397
4136	246	397
4137	135	397
4138	176	397
4139	49	397
4140	2	397
4141	8	397
4142	12	397
4143	163	397
4144	3071	397
4145	619	398
4146	315	398
4147	218	398
4148	4137	398
4149	93	398
4150	50	398
4151	1668	398
4152	571	398
4153	4147	398
4154	8	398
4156	1128	399
4157	24	399
4158	13	399
4159	4149	399
4160	1716	399
4161	57	399
4162	14	399
4163	255	399
4164	4161	399
4165	114	399
4166	731	399
4167	1302	399
4168	145	399
4169	8	399
4170	10	399
4171	970	399
4172	25	399
4173	502	399
4174	1168	399
4175	12	399
4176	163	399
4177	1580	400
4178	89	400
4179	2969	400
4180	2256	400
4181	132	400
4182	815	400
4183	447	400
4185	1156	401
4186	356	401
4187	592	401
4188	990	401
4189	44	401
4190	721	401
4191	49	401
4192	48	401
4193	8	401
4195	68	402
4196	8	402
4197	127	402
4198	290	402
4199	3	402
4200	748	402
4201	4192	402
4202	1441	402
4203	128	402
4204	120	402
4205	1999	402
4206	4198	402
4207	114	402
4208	51	402
4209	12	402
4210	163	402
4211	294	403
4212	8	403
4213	135	403
4214	4214	403
4215	2	403
4216	14	403
4217	58	403
4218	167	403
4219	176	403
4220	246	403
4221	125	403
4222	139	403
4223	12	403
4224	51	403
4225	4227	404
4226	8	404
4227	186	404
4228	215	404
4229	93	404
4230	14	404
4231	125	404
4232	183	404
4233	260	404
4234	176	404
4235	33	404
4236	653	404
4237	907	404
4238	191	404
4239	569	404
4240	187	404
4241	163	404
4242	12	404
4243	1073	405
4244	218	405
4245	141	405
4246	142	405
4247	394	405
4248	8	405
4249	1168	405
4251	187	406
4252	4246	406
4253	8	406
4254	1168	406
4256	186	407
4257	188	407
4258	187	407
4259	5	407
4260	16	407
4261	837	407
4262	751	407
4263	2	407
4264	167	407
4265	8	407
4266	12	407
4267	294	408
4268	8	408
4269	4272	408
4270	2966	408
4271	1067	408
4272	3	408
4273	45	408
4274	162	408
4275	30	408
4276	273	408
4277	5	408
4278	93	408
4279	187	408
4280	326	408
4281	51	408
4282	12	408
4283	163	408
4284	990	409
4285	44	409
4286	721	409
4287	49	409
4288	776	409
4289	48	409
4290	8	409
4291	523	409
4293	1128	410
4294	1009	410
4295	14	410
4296	187	410
4297	215	410
4298	114	410
4299	145	410
4300	2683	410
4301	1613	410
4302	748	410
4303	167	410
4304	8	410
4305	1168	410
4306	163	410
4307	8	411
4308	1457	411
4309	14	411
4310	216	411
4311	3105	411
4312	20	411
4313	6	411
4314	577	411
4315	799	411
4316	5	411
4317	4315	411
4318	1499	411
4319	186	411
4320	3	411
4321	246	411
4322	16	411
4323	187	411
4324	188	411
4325	163	411
4326	12	411
4327	3977	412
4328	1865	412
4329	3976	412
4330	4321	412
4331	127	412
4332	306	412
4333	306	412
4334	729	412
4335	92	412
4336	12	412
4337	51	412
4339	780	413
4340	57	413
4341	14	413
4342	4330	413
4343	255	413
4344	507	413
4345	1302	413
4346	128	413
4347	719	413
4348	8	413
4349	1308	413
4350	51	413
4351	12	413
4352	163	413
4353	1156	414
4354	990	414
4355	44	414
4356	721	414
4357	49	414
4358	48	414
4359	8	414
4360	523	414
4361	68	414
4363	191	415
4364	1009	415
4365	4356	415
4366	187	415
4367	8	415
4368	619	415
4369	383	415
4370	381	415
4371	51	415
4372	88	416
4373	4365	416
4374	893	416
4375	58	416
4376	15	416
4377	23	416
4378	49	416
4379	51	416
4380	8	416
4382	68	417
4383	8	417
4384	1067	417
4385	160	417
4386	1156	417
4387	574	417
4388	147	417
4389	46	417
4390	2822	417
4391	107	417
4392	2577	417
4393	2062	417
4395	375	418
4396	4386	418
4397	18	418
4398	574	418
4399	205	418
4400	145	418
4401	655	418
4402	2533	418
4403	8	418
4404	51	418
4405	12	418
4406	163	418
4407	8	419
4408	1457	419
4409	186	419
4410	14	419
4411	578	419
4412	246	419
4413	6	419
4414	338	419
4415	1128	419
4416	1594	419
4417	1680	419
4418	1669	419
4419	216	419
4420	20	419
4421	4401	419
4422	12	419
4423	163	419
4424	383	419
4425	139	419
4426	8	420
4427	967	420
4428	1066	420
4429	659	420
4430	1067	420
4431	274	420
4432	565	420
4433	14	420
4434	162	420
4435	148	420
4436	59	420
4437	2004	420
4438	68	420
4439	51	420
4440	160	421
4441	1680	421
4442	3343	421
4443	14	421
4444	172	421
4445	1625	421
4446	8	421
4447	3759	421
4448	51	421
4449	1073	422
4450	218	422
4451	187	422
4452	2620	422
4453	547	422
4454	49	422
4455	8	422
4457	8	423
4458	967	423
4459	1066	423
4460	106	423
4461	1067	423
4462	274	423
4463	93	423
4464	578	423
4465	14	423
4466	18	423
4467	3733	423
4468	59	423
4469	68	423
4470	51	423
4471	1353	424
4472	8	424
4473	51	424
4474	12	424
4475	57	425
4476	44	425
4477	187	425
4478	547	425
4479	49	425
4480	48	425
4481	8	425
4482	25	425
4484	400	426
4485	14	426
4486	187	426
4487	731	426
4488	269	426
4489	3642	426
4490	8	426
4491	25	426
4492	68	426
4493	12	426
4494	1009	427
4495	799	427
4496	4494	427
4497	4137	427
4498	5	427
4499	9	427
4500	1787	427
4501	8	427
4502	619	427
4503	1168	427
4505	14	428
4506	5	428
4507	132	428
4508	49	428
4509	2	428
4510	17	428
4511	8	428
4512	139	428
4513	46	429
4514	4509	429
4515	15	429
4516	120	429
4517	811	429
4518	507	429
4519	1441	429
4520	8	429
4521	68	429
4522	1168	429
4524	1128	430
4525	3	430
4526	4524	430
4527	319	430
4528	1134	430
4529	1302	430
4530	205	430
4531	145	430
4532	167	430
4533	8	430
4534	68	430
4535	163	430
4536	383	430
4537	381	430
4538	8	431
4539	967	431
4540	1066	431
4541	35	431
4542	1067	431
4543	274	431
4544	93	431
4545	14	431
4546	4531	431
4547	162	431
4548	59	431
4549	3701	431
4550	68	431
4552	3388	432
4553	191	432
4554	20	432
4555	4549	432
4556	435	432
4557	187	432
4558	205	432
4559	837	432
4560	167	432
4561	8	432
4562	51	432
4564	8	433
4565	967	433
4566	867	433
4567	1066	433
4568	1067	433
4569	274	433
4570	565	433
4571	14	433
4572	155	433
4573	147	433
4574	990	433
4575	1156	433
4576	59	433
4577	68	433
4578	51	433
4579	4580	434
4580	464	434
4581	187	434
4582	1106	434
4583	117	434
4584	269	434
4585	8	434
4586	2631	434
4587	188	434
4588	383	434
4589	381	434
4590	381	435
4591	57	435
4592	4583	435
4593	8	435
4594	51	435
4595	381	435
4596	383	435
4597	1022	436
4598	20	436
4599	507	436
4600	216	436
4601	1955	436
4602	702	436
4603	1787	436
4604	8	436
4605	1168	436
4606	3071	436
4607	12	436
4608	51	436
4609	201	437
4610	600	437
4611	148	437
4612	4607	437
4613	14	437
4614	120	437
4615	18	437
4616	774	437
4617	1106	437
4618	287	437
4619	8	437
4620	51	437
4621	12	437
4622	163	437
4623	383	437
4624	893	438
4625	147	438
4626	183	438
4627	1134	438
4628	3823	438
4629	731	438
4630	1106	438
4631	71	438
4632	8	438
4633	51	438
4634	163	438
4635	44	439
4636	4627	439
4637	2857	439
4638	8	439
4639	383	439
4640	51	439
4641	642	440
4642	381	440
4643	57	440
4644	2183	440
4645	8	440
4646	1168	440
4647	383	440
4648	51	440
4649	356	441
4650	44	441
4651	8	441
4653	582	442
4654	34	442
4655	35	442
4656	20	442
4657	14	442
4658	5	442
4659	246	442
4660	713	442
4661	176	442
4662	2256	442
4663	1053	442
4664	40	442
4665	748	442
4666	2	442
4667	8	442
4668	481	442
4669	970	442
4670	12	442
4671	163	442
4672	735	443
4673	13	443
4674	3809	443
4675	1048	443
4676	162	443
4677	14	443
4678	131	443
4679	1044	443
4680	2083	443
4681	1668	443
4682	16	443
4683	806	443
4684	1507	443
4685	167	443
4686	12	443
4687	33	443
4689	8	444
4690	1302	444
4691	4607	444
4692	40	444
4693	66	444
4694	5	444
4695	827	444
4696	14	444
4697	10	444
4698	119	444
4699	481	444
4700	167	444
4701	2256	444
4702	30	444
4703	12	444
4704	1022	445
4705	451	445
4706	147	445
4707	4088	445
4708	1134	445
4709	8	445
4710	10	445
4711	51	445
4712	502	445
4714	1022	446
4715	4712	446
4716	20	446
4717	2256	446
4718	8	446
4719	25	446
4720	51	446
4721	383	446
4722	12	446
4723	4718	447
4724	24	447
4725	23	447
4726	167	447
4727	8	447
4729	186	448
4730	125	448
4731	2066	448
4732	4727	448
4733	14	448
4734	4736	448
4735	5	448
4736	135	448
4737	713	448
4738	4723	448
4739	737	448
4740	748	448
4741	2	448
4742	17	448
4743	8	448
4744	10	448
4745	502	448
4746	188	448
4747	12	448
4748	163	448
4749	713	449
4750	8	449
4751	338	449
4752	1169	449
4753	3	449
4754	49	449
4755	6	449
4756	14	449
4757	4753	449
4758	107	449
4759	4740	449
4760	20	449
4761	3054	449
4762	191	449
4763	383	449
4764	51	449
4765	8	450
4766	4767	450
4767	13	450
4768	120	450
4769	15	450
4770	46	450
4771	4771	450
4772	4756	450
4773	38	450
4774	679	450
4775	1134	450
4776	1914	450
4777	26	450
4778	23	450
4779	715	450
4780	619	450
4781	201	450
4782	878	450
4783	3758	450
4784	1161	450
4785	719	450
4786	12	450
4787	24	451
4788	827	451
4789	600	451
4790	14	451
4791	1336	451
4792	172	451
4793	1669	451
4794	5	451
4795	731	451
4796	713	451
4797	127	451
4798	40	451
4799	128	451
4800	737	451
4801	2	451
4802	8	451
4803	25	451
4804	12	451
4805	8	452
4806	191	452
4807	1534	452
4808	14	452
4809	114	452
4810	145	452
4811	10	452
4812	4580	452
4813	25	452
4814	2431	452
4815	2533	452
4816	93	452
4817	183	452
4818	163	452
4819	383	452
4820	51	452
4821	12	452
4822	8	453
4823	780	453
4824	4767	453
4825	35	453
4826	1134	453
4827	287	453
4828	147	453
4829	719	453
4830	12	453
4831	44	454
4832	721	454
4833	8	454
4835	88	455
4836	4826	455
4837	44	455
4838	4829	455
4839	8	455
4840	44	455
4841	51	455
4842	44	456
4843	4835	456
4844	721	456
4845	4836	456
4846	729	456
4847	48	456
4848	1168	456
4850	356	457
4851	592	457
4852	57	457
4853	1209	457
4854	507	457
4855	8	457
4856	4845	457
\.


--
-- Name: tagrecipes_tagrecipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tagrecipes_tagrecipe_id_seq', 4857, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tags (tag_id, category) FROM stdin;
1	Lamb
2	Tomato
3	Egg
4	Eggplant
5	Onion
6	Flour
7	 Food
8	Web Recipe
9	Paprika
10	White Wine
11	Greek
12	Dinner
13	Chile
14	Garlic
15	Cinnamon
16	Oregano
17	Tomato Paste
18	Mint
19	Milk
20	Cheese
23	Clove
24	Bay Leaf
25	Thyme
26	juniper
27	Breadcrumbs
29	Pork Shoulder
30	Parsley
31	Pancetta
32	Confit
33	Pork
34	Bean
35	Carrot
37	Duck
38	Peppercorn
40	Sausage
41	Stock
42	Crepe
43	WebRecipe
44	Dessert
45	Cornstarch
46	Cardamom
48	Vanilla
49	Sugar
50	Orange
51	Vegetarian
52	Powdered Sugar
54	Cake
55	Egg Yolks
57	Cream
58	Butter
59	Olive Oil
62	Kosher
63	Russet Potato
64	Black Pepper
65	roast chicken
66	Chicken
67	Kosher Salt
68	Healthyish
71	Red Onion
72	Squash
87	Syrup
88	Apple
89	Condiment/Spread
92	Vegan
93	Lemon Juice
98	Sauerkraut
100	Pork Tenderloin
101	Broth
106	beet
107	Apricot
109	Walnut
111	Weeknight
113	Short Rib
114	Mushroom
116	Mirin
117	Radish
118	Stir-Fry
119	Chicken Broth
120	Ginger
121	Pea
122	Sesame Oil
125	Basil
126	Sambal Oelek
127	Rice
128	Green Onion Scallion
131	Meat
132	Sauce
133	High Fiber
135	Pasta
136	Meatball
138	Comfort Food
139	Italian
141	Coconut Milk
142	Lime
145	Shallot
147	Cayenne
148	Cilantro
150	Noodle
152	Ghee
154	Lemongrass
155	Curry
158	Healthy
160	Almond
162	Cumin
163	Lunch
165	Couscous
167	Vinegar
168	Smoked Paprika
172	Hot Sauce
175	Leg of Lamb
176	Red Pepper
179	Fennel Seed
183	Chive
186	Anchovy
187	Lemon
188	Fish
191	Bread
193	Bars
194	Nut Butter
195	Vanilla Extract
197	Kid-Friendly
198	Dried Fruit
199	honey
200	Oat
201	Brown Sugar
202	Cereal
205	Salad
207	Provolone
212	Lettuce
215	Mayonnaise
216	Mozzarella
218	Cocktail
219	mezcal
220	Tequila
221	Tangerine
222	Soda
224	Gin
225	Aperol
227	Farro
232	 Vegetarian
236	spelt
237	olive
242	Salami
243	Back To School
246	Parmesan
255	Leek
260	Fennel
269	Sesame Seed
272	Radicchio
273	Yogurt
274	Tahini
283	Feta
287	Rice Vinegar
290	Soy Sauce
294	Basically
298	Sriracha
305	Spring
306	Side
308	Valentines Day
311	Love Week
314	Bitters
315	Bourbon
319	herb
321	Ground Beef
326	Cucumber
331	Portuguese
338	Dough
343	Tart
344	Do Ahead
345	Low Cal
346	Make Ahead
347	Souffle
350	Low Cholesterol
354	Gluten Free
355	French
356	Chocolate
357	Low Fat
358	Large Group
359	Party
361	Christmas
362	Buche De Noel
367	Frosting
370	Tepache
372	Summer Drinks
375	Asparagus
381	Breakfast
383	Brunch
387	Ice
394	Pineapple
400	Cauliflower
405	Capers
410	Horseradish
417	chartreuse
429	Rhubarb
435	date
447	Turkey
451	Pear
453	Food Lover's Cleanse 2015
460	Agave
464	Dill
472	egg salad
479	Espresso
481	Pepper
488	Truffle
491	Caraway
495	Anise
498	Red Wine
502	Wine
507	Dairy
508	Matcha
513	Coconut
518	Sesame
519	Amaranth
523	Coffee
530	Amaretto
536	Watermelon
540	Margarita
541	popsicle
542	BA Weddings
544	Wedding
547	Strawberry
548	Fruit
557	Salad Dressing
561	Balsamic Vinegar
565	Lime Juice
569	Arugula
571	Simple Syrup
574	Pistachio
577	pizza dough
578	Ricotta
582	Almond Milk
583	Brandy
584	Nutmeg
592	Cocoa
595	Miso
600	Celery
605	Kimchi
613	Banana
619	Beer
629	Chicken Salad
640	Lavender
642	Bake
653	Sandwich
655	Tarragon
657	Sprout
659	Avocado
669	Spicy
672	Mousse
679	Coriander
691	Pisco
697	Whiskey
702	Snack
713	Reader's Choice Week
715	Guinness
719	St. Patricks Day
721	ice cream
729	Summer
731	Parlsey
735	Grill Barbecue
736	Fish Sauce
737	Shrimp
745	gochujang
748	Spinach
751	swordfish
760	Drinks
767	Quinoa
774	Peanut
776	Tofu
780	Cabbage
799	Cornmeal
806	Pine Nut
811	Maple Syrup
813	butter balls
815	Thanksgiving
819	Sundae
822	Blackberry
824	Cornbread
825	Brown Butter
827	Bell Pepper
835	Cod
836	Hazelnut
837	Sherry
851	Vodka
867	Sweet Potato/Yam
877	Crackers
878	Salt
882	Tortillas
884	Enchiladas
885	Ancho Chile
888	Queso Fresco
893	Apple Cider Vinegar
907	Grill
949	Cookies
950	Holiday Cookies
951	Rum
954	Pecan
960	Rum Drinks
967	Basics
970	Soup
973	Kombu
986	Monterey Jack
990	coconut oil
1009	Buttermilk
1011	Pancake
1014	Flaxseed
1017	Oil
1021	Roast
1022	appetizer
1025	Cupcakes
1026	Cream Cheese
1041	Corn Syrup
1044	Mexican
1045	Winter
1048	Cinco De Mayo
1053	Sage
1066	Hummus
1067	Chickpea
1071	Peanut Butter
1073	Alcohol
1077	Grapefruit
1080	Sparkling Wine
1086	Crumble
1091	pepita
1106	Potato Salad
1109	Chorizo
1125	Pork Chop
1127	Father's Day
1128	Bacon
1134	Mustard
1138	Peach
1144	Zaatar
1147	Pita
1148	Labneh
1156	Cashew
1161	Beef
1167	Chili
1168	BA Best
1169	Yeast
1175	Jam
1185	Tiramisu
1186	Mascarpone
1187	Sweet Spots
1189	Beignets
1197	Tumeric
1203	Palm Sugar
1206	Sea Salt
1209	Hot Chocolate
1210	Marshmallow
1219	Vegetables
1220	Julia Child
1223	Zucchini
1225	Bastille Day
1229	Potluck
1230	Casserole
1242	Picnic
1245	Tuna
1248	Cannellini Beans
1251	White Beans
1263	Hamantaschen
1268	Purim
1296	Passover
1297	Matzo
1300	Toffee
1301	Galette
1302	Potato
1305	Goat Cheese
1308	Yukon Gold
1332	Rye
1336	Ham
1339	Escarole
1344	Plum Tomatoes
1349	Cherry Tomatoes
1353	Roasted Vegetables
1361	Broccoli
1364	Butternut Squash
1376	Chiltern
1381	Absinthe
1384	Cognac/Armagnac
1398	Fusilli
1405	Food-Lover's Cleanse 2014
1427	spaghetti squash
1431	Pecorino
1441	Tea
1446	Flatbread
1451	Burrata
1457	Pizza
1474	chestnut
1486	Smores
1487	Graham Cracker
1494	Chimichurri
1499	Kale
1507	Taco
1526	gochugaru
1531	camp lunch
1534	Toast
1544	ice cream maker
1566	Pinto Beans
1570	Brioche
1580	Cider
1581	switchel
1587	omelet
1594	chard
1596	Celery Root
1601	Panzanella
1613	Sour Cream
1624	macadamia nut
1625	Nut
1635	Vinaigrette
1640	Bread Pudding
1651	Lasagna
1653	Collard Greens
1656	Bechamel
1668	Orange Juice
1669	Jalapeno
1680	Cherry
1695	Gremolata
1716	Corn
1751	baking 123
1754	Pate a Choux
1755	Pastry
1759	Mustard Greens
1764	Lentil
1771	Custard
1783	Pie
1784	Citrus
1787	Super Bowl
1790	Heritage Pork
1791	Nachos
1792	Chips
1795	Mario Batali
1847	Indian Food
1850	Tamarind
1865	Easy
1870	Aleppo Pepper
1878	Barley
1884	Oatmeal
1914	Allspice
1922	Fall
1924	Pumpkin
1927	Muffin
1952	Aniseed
1955	Panko
1968	Endive
1977	Bar Cookie
1998	Japanese
1999	furikake
2004	Pumpkin Seed
2007	grape
2020	Chile Pepper
2023	Mole
2024	Tomatillo
2062	Raisin
2066	clam
2067	Seafood
2083	Middle Eastern
2099	Burgers
2104	Asiago
2109	Hot Pepper
2137	Daikon
2143	Ramp
2145	korean
2160	Sumac
2172	Okra
2183	Scone
2195	Cheddar
2211	Leafy Greens
2222	Dijon
2253	Artichoke
2256	Rosemary
2276	BLT
2282	Romaine
2294	Salsa
2334	Whole Grain
2351	Blueberry
2386	pickle
2402	Brownies
2431	Lemon Zest
2436	Crudite
2439	chicken wings
2453	hamburger
2454	Ketchup
2458	Relish
2498	Seltzer
2518	Rib
2533	Watercress
2562	Smoked Trout
2569	Dip
2571	Trout
2577	Berry
2596	Trifle
2597	Raspberry
2598	Liqueur
2613	Coconut Cream
2620	Rose
2623	spritz
2624	Passion Fruit
2631	Salmon
2642	Serrano Chiles
2669	Star Anise
2683	Shiitake
2697	Masa
2705	Président Cheese 
2709	Zest
2719	Smoothie
2736	Ground Pork
2748	chia
2759	Pea Shoot
2763	Sugar Snap Pea
2802	Crust
2819	Orange Zest
2822	Fig
2857	Puff Pastry Dough
2859	Pot Pie
2914	Chocolate Chips
2925	Almond Paste
2940	Chilaquiles
2956	Greek Food
2966	Fritter
2969	Gravy
2977	Biscuit
2994	Mango
2995	Pudding
3005	Hominy
3014	Posole
3035	Seed
3038	Cacao Nib
3041	Granola
3054	Gruyere
3061	Candy
3071	Nostalgia
3091	Stew
3103	Macaroni And Cheese
3105	Fontina
3108	Macaroni
3142	Appetizer
3192	Molasses
3219	Polenta
3230	Sliders
3234	Roll
3272	mackerel
3281	Campari
3290	Egg Whites
3294	Ricotta Salata
3297	Black Beans
3319	Canola Oil
3330	Seaweed
3333	Soba
3343	Edamame
3353	Rigatoni
3366	Light
3376	Red Snapper
3388	Blue Cheese
3460	Tostada
3486	Gazpacho
3557	Acai
3619	Hoisin Sauce
3627	Milk Chocolate
3629	White Chocolate
3637	Rice Wine
3642	Steak
3644	Oyster Sauce
3690	kohlrabi
3701	sunflower seed
3725	Dark Chocolate
3733	Poppy Seeds
3758	Brisket
3759	Worcestershire Sauce
3769	Acorn Squash
3783	Liver
3792	Gelatin
3802	Bok Choy
3808	Halibut
3809	Chile Powder
3823	Old Bay
3824	Onion Powder
3826	red wine vinegar
3878	Oyster
3882	Tapioca
3933	Summer Squash
3944	Adobo
3955	Guacamole
3968	chinese
3971	Buffet
3973	Sichuan
3976	Lunar New Year
3977	Asian
4009	green bean
4020	Fudge
4029	 Lunch
4030	 Dinner
4037	Little Gem
4056	Grilled Cheese
4088	Cranberry
4089	Cranberry Sauce
4137	Lager
4147	Vermouth
4149	Chowder
4161	Marjoram
4192	Green Tea
4198	nori
4214	Spaghetti
4227	Aioli
4246	Lemonade
4272	Falafel
4315	Broccoli Rabe
4321	Quick And Easy
4330	Irish
4356	game of thrones
4365	Apple Cider
4386	Fava Bean
4401	Cast iron
4494	fry
4509	Chai
4524	Green
4531	Harissa
4549	Dandelion Green
4580	Creme Fraiche
4583	Waffle
4607	fingerling potato
4627	Dominique Ansel
4712	Brie
4718	Achiote Paste
4723	scallop
4727	Fettuccine
4736	Mussel
4740	Kirsch
4753	Eau De Vie
4756	Leaf
4767	Corned Beef
4771	Bay
4826	apple pie
4829	McDonalds
4835	Frozen Dessert
4836	Summer Desserts
4845	Whipped Cream
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tags_tag_id_seq', 4846, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, email, name, password, restrictions) FROM stdin;
2	r.giles@sunnydale.hs.com	Rupert Giles	$2b$12$od6OQTpNOgIIgxhN7ZtYrOuC9oypKG.DspZ5TGm5c1gTAczPz5U92	 Vegetarian,
3	bookish@sunnydale.hs.com	Willow Rosenberg	$2b$12$.A.S9vi1Wvnco6GQIZPstOmNW/YlVmcH2n3qX.wOmsww.hhLHHPoy	 Kosher,
4	slayallday@sunnydale.hs.come	Buffy Summers	$2b$12$KdpK1JdV3VbWA0QQagIPQOrDDNU6NK5V4IOsyr.IY7B82Xik6W2MK	 Vegan,
5	t.maclay@sunnydale.hs.com	Tara Maclay	$2b$12$2a/5d007hWKh4yyUZaX.XexhJ0OQcCJgQm82U77PlcLxsB21Fl/GK	 Fish,
6	manhater@demon.com	Anya Jenkins	$2b$12$uh6Dl6B0dr2Y9kg01Sg0P.JCWy64MSDPfgRs.8bTQqwvrIVLnusZm	 Fish,Kosher,
7	5by5@freespirit.com	Faith	$2b$12$YaNNVolFf2U1uaz8FHZfmef.I26lUru.o3QQ/DkujCq0LYj.rAxle	\N
8	jenny@sunnydalehs.com	Jenny Calendar	$2b$12$vGfGN/RcaZDzWBdkkucB4uLJqBmNstlHokZrlikljp8SA3YHBB42e	 Vegetarian,
9	thegreatandpowerful@oz.com	Oz	$2b$12$FyaIUlLQlXMmUPZDwk744.ethcFH56mND9aaCnpTS861BrsHadTri	 Fish,
10	xander@sunnydalehs.com	Xander Harris	$2b$12$pnrHc/WZez9EFN9c1O3bsOiOin2AC3JADIgCJqOqUL/W/NP2wTWN2	 Fish,
11	dawn@sunnydalehs.com	Dawn Summers	$2b$12$faZUVdu8MQa6tYgk.BRttu5S4LFMVaw9iDA7aohg09aSWE9JzWLmq	\N
1	cordy@sunnydale.hs.com	Cordelia Chase	$2b$12$D780WfPbMO369lwn7kAqPuFzq3xoLfSBJjPi.iEbSSY3Xk8rs50B2	 Vegetarian,
12	kendra@vawesome.com	Kendra Young	$2b$12$oVlHvHwz9goPXnoGIMhU9etO0Af4GhBk.UM/uP.uoyg86kXtDS3lu	\N
13	vampire@sunnydalehs.com	Drusilla	$2b$12$zFLAO5DxUZnx7SB3o0R3musVmnpsoy/GvsF/XDcyc/COhR08W4.kO	 Kosher,
14	imavampire@sunnydale.com	Spike	$2b$12$EXFS9s1WEqqWZZSC7c03V.IRO/7dV1zL7jTG0yBrw5LcoPtB.KHcq	 Vegetarian,
15	rat@sunnydalehs.com	Amy	$2b$12$0acVw23Xq3noeG.i1aVPzO70qHiRNZrXlz0yvqv0cB3FbYRu4zxgS	 Vegan,
16	vampwithasoul@sunnydale.com	Angel	$2b$12$cawePKWUqamrT.rjlV8Eae7/6sEgekRlQrYs5or4F.6ml71hlT2mG	 Vegetarian,
17	riley@sunnydalecollege.com	riley	$2b$12$ITPjAjiiUjqki/EWvpwjH.tnQpf8c22.fHMf9RhUmc/tgm7kZrJN2	\N
18	vamp@sunnydale.com	Darla	$2b$12$1/rxXwh/NOZWJUiAD5XjGeZUbF2udD2mPETIVCweMJ9cUQcGPEwLO	 Vegetarian,
19	personal@email.com	Person	$2b$12$4GJPp4uJeRKThIfhScFR7.EBgs91lrTyVXKlm4mF1YHnb7hj80ece	 Vegetarian,
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 19, true);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);


--
-- Name: tagrecipes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tagrecipes
    ADD CONSTRAINT tagrecipes_pkey PRIMARY KEY (tagrecipe_id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: ratings_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);


--
-- Name: ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: tagrecipes_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tagrecipes
    ADD CONSTRAINT tagrecipes_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);


--
-- Name: tagrecipes_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tagrecipes
    ADD CONSTRAINT tagrecipes_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

