<?php

$servername = 'localhost';
$user = 'root';
$password = 'root';
$db = 'message';
$host = '127.0.0.1';
$port = 8889;


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
$sql = "SELECT * FROM message
WHERE date IN (SELECT max(date) FROM message)";

$result = $conn->query($sql);

$rows = array();
while($r = $result->fetch_array(MYSQLI_BOTH)) {
  $rows[] = $r;
}
echo json_encode($rows);
$conn->close();

?>
