<?php

require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/user.php");
require_once("lib/kitchentype.php");
require_once("lib/ingredient.php");
require_once("lib/dish_info.php");
require_once("lib/dish.php");
require_once("lib/groceryList.php");

/// INIT
$db = new database();
// $art = new article($db->getConnection());
// $user = new user($db->getConnection());
// $kitchentype = new kitchentype($db->getConnection());
// $ingredient = new ingredient($db->getConnection());
$dish_info = new dish_info($db->getConnection());
$dish_type = new dish ($db->getConnection());
// $dish_test = new dishTest($db->getConnection()); 
// $grocery_list = new groceryList($db->getConnection());

/// VERWERK 
// $data_article= $art->selectArticle(1);
// $data_user = $user->selectUser(1);
// $data_kitchentype = $kitchentype->selectKitchentype(2);
// $data_ingredient = $ingredient->selectIngredient(1);
// $favoriteAdd = $dish_info->addFavorite(1,2);
// $favoriteDelete = $dish_info->deleteFavorite(1,2);
// $data_dish_info = $dish_info->selectDishInfo(1);
// $data_dish_info = $dish_info->deleteRating(1);

$data_dish = $dish_type->selectDish();
// $data_search = $dish_type->searchFunction("macaroni");
// $data_dish_rating = $dish_type->selectRating(2);
// $data_dish_ingredient = $dish_type->selectIngredient(1);
// $data_dish_user = $dish_type->selectUser(1);
// $data_dish_test = $dish_test->selectDish();

// $data_grocery = $grocery_list->selectGroceries(1);
// $data_grocery1 = $grocery_list->articleOnList(3, 1);
// $data_grocery2 = $grocery_list->addGroceries(3, 2);

/// RETURN
// echo "<pre>";
// echo "Article data: ";  
// var_dump($data_article);

// echo "<pre>";
// echo "User data: "; 
// var_dump($data_user);

// echo "<pre>";
// echo "Kitchentype data: ";
// var_dump($data_kitchentype);

// echo "<pre>";
// echo "Ingredient data: ";
// var_dump($data_ingredient);

// echo "<pre>";
// echo "dish_info: ";
// var_dump($data_dish_info);

echo "<pre>";
echo "dish: ";
var_dump($data_dish);

// echo "<pre>";
// echo "dish: ";
// var_dump($data_dish_ingredient);

// echo "<pre>";
// echo "dish: ";
// var_dump($data_dish_rating);

// echo "<pre>";
// echo "dish: ";
// var_dump($data_dish_test);

// echo "<pre>";
// echo "dish: ";
// var_dump($data_grocery);

// echo "<pre>";
// echo "dish: ";
// var_dump($data_grocery1);

// echo "<pre>";
// echo "dish: ";
// var_dump($data_grocery2);

// echo "<pre>";
// echo "dish: ";
// var_dump($data_search);