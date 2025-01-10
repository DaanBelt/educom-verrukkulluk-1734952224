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
        
        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
            $user = [];

            if($row["user_id"] == !NULL) {
                $user_id = $row["user_id"];
                $user = $this->selectUser($user_id);
            }
            $return [] = [...$user, ...$row];
        }
        return($return);
    }
}