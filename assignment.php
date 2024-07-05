<?php
$world=array("Europe","Africa","Asia","America");
$africa=array("Kenya","Mali","Tunisia","Uganda","Angola");
$eac=array("Nairobi","Dodoma","Kigali","Kampala","Mogadishu");
$kcnt=array("Kajiado","Nakuru","Busia","Nyamira","Kiambu","Wajir");
$wrd=array("Continents"=>$world,"African countries"=>$africa,"East Africa Capitals"=>$eac,"Kenyan Counties"=>$kcnt);
foreach ($wrd as $key => $k) 
{
    echo $key.":";
    for ($i=0;$i<count($k);$i++) 
    { 
        echo $k[$i]." ";
    }
    echo"<br>";
}
?>