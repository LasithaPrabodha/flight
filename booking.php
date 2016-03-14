<?PHP include_once('includes/header.php') ?>

	<!-- banner-bottom -->
	<div class="banner-bottom">
		<!-- container -->
		<div class="container">
			<div class="faqs-top-grids">
				<div class="book-grids">
					<div class="col-md-6 book-left">
						<div class="book-left-info">
							<h3>View/Cancel/Reschedule your bookings by signing in</h3>
						</div>
						<div class="book-left-form">
							<form>
								<p>Email</p>
								<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Password</p>
								<input type="password" name="password" id="password">
								<input type="submit" id="login" value="Sign in">
							</form>
							<a href="#">Forgot your password?</a>
						</div>
						<div class="book-left-bottom">
								<div class="book-left-facebook">
									<a href="#">Connect with Facebook</a>
								</div>
								<div class="book-left-chrome">
									<a href="#">Connect with Google</a>
								</div>
							</div>
					</div>
					<div class="col-md-6 book-left book-right">
						<div class="book-left-info">
							<h3>View/print your booking without signing in</h3>
						</div>
						<div class="book-left-form">
							<form>
								<p>Email</p>
								<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<p>Booking Reference Number</p>
								<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
								<input type="submit" id="login" value="Submit">
							</form>
							<a href="#">How do I find my Booking Reference Number?</a>
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