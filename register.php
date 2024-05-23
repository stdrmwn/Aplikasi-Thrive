<?php
// Set CORS headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Accept, Origin, Authorization");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Connect to the database
$db = mysqli_connect('localhost', 'root', '', 'userdata');
if (!$db) {
    echo json_encode("Database connection failed");
    exit();
}

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the posted data
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Validate inputs
    if (empty($username) || empty($password)) {
        echo json_encode("Please fill in both fields");
        exit();
    }

    // Prepare a select statement to check if the username exists
    $sql = "SELECT username FROM users WHERE username = ?";
    $stmt = mysqli_prepare($db, $sql);
    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        // Check if username already exists
        if (mysqli_stmt_num_rows($stmt) > 0) {
            echo json_encode("Error");
            mysqli_stmt_close($stmt);
            exit();
        } else {
            // Prepare an insert statement
            $sql = "INSERT INTO users (username, password) VALUES (?, ?)";
            $stmt = mysqli_prepare($db, $sql);
            if ($stmt) {
                // Hash the password
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                mysqli_stmt_bind_param($stmt, "ss", $username, $hashed_password);

                // Execute the statement
                if (mysqli_stmt_execute($stmt)) {
                    echo json_encode("Success");
                } else {
                    echo json_encode("Error");
                }
                mysqli_stmt_close($stmt);
            } else {
                echo json_encode("Error");
            }
        }
    } else {
        echo json_encode("Error");
    }

    // Close the connection
    mysqli_close($db);
} else {
    echo json_encode("Invalid request method");
}
?>
