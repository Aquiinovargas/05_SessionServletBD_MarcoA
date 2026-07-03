// Alterna visibilidad de los campos de contraseña que tengan boton .toggle-password
document.addEventListener('DOMContentLoaded', function () {

    var botones = document.querySelectorAll('.toggle-password');

    botones.forEach(function (btn) {

        btn.addEventListener('click', function () {

            var targetId = btn.getAttribute('data-target');
            var input = document.getElementById(targetId);

            if (!input) {
                return;
            }

            var mostrando = input.type === 'text';

            input.type = mostrando ? 'password' : 'text';
            btn.classList.toggle('showing', !mostrando);
            btn.setAttribute('aria-label', mostrando ? 'Mostrar contraseña' : 'Ocultar contraseña');

        });

    });

});
