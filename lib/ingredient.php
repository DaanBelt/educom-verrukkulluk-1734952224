<?php

class ingredient {
    private $connection;
    private $art;

    public function __construct($connection) {
        $this -> connection = $connection;
        $this -> art = new article ($connection);
    }

    private function selectArticle($article_id) {
        $art = $this->art->selectArticle($article_id);
        return($art);
    }

    public function selectIngredient($dish_id) {

        $sql = "SELECT * FROM ingredient WHERE dish_id = $dish_id";
        $result = mysqli_query($this->connection, $sql);

        $return = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $art_id = $row["article_id"];
            $art = $this->selectArticle($art_id);

            $return[] = [
                "id" => $row["id"],
                "dish_id" => $row["dish_id"],
                "article_id" => $art_id,
                "amount" => $row["amount"],
                "name" => $art["title"],
                "description" => $art["description"],
                "price" => $art["price"],
                "kcal" => $art["kcal"],
                "packaging" => $art["packaging"],
                "unit" => $art["unit"],
                "picture" => $art["picture"],
            ];
        }
        return($return);
    }
}

