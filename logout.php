<?php
    session_start();
    $num = substr_count ($_SERVER["REQUEST_URI"] , '/' );
    if($num > 2 ){
        $index = "../";
    }
    // Apaga todas as variáveis da sessão
    $_SESSION = array();
    session_destroy();
    setcookie('token', '', time()-3600); // tempo negativo e/ou valor vazio ('') para apagra cookie
    echo "<p> Erro de sessão... fazer login novamente.";
    $msg = "Logout realizado com sucesso!";
    header('location: '.$index.'login.php?msg='.base64_encode($msg));
    exit;

?>