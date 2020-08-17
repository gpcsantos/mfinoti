<?php
    $pageid = 20;
    include_once('../includes/conexao.php');
    include_once('../includes/autenticacao.php');

    if(!empty($_POST)){
        $idPerfil = $_POST['cbo_perfil'];
        $cont = $_POST['cont'];
        
        $sql1 = "DELETE FROM rl_pagina_perfil WHERE fk_perfil = ".$idPerfil;
        
        $sql = "INSERT INTO rl_pagina_perfil(fk_perfil, fk_pagina) VALUES";
        for($i = 1; $i <= $cont; $i++){
           if(!empty($_POST["chk".$i])){
            $sql .= "('".$idPerfil."','". $_POST["chk".$i] ."'),";
           }
        }
        echo $sql = substr($sql,0,-1);
        if(mysqli_query($con,$sql1) && mysqli_query($con,$sql)){
            $msg = "Alterações realizadas com sucesso!";
        }else {
            $msg = "Não foi possível realizar as alterações. Informe ao Administador do sistema! Erro: ".$con->error;
        }
        header('location: perfil_arquivo.php?msg='.base64_encode($msg));
        exit;    
    }
    header('location: index.php?msg='.base64_encode('Acesso indevido à página!'));
    exit;
?>