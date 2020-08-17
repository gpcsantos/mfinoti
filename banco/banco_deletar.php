<?php
    $pageid = 25;
    include_once('../includes/conexao.php');
    include_once('../includes/autenticacao.php');

    if(isset($_REQUEST['submit'])){ 
        
        if($_REQUEST['submit']=='excluir'){
            $sql = "DELETE FROM tb_banco WHERE pk_id=".base64_decode($_REQUEST['id']);
        }

        if(mysqli_query($con,$sql)){
            
                $msg = "O registro do banco foi excluido com sucesso!<br>";
        }else{
           
                $msg = "O registro do banco não foi excluido! Erro: ".$con->error;
          
        }
        header('location: index.php?msg='.base64_encode($msg));
    }else{
        header('location: index.php');
    }





