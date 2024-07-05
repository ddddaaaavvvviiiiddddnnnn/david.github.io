<!DOCTYPE html>
<html>
    <head><title>Kenswed</title></head>
    <body style="background-color: aqua;">
       <form action="index.php" style="border: none;" method="post">
        <h2>Kenswed Student Form</h2>
        First Name:<input type="text" name="first" placeholder="Enter First Name"><br><br>
        Last Name:<input type="text" name="last" placeholder="Enter Last Name"><br><br>
        Email Address:<input type="email" name="email" placeholder="Enter Email Address"><br><br>
        Mobile Number:<input type="number" name="mobile" placeholder="Enter Mobile Number"><br><br>
        Gender:
        <input type="radio" name="gender" value="male">Male
        <input type="radio" name="gender" value="female">Female
        <input type="radio" name="gender" value="other">Other <br><br>
        DOB: <input type="date" name="date" id=""><br><br>
        Religion:
        Christian<input type="radio" name="religion" value="christian">
        Muslim<input type="radio" name="religion" value="muslim">
        Hindu<input type="radio" name="religion" value="hindu">
        Pagan<input type="radio" name="religion" value="pagan"> <br><br>
        County: <input type="text" name="county" list="county" placeholder="Select County">
         <datalist id="county">
            <option>Kajiado</option>
            <option>Kiambu</option>
            <option>Kakamega</option>
            <option>Nyeri</option>
            <option>Nakuru</option>
            <option>Marsabit</option>
            <option>Turukana</option>
            <option>Busia</option>
            <option>Muranga</option>
            <option>Nairobi</option>
            <option>Mombasa</option>
            <option>Kilifi</option>
        </datalist><br><br>
        Course: <select name="course" id="">
            <option value="Select">Select</option>
            <option value="ICP">ICP</option>
            <option value="HEP">SHEP</option>
            <option value="HDBT">HDBT</option>
            <option value="Pastry">Pastry</option>
            <option value="Tailoring">Tailoring</option>
        </select><br><br>
        Term: <input type="text" name="term" list="module" placeholder="select module">
         <datalist name="term" id="module">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
         </datalist><br><br>
        Hobbies: 
        <input type="checkbox" name="hobbies" value="reading">Reading
        <input type="checkbox" name="hobbies" value="coding">Coding
        <input type="checkbox" name="hobbies" value="swimming">Swimming
        <input type="checkbox" name="hobbies" value="travelling">Travelling <br><br>
        <input type="submit" value="Register">
        <input type="reset" value="reset">
       </form> 
       <?php
       $fn=$_POST["first"];
       $ln=$_POST["last"];
       $em=$_POST["email"];
       $mob=$_POST["mobile"];
       $gen=$_POST["gender"];
       $dob=$_POST["date"];
       $reg=$_POST["religion"];
       $cty=$_POST["county"];
       $c=$_POST["course"];
       $t=$_POST["term"];
       $h=$_POST["hobbies"];
       echo"<h2><u>Your details are as shown below</u></h2>";
       echo"Name:".$fn." ".$ln."<br>";
       echo"Email Address:".$em."<br>";
       echo"Mobile No:".$mob."<br>";
       echo"Gender:".$gen."<br>";
       echo"Date of Birth:".$dob."<br>";
       echo"Religion: $reg <br>";
       echo"County: $cty <br>";
       echo"Course: $c <br>";
       echo"Term: $t <br>";
       echo"Hobbies: $h <br>";
       ?>
    </body>
</html>