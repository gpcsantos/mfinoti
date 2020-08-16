<?php
    include_once('../includes/conexao.php');
    include_once('../includes/autenticacao.php');

    if(isset($_REQUEST['submit'])){ 
        if($_REQUEST['submit']=='incluir' || $_REQUEST['submit']=='alterar' ){
            $banco = $_POST['txt_banco'];
            $num = $_POST['txt_num'];
            if($_REQUEST['submit']=='incluir'){
                $sql = "INSERT INTO tb_banco(banco, num, atualizado) VALUES('$banco','$num',now())";
            }
            if($_REQUEST['submit']=='alterar'){
                $id = $_REQUEST["id"];
                $sql = "UPDATE tb_banco set banco = '$banco', num = '$num', atualizado=now() WHERE pk_id = ".$id;
            }
        }
        if($_REQUEST['submit']=='excluir'){
            $sql = "DELETE FROM tb_banco WHERE pk_id=".base64_decode($_REQUEST['id']);
        }

        if(mysqli_query($con,$sql)){
            if($_POST['submit']=='incluir'){
                $msg = "O registro do banco foi incluido com sucesso!<br>";
            }
            if($_REQUEST['submit']=='alterar'){
                $msg = "O registro do banco foi alterado com sucesso!<br>";
            }
            if($_REQUEST['submit']=='excluir'){
                $msg = "O registro do banco foi excluido com sucesso!<br>";
            }
        }else{
            if($_REQUEST['submit']=='incluir'){
                $msg = "O registro do banco não foi incluido! Erro: ".$con->error;
            }
            if($_REQUEST['submit']=='alterar'){
                $msg = "O registro do banco não foi alterado! Erro: ".$con->error;
            }
            if($_REQUEST['submit']=='excluir'){
                $msg = "O registro do banco não foi excluido! Erro: ".$con->error;
            }
        }
        header('location: index.php?msg='.base64_encode($msg));
    }else{
        header('location: index.php');
    }





