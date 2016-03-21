<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <?php
    require_once("../includes/functions.php");

    $message = "";
    if (isset($_POST['login'])) {
        $LUsername = sql_escape($_POST['email']);
        $LPassword = sql_escape($_POST['password']);

        if (!empty($LUsername) && !empty($LPassword)) {
            $hashPassword = md5($LPassword);
            $conexion = db_connect();
            $sql = "SELECT * FROM users WHERE email = '{$LUsername}' ";
            $result = $conexion->query($sql);
            if ($result->num_rows > 0) {

                $resultSet = $result->fetch_assoc();
                $filteredID = sql_escape($resultSet['email']);
                $filteredPW = sql_escape($resultSet['password']);
                if ((($filteredID == $LUsername)) && ($filteredPW == $hashPassword)) {

                    $_SESSION['email'] = $filteredID;
                    $_SESSION['id'] = $resultSet['id'];
                    $_SESSION['first_name'] = $resultSet['first_name'];
                    $_SESSION['last_name'] = $resultSet['last_name'];
                    $_SESSION['passport_no'] = $resultSet['passport_no'];
                    $_SESSION['address'] = $resultSet['address'];
                    $_SESSION['phone'] = $resultSet['phone'];
                    $_SESSION['user_type'] = $resultSet['user_type'];
                    
                    header("Location:index.php");
                } else {
                    $message = '<div class="alert alert-danger">  <strong></strong> Incorrect Password</div>';
                }
            } else {
                $message = '<div class="alert alert-danger">  <strong></strong> User Not Found!</div>';
            }
        }
    }
    ?>

    <body id="login">
        <div class="container">

            <form class="form-signin" action="" method="post">
                <h2 class="form-signin-heading">Please sign in</h2>
                 <?php
                echo $message;
                ?>
                <input type="text" class="input-block-level" placeholder="Email address" id="email" name="email">
                <input type="password" class="input-block-level" placeholder="Password" id="password" name="password">
                <label class="checkbox">
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
                <button class="btn btn-large btn-primary" type="submit" name="login">Sign in</button>
               
            </form>

        </div> <!-- /container -->

        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>