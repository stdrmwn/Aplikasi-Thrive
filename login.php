<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Accept, Origin, Authorization");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'userdata');

$connect = mysqli_connect(HOST, USER, PASS, DB) or die('Database connection failed');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    if (empty($username) || empty($password)) {
        echo json_encode(array("status" => "error", "message" => "Please fill in both fields"));
        exit();
    }

    $sql = "SELECT username, password FROM users WHERE username = ?";
    if ($stmt = mysqli_prepare($connect, $sql)) {
        mysqli_stmt_bind_param($stmt, "s", $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) > 0) {
            mysqli_stmt_bind_result($stmt, $db_username, $db_password);
            mysqli_stmt_fetch($stmt);

            if (password_verify($password, $db_password)) {
                echo json_encode(array("status" => "success", "message" => "Login successful"));
            } else {
                echo json_encode(array("status" => "error", "message" => "Incorrect password"));
            }
        } else {
            echo json_encode(array("status" => "error", "message" => "Username not found"));
        }
        mysqli_stmt_close($stmt);
    } else {
        echo json_encode(array("status" => "error", "message" => "Error preparing statement"));
    }

    mysqli_close($connect);
} else {
    echo json_encode(array("status" => "error", "message" => "Invalid request method"));
}
?>
