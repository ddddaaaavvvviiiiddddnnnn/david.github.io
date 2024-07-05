<?php
require 'connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $species = $_POST['species'];
    $age = (int)$_POST['age'];

    if ($name && $species && $age) {
        $stmt = $pdo->prepare('INSERT INTO pets (name, species, age) VALUES (?, ?, ?)');
        if ($stmt->execute([$name, $species, $age])) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false]);
        }
    } else {
        echo json_encode(['success' => false]);
    }
} else {
    echo json_encode(['success' => false]);
}
?>
