<?php
    $pageid = 12;
    include_once('../includes/conexao.php');
    include_once('../includes/autenticacao.php');

    $msg = "";
    if(isset($_REQUEST['submit'])){ 
        if($_REQUEST['submit']=='incluir' || $_REQUEST['submit']=='alterar' ){
            $arquivo = $_REQUEST['txt_arquivo'];
            $descricao = $_REQUEST['txt_descricao'];
            if(!empty($_REQUEST["chk1"]) && $_REQUEST["chk1"] == "on"){
                $chk1 = 1;
            }else{
                $chk1 = 0;
            }
            if(!empty($_REQUEST["chk2"]) && $_REQUEST["chk2"] == "on"){
                $chk2 = 1;
            }else{
                $chk2 = 0;
            }
            if(!empty($_REQUEST["chk3"]) && $_REQUEST["chk3"] == "on"){
                $chk3 = 1;
            }else{
                $chk3 = 0;
            }
            if(!empty($_REQUEST["chk4"]) && $_REQUEST["chk4"] == "on"){
                $chk4 = 1;
            }else{
                $chk4 = 0;
            }
            //$colaborador = $_REQUEST['txt_colaborador'];
            //futuramente será necessário alteral o SQL para incluir o colaborador
            if ($_REQUEST['submit']=='incluir'){
                echo  $sql = "INSERT INTO tb_pagina(arquivo,descricao,atualizado,c,r,u,d) 
                    VALUES('$arquivo','$descricao',now(),$chk1,$chk2,$chk3,$chk4)";
            }else{
                if($_REQUEST['submit']=='alterar'){
                    $id = $_REQUEST["id"];
                    echo $sql = "UPDATE tb_pagina SET arquivo = '$arquivo', descricao = '$descricao', 
                            atualizado=now(),
                            c=$chk1, r=$chk2 ,u=$chk3, d=$chk4
                            WHERE pk_id = ".$id;
                    
                }
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
        header('location: pagina.php?msg='.base64_encode($msg));
    }else{
        header('location: index.php');
    }