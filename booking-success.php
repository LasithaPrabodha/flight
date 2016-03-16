<?PHP
include_once('includes/header.php');

if (!loggedin()) {
    die("<script>location.href = 'index.php'</script>");
}
?>

<!-- banner-bottom -->
<div class="banner-bottom">
    <!-- container -->
    <div class="container">
        <div class="about-info">
            <h1>Thank You!</h1>
        </div>
        <div class="faqs-top-grids terms-grids">	
            <br>
            <h3>You have successfully placed a booking.Your e-tickets will be sent to your email account soon!Thank You</h3>
            <br>
            <br>
            <br>
            <br>
            
            <?php
            $_SESSION['seats'] = '';
            $_SESSION['class'] = '';
            $_SESSION['flight_id'] = '';
            ?>
            <div class="col-md-offset-1 col-md-3 center" ><a href="index.php"><button class='btn btn-success btn-lg col-md-12' data-toggle="modal" data-target="#editModal">Home</button></a></div>
            <br>
            <br>
            <br>
        </div>
        
    </div>
    <!-- //container -->
</div>
<!-- //banner-bottom -->


<?php include_once 'includes/footer.php'; ?>