# Level 23 -> Level 24: 
# Nos dice que un programa se ejecuta automáticamente en intervalos regulares desde cron, el programador de trabajos basado en el tiempo. Busque en /etc/cron.d/ la configuración y vea que comando se está ejecutando.

# NOTA: Este nivel requiere que crees tu propio primer script de shell. ¡Este es un gran paso y deberías estar orgulloso de ti mismo cuando superes este nivel!

# NOTA 2: Tenga en cuenta que su script de shell se elimina una vez ejecutado, por lo que es posible que desee conservar una copia...

# Vamos a listar el contenido de /etc/cron.d:
ls -l /etc/cron.d

# Salida:
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
# -rw-r--r-- 1 root root 396 Jan  9  2024 sysstat

# Hacemos un cat de /etc/cron.d/cronjob_bandit24:
cat /etc/cron.d/cronjob_bandit24

# Salida:
# @reboot bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
# * * * * * bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null

# Antes de mostrar si hacemos un ls -l de /usr/bin/cronjob_bandit24.sh:
ls -l /usr/bin/cronjob_bandit24.sh

# Salida:
# -rwxr-x--- 1 bandit24 bandit23 384 Oct 14 09:26 /usr/bin/cronjob_bandit24.sh
# Podemos ver que es un fichero, pertenece al usuario bandit24 y al grupo de bandit23

# Ahora vamos a mostrar el contenido de /usr/bin/cronjob_bandit24.sh:
#!/bin/bash

myname=$(whoami) # Guardamos en la variable myname el nombre de usuario que es bandit23

cd /var/spool/$myname/foo # Nos movemos al directorio de /var/spool/bandit23/foo
echo "Executing and deleting all scripts in /var/spool/$myname/foo:" # Mostramos con un echo que se ejecutará y eliminará todos los scripts en /var/spool/bandit23/foo
for i in * .*; # Bucle que recorre todos los ficheros (*) y los ficheros ocultos (.*)
do
    if [ "$i" != "." -a "$i" != ".." ]; # Excluye a los directorios . (actual) y .. (padre)
    then
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)" # Guardamos en la variable owner el propietario o creador del fichero
        if [ "${owner}" = "bandit23" ]; then # Si el propietario es bandit23
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i
    fi
done
