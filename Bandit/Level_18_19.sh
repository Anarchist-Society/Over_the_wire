# Level 18 -> Level 19: cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
# La contraseña del bandit19 se encuentra almacenada en un readme, en el directorio home de bandit18.
# El .bashrc ha sido modificado para iniciar sesión con SSH.

# Primero, hay que entender la diferencia entre "Interactive shell" y "Non-interactive shell".

# Interactive shell: Lo usa el usuario directamente en la terminal.
# - El usuario interactúa directamente.
# - El shell espera que el usuario escriba algún comando.

# Non-interactive shell: Lo usa el sistema para ejecutar comandos sin intervención del usuario.
# - No espera que el usuario escriba nada.
# - No espera ningún comando, solo ejecuta un conjunto de comandos y termina.

# Segundo, hay que entender la diferencia entre "Login shell" y "No-login shell".

# Login shell: Se refiere a cómo se inició el shell.
# - Es aquel que se inicia cuando un usuario inicia sesión en el sistema.
# - Es el primer shell que "te recibe" al entrar al sistema.
# - Lee ciertos ficheros de configuración de login.

# No-login shell:
# - Es un shell que se abre después de que el usuario haya iniciado sesión.
# - Por ejemplo abrir otra terminal o ejecutar bash dentro de un shell que ya está abierto.

# Como no podemos entrar directamente con ssh, ya que nos saco directamente, podemos ejecutar comandos con ssh sin entrar en el usuario
ssh -p 2220 bandit18@bandit.labs.overthewire ls -la # Usamos esto para mostrar el contenido

ssh -p 2220 bandit18@bandit.labs.overthewire cat readme
