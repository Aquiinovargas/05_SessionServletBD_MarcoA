<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear cuenta - BD CON SERVLETS</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilos.css">

</head>

<body>

<div class="auth-page">

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<div class="auth-alert auth-alert-error">
    <strong>Error:</strong> <%= error %>
</div>
<%
    }
%>

<div class="auth-card">

    <div class="auth-header">
        <div class="auth-icon">
            <svg viewBox="0 0 24 24"><path d="M15 12a5 5 0 10-5-5 5 5 0 005 5zm-1 2c-4.42 0-8 2.24-8 5v1h11.09A6.98 6.98 0 0116 15c0-.53.06-1.04.16-1.54A12.6 12.6 0 0014 14zm7-3v3h3v2h-3v3h-2v-3h-3v-2h3v-3z"/></svg>
        </div>
        <h2>Crear cuenta</h2>
        <p>Regístrate con tus datos</p>
    </div>

    <div class="auth-body">

        <form method="post" action="UsuarioServlet">

            <input type="hidden" name="accion" value="Registrar">

            <div class="auth-field">
                <label for="tfNombre">Nombre</label>
                <div class="auth-input-wrap">
                    <input type="text" id="tfNombre" name="tfNombre" placeholder="Nombre(s)" required>
                </div>
            </div>

            <div class="auth-row">
                <div class="auth-field">
                    <label for="tfPaterno">Apellido paterno</label>
                    <div class="auth-input-wrap">
                        <input type="text" id="tfPaterno" name="tfPaterno" placeholder="Paterno" required>
                    </div>
                </div>
                <div class="auth-field">
                    <label for="tfMaterno">Apellido materno</label>
                    <div class="auth-input-wrap">
                        <input type="text" id="tfMaterno" name="tfMaterno" placeholder="Materno" required>
                    </div>
                </div>
            </div>

            <div class="auth-field">
                <label for="tfCorreo">Correo (usuario)</label>
                <div class="auth-input-wrap">
                    <input type="email" id="tfCorreo" name="tfCorreo" placeholder="tucorreo@ejemplo.com" required>
                </div>
            </div>

            <div class="auth-field">
                <label for="tfPassword">Contraseña</label>
                <div class="auth-input-wrap">
                    <input type="password" id="tfPassword" name="tfPassword" placeholder="Crea una contraseña" required>
                    <button type="button" class="toggle-password" data-target="tfPassword" aria-label="Mostrar contraseña">
                        <svg class="eye-on" viewBox="0 0 24 24"><path d="M12 5c-7 0-10 7-10 7s3 7 10 7 10-7 10-7-3-7-10-7zm0 12a5 5 0 110-10 5 5 0 010 10zm0-2a3 3 0 100-6 3 3 0 000 6z"/></svg>
                        <svg class="eye-off" viewBox="0 0 24 24"><path d="M2.1 3.51L3.51 2.1l18.39 18.39-1.41 1.41-3.02-3.02A11.6 11.6 0 0112 19c-7 0-10-7-10-7a17.5 17.5 0 015.06-6.36L2.1 3.51zM12 7a5 5 0 014.9 6.02l-1.55-1.55a3 3 0 00-3.82-3.82L9.98 6.1A5 5 0 0112 7zm0 10a11.6 11.6 0 004.36-.84l-1.66-1.66A5 5 0 018.5 9.66L6.6 7.76A17.4 17.4 0 002 12s3 7 10 7z"/></svg>
                    </button>
                </div>
            </div>

            <input type="submit" class="auth-submit" value="Registrarme">

        </form>

        <p class="auth-footer-link">
            ¿Ya tienes cuenta? <a href="Login.jsp">Inicia sesión aquí</a>
        </p>

    </div>

</div>

</div>

<script src="auth.js"></script>

</body>
</html>
