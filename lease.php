<?php
session_start();
include 'config.php';

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

// Fetch available cars
$sql_cars = "SELECT * FROM cars";
$result_cars = $conn->query($sql_cars);

// Handle lease submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_SESSION['user_id'];
    $car_id = $_POST['car_id'];
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];

    // Calculate total cost (example calculation)
    $sql_car = "SELECT price_per_month FROM cars WHERE id='$car_id'";
    $result_car = $conn->query($sql_car);
    $row_car = $result_car->fetch_assoc();
    $price_per_month = $row_car['price_per_month'];
    $total_cost = $price_per_month * (strtotime($end_date) - strtotime($start_date)) / (60 * 60 * 24 * 30); // Assuming monthly lease

    // Insert into leases table
    $sql = "INSERT INTO leases (user_id, car_id, start_date, end_date, total_cost) VALUES ('$user_id', '$car_id', '$start_date', '$end_date', '$total_cost')";

    if ($conn->query($sql) === TRUE) {
        echo "Lease submitted successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Car Lease</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Lease a Car</h2>
    <form method="POST" action="">
        <label for="car_id">Select Car:</label>
        <select name="car_id" id="car_id">
            <?php
            if ($result_cars->num_rows > 0) {
                while($row = $result_cars->fetch_assoc()) {
                    echo "<option value='" . $row['id'] . "'>" . $row['make'] . " " . $row['model'] . "</option>";
                }
            }
            ?>
        </select><br><br>
        <label for="start_date">Start Date:</label>
        <input type="date" name="start_date" id="start_date" required><br><br>
        <label for="end_date">End Date:</label>
        <input type="date" name="end_date" id="end_date" required><br><br>
        <input type="submit" value="Submit Lease">
    </form>
</body>
</html>
