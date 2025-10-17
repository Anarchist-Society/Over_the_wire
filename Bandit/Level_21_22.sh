# Level 21 -> Level 22: tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q
# Nos dice que un programa se ejecuta automáticamente en intervalos regulares desde cron.
# También nos dice que busquemos en /etc/cron.d/ la configuración y vea qué comando se está ejecutando.
# Si hacemos mostramos el contenido de /etc/cron.d/, la salida será algo como esta:

ls -la
# bandit21@bandit:~$ ls -la /etc/cron.d
# total 60
# drwxr-xr-x   2 root root  4096 Oct 14 09:29 .
# drwxr-xr-x 128 root root 12288 Oct 14 10:40 ..
# -r--r-----   1 root root    47 Oct 14 09:26 behemoth4_cleanup
# -rw-r--r--   1 root root   123 Oct 14 09:19 clean_tmp
# -rw-r--r--   1 root root   120 Oct 14 09:26 cronjob_bandit22
# -rw-r--r--   1 root root   122 Oct 14 09:26 cronjob_bandit23
# -rw-r--r--   1 root root   120 Oct 14 09:26 cronjob_bandit24
# -rw-r--r--   1 root root   201 Apr  8  2024 e2scrub_all
# -r--r-----   1 root root    48 Oct 14 09:27 leviathan5_cleanup
# -rw-------   1 root root   138 Oct 14 09:28 manpage3_resetpw_job
# -rwx------   1 root root    52 Oct 14 09:29 otw-tmp-dir
# -rw-r--r--   1 root root   102 Mar 31  2024 .placeholder
# -rw-r--r--   1 root root   396 Jan  9  2024 sysstat

# Aquí nos fijamos que hay un cronjob del sistema cuyo nombre es cronjob_bandit22, lo analizamos ya que tenemos los permisos suficientes para lectura:
cat /etc/cron.d/cronjob_bandit22
# @reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
# * * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null

# Tenemos estas dos tareas, ambas pertenecen al usuario22, ambas ejecutan el mismo script y los errores se van a /dev/null, pero con la única diferencia que la primera se ejecuta tras reinciar el sistema y la segunda se ejecuta a cada minuto

# Vamos a ver el contenido del script que se ejecuta:
cat /usr/bin/cronjob_bandit22.sh
#!/bin/bash
# chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv -> Le otorga los permisos suficientes para poder acceder al contenido de /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
# cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv -> Después envía la contraseña de bandit22 a este fichero, por lo que si comprobamos el contenido de este fichero y ya tenemos la contraseña de bandit22
cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv # Esto ya nos devuelve la contraseña
