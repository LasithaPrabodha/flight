<?php

require '../PHPMailer/PHPMailerAutoload.php';

if (isset($_POST['email'])) {
    $subject = strip_tags($_POST['subject']);
    $email = strip_tags($_POST['email']);
    $message = strip_tags($_POST['message']);
}
$mail = new PHPMailer;

$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->Username = 'ahasedeyyona@gmail.com';
$mail->Password = 'ahase123';
$mail->SMTPSecure = 'tls';

$mail->From = 'ahahahhaa@gmail.com';
$mail->FromName = 'Admin';
$mail->addAddress($email, 'lasitha');

$mail->addReplyTo($email, 'lasitha');

$mail->WordWrap = 50;
$mail->isHTML(true);

$mail->Subject = $subject;
$mail->Body = $message;

if (!$mail->send()) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
    exit;
}

echo ' <div class="alert alert-success" >
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Success</h4>
                            Email sent!</div>';
