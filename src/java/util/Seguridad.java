package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * Utilidad para no guardar contraseñas en texto plano.
 * Convierte la contraseña en un hash SHA-256 (irreversible).
 *
 * @author aquinojr
 */
public class Seguridad {

    public static String hashPassword(String password) {

        try {

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(password.getBytes("UTF-8"));

            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();

        } catch (NoSuchAlgorithmException | java.io.UnsupportedEncodingException e) {
            throw new RuntimeException("Error al generar el hash de la contraseña", e);
        }

    }

    /**
     * Genera un codigo numerico de 6 digitos para verificar la cuenta por correo.
     */
    public static String generarCodigo() {

        SecureRandom random = new SecureRandom();
        int numero = 100000 + random.nextInt(900000); // siempre 6 digitos: 100000-999999
        return String.valueOf(numero);

    }

}
