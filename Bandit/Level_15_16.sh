# Level 15 -> Level 16: kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
# Para conseguir la contraseña del bandit 16 nos piden enviar la contraseña de bandit15 al puerto 30001 en localhost utilizando cifrado SSL/TLS
# Comprobamos si está abierto el puerto:
nc -zv localhost 30001
# -z -> busca si el puerto está abierto/ocupado, sin enviar datos
# -v -> modo "verbose" para más información de salida

# Con nmap podemos hacerlo también
nmap -p 30001 localhost # Este nos dice que el servicio se llama pago-services1

# Para enviar la contraseña con cifrado SSL/TLS no podemos usar nc, debemos usar ncat ya que tiene soporte nativo de SSL/TLS
cat /etc/bandit_pass/bandit15 | ncat --ssl localhost 30001 # Con cat
ncat --ssl localhost 30001 < /etc/bandit_pass/bandit15 # Con redireccionamiento stdin

# Otra forma de hacerlo es con openssl y s_client:
openssl s_client -connect localhost:30001
# Pegamos la contraseña de bandit15 y nos devuelve la contraseña de bandit16

# También podemos hacerlo con redireccionamiento stdin
openssl s_client -connect localhost:30001 < /etc/bandit_pass/bandit15 # Pero esto no funcionará porque al final del fichero hay un caracter de EOF
# Este caracter podemos evitarlo con
# -ign_eof -> ignora el EOF recibido en stdin y mantiene la conexión abierta
# -quiet -> reduce la salida y evita imprimir cosas innecesarias
openssl s_client -connect localhost:30001 -ign_eof < /etc/bandit_pass/bandit15
openssl s_client -connect localhost:30001 -quiet < /etc/bandit_pass/bandit15

# O con un cat
cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -ign_eof
cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -quiet
