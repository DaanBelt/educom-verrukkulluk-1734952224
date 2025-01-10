<?php

class test {
    public function selectDish($dish_id = null) {
        $sql = "SELECT * FROM dish";
        if(isset($dish_id)){
            $sql .= " WHERE id = $dish_id";
        }

        while($row = mysqli_fetch_array($sql)) {
            }
    }
}
?>