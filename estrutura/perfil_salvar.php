<?php
    $pageid = 17;
    include_once('../includes/conexao.php');
    include_once('../includes/autenticacao.php');

    $msg = "";
    if(isset($_REQUEST['submit'])){ 
        if($_REQUEST['submit']=='incluir' || $_REQUEST['submit']=='alterar' ){
            $perfil = $_REQUEST['txt_perfil'];
            $abreviado = $_REQUEST['txt_abreviado'];
            if ($_REQUEST['submit']=='incluir'){
                echo $sql = "INSERT INTO tb_perfil(perfil,abreviado,atualizado) 
                    VALUES('$perfil','$abreviado',now())";
            }else{
                $id = $_REQUEST["id"];
                echo $sql = "UPDATE tb_perfil SET perfil = '$perfil', abreviado = '$abreviado', 
                    atualizado=now()
                    WHERE pk_id = ".$id;
            }
        }
                
        if(mysqli_query($con,$sql)){
            if($_POST['submit']=='incluir'){
                $msg = "As informações foram incluidas com sucesso!<br>";
            }
            if($_REQUEST['submit']=='alterar'){
                $msg = "As informações foram alteradas com sucesso!!<br>";
            }
            
        }else{
            if($_REQUEST['submit']=='incluir'){
                $msg = "Informções não incluídas! Erro: ".$con->error;
            }
            if($_REQUEST['submit']=='alterar'){
                $msg = "Inforamções não foram alteradas! Erro: ".$con->error;
            }
            
        }
        header('location: perfil.php?msg='.base64_encode($msg));
    }else{
        header('location: index.php');
    }