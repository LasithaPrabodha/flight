<?php require_once("includes/functions.php"); ?>

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
    <!-- js -->
    <script src="js/jquery.min.js"></script>
    <script src="js/modernizr.custom.js"></script>
    <!-- //js -->
    <!-- fonts -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,700,500italic,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- //fonts -->
    <script type="text/javascript">
        $(document).ready(function () {
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
                <h1><a  href="index.html"><span>Go</span>vihar</a></h1>
            </div>
            <!--navbar-header-->
            <div class="header-dropdown">
                <div class="emergency-grid">
                    <ul>
                        <li>Toll Free : </li>
                        <li class="call">+1 234 567 8901</li>
                    </ul>
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

                    <div id="loginContainer">
                        <a href="#" id="loginButton"><span> <?PHP echo $_SESSION['first_name']; ?></span></a>
                        <div id="loginBox" style="position: absolute;top: 45px;left: 0px;display: none;z-index: 99999;background-color:black; text-decoration: none;">
                            <ul style="text-decoration: none; padding: 10px; color: green;">
                                <li><a style="color: #fff;" href="profile.php">Profile</a></li>
                                <li><a style="color: #fff;" href="messages.php">Messages</a></li>
                                <li><a style="color: #fff;" href="signout.php">Sign out</a></li>
                            </ul>
                        </div>
                    </div>

                <?php }else{ ?>
                    <div id="loginContainer"><a href="#" id="loginButton"><span>Login</span></a>
                        <div id="loginBox">
                            <form id="loginForm">
                                <div class="login-grids">
                                    <div class="login-grid-left">
                                        <fieldset id="body">
                                            <fieldset>
                                                <label for="email">Email Address</label>
                                                <input type="text" name="email" id="email">
                                            </fieldset>
                                            <fieldset>
                                                <label for="password">Password</label>
                                                <input type="password" name="password" id="password">
                                            </fieldset>
                                            <input type="submit" id="login" value="Sign in">
                                           
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