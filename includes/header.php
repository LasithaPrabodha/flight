<?php require_once("includes/functions.php");

$message = "";
if(isset($_POST['login']))
{
    $LUsername = sql_escape($_POST['email']);
    $LPassword = sql_escape($_POST['password']);

    if(!empty($LUsername) && !empty($LPassword))
    {
        $hashPassword =md5($LPassword);
        $conexion = db_connect();
        $sql = "SELECT * FROM users WHERE email = '{$LUsername}' ";
        $result = $conexion->query($sql);
        if ($result->num_rows > 0) {

            $resultSet = $result->fetch_assoc();
            $filteredID = sql_escape($resultSet['email']);
            $filteredPW = sql_escape($resultSet['password']);
            if((($filteredID == $LUsername)) && ($filteredPW == $hashPassword))
            {

                $_SESSION['email']=$filteredID;
                $_SESSION['id']=$resultSet['id'];
                $_SESSION['first_name'] = $resultSet['first_name'];
                $_SESSION['last_name'] = $resultSet['last_name'];
                $_SESSION['passport_no'] = $resultSet['passport_no'];
                $_SESSION['address'] = $resultSet['address'];
                $_SESSION['phone'] = $resultSet['phone'];

            }else{
                $message = '<div class="alert alert-danger">  <strong></strong> Incorrect Password</div>';
            }
        }else{
            $message = '<div class="alert alert-danger">  <strong></strong> User Not Found!</div>';
        }
    }
}


?>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Govihar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Custom Theme files -->
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
    <!--datatable css-->
     <link href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css" rel="stylesheet">
     <link href="https://cdn.datatables.net/responsive/2.0.2/css/responsive.bootstrap.min.css" rel="stylesheet">
    
    <!-- js -->
     <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    <!--<script src="js/jquery.min.js"></script>-->
    <script src="js/modernizr.custom.js"></script>
    <!-- //js -->
    <!-- fonts -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,700,500italic,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    
    <!--datatables-->
<script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.0.2/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.0.2/js/responsive.bootstrap.min.js"></script>

    <!-- //fonts -->
    <script>
    $(document).ready(function () {
        
        //tab change script
        $("div.bhoechie-tab-menu>ul>li").click(function (e) {
            e.preventDefault();
            $(this).siblings('li.active').removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $("div.bhoechie-tab-content").addClass("hide");
            $("div.bhoechie-tab-content").eq(index).removeClass("hide");
        });


        //load profile to the picture box  when uploading 
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#profile-img').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#profile_img").change(function () {
            readURL(this);
        });
    });

   
    $(document).ready(function () {
            $('#bookings_tab').DataTable();

            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true   // 100% fit in a container
            });
            
            
        });
        
        
    </script>
    <!--pop-up-->
    <script src="js/menu_jquery.js"></script>
    <!--//pop-up-->
</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <div class="header-grids">
            <div class="logo">
                <h1><a  href="index.php"><span>Go</span>vihar</a></h1>
            </div>
            <!--navbar-header-->
            <div class="header-dropdown">
                <div class="emergency-grid">
<!--                    <ul>
                        <li>Toll Free : </li>
                        <li class="call">+1 234 567 8901</li>
                    </ul>-->
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="nav-top">
            <div class="top-nav">
                <span class="menu"><img src="images/menu.png" alt="" /></span>
                <ul class="nav1">
                    <li class="active"><a href="index.php">Home</a></li>
                    <li><a href="deals.php">Deals</a></li>
                </ul>
                <div class="clearfix"> </div>
                <!-- script-for-menu -->
                <script>
                    $( "span.menu" ).click(function() {
                        $( "ul.nav1" ).slideToggle( 300, function() {
                            // Animation complete.
                        });
                    });

                </script>
                <!-- /script-for-menu -->
            </div>
            <div class="dropdown-grids">

                <?PHP
                if(loggedin()){ ?>

                    <div id="loginContainer" >
                        <a href="#" id="loginButton"><span> <?PHP echo $_SESSION['first_name']; ?></span></a>
                        <div id="loginBox" class="dddiv" style="left: 0px; background: #ffffff; padding: 2px; border-radius: 3px; border: solid 1px #6fd508;">
                            <ul style="list-style: none;" id="ddui">
                                <li ><a  href="profile.php">Profile</a></li>
                                <li ><a  href="logout.php">Sign out</a></li>
                                <li ><a  href="feedback.php">Feedback</a></li>
                            </ul>
                        </div>
                    </div>

                <?php }else{ ?>
                    <div id="loginContainer"><a href="#" id="loginButton"><span>Login</span></a>
                        <div id="loginBox">
                            <form id="loginForm" method="post">
                                <div class="login-grids">
                                    <div class="login-grid-left">
                                        <fieldset id="body">
                                            <fieldset>
                                                <label for="email">Email Address</label>
                                                <input type="text" name="email" required id="email">
                                            </fieldset>
                                            <fieldset>
                                                <label for="password">Password</label>
                                                <input type="password" name="password" required id="password">
                                            </fieldset>
                                            <input type="submit" name="login" id="login" value="Sign in">

                                        </fieldset>

                                        <div class="or-grid">
                                            <p>OR</p>
                                        </div>
                                        <div class="social-sits">
                                            <div class="button-bottom">
                                                <p>New account? <a href="signup.php">Signup</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                <?PHP } ?>


            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//header-->
<?php
echo $message;
?>