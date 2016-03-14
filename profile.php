<?PHP include_once('includes/header.php') ?>
<?php 

$sql = "SELECT * FROM users where id = '1'";
$result = $conexion->query($sql);
if ($result->num_rows > 0) {

    while ($row = $result->fetch_array()) {

        $id = $row['id'];
        $first_name = $row['first_name'];
        $last_name = $row['last_name'];
        $email = $row['email'];
        //$profile_img = $row['profile_img'];
        $user_type = $row['user_type'];
        $password = $row['password'];
        $contact_number = $row['phone'];
        $passport_no = $row['passport_no'];
    }
}


$name_with_initials=$first_name."".$last_name;


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

</style>
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
        });
</script>
<div class="banner-bottom">
    <div class="container ">
        <div class="banner-bottom-info">
				<h3 style="margin-left: 30px;"><?php
                        if ($user_type == 'A') {
                            echo 'Admin Profile';
                        } else{
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

            <?php if($id == ''){ ?>
            <div class="col-md-offset-1 col-md-10 center" ><button class='btn btn-success col-md-12' data-toggle="modal" data-target="#editModal">Profile settings</button></div>

            <div class="col-md-offset-1 col-md-10 center" style="margin-top: 3px; "><center><a href="#" class='col-md-12' data-toggle="modal" data-target="#passModal" >change password</a></center></div>

            <?php }?>
            <div class="clearfix"></div>
        </div>

        <div class="col-md-9" style=" border-left: 1px solid #ddd; min-height: 553px">
            
            
            <div class="col-md-12" style="margin-top: 10px;">
                <!--Tabs-->
                <div class="bhoechie-tab-menu col-md-12">
                    <ul class="nav nav-tabs profile-nav">
                        <li role="presentation" class="active"><a href="#">Profile</a></li>
                        <li role="presentation"><a href="">My Bookings</a></li> 
                        
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
                <div class="bhoechie-tab-content hide col-md-12" style="padding: 0px;">
                    
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="details-table" style="margin-top: 10px; margin-bottom: 10px;">
                        <tbody>
                            <tr class="trheding">
                                <td id="dtr">Bookings</td>
                                <td id="dtr">&nbsp;</td>
                                <td id="dtr">&nbsp;</td>
                                <td id="dtr">&nbsp;</td>
                            </tr>
                    




                        </tbody></table>
                    <br><br>
                     <div class="clearfix"></div>
                </div>
                <!--end of tab content 2-->
                <!--tab content 3:For doctors select available time slots-->
               
                <!--end of tab content 3-->
                <!--tab content 4:for doctors see payment details -->
               
                 <!--end of tab content 4-->
            </div>
        </div>
    </div>
        <!-- end of profile -->
    </div>
</div>
	

<?php include_once 'includes/footer.php'; ?>