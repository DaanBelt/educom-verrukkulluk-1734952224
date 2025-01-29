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

    public function selectDish($id = null) {
        $sql = "SELECT * FROM dish";
        $dish_array = [];
        
        if($id){
            $sql .= " WHERE id = $id";
        }

        $result = mysqli_query($this->connection, $sql);

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
            $user = $this->selectUser($row["user_id"]);
            $ingredients = $this->selectIngredient($row["id"]);
            $totalCalories = $this->calcCalories($ingredients);
            $totalPrice = $this->calcPrice($ingredients);
            $rating = $this->selectRating($row["id"]);
            $steps = $this->selectSteps($row["id"]);  
            $remarks = $this->selectRemarks($row["id"]);
            $kitchen = $this->selectKitchen($row["kitchen_id"]);
            $type = $this->selectType($row["type_id"]);
            $favorites = $this->determineFavorite($row["id"]);
            $dish_array[] = [
                "dish" => $row, 
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

    private function selectDishInfo($dish_id){
        return($this->dish_info->selectDishInfo($dish_id));
    }

    private function selectKitchenType($dish_id) {
        return($this->kitchentype->selectKitchenType($dish_id));
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
        $rating = $this->selectDishInfo($dish_id);
        foreach($rating as $key => $item) {
            if ($item['record_type'] === 'B' || $item['record_type'] === 'O' || $item['record_type'] === 'F') {
                unset($rating[$key]);
            }
        }
        
        $ratingTotal = 0;
        $count = 0;
        if(count($rating) > 0) {
            foreach($rating as $item) {
                $ratingTotal += $item['number_field'];
                $count ++;
            }
            $averageRating = $ratingTotal / $count;
            } else {
                $averageRating = 0;
            }
            $rating['average'] = $averageRating;
            return($rating);   
    }

    private function selectSteps($dish_id) {
        $steps = $this->selectDishInfo($dish_id);
        foreach($steps as $key => $item) {
            if ($item['record_type'] === 'W' || $item['record_type'] === 'O' || $item['record_type'] === 'F') {
                unset($steps[$key]);
            }
        }
        return($steps);
    }

    private function selectRemarks($dish_id) {
        $remarks = $this->dish_info->selectDishInfo($dish_id);
        foreach($remarks as $key => $item) {
            if ($item['record_type'] === 'W' || $item['record_type'] === 'B' || $item['record_type'] === 'F') {
                unset($remarks[$key]);
            }
        }
        return($remarks);
    }

    private function determineFavorite($dish_id){
        $favorites = $this->dish_info->selectDishInfo($dish_id);
        foreach($favorites as $key => $item) {
            if($item['record_type'] == 'W' || $item['record_type'] == 'B' || $item['record_type'] == 'O') {
                unset($favorites[$key]);
            }
        }
        return($favorites);
    }

    private function selectKitchen($selectDish) { 
        $kitchen_id = $selectDish;
        $kitchen = $this->selectKitchenType($kitchen_id);
        return($kitchen);
    }

    private function selectType($selectDish) {
        $type_id = $selectDish;
        $type = $this->selectKitchentype($type_id);
        return($type);
    }

    public function findSearchTerm($dish, $searchTerm) {
        foreach ($dish as $value) {
            if (is_string($value)) {
                if (preg_match("/$searchTerm/i", $value)) {
                    return(true);
                }
            }

            if (is_array($value) && $this->findSearchTerm($value, $searchTerm)) {
                return(true);
            }
        }
        return false;
    }

    public function searchTerm($searchTerm) {
        $data = $this->selectDish();
        $results = [];
        
        foreach ($data as $dish) {
            if ($this->findSearchTerm($dish, $searchTerm)) {
                $results[] = $dish;
            } 
        }

        if(!empty($results)) {
            return($results); 
        } else {
            echo "Er zijn geen zoek resultaten gevonden voor '$searchTerm'";
            return($results);
        }
    }
}
?>
