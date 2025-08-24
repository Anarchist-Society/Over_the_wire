# Level 16 -> Level 17:
# La contraseña para el siguiente nivel se puede conseguir enviando la contraseña de bandit16 a un  puerto en localhost en el rango 31000 a 32000.
# Primero de todo hay que descubrir qué puerto tiene un servidor escuchando.
nc -zv localhost 31000-32000 2>&1 | grep succeeded
nv -zvn 127.0.0.1 31000-32000 2>&1 | grep succeeded
nmap -p 31000-32000 localhost

# Después hay que descubrir cuál de ellos tienen SSL/TLS y cuáles no.
# Detección de servicio/versión con nmap:
nmap -sV --version-light -p 31046,31518,31691,31790,31960 localhost
nmap -sV --version-light -p 31000-32000 localhost

# Para acelerar el proceso:
nmap -sV --version-light -T4 -p 31000-32000 localhost

# Otra forma:
nmap -A -T4 -p 31000-32000 localhost

# Enviamos la constraseña del nivel actual
# Con ncat:
cat /etc/bandit_pass/bandit16 | ncat --ssl localhost 31790 # Con cat
ncat --ssl localhost 31790 < /etc/bandit_pass/bandit16 # Con redireccionamiento stdin

# Con openssl y s_client:
openssl s_client -connect localhost:31790 -ign_eof < /etc/bandit_pass/bandit16 # Con redireccionamiento stdin
openssl s_client -connect localhost:31790 -quiet < /etc/bandit_pass/bandit16 # Con redireccionamiento stdin

cat /etc/bandit_pass/bandit16 | openssl s_client -connect localhost:31790 -ign_eof
cat /etc/bandit_pass/bandit16 | openssl s_client -connect localhost:31790 -quiet

# El resultado de todo esto será una SSH private key para conectarnos a bandit17, por lo que tenemos que almacenarla primero.
# Yo lo compiaré en mi sistema local y luego le pondré los permisos necesarios
chmod 600 pvt.key
ssh -p 2220 -i pvt.key bandit17@bandit.labs.overthewire.org
