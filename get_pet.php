<?php
require 'connect.php';

$stmt = $pdo->query('SELECT name, species, age FROM pets');
$pets = $stmt->fetchAll();

echo json_encode(['pets' => $pets]);
?>
