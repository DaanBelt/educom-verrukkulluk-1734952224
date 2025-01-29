<?php
//// Allereerst zorgen dat de "Autoloader" uit vendor opgenomen wordt:
require_once("./vendor/autoload.php");

/// Twig koppelen:
$loader = new \Twig\Loader\FilesystemLoader("./templates");
/// VOOR PRODUCTIE:
/// $twig = new \Twig\Environment($loader), ["cache" => "./cache/cc"]);

/// VOOR DEVELOPMENT:
$twig = new \Twig\Environment($loader, ["debug" => true ]);
$twig->addExtension(new \Twig\Extension\DebugExtension());

/******************************/

/// Next step, iets met je data doen. Ophalen of zo
require_once("lib/dish.php");



// data retrieval
require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/user.php");
require_once("lib/kitchentype.php");
require_once("lib/ingredient.php");
require_once("lib/dish_info.php");
require_once("lib/dish.php");
require_once("lib/groceryList.php");


// data init
$db = new database();
$dish = new dish ($db->getConnection());
// $art = new article($db->getConnection());
// $user = new user($db->getConnection());
// $kitchentype = new kitchentype($db->getConnection());
// $ingredient = new ingredient($db->getConnection());
$dish_info = new dish_info($db->getConnection());
$grocery_list = new groceryList($db->getConnection());

/*
URL:
http://localhost:8888/educom-verrukkulluk-1734952224/index.php
http://localhost:8888/educom-verrukkulluk-1734952224/index.php?dish_id=4&action=detail 
http://localhost:8888/educom-verrukkulluk-1734952224/index.php?dish_id=${dish_id}&rating=${rating}&action=rating`
*/

$dish_id = isset($_GET["dish_id"]) ? $_GET["dish_id"] : "";
$action = isset($_GET["action"]) ? $_GET["action"] : "homepage";
$rating = isset($_GET["rating"]) ? $_GET["rating"] : "";
$user_id = isset($_GET["user"]) ? $_GET["user"] : "2";
$article_id = isset($_GET["article"]) ? $_GET["article"] : "";
$searchTerm = isset($_POST['search']) ? $_POST['search'] : "";

switch($action) {

        case "homepage": {
            $data = $dish->selectDish();
            $template = 'homepage.html.twig';
            $title = "homepage";
            break;
        }

        case "detail": {
            $data = $dish->selectDish($dish_id);
            $template = 'detail.html.twig';
            $title = "detail pagina";
            break;
        }
        
        case "rating": {
            header('Content-type: application/json');
            $dish_info->addRating($dish_id, $rating);
            $allRatings = $dish->selectRating($dish_id);
            $averageRating = $allRatings["average"];

            $result = array("succes"=>true, "Average"=>$averageRating);
            echo json_encode($result);
            die();
        }

        case "grocery-list": {
            $data = $grocery_list->selectGroceries($user_id);
            $template = 'grocery.html.twig';
            $title = "Boodschappenlijst";
            break;
        }

        case "add-grocery": {
            $grocery_list->addGroceries($dish_id, $user_id);
            $data = $grocery_list->selectGroceries($user_id);
            $template = 'grocery.html.twig';
            $title = "Boodschappenlijst";
            break;
        }

        case "delete-article": {
            $grocery_list->deleteGrocery($article_id, $user_id);
            $data = $grocery_list->selectGroceries($user_id);
            $template = 'grocery.html.twig';
            $title = "Boodschappenlijst";
            break;
        }

        case "search": {
            $data = $dish->searchTerm($searchTerm);
            $template = 'search.html.twig';
            $title = "search";
            break;
        }
}


/// Onderstaande code schrijf je idealiter in een layout klasse of iets dergelijks
/// Juiste template laden, in dit geval "homepage"
$template = $twig->load($template);


/// En tonen die handel!
echo $template->render(["title" => $title, "data" => $data]);
