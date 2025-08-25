# Level 19 -> Level 20: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
# Nos dicen que para obtener acceso al siguiente nivel, debemos usar el binario setuid en el home de bandit19.
# Ejecutamos bandit20-do: ./bandit20-do
# Salida: "Run a command as another user, Example: ./bandit20-do id".

# Ejecutamos bandit20-do id
# Salida: uid=11019(bandit19) gid=11019(bandit19) euid=11020(bandit20) groups=11019(bandit19)
# Lo que nos dice esta salida es que el uid del usuario que ejecuta el comando es 11019(bandit19), que el gid del usuario que ejecuta el comando es 11019(bandit19).
# Pero lo que importa es el euid (Effective User ID, identificador de usuario efectivo), es el identificador de usuario que el sistema utiliza para comprobar los permisos de acceso de un proceso, es decir, actúa como si fuera el usuario bandit20.

# Por lo tanto para acceder a la contraseña de bandit20, nos dicen que está en /etc/bandit_pass/bandit20, pero este fichero solo tiene permisos de lectura para el usuario bandit20, por lo que:

./bandit20-do cat /etc/bandit_pass/bandit20 # Esto nos devuelve la contraseña de bandit20
