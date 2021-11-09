-- CREATING TABLES
CREATE TABLE users (
	user_id SERIAL PRIMARY KEY NOT NULL,
	first_name varchar(75) NOT NULL,
	last_name varchar(75) NOT NULL,
	bio varchar(255)
);

CREATE TABLE auth (
	user_id int NOT NULL REFERENCES users(user_id),
	email varchar(255) NOT NULL UNIQUE,
	password varchar(255) NOT NULL
);

CREATE TABLE "comments" (
	"comment_id" SERIAL PRIMARY KEY NOT NULL,
	"user_id" int NOT NULL REFERENCES users(user_id)
);

CREATE TABLE "recipe" (
	"user_id" INT NOT NULL REFERENCES users(user_id),
	"recipe_id" SERIAL PRIMARY KEY NOT NULL,
	"recipe_name" VARCHAR(255) NOT NULL,
	"serving_size" INT NOT NULL,
	"prep_minutes" INT NOT NULL,
	"cook_minutes" INT NOT NULL,
	"favorite" BOOLEAN NOT NULL,
	"photo_url" VARCHAR(255) NOT NULL
);

CREATE TABLE "likes" (
	"like_id" SERIAL PRIMARY KEY NOT NULL,
	"user_id" INT NOT NULL REFERENCES users(user_id),
	"recipe_id" INT NOT NULL REFERENCES recipe(recipe_id)
);

CREATE TABLE "ingredient" (
	"ingredient_id" SERIAL PRIMARY KEY NOT NULL,
	"ingredient_name" varchar(255) NOT NULL UNIQUE
);

CREATE TABLE "recipe_ingredient" (
	"recipe_ingredient_id" serial PRIMARY KEY NOT NULL,
	"ingredient_id" int NOT NULL REFERENCES ingredient(ingredient_id),
	"quantity" int NOT NULL,
	"quantity unit" varchar(255) NOT NULL,
	"recipe_id" integer NOT NULL REFERENCES recipe(recipe_id)
);

CREATE TABLE "tag" (
	"tag_id" serial PRIMARY KEY NOT NULL ,
	"tag_name" varchar(255) NOT NULL
);

CREATE TABLE "recipe_tag" (
	"recipe_tag_id" serial PRIMARY KEY NOT NULL,
	"recipe_id" integer NOT NULL REFERENCES recipe(recipe_id),
	"tag_id" integer NOT NULL REFERENCES tag(tag_id)
);

CREATE TABLE "grocery_list" (
	"grocery_list_id" serial PRIMARY KEY NOT NULL,
	"user_id" integer NOT NULL REFERENCES users(user_id),
	"list_name" varchar(255) NOT NULL
);

CREATE TABLE "grocery items" (
	"grocery_item_id" serial PRIMARY KEY NOT NULL,
	"grocery_list_id" integer NOT NULL REFERENCES grocery_list(grocery_list_id),
	"ingredient_id" integer NOT NULL REFERENCES ingredient(ingredient_id)
);

-- INSERTING USERS
INSERT INTO users (first_name, last_name)
VALUES('Justin', 'Lowry');

INSERT INTO users (first_name, last_name, bio)
VALUES ('Jessica', 'Lowry', 'I love cats'),
('Joe', 'Cherry', 'I love DND'),
('Sam', 'Lowry', 'Mark Twain is a wise man'),
('George', 'Lowry', 'I am the jungle guy');

-- UPDATING USER
UPDATE users
SET last_name = 'Cherry'
WHERE user_id = 2;

-- INSERTING INGREDIENTS
INSERT INTO ingredient(ingredient_name)
VALUES('Blue Berries'),
('Banana'),
('Milk'),
('Ice'),
('Ice cream'),
('Strawberries'),
('Chocolate protein');

