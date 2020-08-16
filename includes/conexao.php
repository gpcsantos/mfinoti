<?php
    $host = "localhost";
    $user = "root";
    $pass = "";
    $dbname = "mfinoti";

    $con = mysqli_connect($host, $user, $pass);

    if($con){
        mysqli_select_db($con,$dbname);
    }else{
        echo "ERRO: Falha ao conectar o  banco de dados!";
    }
?>