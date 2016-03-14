<?PHP include_once('includes/header.php') ?>
<?php 
$user_type='A';
$profile_img='';
$id='';
$name_with_initials='aaaaa';
$first_name='Arun';

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
<div class="container">
	<!-- profile -->
        <div class="row" style="padding: 10px;background-color: rgba(211, 211, 211, 0.09);;margin-top: 10px;margin-bottom: 20px;">
        
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
            <div class="col-md-offset-1 col-md-10 text-center" style='padding-top: 0px;'><h4><span style="color:rgb(77, 80, 89);"><?php
                        if ($user_type == 'A') {
                            echo 'ADMIN';
                        } 
                        ?></span></h4></div>

            <?php if($id == ''){ ?>
            <div class="col-md-offset-1 col-md-10 center" ><button class='btn btn-success col-md-12' data-toggle="modal" data-target="#editModal">Profile settings</button></div>

            <div class="col-md-offset-1 col-md-10 center" style="margin-top: 3px; "><center><a href="#" class='col-md-12' data-toggle="modal" data-target="#passModal" >change password</a></center></div>

            <?php }?>
            <div class="clearfix"></div>
        </div>

        <div class="col-md-9" style=" border-left: 1px solid #ddd; min-height: 553px">
            <div class="col-md-12"><div class="col-md-8"><h1><?php
                        if ($user_type == 'A') {
                            echo 'Admin Profile';
                        } else{
                            echo 'Your Profile';
                        } 
                        ?></h1></div>
              
            </div>
            
            <div class="col-md-12" style="margin-top: 10px;">
                <!--Tabs-->
                <div class="bhoechie-tab-menu">
                    <ul class="nav nav-tabs profile-nav">
                        <li role="presentation" class="active"><a href="#">Profile</a></li>
                        <li role="presentation"><a href="">Appoinments</a></li> 
                        <li role="presentation"><a href="#">Set Available Times</a></li>
                        <li role="presentation"><a href="#">Payments</a></li>
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
                                <td class="normal"><?php echo ''; ?></td>
                                <td class="subheadng">&nbsp;  </td>
                                <td class="normal">&nbsp; </td>   
                            </tr>

                            <tr>
                                <td class="subheadng">User Name</td>
                                <td class="normal"><?php echo ''; ?></td>
                                <td class="subheadng">&nbsp;  </td>
                                <td class="normal">&nbsp; </td>   
                            </tr>
                            <tr>

                                <td class="subheadng">User Role</td>
                                <td class="normal"><?php
                                    if ($user_type == 'A') {
                                        echo 'Admin';
                                    } elseif ($user_type == 'D') {
                                        echo 'Doctor';
                                    } elseif ($user_type == 'P') {
                                        echo 'Patient';
                                    } elseif ($user_type == 'G') {
                                        echo 'General Pysicient';
                                    }
                                    ?></td>
                                <td class="subheadng">&nbsp;  </td>
                                <td class="normal">&nbsp; </td>   
                            </tr>
                            <tr>
                                <td class="subheadng">Contact No</td>
                                <td class="normal"><?php echo ''; ?></td>
                                <td class="subheadng">&nbsp;  </td>
                                <td class="normal">&nbsp; </td>   
                            </tr>




                        </tbody></table>
                    <br><br>
                    <div class="clearfix"></div>
                </div>
                <!--end of tab content 1-->
                <!--tab content 2:appointment details-->
                <div class="bhoechie-tab-content hide">
                    <br>
                </div>
                <!--end of tab content 2-->
                <!--tab content 3:For doctors select available time slots-->
                <div class="col-md-12 bhoechie-tab-content hide">
                    <br>
                </div> 
                <!--end of tab content 3-->
                <!--tab content 4:for doctors see payment details -->
                <div class="col-md-12 bhoechie-tab-content hide">
                    <br>
                </div>
                 <!--end of tab content 4-->
            </div>
        </div>
    </div>
        <!-- end of profile -->
</div>
	

<?php include_once 'includes/footer.php'; ?>