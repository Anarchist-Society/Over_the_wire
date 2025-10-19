# Level 22 -> Level 23: 8ca319486bfbbc3663ea0fbe81326349
# Nos dice que un programa se ejecuta automáticamente en intervalos regulares desde cron, el programador de trabajos basado en el tiempo.

# NOTA: Mirar scripts de shell escritos por otras personas es una habilidad muy útil. El guión de este nivel se ha hecho intencionadamente fácil de leer. Si tiene problemas para entender lo que hace, intente ejecutarlo para ver la información de depuración que imprime.

# También nos dice que busquemos en /etc/cron.d/ la configuración y vea qué comando se está ejecutando.
ls -l /etc/cron.d/

# La salida de esto es la siguiente:
# total 40
# -r--r----- 1 root root  47 Oct 14 09:26 behemoth4_cleanup
# -rw-r--r-- 1 root root 123 Oct 14 09:19 clean_tmp
# -rw-r--r-- 1 root root 120 Oct 14 09:26 cronjob_bandit22
# -rw-r--r-- 1 root root 122 Oct 14 09:26 cronjob_bandit23
# -rw-r--r-- 1 root root 120 Oct 14 09:26 cronjob_bandit24
# -rw-r--r-- 1 root root 201 Apr  8  2024 e2scrub_all
# -r--r----- 1 root root  48 Oct 14 09:27 leviathan5_cleanup
# -rw------- 1 root root 138 Oct 14 09:28 manpage3_resetpw_job
# -rwx------ 1 root root  52 Oct 14 09:29 otw-tmp-dir
# -rw-r--r-- 1 root root 396 Jan  9  2024 sysstat#

# Podemos ver que tenemos un fichero llamado cronjob_bandit23 con los permisos suficientes para poder leerlo:
cat /etc/cron.d/cronjob_bandit23
#
# Salida:
# @reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
# * * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null

# Ahora vamos a mostrar el contenido de /usr/bin/cronjob_bandit23.sh:
#!/bin/bash

# myname=$(whoami)
# mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
 
# echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
 
# cat /etc/bandit_pass/$myname > /tmp/$mytarget

# Vamos a analizar el contenido del siguiente script:
myname=$(whoami) # Guardamos en la variable myname el nombre del usuario actual
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
# En esta variable guardamos el md5sum de echo I am user $myname y luego con cut recortamos hasta el primer espacio y bloque
echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget" # Aquí hacemos hay un echo en el cual nos indican que está copiando la contraseña de /etc/bandit_pass/nombre_usuario en  /tmp/contenido_de_target
cat /etc/bandit_pass/$myname > /tmp/$mytarget

# Por lo que para recuperar la contraseña de Bandit23 hacemos lo siguiente:
echo I am user bandit23 | md5sum | cut -d ' ' -f 1

# Salida:
# 8ca319486bfbbc3663ea0fbe81326349 -> Con esto ya podemos recuperar el contenido de mytarget que es donde se ha copiado la contraseña de Bandit23

# Ahora hacemos un mostramos el contenido en el fichero donde se ha copiado la contraseña de bandit23:
cat /tmp/8ca319486bfbbc3663ea0fbe81326349 # Y eso ya nos devuelve la contaseña
