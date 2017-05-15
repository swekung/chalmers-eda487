<?php

header( "refresh:2;url=index.html" );
$servername = 'localhost';
$user = 'root';
$password = 'root';
$db = 'message';
$host = '127.0.0.1';
$port = 3306;


$link = mysqli_init();
$success = mysqli_real_connect(
   $link,
   $host,
   $user,
   $password,
   $db,
   $port
);

// Create connection
$conn = new mysqli('localhost', 'root', 'root', 'message');
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$message = $_GET[message];
$sql = "Truncate table message";

if ($conn->query($sql) === TRUE)
{
    echo 'Records deleted succesfully';
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();

?>
