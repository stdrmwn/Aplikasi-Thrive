<?php
/* Attempt to connect to MySQL database */
$link = mysqli_connect("localhost", "root", "", "db_user");

// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>