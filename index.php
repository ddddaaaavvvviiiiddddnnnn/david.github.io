<?php
$dbhost = "localhost"
$dbname = "david";
$dbusername = "root";
$dbpassword = "";
$conn = new mysqli($dbhost, $dbname, $dbusername, $dbpassword);
if ($conn->connect_error) 
{
    echo("connection failed: " . $conn->connect_error);
}
echo("connection successful");
?>