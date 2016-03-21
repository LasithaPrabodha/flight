<!DOCTYPE html>
<html class="no-js">
    <?PHP
    include_once '../includes/functions.php';
    if (!loggedin()) {
        die("<script>location.href = 'login.php'</script>");
    }
    if (isset($_GET['utid']) && (!empty($_GET['utid']))) {
        $utid = $_GET['utid'];
        $sql = "SELECT * FROM users where id = $utid";
        $result = $conexion->query($sql);
        if ($result->num_rows > 0) {

            while ($row = $result->fetch_array()) {

                $id = $row['id'];
                $first_name = $row['first_name'];
                $last_name = $row['last_name'];
                $email = $row['email'];
                $user_type = $row['user_type'];
            }
        }
    }

    if (isset($_POST['submit2'])) {
        $user_id = $_POST['userid'];
        $usertype = $_POST['usertype'];
        $sql = "UPDATE users set user_type='$usertype'  where id = $user_id";
        if ($result = $conexion->query($sql)) {
            echo "<div class='alert alert-success'>User updated successfully.</div>";
            $sql = "SELECT * FROM users where id = $user_id";
            $result = $conexion->query($sql);
            if ($result->num_rows > 0) {

                while ($row = $result->fetch_array()) {

                    $id = $row['id'];
                    $first_name = $row['first_name'];
                    $last_name = $row['last_name'];
                    $email = $row['email'];
                    $user_type = $row['user_type'];
                }
            } else {
                $sql = "SELECT * FROM users where id = $user_id";
                $result = $conexion->query($sql);
                if ($result->num_rows > 0) {

                    while ($row = $result->fetch_array()) {

                        $id = $row['id'];
                        $first_name = $row['first_name'];
                        $last_name = $row['last_name'];
                        $email = $row['email'];
                        $user_type = $row['user_type'];
                    }
                }
            }
        }
    }


    $name_with_initials = $first_name . " " . $last_name;
    ?>
    <head>
        <title>User Type</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>


        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">

    </head>

    <body>
<?PHP include_once 'nav.php'; ?>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li>
                            <a href="index.php"><i class="icon-chevron-right"></i>Users</a>
                        </li>
                        <li >
                            <a href="res.php"><i class="icon-chevron-right"></i>Reservations</a>
                        </li>
                        <li >
                            <a href="flights.php"><i class="icon-chevron-right"></i>Flight Schedules</a>
                        </li>
                        <li class="active">
                            <a href="feedbacks.php"><i class="icon-chevron-right"></i>Feedback</a>
                        </li>
                        <!--                        <li>
                                                    <a href="stats.php"><i class="icon-chevron-right"></i> Statistics (Charts)</a>
                                                </li>
                                                <li>
                                                    <a href="form.php"><i class="icon-chevron-right"></i> Forms</a>
                                                </li>
                                                <li>
                                                    <a href="tables.php"><i class="icon-chevron-right"></i> Tables</a>
                                                </li>
                                                <li>
                                                    <a href="buttons.php"><i class="icon-chevron-right"></i> Buttons & Icons</a>
                                                </li>
                                                <li>
                                                    <a href="editors.php"><i class="icon-chevron-right"></i> WYSIWYG Editors</a>
                                                </li>
                                                <li>
                                                    <a href="interface.php"><i class="icon-chevron-right"></i> UI & Interface</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-success pull-right">731</span> Orders</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-success pull-right">812</span> Invoices</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-info pull-right">27</span> Clients</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-info pull-right">1,234</span> Users</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-info pull-right">2,221</span> Messages</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-info pull-right">11</span> Reports</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-important pull-right">83</span> Errors</a>
                                                </li>
                                                <li>
                                                    <a href="#"><span class="badge badge-warning pull-right">4,231</span> Logs</a>
                                                </li>-->
                    </ul>
                </div>

                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success" hidden="">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Success</h4>
                            The operation completed successfully</div>
                        <div class="navbar">
                            <div class="navbar-inner">
                                <ul class="breadcrumb">
                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
                                    <li>
                                        <a href="#">Feedbacks</a> <span class="divider">/</span>	
                                    </li>
                                    <li>
                                        <a href="#">Settings</a> <span class="divider">/</span>	
                                    </li>
                                    <li class="active">Tools</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Usertype</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">

                                    <form name="frmChange" method="post" action="" >
                                        <div style="width:500px;">
                                            <div class="form-group">
                                                <label for="first_name">User ID</label>
                                                <input type="texr" name="userid"  class="form-control" readonly value="<?php echo $id; ?>">
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="first_name">UserName</label>
                                                <input type="text" name="username"  class="form-control" disabled value="<?php echo $email; ?>">
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Name</label>
                                                <input type="text" name="name"  class="form-control" disabled value="<?php echo $name_with_initials; ?>">
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">User Type </label>
                                                <div class="controls">
                                                    <select  name="usertype">
                                                        <option value="U"<?php if ($user_type == 'U') {
    echo ' selected';
} ?>>User</option>
                                                        <option value="A" <?php if ($user_type == 'A') {
    echo ' selected';
} ?>>Admin</option>

                                                    </select>

                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-success" value="Change User Type" name="submit2">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                   
                </div>
            </div>
            <hr>

        </div>
        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>


        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/DT_bootstrap.js"></script>
        <script>
            $(function () {
                // Easy pie charts
                $('.chart').easyPieChart({animate: 1000});
            });

        </script>
    </body>

</html>