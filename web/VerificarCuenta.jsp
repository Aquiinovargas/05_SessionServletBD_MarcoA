<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verificar cuenta - BD CON SERVLETS</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilos.css">

</head>

<body>

<div class="auth-page">

<%
    String correo = request.getParameter("correo");
    if (correo == null) {
        correo = (String) request.getAttribute("correo");
    }
    if (correo == null) {
        correo = "";
    }

    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<div class="auth-alert auth-alert-error">
    <strong>Error:</strong> <%= error %>
</div>
<%
    }

    String mensaje = (String) request.getAttribute("mensaje");
    if (mensaje != null) {
%>
<div class="auth-alert auth-alert-success">
    <%= mensaje %>
</div>
<%
    }
%>

<div class="auth-card">

    <div class="auth-header">
        <div class="auth-icon">
            <svg viewBox="0 0 24 24"><path d="M20 4H4a2 2 0 00-2 2v12a2 2 0 002 2h16a2 2 0 002-2V6a2 2 0 00-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>
        </div>
        <h2>Verifica tu cuenta</h2>
        <p>Te enviamos un código de 6 dígitos a tu correo</p>
    </div>

    <div class="auth-body">

        <form method="post" action="UsuarioServlet">

            <input type="hidden" name="accion" value="VerificarCodigo">

            <div class="auth-field">
                <label for="tfCorreo">Correo</label>
                <div class="auth-input-wrap">
                    <input type="email" id="tfCorreo" name="tfCorreo" placeholder="tucorreo@ejemplo.com" value="<%= correo %>" required>
                </div>
            </div>

            <div class="auth-field">
                <label for="tfCodigo">Código de verificación</label>
                <div class="auth-input-wrap">
                    <input type="text" id="tfCodigo" name="tfCodigo" placeholder="123456" maxlength="6" required>
                </div>
            </div>

            <input type="submit" class="auth-submit" value="Verificar">

        </form>

        <form method="post" action="UsuarioServlet" style="margin-top:8px;">

            <input type="hidden" name="accion" value="ReenviarCodigo">
            <input type="hidden" name="tfCorreo" value="<%= correo %>">

            <button type="submit" class="auth-submit" style="background:transparent;border:1px solid #ccc;color:#333;">
                Reenviar código
            </button>

        </form>

        <p class="auth-footer-link">
            <a href="Login.jsp">Volver a inicio de sesión</a>
        </p>

    </div>

</div>

</div>

</body>
</html>
