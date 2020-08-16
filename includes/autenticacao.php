<?php
    session_start();

    //essa rotina verifica se na URL tem  mais de 2 barras "/"
    //caso tenha mais de 2 barras será incluído o "../" para voltar no login.php em um diretório anterior
    $num = substr_count ($_SERVER["REQUEST_URI"] , '/' );
    if($num > 2 ){
        $index = "../";
    }
    //echo "<br>";
    //echo $teste = $index.'index.php';
    
    //exit;
    if(!empty($_SESSION)){
        $tempo  = time();
        $dif_tempo = $tempo -  $_SESSION['tempo'];
        $tempo_limite = 600; // 600 segundo = 10 minutos
        if($dif_tempo <= $tempo_limite){
            $_SESSION['tempo']=time();
//            echo "Cookie: ".$_COOKIE['token']."<br>";
//            echo "Session: ".$_SESSION['token']."<br>";
//            echo "Len(Cookie): ".strlen($_COOKIE['token'])."<br>";
//            echo "len(Session): ".strlen($_SESSION['token'])."<br>";

            if(!empty($_COOKIE['token']) && !empty($_SESSION['token']) && $_COOKIE['token']==$_SESSION['token']){
                $userid = $_SESSION['user'];
                // Sessão aberta e autenticada 
                // códigos para averiguação de acesso ao sistema, controle por acesso às páginas
                $sql = "SELECT  pg.arquivo
                    FROM tb_usuario AS u
                    INNER JOIN tb_perfil AS p ON p.pk_id=u.fk_perfil
                    INNER JOIN rl_pagina_perfil AS rl ON p.pk_id=rl.fk_perfil
                    INNER JOIN tb_pagina AS pg ON rl.fk_pagina=pg.pk_id
                    WHERE (u.c = pg.c OR u.r = pg.r OR u.u = pg.u OR u.d = pg.d) 
                    AND pg.pk_id=$pageid AND u.pk_id=$userid ";

                $result = mysqli_query($con,$sql);
                if(mysqli_num_rows($result)==0){
                    $msg = "Você não tem acesso à página solicitada. Se precisa ter acesso, procure o Administrador do sistema!";
                    header('location: '.$index.'index.php?msg='.base64_encode($msg));
                    exit;
                }

                //Averiguação de segurnaça com último acesso ao banco de dados.
                //Compara os tokens (cookies e sessão) com o ultimo token do banco de dados
                $sql = "SELECT * FROM tb_acesso
                    WHERE fk_usuario='".$userid."' AND 
                    token='".$_SESSION['token']."' AND token='".$_COOKIE['token']."' ORDER BY dataHora DESC LIMIT 1";
                $result = mysqli_query($con,$sql);
                if(mysqli_num_rows($result)==0){
                    // Apaga todas as variáveis da sessão
                    $_SESSION = array();
                    session_destroy();
                    setcookie('token', '', time()-3600); // tempo negativo e/ou valor vazio ('') para apagra cookie
                    $msg = "Seu token apresentou erro - É necessário fazer login novamente!";
                    header('location: '.$index.'login.php?msg='.base64_encode($msg));
                    exit;
                }
            }else{
                // Apaga todas as variáveis da sessão
                $_SESSION = array();
                session_destroy();
                setcookie('token', '', time()-3600); // tempo negativo e/ou valor vazio ('') para apagra cookie
                $msg = "Sua sessão apresentou problemas - É necessário fazer login novamente!";
                header('location: '.$index.'login.php?msg='.base64_encode($msg));
                exit;
            }
           
        }else{
            // Apaga todas as variáveis da sessão
            $_SESSION = array();
            session_destroy();
            setcookie('token', '', time()-3600); // tempo negativo e/ou valor vazio ('') para apagra cookie
            $msg = "Tempo limite ultrapassado - É necessário fazer login novamente!";
            header('location: '.$index.'login.php?msg='.base64_encode($msg));
            exit;
        }
    }else{
        header('location: '.$index.'login.php');
        exit;
    }
?>