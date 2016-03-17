<?PHP include_once('includes/header.php') ?>
<?php
if (!loggedin()) {
    die("<script>location.href = 'index.php'</script>");
}
if ((isset($_GET['flight_id']))&& (isset($_GET['class']))&&(!empty($_GET['flight_id']))&&(!empty($_GET['class']))) {

    $flight_id = $_GET['flight_id'];
    $class = $_GET['class'];

    $_SESSION['flight_id'] = $flight_id;
    $_SESSION['class'] = $class;
}else{
    die("<script>location.href = 'index.php'</script>");
}

 if ((isset($_POST['reserve']))  && (!empty($_SESSION['seats'])) &&(!empty($_SESSION['flight_id']))&&(!empty($_SESSION['class']))) { //Save an apointment : For Patients
            $conexion = db_connect();
            $slot=  array();
            $slot = $_SESSION['seats'];
            $flight_id = $_SESSION['flight_id'];
            
            $sql = "SELECT * FROM flights where id='$flight_id'";
            $result = $conexion->query($sql);
            $rows = $result->fetch_array();
           // $price=$rows['b_price'];
            
            
            $airline = $row['airline'];
            $flight_no = $row['flight_no'];
            $depature = $row['depature'];
            $destination = $row['destination'];
            $depature_date = $row['depature_date'];
           
            $class = $_SESSION['class'];
            if($class=='b'){
                
                $ssql='b_seat_booked';
               $price=$rows['b_price'];
               $class_name='BUSINESS';
            }else if($class=='e'){
                
                $ssql='e_seat_booked';
               $price=$rows['e_price'];
               $class_name='ECONOMY';
            }


            $sql = "SELECT ".$ssql." FROM flights where id='$flight_id'";
            $result = $conexion->query($sql);
            $rows = $result->fetch_array();
            $reserved = array();
            $reserved = explode(',', $rows[0]);

            $merge = array_merge($reserved, $slot);


            $sql2 = "UPDATE flights SET ".$ssql."='" . implode(',', $merge) . "' where id='$flight_id' ";
            if ($result = $conexion->query($sql2)) {
             
            $passengers=  sizeof($slot);
            $tot_price=$passengers*$price;
            $ref_id = uniqid();
            $seats_booked= implode(',', $slot);
            $sql3 = "insert into bookings (user_id,flight_id,booking_reference,class,seat_no,amount) values('{$_SESSION['id']}','$flight_id','$ref_id','$class','$seats_booked','$tot_price')";
             if ($conexion->query($sql3)) {
                   $bookingid = $conexion->insert_id;
                  $sql = "INSERT INTO `booking_payments`(`user_id`, `flight_id`,`booking_id`,`amount`) VALUES ('{$_SESSION['id']}','$flight_id','$bookingid','$tot_price')";
                  if($conexion->query($sql)){
                      require '/PHPMailer/PHPMailerAutoload.php';
                        $subject = strip_tags('E-ticket');
                        $email = strip_tags('arunthms01@gmail.com');
                        $message = '<html><body>';
                        $message .= '<table rules="all" style="border-color: #666;" cellpadding="10">';
                        $message .= "<tr style='background: #eee;'><td><strong>Your E-ticket details</strong> </td><td></td></tr>";
                        $message .= "<tr><td><strong>Referenace No:</strong> </td><td>" . $ref_id . "</td></tr>";
                        $message .= "<tr><td><strong>Flight No:</strong> </td><td>" . $flight_no . "</td></tr>";
                        $message .= "<tr><td><strong>Airline:</strong> </td><td>" . $airline . "</td></tr>";
                        $message .= "<tr><td><strong>Seat No(s):</strong> </td><td>" . $seats_booked . "</td></tr>";
                        $message .= "<tr><td><strong>Class:</strong> </td><td>" . $class_name . "</td></tr>";
                        $message .= "<tr><td><strong>Departure Date:</strong> </td><td>" . $depature_date . "</td></tr>";
                        $message .= "<tr><td><strong>Departure:</strong> </td><td>" . $depature . "</td></tr>";
                        $message .= "<tr><td><strong>Destination:</strong> </td><td>" . $destination . "</td></tr>";
                        $message .= "<tr><td><strong>Passengers :</strong> </td><td>" . $passengers . "</td></tr>";
                        $message .= "<tr><td><strong>Ticket amount:</strong> </td><td>" . $price . "</td></tr>";
                        $message .= "<tr><td><strong>Total amount:</strong> </td><td>" . $tot_price . "</td></tr>";
                        $message .= "</table>";
                        $message .= "</body></html>";
                   
                    $mail = new PHPMailer;

                    $mail->isSMTP();
                    $mail->Host = 'smtp.gmail.com';
                    $mail->SMTPAuth = true;
                    $mail->Username = 'ahasedeyyona@gmail.com';
                    $mail->Password = 'ahase123';
                    $mail->SMTPSecure = 'tls';

                    $mail->From = 'ahahahhaa@gmail.com';
                    $mail->FromName = 'FlightBooking';
                    $mail->addAddress($email, 'lasitha');

                    $mail->addReplyTo($email, 'lasitha');

//                    $mail->WordWrap = 50;
                    $mail->isHTML(true);

                    $mail->Subject = $subject;
                    $mail->Body = $message;

                    if (!$mail->send()) {
                        echo 'Message could not be sent.';
                        echo 'Mailer Error: ' . $mail->ErrorInfo;
                        exit;
                    }
                 
                   // die("<script>location.href = 'booking-success.php'</script>");
//                    $_SESSION['radioval'] = '';
                }
                
                
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
				
					
								
                                                                
                                                                <form id="loginForm" name="seatsfrm" action="" method="post" style="margin:auto;width:100%; border: none !important;">
                                   <?php
                                    $sql1 = "SELECT flight_no,airline,depature,destination,depature_date,b_price,e_price,b_seat_count,e_seat_count,b_seat_booked,e_seat_booked from flights  where id='{$_SESSION['flight_id']}'";
                                    $result = $conexion->query($sql1);
                                    $row = $result->fetch_array();
                                    $flight_no = $row['flight_no'];
                                    $airline = $row['airline'];
                                    $depature = $row['depature'];
                                    $destination = $row['destination'];
                                    $depature_date = $row['depature_date'];
                                    $class=$_SESSION['class'];
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
                                       $class_name='ECONOMY';
                                    }else if($class=='b'){
                                       $booked= $b_booked;
                                       $price= $b_price;
                                       $seat_count= $b_seat_count;
                                       $class_name='BUSINESS';
                                    }
                                   

                                   echo "Seat fee is : Rs." . $price . ".00/= <br>";
                                    
                                    $_SESSION['price'] = $price;
                                    $_SESSION['class'] = 'e';
                                    ?>
                               <div class="col-md-12" >
                                    <div class="col-md-2" style="background: #F4F7F9; padding: 5px ;margin: 0">Airlines :</div>
                                    <div class="col-md-3" style="background: #F4F7F9; padding: 5px ;margin: 0"><?php echo $airline;?></div>
                                    <div class="col-md-2" style="background: #F4F7F9; padding: 5px ;margin: 0">|    Flight No :</div>
                                    <div class="col-md-3" style="background: #F4F7F9; padding: 5px ;margin: 0: 4px"><?php echo $flight_no;?></div>
                                    <div class="col-md-2" ></div>
                                </div>
                                <div class="col-md-12" >
                                    <div class="col-md-2" style="padding: 5px ;margin: 0">Departure :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0"><?php echo $depature; ?></div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0">|     Destination :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0: 4px"><?php echo $destination; ?></div>
                                    <div class="col-md-1" ></div>
                                </div>
                                <div class="col-md-12" >
                                    <div class="col-md-2" style="padding: 5px ;margin: 0">Departure Date :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0"><?php echo $depature_date ?></div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0">|     Class :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0: 4px"><?php echo $class_name; ?></div>
                                    <div class="col-md-1" ></div>
                                </div>
                                                                    <div class="clearfix"></div>
                               <br>
                               <br>
                               <b><?php echo "Ticket price per person : Rs." . $price . ".00/=";?></b>
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
           // alert(seats);
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