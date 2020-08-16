<?php
    $pageid = 18;
    include_once('../includes/conexao.php');
   // include_once('../includes/autenticacao.php');

    $msg = "";
    if(isset($_REQUEST['submit'])){ 
        if($_REQUEST['submit']=='excluir'){
            $sql = "DELETE FROM tb_perfil WHERE pk_id=".base64_decode($_REQUEST['id']);
        }
        
        if(mysqli_query($con,$sql)){
            $msg = "O registro foi excluído com sucesso!<br>";
        }else{
            $msg = "O registro não foi excluído! Erro: ".$con->error;
        }
        header('location: perfil.php?msg='.base64_encode($msg));
    }else{
        header('location: index.php');
    }