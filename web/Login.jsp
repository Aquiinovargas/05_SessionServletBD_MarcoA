<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión - BD CON SERVLETS</title>

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

    if ("1".equals(request.getParameter("registrado"))) {
%>
<div class="auth-alert auth-alert-success">
    Cuenta creada correctamente. Ya puedes iniciar sesión.
</div>
<%
    }

    if ("1".equals(request.getParameter("verificado"))) {
%>
<div class="auth-alert auth-alert-success">
    Cuenta verificada correctamente. Ya puedes iniciar sesión.
</div>
<%
    }
%>

<div class="auth-card">

    <div class="auth-header">
        <div class="auth-icon">
            <svg viewBox="0 0 24 24"><path d="M12 2a5 5 0 015 5v3h1a2 2 0 012 2v8a2 2 0 01-2 2H6a2 2 0 01-2-2v-8a2 2 0 012-2h1V7a5 5 0 015-5zm0 2a3 3 0 00-3 3v3h6V7a3 3 0 00-3-3zm0 10a1.5 1.5 0 00-1.5 1.5c0 .65.4 1.2 1 1.4V18a.5.5 0 001 0v-1.1c.6-.2 1-.75 1-1.4A1.5 1.5 0 0012 14z"/></svg>
        </div>
        <h2>Bienvenido de vuelta</h2>
        <p>Inicia sesión para continuar</p>
    </div>

    <div class="auth-body">

        <form method="post" action="UsuarioServlet">

            <input type="hidden" name="accion" value="Login">

            <div class="auth-field">
                <label for="tfCorreo">Correo</label>
                <div class="auth-input-wrap">
                    <input type="email" id="tfCorreo" name="tfCorreo" placeholder="tucorreo@ejemplo.com" required>
                </div>
            </div>

            <div class="auth-field">
                <label for="tfPassword">Contraseña</label>
                <div class="auth-input-wrap">
                    <input type="password" id="tfPassword" name="tfPassword" placeholder="Tu contraseña" required>
                    <button type="button" class="toggle-password" data-target="tfPassword" aria-label="Mostrar contraseña">
                        <svg class="eye-on" viewBox="0 0 24 24"><path d="M12 5c-7 0-10 7-10 7s3 7 10 7 10-7 10-7-3-7-10-7zm0 12a5 5 0 110-10 5 5 0 010 10zm0-2a3 3 0 100-6 3 3 0 000 6z"/></svg>
                        <svg class="eye-off" viewBox="0 0 24 24"><path d="M2.1 3.51L3.51 2.1l18.39 18.39-1.41 1.41-3.02-3.02A11.6 11.6 0 0112 19c-7 0-10-7-10-7a17.5 17.5 0 015.06-6.36L2.1 3.51zM12 7a5 5 0 014.9 6.02l-1.55-1.55a3 3 0 00-3.82-3.82L9.98 6.1A5 5 0 0112 7zm0 10a11.6 11.6 0 004.36-.84l-1.66-1.66A5 5 0 018.5 9.66L6.6 7.76A17.4 17.4 0 002 12s3 7 10 7z"/></svg>
                    </button>
                </div>
            </div>

            <input type="submit" class="auth-submit" value="Entrar">

        </form>

        <p class="auth-footer-link">
            ¿No tienes cuenta? <a href="Registro.jsp">Regístrate aquí</a>
        </p>

    </div>

</div>

</div>

<script src="auth.js"></script>

</body>
</html>
