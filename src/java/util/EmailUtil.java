package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil 
{

    private static String remitenteCorreo;
    private static String remitenteClave;

    static 
    {

        try (InputStream in = EmailUtil.class.getClassLoader().getResourceAsStream("correo.properties")) 
        {

            if (in == null) 
            {
                throw new RuntimeException(
                        "No se encontro correo.properties en el classpath. "
                        + "Copia correo.properties.example a correo.properties (dentro de src/java) y pon tus datos reales.");
            }

            Properties props = new Properties();
            props.load(in);

            remitenteCorreo = props.getProperty("mail.user");
            remitenteClave = props.getProperty("mail.password");

        }
        catch (IOException e) 
        {
            throw new RuntimeException("Error al leer correo.properties", e);
        }

    }

    public static void enviarCodigoVerificacion(String destinatario, String nombre, String codigo) throws MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() 
        {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(remitenteCorreo, remitenteClave);
            }
        });

        Message mensaje = new MimeMessage(session);
        mensaje.setFrom(new InternetAddress(remitenteCorreo));
        mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
        mensaje.setSubject("Tu codigo de verificacion");

        String cuerpo = "Hola " + nombre + ",\n\n"
                + "Tu codigo de verificacion es: " + codigo + "\n\n"
                + "Ingresa este codigo en la pagina para activar tu cuenta.\n\n"
                + "Si tu no creaste esta cuenta, ignora este correo.";

        mensaje.setText(cuerpo);

        Transport.send(mensaje);

    }

}
