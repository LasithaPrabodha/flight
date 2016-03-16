<?PHP include_once('includes/header.php') ?>
<?php
if (!loggedin()) {
    die("<script>location.href = 'index.php'</script>");
}
 if ((isset($_POST['reserve']))  && (!empty($_SESSION['seats']))) { //Save an apointment : For Patients
            $conexion = db_connect();
            $slot=  array();
            $slot = $_SESSION['seats'];
            $flight_id = 1;
            
            
            $price= '6789';
            $class = 'e';
            if($class=='b'){
                
                $ssql='b_seat_booked';
            }else if($class=='e'){
                
                $ssql='e_seat_booked';
            }


            $sql = "SELECT ".$ssql." FROM flights where id='$flight_id'";
            $result = $conexion->query($sql);
            $rows = $result->fetch_array();
            $reserved = array();
            $reserved = explode(',', $rows[0]);

            $merge = array_merge($reserved, $slot);


            $sql2 = "UPDATE flights SET ".$ssql."='" . implode(',', $merge) . "' where id='$flight_id' ";
            if ($result = $conexion->query($sql2)) {
                
            $ref_id = uniqid();
            $seats_booked= implode(',', $slot);
            $sql3 = "insert into bookings (user_id,flight_id,booking_reference,class,seat_no,amount) values('{$_SESSION['id']}','$flight_id','$ref_id','$class','$seats_booked','$price')";
             if ($conexion->query($sql3)) {
//                    $appointmentid = $conexion->insert_id;
//                    $sql = "INSERT INTO `patient_payments`(`user_id`, `appoinment_id`, `doctor_id`, `amount`) VALUES ('{$_SESSION['user_id']}','$appointmentid','$id','$fee')";
//                    $conexion->query($sql);
//                    $updt_pay = "update doc_pay set appoi_no=appoi_no+1, tot_amnt=tot_amnt+$fee where doc_id='$id'";
//                    $conexion->query($updt_pay);
                    echo "<div class='alert alert-success'>Seat(s) Booked successfully!.Your Ticket will be sent to your Email.</div>";
//                    $_SESSION['radioval'] = '';
//                }
                $_SESSION['seats']='';
                
            };
        }}
?>
<!-- banner-bottom -->
	<div class="banner-bottom">
		<!-- container -->
		<div class="container">
                    <div class="banner-bottom-info">
                    <h3>Select Your seats</h3>
                    </div>
			<div class="faqs-top-grids" style="margin-top: 10px;">
				
					
								
                                                                
                                                                <form id="loginForm" name="seatsfrm" action="" method="post" style="margin:auto;width:100%; border: none !important;"><b> 
                                   <?php
                                    $sql1 = "SELECT b_price,e_price,b_seat_count,e_seat_count,b_seat_booked,e_seat_booked from flights  where id='1'";
                                    $result = $conexion->query($sql1);
                                    $row = $result->fetch_array();
                                    $class='e';
                                    $b_booked =explode(',', $row['b_seat_booked']);
                                    $e_booked =explode(',', $row['e_seat_booked']);
                                    $b_price = $row['b_price'];
                                    $e_price = $row['e_price'];
                                    $b_seat_count = $row['b_seat_count'];
                                    $e_seat_count = $row['e_seat_count'];
                                    
                                    if($class=='e'){
                                       $booked= $e_booked;
                                       $price= $e_price;
                                       $seat_count= $e_seat_count;
                                    }else if($class=='b'){
                                       $booked= $b_booked;
                                       $price= $b_price;
                                       $seat_count= $b_seat_count;
                                    }
                                   

                                   echo "Seat fee is : Rs." . $price . ".00/= <br>";
                                    
                                    $_SESSION['price'] = $price;
                                    $_SESSION['class'] = 'e';
                                    ?>
                                </b> <br>
                                <hr/>

                                <table class="table-striped" style="width:100%">
                                    
                                <thead>
                                    <tr>
                                        <th>Window</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>Window</th>
                                    </tr>
                                </thead>
                                    <?php
                                   
                                        echo '<tr>';

                                        for ($x = 1; $x <= $seat_count; $x++) {
                                            $chk = "";
                                            $dis = "";
                                            $color = "";
                                             if( (fmod($x,7)==0)||(fmod($x,7)==1)){
                                                 $color = 'background: paleturquoise;color:#fff;';
                                           
                                             }
                                              
                                                    if (in_array($x, $booked)) {
                                                        $dis = 'disabled="disabled"';
                                                        $color = 'background:#EE2C2C;color:#fff;';
                                                    }

                                                    echo '<td style="padding:8px;margin:10px;' . $color . '"><input' . $dis . ' type="checkbox" name="seats" id="seats" value="' . $x  . '">No: ' . $x . '</input></td>';
      if( fmod($x,7)==0){
                                                 echo '</tr><tr>';
                                             }
                                        
                                    }
                                    ?>
                                </table>
                                <input type="hidden" name="radio"   value="Reserve this time slot"/>
                            </form>

                            <div class="col-md-12" style="margin: 10px 0">
                                <button class='btn-primary btn pull-right' data-toggle="modal" data-target="#cardModal">Book</button>
                            </div>
                                                                 
						
					
					<div class="clearfix"> </div>
				
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-bottom -->
	<!--Card payment popup-->
    <div class="modal fade bs-modal-sm" id="cardModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <center>
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">Card Payments</h4>
                    </div>
                    <div class="panel panel-default credit-card-box">
                        <div class="panel-heading display-table" >
                            <div class="row display-tr" >
                                <h3 class="panel-title display-td" >Payment Details</h3>
                                <div class="display-td" >                            
                                    <img class="img-responsive" src="http://i76.imgup.net/accepted_c22e0.png">
                                </div>
                            </div>                    
                        </div>
                        <div class="panel-body">
                            <form role="form" name="payment-form" method="POST" action="">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="cardNumber">CARD NUMBER</label>
                                            <div class="input-group">
                                                <input 
                                                    type="tel"
                                                    class="form-control"
                                                    name="cardNumber"
                                                    placeholder="Valid Card Number"
                                                    autocomplete="cc-number"
                                                    required autofocus 
                                                    />
                                                <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                            </div>
                                        </div>                            
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-7 col-md-7">
                                        <div class="form-group">
                                            <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                            <input 
                                                type="tel" 
                                                class="form-control" 
                                                name="cardExpiry"
                                                placeholder="MM / YY"
                                                autocomplete="cc-exp"
                                                required 
                                                />
                                        </div>
                                    </div>
                                    <div class="col-xs-5 col-md-5 pull-right">
                                        <div class="form-group">
                                            <label for="cardCVC">CV CODE</label>
                                            <input 
                                                type="tel" 
                                                class="form-control"
                                                name="cardCVC"
                                                placeholder="CVC"
                                                autocomplete="cc-csc"
                                                required
                                                />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12">

                                        <input type="submit" name="reserve"   class="btn-primary btn pull-right" value="Reserve this time slot"/>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>  
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <!--        <button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div><!-- /.modal-content -->
            </center>
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!--end of Card payment-->
    <script>
    $(document).ready(function(){
        
 function getCheckedBoxes(chkboxName) {
  var checkboxes = document.getElementsByName(chkboxName);
  var checkboxesChecked = [];
  // loop over them all
  for (var i=0; i<checkboxes.length; i++) {
     // And stick the checked ones onto an array...
     if (checkboxes[i].checked) {
        checkboxesChecked.push(checkboxes[i]);
     }
  }
  // Return the array if it is non-empty, or null
  return checkboxesChecked.length > 0 ? checkboxesChecked : null;
}


 $("input[name='seats']").click(function ()
{
            var seats = [];
            $.each($("input[name='seats']:checked"), function(){            
                seats.push($(this).val());
            });
            alert(seats);
            $.ajax({
                    type: "POST",
                    url: "includes/profile_functions.php",
                    data: {seats: seats}, //pass txtarea input with cssrf tolcke
                    dataType: "json"

                });  
            
});
});
    </script>
<?php include_once 'includes/footer.php'; ?>