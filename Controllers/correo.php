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
    $mail->setFrom('jddca874@gmail.com', 'Boletin de Noticias');
    $mail->addAddress($email);     //Add a recipient
    //$cuerpo = require '../public/plantilla_correo/enviar_correo.html';
    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'Boletin de Noticias';
    $mail->Body = '
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Boletín de Noticias - ByteZone</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
            }
            .container {
                max-width: 600px;
                margin: 20px auto;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            .header {
                background-color: #0044cc;
                color: #ffffff;
                text-align: center;
                padding: 20px;
            }
            .header h1 {
                margin: 0;
                font-size: 24px;
            }
            .content {
                padding: 20px;
            }
            .content h2 {
                font-size: 20px;
                margin-bottom: 10px;
            }
            .content p {
                font-size: 16px;
                line-height: 1.6;
            }
            .product {
                margin-bottom: 20px;
            }
            .product img {
                max-width: 100%;
                border-radius: 5px;
            }
            .cta {
                text-align: center;
                margin: 20px 0;
            }
            .cta a {
                display: inline-block;
                background-color: #0044cc;
                color: #ffffff;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
            }
            .footer {
                background-color: #f4f4f4;
                text-align: center;
                padding: 10px 20px;
                font-size: 14px;
                color: #666;
            }
            .footer a {
                color: #0044cc;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>¡Bienvenido a ByteZone!</h1>
                <p>Tu fuente confiable de tecnología de última generación</p>
            </div>
            <div class="content">
                <h2>🎉 Promoción de la semana</h2>
                <div class="product">
                    <img src="https://p.turbosquid.com/ts-thumb/LR/OKNFMC/8J/render40/jpg/1630751247/1200x1200/fit_q99/09c4cc84e6c789fa9403bee40206a7ef198b6693/render40.jpg" alt="Producto destacado">
                    <h3>PC Gamer RGB - 30% de descuento</h3>
                    <p>Rendimiento extremo para los más exigentes. Incluye tarjeta gráfica de última generación y almacenamiento SSD ultrarrápido.</p>
                </div> 
                <h2>🆕 Nuevos productos</h2>
                <div class="product">
                    <img src="https://cdn.ofertitas.es/wp-content/uploads/tablet-xiaomi-redmi-pad-se-barata.jpg" alt="Producto nuevo">
                    <h3>Tablet Xiaomi Redmi Pad SE</h3>
                    <p>Sonido de alta calidad, batería de larga duración y diseño ergonómico. ¡Perfectos para el trabajo y el gaming!</p>
                </div>
                <div class="cta">
                    <a href="https://sitiowebconstruccion.netlify.app/" target="_blank">Ver más productos</a>
                </div>
            </div>
            <div class="footer">
                <p>¿Tienes alguna pregunta? <a href="mailto:jddca874@gmail.com">Contáctanos</a></p>
                <p>Síguenos en nuestras redes sociales para más ofertas y novedades.</p>
                <p>&copy; 2024 ByteZone. Todos los derechos reservados.</p>
            </div>
        </div>
    </body>
    </html>';
    $mail->AltBody = '==============================
                        ¡Bienvenido a ByteZone!
                        ==============================
                        Tu fuente confiable de tecnología de última generación.

                        🎉 PROMOCIÓN DE LA SEMANA
                        ------------------------------
                        - **Laptop Gamer RGB - 30% de descuento**
                        Rendimiento extremo para los más exigentes. Incluye tarjeta gráfica de última generación y almacenamiento SSD ultrarrápido.

                        🆕 NUEVOS PRODUCTOS
                        ------------------------------
                        - **Tablet Xiaomi Redmi Pad SE**
                        Sonido de alta calidad, batería de larga duración y diseño ergonómico. ¡Perfectos para el trabajo y el gaming!

                        ➡️ Descubre más productos en nuestra tienda: https://sitiowebconstruccion.netlify.app/

                        ==============================
                        ¿Tienes alguna pregunta? Escríbenos: jddca874@gmail.com
                        Síguenos en nuestras redes sociales para más ofertas y novedades.
                        © 2024 ByteZone. Todos los derechos reservados.
                        ==============================';

    $mail->send();
    header("Location: http://localhost/tienda/");
    exit();
    //echo 'Enviado Correctamente';
} catch (Exception $e) {
    echo "Error al enviar: {$mail->ErrorInfo}";
}