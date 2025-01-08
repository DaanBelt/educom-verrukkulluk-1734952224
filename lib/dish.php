<?php
class dish {
    private $connection;
    private $ingredient;
    private $user;
    private $article;
    private $dish_info;
    private $kitchentype;

    public function __construct($connection){
        $this-> connection = $connection;
        $this-> ingredient = new ingredient($connection);
        $this-> user = new user($connection);
        $this-> article= new article($connection);
        $this-> dish_info = new dish_info($connection);
        $this-> kitchentype = new kitchentype($connection);
    }

    public function selectDish($ids) {
        $dish_array = [];

        foreach($ids as $id) {
            $sql = "SELECT * FROM dish WHERE id = $id";
            $result = mysqli_query($this->connection, $sql);
            $return = mysqli_fetch_array($result, MYSQLI_ASSOC);

            if($return) {
                $user = $this->selectUser($return["user_id"]);
                $ingredients = $this->ingredient->selectIngredient($id);
                $totalCalories = $this->calcCalories($ingredients);
                $totalPrice = $this->calcPrice($ingredients);
                $rating = $this->selectRating($id);
                $steps = $this->selectSteps($id);  
                $remarks = $this->selectRemarks($id);
                $kitchen = $this->selectKitchen($return);
                $type = $this->selectType($return);
                $favorites = $this->determineFavorite($id);
                $dish_array[] = [
                    "dish" => $return, 
                    "user" => $user, 
                    "ingredients" => $ingredients,
                    "total_calories" => $totalCalories,
                    "total_price" => $totalPrice,
                    "rating" => $rating,
                    "steps" => $steps,
                    "remarks" => $remarks,
                    "favorites" => $favorites,
                    "kitchen" => $kitchen,
                    "type" => $type
                ];
            }
        }
        return($dish_array);
    }

    private function selectIngredient($dish_id) {
        $ingredient = $this->ingredient->selectIngredient($dish_id);
        return($ingredient);
    }

    private function selectUser($user_id) {
        $user = $this->user->selectUser($user_id);
        return($user);
    }

    private function selectArticle($article_id) {
        $article = $this->article->selectArticle($article_id);
       return($article);
    }

    public function calcCalories($ingredients) {
        $totalCalories = 0;

       foreach($ingredients as $ingr) {
            $art_id = $ingr["article_id"];
            $art = $this->selectArticle($art_id);
            $calc = $art["kcal"]/$art["packaging"]*$ingr["amount"];
            $totalCalories += $calc;
       }
       return($totalCalories);
    }

    public function calcPrice($ingredients) {
        $totalPrice = 0;

        foreach($ingredients as $ingr) {
            $art_id = $ingr["article_id"];
            $art = $this->selectArticle($art_id);
            $calc = ceil($ingr["amount"]/$art["packaging"])*$art["price"]; 
            $totalPrice += $calc;
        }
        return($totalPrice);
    }

    public function selectRating($dish_id) {
       $rating = $this->dish_info->selectDishInfo($dish_id);
        foreach($rating as $key => $item) {
            if ($item['record_type'] === 'B' || $item['record_type'] === 'O' || $item['record_type'] === 'F') {
                unset($rating[$key]);
            }
        }
       return($rating);
    }

    public function selectSteps($dish_id) {
        $steps = $this->dish_info->selectDishInfo($dish_id);
        foreach($steps as $key => $item) {
            if ($item['record_type'] === 'W' || $item['record_type'] === 'O' || $item['record_type'] === 'F') {
                unset($steps[$key]);
            }
        }
        return($steps);
    }

    public function selectRemarks($dish_id) {
        $remarks = $this->dish_info->selectDishInfo($dish_id);
        foreach($remarks as $key => $item) {
            if ($item['record_type'] === 'W' || $item['record_type'] === 'B' || $item['record_type'] === 'F') {
                unset($remarks[$key]);
            }
        }
        return($remarks);
    }

    public function determineFavorite($dish_id){
        $favorites = $this->dish_info->selectDishInfo($dish_id);
        foreach($favorites as $key => $item) {
            if($item['record_type'] == 'W' || $item['record_type'] == 'B' || $item['record_type'] == 'O') {
                unset($favorites[$key]);
            }
        }
        return($favorites);
    }

    public function selectKitchen($selectDish) { 
        $kitchen_id = $selectDish["kitchen_id"];
        $kitchen = $this->kitchentype->selectKitchenType($kitchen_id);
        return($kitchen);
    }

    public function selectType($selectDish) {
        $type_id = $selectDish["type_id"];
        $type = $this->kitchentype->selectKitchentype($type_id);
        return($type);
    }
}