<!DOCTYPE html>
<html class="no-js">
    <?PHP
    include_once '../includes/functions.php';
    if (!loggedin()) {
        die("<script>location.href = 'login.php'</script>");
    }

    if (isset($_POST['submit1'])) {
        $flight_no = $_POST['flight_no'];
        $airline = $_POST['airline'];
        $dep = $_POST['departure'];
        $des = $_POST['destination'];
        $dep_d = $_POST['d_date'];
        $b_price = $_POST['b_price'];
        $b_count = $_POST['b_count'];
        $e_price = $_POST['e_price'];
        $e_counr = $_POST['e_count'];
        if (empty($flight_no) || empty($airline) || empty($dep) || empty($des) || empty($dep_d) || empty($b_price) || empty($b_count) || empty($e_price) || empty($e_counr)) {
            echo "<div class='alert alert-danger'>All the fields are mandatory.</div>";
        } else {

            $sql = "INSERT INTO `flights`(`flight_no`, `airline`, `depature`, `destination`, `depature_date`, `b_price`, `b_seat_count_w`, `e_price`, `e_seat_count_w`) VALUES ('$flight_no','$airline','$dep','$des','$dep_d','$b_price','$b_count','$e_price','$e_counr')";
            if ($result = $conexion->query($sql)) {
                echo "<div class='alert alert-success'>Flight added successfully.</div>";
            }
        }
    }
    ?>
    <head>
        <title>Flights schedule</title>
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
        <link href="assets/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

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
                        <li class="active">
                            <a href="flights.php"><i class="icon-chevron-right"></i>Flight Schedules</a>
                        </li>
                        <li >
                            <a href="feedbacks.php"><i class="icon-chevron-right"></i>Feedback</a>
                        </li>

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
                                        <a href="#">Flight Schedules</a> <span class="divider">/</span>	
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
                                <div class="muted pull-left">Flight Schedules</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Flight No</th>
                                                <th>Airline</th>
                                                <th>Departure</th>
                                                <th>Destination</th>
                                                <th>Departure Date</th>
                                                <th>Business Class Price</th>
                                                <th>Business Class Seat count</th>
                                                <th>Economy Class Price</th>
                                                <th>Economy Class Seat count</th>
                                                <th>Date created</th>

                                        </thead>
                                        <tbody>
                                            <?php
                                            include_once("../includes/sql.php");
                                            $conexion = db_connect();

                                            $sql = "SELECT * FROM flights";
                                            $result = $conexion->query($sql);

                                            while ($row = $result->fetch_array()) {
                                                $id = $row['id'];
                                                $flight_no = $row['flight_no'];
                                                $airline = $row['airline'];
                                                $depature = $row['depature'];
                                                $destination = $row['destination'];
                                                $depature_date = $row['depature_date'];
                                                $b_price = $row['b_price'];
                                                $b_seat_count_w = $row['b_seat_count_w'];
                                                $e_price = $row['e_price'];
                                                $e_seat_count_w = $row['b_seat_count_w'];
                                                $date_created = $row['date_created'];
                                                ?>
                                                <tr>
                                                    <td><?PHP echo $id; ?></td>
                                                    <td><?PHP echo $flight_no; ?></td>
                                                    <td><?PHP echo $airline; ?></td>
                                                    <td><?PHP echo $depature; ?></td>
                                                    <td><?PHP echo $destination; ?></td>
                                                    <td><?PHP echo $depature_date; ?></td>
                                                    <td><?PHP echo $b_price; ?></td>
                                                    <td><?PHP echo $b_seat_count_w; ?></td>
                                                    <td><?PHP echo $e_price; ?></td>
                                                    <td><?PHP echo $e_seat_count_w; ?></td>
                                                    <td><?PHP echo $date_created; ?></td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->

                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Add a flight</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">

                                    <form name="frmflight" method="post" action="" >
                                        <div style="width:500px;">
                                            <div class="form-group">
                                                <label for="first_name">Flight No</label>
                                                <input type="text" name="flight_no"  class="form-control"  >
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="first_name">Airline</label>
                                                <input type="text" name="airline"  class="form-control" >
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Departure</label>
                                                <input type="text" name="departure"  class="form-control" >
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Destination</label>
                                                <input type="text" name="destination"  class="form-control" >
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Departure Date</label>
                                                <div class="input-group date form_datetime col-md-5"  data-date="" data-date-format="yyyy-mm-dd  HH:ii:ss" data-link-field="dtp_input1">
                                                    <input class="form-control" size="16" type="text" value="" name="d_date" readonly>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Business Class Price</label>
                                                <input type="text" name="b_price"  class="form-control" >
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Business Class Seat count</label>
                                                <input type="text" name="b_count"  class="form-control" >
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Economy Class Price</label>
                                                <input type="text" name="e_price"  class="form-control" >
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Economy Class Seat count</label>
                                                <input type="text" name="e_count"  class="form-control" >
                                                <p class="help-block"></p>
                                            </div>

                                            <input type="submit" class="btn btn-success" value="Add" name="submit1">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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
        <script src="assets/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/bootstrap-datetimepicker.fr.js"></script>


        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/DT_bootstrap.js"></script>
        <script>
            $(function () {
                // Easy pie charts
                $('.chart').easyPieChart({animate: 1000});
            });
            var today = new Date();
            $('.form_datetime').datetimepicker({
                //language:  'fr',
                startDate: today,
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
//        showMeridian: 1
            });

        </script>
    </body>

</html>