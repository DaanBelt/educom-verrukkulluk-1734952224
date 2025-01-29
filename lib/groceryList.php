<?php

class groceryList {
    private $connection;
    private $ingredients;
    private $dish;
    private $user;
    private $article;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->ingredients = new ingredient($connection);
        $this->dish = new dish($connection);
        $this->user = new user($connection);
        $this->article = new article($connection);
    }
    
    public function addGroceries($dish_id, $user_id) {
        $ingredients = $this->selectIngredient($dish_id);
        
        $articleAmount = 0;

        foreach($ingredients as $ingr) {
            $article_id = $ingr["article_id"];
            $article = $this->selectArticle($article_id);

            if($this->articleOnList($ingr["article_id"], $user_id)) {
                //updateArticle;
                $grocery = $this->selectArticleFromGrocery($user_id, $article_id);
                $amount = $grocery["amount"] + $ingr["amount"];
                $packaging = ceil($amount/$article["packaging"]);
                $sql = "UPDATE grocery_list SET amount = $amount, packaging = $packaging WHERE article_id = $article_id AND user_id = $user_id";
                mysqli_query($this->connection, $sql);
            } else {
                //addArticle;
                $amount = $ingr["amount"];
                $packaging = ceil($ingr["amount"]/$article["packaging"]);
                $sql = "INSERT INTO grocery_list(article_id, user_id, amount, packaging) VALUES($article_id, $user_id, $amount, $packaging)";
                mysqli_query($this->connection, $sql);
            }
        }
    }

    public function deleteGrocery($article_id, $user_id) {
        $sql = "DELETE FROM grocery_list WHERE article_id = $article_id AND user_id = $user_id";
        $result = mysqli_query($this->connection, $sql);
    }

    public function articleOnList($article_id, $user_id) {
        $groceries = $this->selectGroceries($user_id);
        
        foreach($groceries as $grocery) {
            if($grocery["article_id"] == $article_id) {
                return($grocery);
            }
        }
        return(false);
    }

    public function selectGroceries($user_id) {
        $sql = "SELECT * FROM grocery_list WHERE user_id = $user_id";
        $result = mysqli_query($this->connection, $sql);
        
        $grocery_list = [];

        while($grocery = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $art_id = $grocery["article_id"];
            $art = $this->selectArticle($art_id);
            $grocery_list [] = [...$art, ...$grocery];
        }
        return($grocery_list);
    }

    private function selectArticleFromGrocery($user_id, $article_id) {
        $sql = "SELECT * FROM grocery_list WHERE user_id = $user_id AND article_id = $article_id";
        $result = mysqli_query($this->connection, $sql);
        $article = mysqli_fetch_array($result, MYSQLI_ASSOC);
        return($article);
    }

    private function selectIngredient($dish_id) {
        return($this->ingredients->selectIngredient($dish_id));
    }

    private function selectArticle($article_id) {
        return($this->article->selectArticle($article_id));
    }
}

