<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require '../vendor/autoload.php';
//Create an instance; passing `true` enables exceptions

$email = $_POST['email'];
$name = $_POST['name'];
$texto = $_POST['texto'];
$asunto = $_POST['asunto'];

$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'pro.turbo-smtp.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = "jddca874@gmail.com";                     //SMTP username
    $mail->Password   = "P@ssw0rd1234";                               //SMTP password
    $mail->SMTPSecure = "ssl";            //Enable implicit TLS encryption
    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom($email, $name);
    $mail->addAddress("jddca874@gmail.com");     //Add a recipient
    //$cuerpo = require '../public/plantilla_correo/enviar_correo.html';
    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = $asunto;
    $mail->Body = $texto;
    

    $mail->send();
    header("Location: http://localhost/tienda/");
    exit();
    //echo 'Enviado Correctamente';
} catch (Exception $e) {
    echo "Error al enviar: {$mail->ErrorInfo}";
}