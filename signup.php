<?PHP include_once('includes/functions.php');

if (loggedin()) {
    header('Location:index.php');
}

$m = "";
if (isset($_POST['signup'])) {

    $email = sql_escape($_POST['email']);
    $password = md5(sql_escape($_POST['password']));
    $cpassword = md5(sql_escape($_POST['cpassword']));
    $fname = sql_escape($_POST['fname']);
    $lname = sql_escape($_POST['lname']);
    $pno = sql_escape($_POST['pno']);
    $passport = sql_escape($_POST['passport']);

    if(empty($email)&&empty($password)&&empty($cpassword)&&empty($fname)&&empty($lname)&&empty($pno)&&empty($passport)){
        $m = '<div class="alert alert-danger">  <strong></strong> All the Fields are mandatory!</div>';
    } else if($password != $cpassword) {
        $m = '<div class="alert alert-danger">  <strong></strong> Passwords do not match!</div>';
    } else {

        $sql = "SELECT email FROM users WHERE email = '{$email}' ";
        $result = $conexion->query($sql);
        if ($result->num_rows > 0) {
            $m = '<div class="alert alert-danger">  <strong></strong> User already exists !</div>';
        }else{
            $insert = "INSERT INTO users(`first_name`, `last_name`, `email`, `password`, `phone`,`passport_no`) VALUES ('$fname', '$lname','$email', '$password','$pno','$passport')";

            $result = register($insert);
            $m = '<div class="alert alert-success">  <strong></strong> User Created successfully! Sign in Now!</div>';
        }

    }
}
require_once("includes/header.php");

echo $m;
?>

	<!-- banner-bottom -->
	<div class="banner-bottom">
		<!-- container -->
		<div class="container">
			<div class="faqs-top-grids">
				<div class="book-grids">
					<div class="col-md-6 book-left">
						<div class="book-left-info">
							<h3>Create Your Govihar Account</h3>
						</div>
						<div class="book-left-form">
							<form id="signinForm" action="" method="post">
								<p>First Name</p>
								<input type="text" name="fname" required id="fname" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Last Name</p>
								<input type="text" name="lname" required id="lname" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Phone Number</p>
								<input type="text" name="pno" id="pno" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Email Address</p>
								<input type="text" name="email" required id="email" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                                                                <p>Passport Number</p>
								<input type="text" name="passport" required id="passport" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Password</p>
								<input type="password" name="password" required id="password">
								<p>Confirm Password</p>
								<input type="password" name="cpassword" required id="cpassword">
								<input type="submit" id="signup" name="signup" value="Register">
							</form>
						</div>
					</div>
					<div class="col-md-6 book-left book-right">
						<div class="book-left-info">
							<h3>Recommended</h3>
						</div>
						<ul>
							<li>Access booking history with upcoming trips</li>
							<li>Print tickets and invoices</li>
							<li>Make checkouts simpler</li>
							<li>Enter your contact details only once</li>
							<li>Get alerts for low fares</li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-bottom -->

<?php include_once 'includes/footer.php'; ?>