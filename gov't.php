<?php
$wrld=array("N America","S America","Africa","Asia","Europe");
$cntry=array("USA","Sweden","Brazil","England");
$africa=array("Namibia","Ghana","Algeria","Tunisia");
$eac=array("Kenya","Tanzania","Rwanda","Uganda","Burundi");
$kcnt=array("Kajiado","Nakuru","Busia","Nyamira","Kiambu","Wajir");
$wrd=array("Continents"=>$wrld,"world"=>$cntry,"African countries"=>$africa,"East Africa Capitals"=>$eac,"Kenyan Counties"=>$kcnt);
foreach ($wrld as $key => $v)
    {
        echo $key.":";
        for ($i=0;$i<count($k);$i++) 
        { 
            echo $k[$i]." ";
        }
        echo"<br>";
    }
    ?>
