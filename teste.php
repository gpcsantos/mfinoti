<?php
echo "server: ".$_SERVER["HTTP_HOST"];
echo "<br>caminho: ".$_SERVER["REQUEST_URI"];




$teste = $_SERVER;
//echo "<pre>";
//var_dump($teste);



$url= "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
echo "<pre>URL: parse_URL<br>";
echo "numero de barras: ".$num = substr_count ($_SERVER["REQUEST_URI"] , '/' );



