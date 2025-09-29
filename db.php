<?php

    $serverName = "localhost";
    $userName = "root";
    $password = "";
    $dbName = "jaas";

    $conn = mysqli_connect($serverName, $userName, $password, $dbName);
    if (!$conn)
    {
        die("Connection failed: " . mysqli_connect_error());
    }

?>


<?php
require 'vendor/autoload.php'; // If using Composer

$uri = "mongodb://agroworld:qu5V9fEwOEgzYYRwcThgogcfOOhVYhoaFFrnlGrVnfT1Ph7cLxzWMNp9qjEWiZOBtZMbosIXttFpACDbf3alKg==@agroworld.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb";
$client = new MongoDB\Client($uri);

$database = $client->selectDatabase('agrodb');
$collection = $database->selectCollection('agroworld001');

// Example: Insert a document
$collection->insertOne(['name' => 'Akash', 'location' => 'Bengaluru']);
