<?php
  session_start();
  include_once('includes/conexao.php');
  if(!empty($_POST)){
    $login = $_POST['txt_login'];
    $senha = $_POST['txt_senha'];

    //prevenção para SQL Injection
    $usuario_escape = addslashes($login);
    $senha_escape = addslashes($senha);
    
    //conuslta para validar usuário
    $sql = "SELECT * FROM tb_usuario WHERE login='{$usuario_escape}'";
    $dado = mysqli_query($con, $sql);

    if(mysqli_num_rows($dado) != 0){
      //mudar SQL para buscar empresa também
      //consulta para validar usuário e senha
      $sql = "SELECT * FROM tb_usuario WHERE login='{$usuario_escape}' AND senha = '".md5(sha1($senha_escape))."'";
      $dado = mysqli_query($con, $sql);
      if(mysqli_num_rows($dado) != 0){
        $row = mysqli_fetch_object($dado);
        
        //difine fuso horário de São Paulo
        date_default_timezone_set("America/Sao_Paulo");

        //token para autenticação de segurança. Esse token também será inserido no banco para validação posterios
        $token = md5(date("YmdHis").$row->login.$row->senha);

        //variáveis de sessão
        $_SESSION['token'] = $token;
        $_SESSION['user']=$row->pk_id;
        $_SESSION['tempo'] = time();
        // será necessário incluir o id da empresa nas variáveis de sessão
        //$_SESSION['empresa'] = id_empresa (mudar SQL para isso)
        setcookie('token',$token,time() + (86400 * 30), "/"); // 86400 = 1 day
        $ip = $_SERVER['REMOTE_ADDR'];
				$nav = $_SERVER['HTTP_USER_AGENT'];
        echo "<br> ". $sqlAcesso = "INSERT INTO tb_acesso(fk_usuario,dataHora,IP,navegador,token)
          VALUES('$row->pk_id',now(),'$ip','$nav','$token')";
        mysqli_query($con, $sqlAcesso);
        $msg = "Login efetuado com sucesso!";
        header ('location: index.php?msg='.base64_encode($msg));
        exit;
      }else{
        $msg = "Login (usuário) encontrado, mas senha não confere.";
      }
    }else{
      $msg = "Login (usuário) não encontrado na base de dados.";
    }
    header ('location: login.php?msg='.base64_encode($msg));
    exit;
  }
  
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <style>
    .center {
    display: flex !important;
    justify-content: center !important;
    align-items: center !important; /** ISSO AQUI ALINHA VERTICALMENTE */
}



  </style>

</head>

<body class="bg-gradient-success2">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block center" style="background-color: #5e7503;">
                 <img src="images/finoti.png" width=80% >
              </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Bem-vindo!</h1>
                  </div>
                  <form class="user" method="POST" action="login.php">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="txt_login" name="txt_login" aria-describedby="emailHelp" placeholder="Informe seu login..." required>
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="txt_senha" name="txt_senha" placeholder="Senha" required>
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Lembrar</label>
                      </div>
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary btn-user btn-block">
                      Login
                    </button>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="forgot-password.html">Esqueceu a senha?</a>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  <!-- Modal Mensagem -->
  <div class="modal fade" id="modalMensagem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Aviso</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <?php echo base64_decode($_GET["msg"]); ?>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>



  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  
  <script>
    $(function () {
        <?php if(!empty($_GET["msg"])){ ?>
            $('#modalMensagem').modal('show');
        <?php } ?>
    });
  </script>

</body>

</html>
