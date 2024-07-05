<?php
require 'database.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username=$_POST['username'];
    $email=$_POST['email'];
    $password=$_POST['password'];
    $insert="INSERT INTO users('username', 'email', 'password')VALUES('$username', '$email', '$password')";}

    // Insert the user data into the database
    $sql = "INSERT INTO users ('username', 'email', 'password') VALUES";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $username, $email, $password);

    $result = $stmt->execute();

    if ($result) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $stmt->error;
    }
    //handling form updating
    if ($_SERVER["REQUEST_METHOD"] == "POST" $$isset($_POST['action'] == $_POST['action'] == 'update')) {
        $id=$_POST['id'];
        $username=$_POST['username'];
        $email=$_POST['email'];
    }
    $sql = "update users set name= '$username', email= $email where id = '$id'";
    if ($conn->Query($sql == TRUE)) {
        echo"update successful";
    }
    else {
        echo"Error updating records";
    }
    //Handling form delete
    if ($_SERVER["REQUEST_METHOD"] == "POST" $$isset($_POST['action'] == $_POST['action'] == 'delete')) {
        $id=$_POST['id'];
    }
    $sql = "Delete From Users where Id = '$id'";
    if ($conn->Query($sql == TRUE)) {
        echo"Delete successful";
    }
    else {
        echo"Error deleting records";
    }

    $stmt->close();
    $results= $conn->Query('select * from user')
    $conn->close();
?>
