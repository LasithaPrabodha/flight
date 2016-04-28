<!DOCTYPE html>
<html class="no-js">
    <?PHP
    include_once '../includes/functions.php';
    if (!loggedin()) {
        die("<script>location.href = 'login.php'</script>");
    }
    ?>
    <head>
        <title>Users</title>
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
                        <li class="active">
                            <a href="index.php"><i class="icon-chevron-right"></i>Users</a>
                        </li>
                        <li >
                            <a href="res.php"><i class="icon-chevron-right"></i>Reservations</a>
                        </li>
                        <li >
                            <a href="flights.php"><i class="icon-chevron-right"></i>Flight Schedules</a>
                        </li>
                        <li>
                            <a href="feedbacks.php"><i class="icon-chevron-right"></i>Feedback</a>
                        </li>
                                 </ul>
                </div>

                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div id="thanks" >
                        </div>
                        <div class="navbar">
                            <div class="navbar-inner">
                                <ul class="breadcrumb">
                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
                                    <li>
                                        <a href="#">Users</a> <span class="divider">/</span>	
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
                                <div class="muted pull-left">Feedbacks</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th></th>
                                                <th>Profile Image</th>
                                                <th>User Type</th>
                                                <th></th>
                                                <th>Phone no</th>
                                                <th>Address</th>
                                                <th>Passport no</th>
                                                <th>Date Registered</th>


                                        </thead>
                                        <tbody>
                                            <?php
                                            include_once("../includes/sql.php");
                                            $conexion = db_connect();

                                            $sql = "SELECT * FROM users";
                                            $result = $conexion->query($sql);

                                            while ($row = $result->fetch_array()) {
                                                $id = $row['id'];
                                                $fname = $row['first_name'];
                                                $lname = $row['last_name'];
                                                $email = $row['email'];
                                                $p_img = $row['profile_image'];
                                                $user_type = $row['user_type'];
                                                $phone = $row['phone'];
                                                $address = $row['address'];
                                                $passport_no = $row['passport_no'];
                                                $date_registered = $row['date_registered'];
                                                ?>
                                                <tr>
                                                    <td><?PHP echo $id; ?></td>
                                                    <td><?PHP echo $fname . ' ' . $lname; ?></td>
                                                    <td><?PHP echo $email; ?></td>
                                                    <td><a class="btn btn-info" href="#myModal" data-toggle="modal" id="<?PHP echo $email; ?>" data-target="#edit-modal" >
                                                            Email
                                                        </a></td>
                                                    <td><?PHP echo $p_img; ?></td>
                                                    <td><?PHP
                                                        if ($user_type == 'U') {
                                                            echo 'User';
                                                        } elseif ($user_type == 'A') {
                                                            echo 'Admin';
                                                        }
                                                        ?></td>
                                                    <td><a class="btn btn-info" href="<?php echo 'change-utype.php?utid='.$id?>">
                                                            Change UserType
                                                        </a></td>
                                                    <td><?PHP echo $phone; ?></td>
                                                    <td><?PHP echo $address; ?></td>
                                                    <td><?PHP echo $passport_no; ?></td>
                                                    <td><?PHP echo $date_registered; ?></td>

                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                
                </div>
            </div>
            <div id="edit-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Send An Email</h4>
                        </div>
                        <div class="modal-body edit-content">

                        </div>
                        <div class="modal-footer">
                            <input class="btn btn-success" type="submit" value="Send!" id="submit">
                            <a href="#" class="btn" data-dismiss="modal">Nah.</a>
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

<!--        <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
        <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link data-require="bootstrap-css@*" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />-->


        <script>
            $(document).ready(function () {
           $("input#submit").click(function () {
                    $.ajax({
                        type: "POST",
                        url: "email.php", //process to mail
                        data: $('form.contact').serialize(),
                        success: function (msg) {
                            $("#thanks").html(msg) //hide button and show thank you
                            $("#edit-modal").modal('hide'); //hide popup  
                            $(".alert-success").fadeTo(2000, 500).slideUp(500, function () {
                                $(".alert-success").alert('close');
                            });
                        },
                        error: function () {
                            alert("failure");
                        }
                    });
                });
            });
            $('#edit-modal').on('show.bs.modal', function (e) {

                var $modal = $(this);
                essay_id = event.target.id;
                console.log(essay_id);
//
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: 'backend.php',
                    data: 'EID=' + essay_id,
                    success: function (data)
                    {
                        $modal.find('.edit-content').html(data);
                    }
                });

            })
        </script>
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