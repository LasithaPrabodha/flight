<?PHP include_once('includes/header.php') ?>
<?php

if (!loggedin()) {
    die("<script>location.href = 'index.php'</script>");
}
$id = $_SESSION['id'];
$sql = "SELECT * FROM users where id = $id";
$result = $conexion->query($sql);
if ($result->num_rows > 0) {

    while ($row = $result->fetch_array()) {

        $id = $row['id'];
        $first_name = $row['first_name'];
        $last_name = $row['last_name'];
        $email = $row['email'];
        $profile_img = $row['profile_image'];
        $user_type = $row['user_type'];
        $password = $row['password'];
        $contact_number = $row['phone'];
        $passport_no = $row['passport_no'];
    }
}


$name_with_initials = $first_name . " " . $last_name;

if (isset($_POST['submit1'])) { //Save User Settings
    $fname = $_POST['first_name'];
    $lname = $_POST['last_name'];
    $contact = $_POST['contact_no'];

    if ((!empty($fname)) && (!empty($lname)) && (!empty($contact))) {

        if (preg_match("/^[0-9]{9,14}$/", $contact)) {

//profile picture upload
            $target_dir = "images/";
            $target_file = $target_dir .uniqid().basename($_FILES["profile_img"]["name"]);
            $uploadOk = 1;
            $imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);

            // Check if $uploadOk is set to 0 by an error
            if ($uploadOk == 1) {

                $target_image =  str_replace(" ", "_", "$target_file");
                if (move_uploaded_file($_FILES["profile_img"]["tmp_name"], $target_image)) {

                    //if file moved to the images folder update the user table
                    $sql = "UPDATE users SET profile_image='$target_image',first_name='$fname',last_name='$lname', phone='$contact' WHERE email='$email'";

                    if ($result = $conexion->query($sql)) {
                        echo "<div class='alert alert-success'>Profile settings updated successfully.</div>";
                    } else {
                        echo "<div class='alert alert-danger'>Error while updating profile settings.</div>";
                    }
                } else {
                    //if file not moved to the images folder 
                    echo "<div class='alert alert-danger'>Sorry, there was an error uploading your profle image.</div>";
                }
            }
        } else {
            echo "<div class='alert alert-danger'>Incorrect Phone number number</div>";
        }
    } else {
        //if user doesn't enter first name or last name
        echo "<div class='alert alert-danger'>*All the feilds are mandatory</div>";
    }
}
if (isset($_POST['submit2'])) { // Change password
    $curr_pw = $_POST['currentPassword'];
    $new_pw = $_POST['newPassword'];
    $conf_pw = $_POST['confirmPassword'];
    if ((!empty($curr_pw)) && (!empty($new_pw)) && (!empty($conf_pw))) {

        $sql2 = "SELECT password FROM users where id = '$id'";
        $result = $conexion->query($sql2);
        if ($result->num_rows > 0) {

            while ($row = $result->fetch_array()) {

                $password = $row['password'];
            }
        }
        if ($password == md5($curr_pw)) {
            if ($new_pw == $conf_pw) {
                $new_pw = md5($new_pw);
                $sql2 = "update users set password='$new_pw' where id = '$id'";
                $result = $conexion->query($sql2);
                if ($conexion->query($sql2)) {
                    echo "<div class='alert alert-success'>Password updated successfully.</div>";
                } else {
                    echo "<div class='alert alert-danger'>Error occured</div>";
                }
            } else {
                echo "<div class='alert alert-danger'>New password and Confirm password should be the same</div>";
            }
        } else {

            echo "<div class='alert alert-danger'>Incorrect Current Password</div>";
        }
    }
} else if (!isset($_POST)) {
    echo "<div class='alert alert-danger'>*All the feilds are mandatory</div>";
}
?>
<style>
    #details-table td{
        height: 50px;
        padding: 0px 30px;
    }

    .trheding{

        font-size: 13px;
        color: #FF4800;
        font-weight: bold;
        text-transform: uppercase;
        background:  rgb(243, 243, 243) none repeat scroll 0% 0%;


    }

    .subheadng{
        font-size: 13px;
        font-weight: bold;

    }

    .cntn{

        border: 1px solid rgba(128, 128, 128, 0.12);
        border-radius: 4px;
    }

    .profile-nav > li{
        border-radius: 0px !important;
    }
    .profile-nav > li> a{
        color: #595959;
        text-decoration: none;
        background: rgb(243, 243, 243) none repeat scroll 0% 0%;
    }
    #profile-img{
        max-width: 150px;
        max-height: 150px;
    }
    .dataTables tbody tr {
min-height: 35px; 
}
.reffield { 
    width: 350px; height: 80px; border: 1px solid #999999; padding: 5px; font-size: 30px; 
}

</style>

<div class="banner-bottom">
    <div class="container ">
        <div class="banner-bottom-info">
            <h3 style="margin-left: 30px;"><?php
if ($user_type == 'A') {
    echo 'Admin Profile';
} else {
    echo 'Your Profile';
}
?></h3>
        </div>
        <!-- profile -->
        <div class="row " style="padding: 10px;background-color: #fff;margin-top: 10px;margin-bottom: 20px;">

            <div id="alert-container"></div>
            <div class="col-md-3"   style="background-color: rgba(210, 210, 210, 0.09);  min-height: 553px" >
                <div class="col-md-offset-1 col-md-10" ><h3 class="text-center"><?php echo $name_with_initials; ?></h3></div>
                <div class="col-md-offset-1 col-md-10" style="padding-bottom: 25px; border-bottom: 1px solid #ddd; align-content:center; ">
                    <image style="width:80%;height: 80%; margin-left: 20px;" src="<?php
if (isset($profile_img) && (!empty($profile_img))) {
    echo $profile_img;
} else {
    echo 'images/default_prof.jpg';
}
?>"/>
                </div>
                <div class="col-md-offset-1 col-md-10 text-center" style='padding-top: 10px;'><h3><span style="color:#FF4800;"><?php echo $first_name; ?></span></h3></div>
                <div class="col-md-offset-1 col-md-10 text-center" style='padding-top: 0px;'><h4><span style="color:rgb(77, 80, 89);"><br><?php
                    if ($user_type == 'A') {
                        echo 'ADMIN';
                    }
                    ?></span></h4><br></div>


                <div class="col-md-offset-1 col-md-10 center" ><button class='btn btn-success col-md-12' data-toggle="modal" data-target="#editModal">Profile settings</button></div>

                <div class="col-md-offset-1 col-md-10 center" style="margin-top: 3px; "><center><a href="#" class='col-md-12' data-toggle="modal" data-target="#passModal" >change password</a></center></div>


                <div class="clearfix"></div>
            </div>

            <div class="col-md-9" style=" border-left: 1px solid #ddd; min-height: 553px">


                <div class="col-md-12" style="margin-top: 10px;">
                    <!--Tabs-->
                    <div class="bhoechie-tab-menu col-md-12">
                        <ul class="nav nav-tabs profile-nav">
                            <li role="presentation" class="active"><a href="#">Profile</a></li>
                            <li role="presentation"><a href="">My Bookings</a></li> 
                            <li role="presentation"><a href="">View a booking</a></li> 

                        </ul>
                    </div>
                    <!--end of Tabs-->
                    <!--Tab content 1:Profile-->
                    <div class="col-md-12 bhoechie-tab-content" style="padding: 0px;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" id="details-table" style="margin-top: 10px; margin-bottom: 10px;">
                            <tbody>
                                <tr class="trheding">
                                    <td id="dtr">General</td>
                                    <td id="dtr">&nbsp;</td>
                                    <td id="dtr">&nbsp;</td>
                                    <td id="dtr">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="subheadng">Name</td>
                                    <td class="normal"><?php echo $name_with_initials; ?></td>
                                    <td class="subheadng">&nbsp;  </td>
                                    <td class="normal">&nbsp; </td>   
                                </tr>

                                <tr>
                                    <td class="subheadng">User Name</td>
                                    <td class="normal"><?php echo $email; ?></td>
                                    <td class="subheadng">&nbsp;  </td>
                                    <td class="normal">&nbsp; </td>   
                                </tr>
                                <tr>
                                    <td class="subheadng">Contact No</td>
                                    <td class="normal"><?php echo $contact_number; ?></td>
                                    <td class="subheadng">&nbsp;  </td>
                                    <td class="normal">&nbsp; </td>   
                                </tr>
                                <tr>
                                    <td class="subheadng">Passport No</td>
                                    <td class="normal"><?php echo $passport_no; ?></td>
                                    <td class="subheadng">&nbsp;  </td>
                                    <td class="normal">&nbsp; </td>   
                                </tr>




                            </tbody></table>
                        <br><br>
                        <div class="clearfix"></div>
                    </div>
                    <!--end of tab content 1-->
                    <!--tab content 2:appointment details-->
                    <div class="bhoechie-tab-content hide col-md-12 ">

                        <table border="0" cellpadding="0" cellspacing="0" width="100%" id="details-table" style="margin-top: 10px; margin-bottom: 10px;">
                            <tbody>
                                <tr class="trheding">
                                    <td id="dtr">Bookings</td>
                                    <td id="dtr">&nbsp;</td>
                                    <td id="dtr">&nbsp;</td>
                                    <td id="dtr">&nbsp;</td>
                                    </tr>
                                </tbody>
                        </table>
<!--                        <div style="overflow-y: scroll">-->
                         <table id="bookings_tab" class="table table-hover" >
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Flight No</th>
                                    <th>Airline</th>
                                    <th>Dep</th>
                                    <th>Desti</th>
                                    <th>Dep date</th>
                                    <th>Date Booked</th>
                                    <th>View More</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                
                                $conexion = db_connect();

                                $sqlgp = "SELECT b.booking_id,b.date_created,f.flight_no,f.airline,f.depature,f.destination,f.depature_date FROM bookings b,flights f where b.flight_id=f.id and b.user_id=$id";
                                $result = $conexion->query($sqlgp);

                                while ($row = $result->fetch_array()) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row['booking_id']; ?></td>
                                        <td><?php echo $row['flight_no']; ?></td>
                                        <td><?php echo $row['airline']; ?></td>
                                        <td><?php echo $row['depature']; ?></td>
                                        <td><?php echo $row['destination']; ?></td>
                                        <td><?php echo $row['depature_date']; ?></td>
                                        <td><?php echo $row['date_created']; ?></td>
                                        <td><a href="<?php echo "view-booking.php?key=" . $row['booking_id']; ?>"  class="btn btn-sm btn-primary" title="view"><i class="glyphicon glyphicon-new-window" style="font-size: 22px;" ></i></a>&nbsp;</td>


                                    </tr>
    <?php } ?>
                            </tbody>
                         </table>
                    
                    </div>
                    <!--end of tab content 2-->
                    <!--tab content 3:For doctors select available time slots-->
                    <div class="bhoechie-tab-content hide col-md-12 ">
                        <form action="view-booking.php" method="GET">
                            <center style="margin-top:150px;"><h3>Referance No :</h3><input type="text" name="ref" class="reffield"><br><input style="margin-top: 10px;" type="submit" name="refsub" value="Find This Booking" class="btn btn-lg btn-success"></center>
                        
                        </form>
                        
                    </div>
                    <!--end of tab content 3-->
                    <!--tab content 4:for doctors see payment details -->

                    <!--end of tab content 4-->
                </div>
            </div>
        </div>
        <!-- end of profile -->
    </div>
</div>
<!-- edit profile popup-->
<div class="modal fade bs-modal-lg" id="editModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <center>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">Edit Your Profile Details</h4>
            </div>
            <div class="modal-body">

                
                    <form name="prof-settings" id="prof-settings" action="" method="post" enctype="multipart/form-data">
                        <div style="width:600px;">
                        <div class="fom-group img-submit">
                            <label for="profile-img">Profile image</label>
                            <br />

                            <img src="<?php
                    if (isset($profile_img) && (!empty($profile_img))) {
                        echo $profile_img;
                    } else {
                        echo "images/default_prof.jpg";
                    }
                    ?>" id="profile-img" class="img-thumbnail profile-img" name="profile-img">
                            <span class="btn btn-default btn-file">
                                Upload new picture<input type="file" name="profile_img" id="profile_img">
                            </span>
                        </div>
                        <div class="form-group">
                            <label for="first_name">First Name</label>
                            <input type="text" name="first_name" id="first_name" class="form-control" value="<?php echo $first_name; ?>">
                            <p class="help-block"></p>
                        </div>
                        <div class="form-group">
                            <label for="last_name">Last Name</label>
                            <input type="text" name="last_name" id="last_name" class="form-control" value="<?php echo $last_name; ?>">
                            <p class="help-block"></p>
                        </div>

                        <div class="form-group">
                            <label for="last_name">Contact Number</label>
                            <input type="text" name="contact_no" id="contact_no" class="form-control" value="<?php echo $contact_number; ?>">
                            <p class="help-block"></p>
                        </div>
                        <input type="submit" class="btn btn-success" value="Change Settings" name="submit1">

                        </div>
                    </form>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <!--        <button type="button" class="btn btn-primary">Save changes</button>-->
                </div>
            </div><!-- /.modal-content -->
        </center>
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- end of edit profile -->


    <!--change password popup-->
    <div class="modal fade bs-modal-lg" id="passModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <center>
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">Change your password</h4>
                    </div>
                    <div class="modal-body">
                        <form name="frmChange" method="post" action="" onSubmit="return validatePassword()">
                            <div style="width:500px;">
                                <div class="form-group">
                                    <label for="first_name">Current Password</label>
                                    <input type="password" name="currentPassword" id="currentPassword" class="form-control" required>
                                    <p class="help-block"></p>
                                </div>
                                <div class="form-group">
                                    <label for="last_name">New Password</label>
                                    <input type="password" name="newPassword" id="newPassword" class="form-control" required>
                                    <p class="help-block"></p>
                                </div>
                                <div class="form-group">
                                    <label for="last_name">Confirm Password</label>
                                    <input type="password" name="confirmPassword"  id="confirmPassword" class="form-control" required >
                                    <p class="help-block"></p>
                                </div>
                                <input type="submit" class="btn btn-success" value="Change Password" name="submit2">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <!--        <button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div><!-- /.modal-content -->
            </center>
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->	

<?php include_once 'includes/footer.php'; ?>