<?PHP

include_once('includes/header.php');

$conexion = db_connect();
$message = "";
if (isset($_POST['submit'])) {
    if (loggedin()) {
        $name = $_SESSION['first_name'] . " " . $_SESSION['last_name'];
        $email = $_SESSION['email'];
    } else {
        $name = $_POST['name'];
        $email = $_POST['email'];
    }
    $subject = $_POST['subject'];
    $content = $_POST['content'];



    $sql = "INSERT INTO `feedbacks`(`name`, `email`, `subject`, `content`) VALUES ('$name', '$email', '$subject', '$content')";
    if ($conexion->query($sql)) {
        $message = "<div class='alert alert-success'>Feedback Sent successfully.</div>";
    }
}
?>

<?php echo $message ?>
    <section id="contact">
        <div class="container">
                <div class="col-lg-8 col-md-8 col-sm-6 col-md-offset-2">
                    <div class="contact-form">
                        <div class="section-heading" style="margin-top: 20px" >
                            <h2>Feedback</h2>
                            <div class="line"></div>
                        </div>
                        <p style="margin-top: 20px" >Fill out all required Field to send a Message. Please don't spam,Thank you!</p>
                        <form class="submitphoto_form" action="" method="post">
                            <?php if (!loggedin()) { ?>
                                <input type="text" style="margin-top: 20px"  class="form-control " placeholder="Your name" id="name" name="name">
                                <input type="mail" style="margin-top: 20px"  class="form-control " placeholder="Email address" id="email" name="email">
                            <?php } ?>
                            <input type="text" class="form-control " style="margin-top: 20px" placeholder="Subject" id="subject" name="subject" required="">
                            <textarea class="form-control" style="margin-top: 20px"  cols="30" rows="10" placeholder="What would you like to tell us" id="content" name="content" required=""></textarea>
                            <button style="margin-top: 20px; margin-bottom: 20px"  class="btn btn-success" type="submit" name="submit"><i class="button__icon fa fa-envelope"></i><span>Send Feedbacks</span></button>
                        </form>
                    </div>
                </div>
        </div>
    </section>

<?php include_once 'includes/footer.php'; ?>