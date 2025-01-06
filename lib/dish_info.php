<?php
class dish_Info {
    private $connection;
    private $user;

    public function __construct($connection){
        $this->connection = $connection;
        $this->user = new user($connection);
    }

    private function selectUser($user_id){
        $user = $this->user->selectUser($user_id);
        return($user);
    }

    public function addFavorite($dish_id, $user_id) {
        $sql = "INSERT INTO dish_info (record_type, dish_id, user_id) VALUES('F', $dish_id, $user_id)";
        mysqli_query($this->connection, $sql);
    }

    public function deleteFavorite($dish_id, $user_id) {
        $sql = "DELETE FROM dish_info WHERE record_type = 'F' AND dish_id = $dish_id AND user_id = $user_id";
        mysqli_query($this->connection, $sql);
    } 

    public function selectDishInfo($dish_id){
        $sql = "SELECT * FROM dish_info WHERE dish_id = $dish_id";
        $result = mysqli_query($this->connection, $sql);

        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            if($row["user_id"] == NULL){
                $return[] = [
                    "id" => $row["id"],
                    "record_type" => $row["record_type"],
                    "dish_id" => $row["dish_id"],
                    "user_id" => $row["user_id"],
                    "date" => $row["date"],
                    "number_field" => $row["number_field"],
                    "text_field" => $row["text_field"],
                ];
            } else {
                $user_id = $row["user_id"];
                $user = $this->selectUser($user_id);
                $return[] = [
                    "id" => $row["id"],
                    "record_type" => $row["record_type"],
                    "dish_id" => $row["dish_id"],
                    "user_id" => $user_id,
                    "date" => $row["date"],
                    "number_field" => $row["number_field"],
                    "text_field" => $row["text_field"],
                    "user_id" => $user_id,
                    "name" => $user["name"],
                    "email" => $user["e-mail"],
                    "password" => $user["password"],
                    "photo" => $user["photo"],
                ];
            }
        }
        return($return);
    }
}