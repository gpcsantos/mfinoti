<?php
    $pageid = 4;
    include_once('../includes/conexao.php');
    include_once('../includes/autenticacao.php');

    $msg = "";
    if(isset($_REQUEST['submit'])){ 
        if($_REQUEST['submit']=='incluir' || $_REQUEST['submit']=='alterar' ){
            $login = $_REQUEST['txt_login'];
            $senha = $_REQUEST['txt_senha'];
            $senha2 = $_REQUEST['txt_senha2'];
            $acesso = $_REQUEST['cbo_acesso'];
            if($_REQUEST["chk1"] == "on"){
                $chk1 = 1;
            }else{
                $chk1 = 0;
            }
            if($_REQUEST["chk2"] == "on"){
                $chk2 = 1;
            }else{
                $chk2 = 0;
            }
            if($_REQUEST["chk3"] == "on"){
                $chk3 = 1;
            }else{
                $chk3 = 0;
            }
            if($_REQUEST["chk4"] == "on"){
                $chk4 = 1;
            }else{
                $chk4 = 0;
            }
            //$colaborador = $_REQUEST['txt_colaborador'];
            //futuramente será necessário alteral o SQL para incluir o colaborador
            if ($_REQUEST['submit']=='incluir' && $senha==$senha2){
                if($_REQUEST['submit']=='incluir'){
                    $senha = md5(sha1($senha));
                    $sql = "INSERT INTO tb_usuario(login,senha,fk_perfil,atualizado,c,r,u,d) 
                    VALUES('$login','$senha','$acesso',now(),$chk1,$chk2,$chk3,$chk4)";
                }
            }else{
                if($_REQUEST['submit']=='alterar'){
                    $id = $_REQUEST["id"];
                    if(!empty($_REQUEST['txt_senha']) && !empty($_REQUEST['txt_senha2'])){
                        if($senha==$senha2){
                            $senha = md5(sha1($senha));
                            echo $sql = "UPDATE tb_usuario SET login = '$login', senha = '$senha', 
                                fk_perfil = '$acesso',  atualizado=now(),
                                c=$chk1, r=$chk2 ,u=$chk3, d=$chk4
                                WHERE pk_id = ".$id;
                            exit;
                        }else{
                            $msg = "As senhas informadas não são iguais! Não foi possível alterar o cadastro do usuário.";
                            header('location: usuario_alterar.php?id='.base64_encode($id).'&submit='.base64_encode('alterar').'&msg='.base64_encode($msg));
                            exit;
                        }
                    }else{
                        $sql = "UPDATE tb_usuario SET login = '$login', 
                            fk_perfil = '$acesso',  atualizado=now(),
                            c=$chk1, r=$chk2 ,u=$chk3, d=$chk4
                            WHERE pk_id = ".$id;
                    }
                }else{
                    $msg = "As senhas informadas não são iguais! Não foi possível inserir novo usuário.";
                    header('location: usuario_incluir.php?msg='.base64_encode($msg));
                    exit;
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
        header('location: index.php?msg='.base64_encode($msg));
    }else{
        header('location: index.php');
    }