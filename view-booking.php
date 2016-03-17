<?PHP include_once('includes/functions.php');

if (!loggedin()) {
    die("<script>location.href = 'index.php'</script>");
}

require_once("includes/header.php");
if (isset($_GET['key'])&&(!empty ($_GET['key']))) {
    $key = trim($_GET['key']);
    
    $sql = "SELECT b.booking_id,b.booking_reference,b.date_created ,b.class,b.seat_no,b.amount,f.flight_no,f.airline,f.depature,f.destination,f.depature_date FROM bookings b,flights f where b.flight_id=f.id and b.booking_id=$key";
$result = $conexion->query($sql);
if ($result->num_rows > 0) {

    while ($row = $result->fetch_array()) {

        $booking_id = $row['booking_id'];
        $booking_referance = $row['booking_reference'];
        $date_booked = $row['date_created'];
        $class_t = $row['class'];
        $seat = $row['seat_no'];
        $amount = $row['amount'];
        $flight_no = $row['flight_no'];
        $airline = $row['airline'];
        $depature = $row['depature'];
        $destination = $row['destination'];
        $depature_date = $row['depature_date'];
    }
}
    if($class_t=='b'){
        $class = "BUSINESS CLASS";
    }else{
        $class = "ECONOMY CLASS";
    }

    
}else if(isset($_GET['cancel_k'])&&(!empty ($_GET['cancel_k']))){
    $c_key = $_GET['cancel_k'];
        $sql1 = "SELECT b.booking_reference ,b.amount FROM bookings b where b.booking_id=$c_key";
        $result1 = $conexion->query($sql1);
if ($result1->num_rows > 0) {

    while ($row = $result1->fetch_array()) {

        $booking_referance = $row['booking_reference'];
        $amount = $row['amount'];
        
    }
}
    $c_key = $_GET['cancel_k'];
    $sql = "DELETE FROM `bookings` WHERE booking_id=$c_key";
    $booking_id = '';
        $booking_referance = '';
        $date_booked = '';
        $class_t = '';
        $seat = '';
        $amount = '';
        $flight_no = '';
        $airline = '';
        $depature = '';
        $destination = '';
        $depature_date = '';
        $class = "";
    if($result = $conexion->query($sql)){
        echo "<div class='alert alert-success'>Booking <b>".$booking_referance."</b> has been succesfully Canceled.Amount of <b> Rs.".$amount."<b> has been succesfully refunded back to your bank account.</div>";
    die("<script>location.href = 'profile.php'</script>");
        
    }
}else if(isset($_GET['ref'])&&(!empty ($_GET['ref']))){
    $ref = trim($_GET['ref']);
    	
    $sql = "SELECT b.booking_id,b.booking_reference,b.date_created ,b.class,b.seat_no,b.amount,f.flight_no,f.airline,f.depature,f.destination,f.depature_date FROM bookings b,flights f where b.user_id='{$_SESSION['id']}' and b.flight_id=f.id and b.booking_reference='$ref'";
$result = $conexion->query($sql);
if ($result->num_rows > 0) {

    while ($row = $result->fetch_array()) {

        $booking_id = $row['booking_id'];
        $booking_referance = $row['booking_reference'];
        $date_booked = $row['date_created'];
        $class_t = $row['class'];
        $seat = $row['seat_no'];
        $amount = $row['amount'];
        $flight_no = $row['flight_no'];
        $airline = $row['airline'];
        $depature = $row['depature'];
        $destination = $row['destination'];
        $depature_date = $row['depature_date'];
    }
}else{
    $booking_id = '';
        $booking_referance = '';
        $date_booked = '';
        $class_t = '';
        $seat = '';
        $amount = '';
        $flight_no = '';
        $airline = '';
        $depature = '';
        $destination = '';
        $depature_date = '';
        $class = "";
     echo "<div class='alert alert-danger'>Invalid Refernce Number!.</div>";
  die("<script>location.href = 'profile.php'</script>");
}
    if($class_t=='b'){
        $class = "BUSINESS CLASS";
    }else{
        $class = "ECONOMY CLASS";
    }

}else{
     die("<script>location.href = 'index.php'</script>");
    
}


?>

	<!-- banner-bottom -->
	<div class="banner-bottom">
		<!-- container -->
		<div class="container">
			<div class="faqs-top-grids">
				<div class="book-grids">
                                    <h1><?php echo "Ref : ".$booking_referance;?> </h1><br>
					<div class="col-md-6 book-left">
						<div class="book-left-info">
							<h3>Booking Details</h3>
						</div>
						<div class="book-left-form">
							
								<p>Booking No</p>
                                                                <input type="text" disabled value="<?php echo $booking_id;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Referance No</p>
								<input type="text" disabled value="<?php echo $booking_referance;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Booked Date</p>
								<input type="text" disabled value="<?php echo $date_booked;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Class</p>
								<input type="text" disabled value="<?php echo $class;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                                                                <p>Seat</p>
								<input type="text" disabled value="<?php echo $seat;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                                                                <p>Amount</p>
								<input type="text" disabled value="<?php echo 'Rs.'.$amount.'/=';?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								
								<!--<input type="submit" id="signup" name="signup" value="Register">-->
							
						</div>
					</div>
					<div class="col-md-6 book-left book-right">
						<div class="book-left-info">
							<h3>Flight Details</h3>
						</div>
						<div class="book-left-form">
                                                                <p>Flight No</p>
								<input type="text" disabled value="<?php echo $flight_no;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Airline</p>
								<input type="text" disabled value="<?php echo $airline;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Departure</p>
                                                                <input type="text" disabled value="<?php echo $depature;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Destination</p>
								<input type="text" disabled value="<?php echo $destination;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                                                                <p>Departure Date</p>
								<input type="text" disabled value="<?php echo $depature_date;?>" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								
                                                                <a href="<?php echo "view-booking.php?cancel_k=" . $booking_id; ?>"><button class="btn btn-danger">Cancel Booking</button></a>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-bottom -->

<?php include_once 'includes/footer.php'; ?>