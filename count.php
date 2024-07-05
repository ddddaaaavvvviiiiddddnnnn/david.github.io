<?php //count()function
$stud=array("David","Zippy","Tim","Zaddock");
echo count($stud);
?>
<hr>
<?php
$color=array("red","blue","black","green","white","grey","brown","yellow");
sort($color);
foreach($color as $k)//sort()function
{
    echo"$k <br>";
}
?>
<hr>
<?php //sort()function
$color=array("red","blue","black","green","white","grey","brown","yellow");
rsort($color);
foreach($color as $k)
{
    echo"$k <br>";
}
?>
<hr>
<?php //reverse()function
$sport=array("football","badminton","basketball","rugby","cricket","golf","baseball","swimming");
$reversedsport=array_reverse($sport);
foreach($reversedsport as $k)
{
    echo"$k <br>";
}
?>
<hr>
<?php //search() function
$k=array("Kajiado","Nairobi","Kiambu","Makueni","Marsabit","Kisumu");
$key=array_search("Kisumu",$k);
echo $key;
?>