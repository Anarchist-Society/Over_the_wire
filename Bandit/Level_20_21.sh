# Level 20 -> Level 21: EeoULMCra2q0dSkYj561DX7s1CpBuOBt
# Nos dicen que hay un binario setuid en el home de bandit20.
# Este binario hace una conexión a localhost en el puerto que se especifica como argumento. 
# Para que nos de la contraseña del bandit21 tenemos que pasarle la contraseña del bandit20
# Nota: Intente conectarse a su propio demonio de red para ver si funciona como piensa.

# Primero que nada ejecutamos ./suconnect para ver que hace este binario setuid
./suconnect # This program will connect to the given port on localhost using TCP. If it receives the correct password from the other side, the next password is transmitted back.
# Lo que nos dice hasta ahora es que el suconnect es un cliente TCP, esto significa que necesitamos configurar un servidor para que nuestro cliente pueda conectarse.

# Verificamos que puertos del localhost están en uso:
nmap localhost

# para poder crear un servidor TCP lo podemos hacer con nc, para ello ejecutamos lo siguiente:
nc -l -p 1234 # Creamos un servidor en el puerto 1234

# Pero este servidor es muy básico, podemos comunicarnos a través de su entrada y salida estándar de esta forma:
nc -l -p 1234 < /etc/bandit_pass/bandit20 # Ahora tenemos un servidor escuchando en el puerto 1234 que enviará la contraseña de bandit20 a cualquier host que intente conectarse.

# Ahora que ya sabemos como crear un servidor TCP, hay que crearlo en segundo plano para que pueda estar escuchando de un cliente y poder estár usando la misma terminal desde la cual iniciamos el servidor.
# Para ello tenemos varias formas:

# La primera es:
nc -l -p 1234 < /etc/bandit_pass/bandit20
# Luego presionamos "Ctrl" + "z" -> Lo que hace esto pausar y lo envía a segundo plano. Luego ingresamo "bg" para ejecutarlo en segundo plano
bg

# Una vez hecho esto podemos ejecutar el setuid:
./connect 1234 # Esto ya nos devuleve la contraseña de bandit21

# La segunda es:
nc -l -p 1234 < /etc/bandit_pass/bandit20&
./connect 1234 # Esto ya nos devuleve la contraseña de bandit21

# La tercera es con screen:
# Mostramos las sesiones de pantalla abierta:
screen -ls

# Creamos una nueva sesión con screen:
screen -S new_session

# En esta nueva sesión creamos el servidor TCP:
nc -l -p 1234 < /etc/bandit_pass/bandit20

# Luego para volver a la otra sessión presionamos "Ctrl" + "A" + "D"
./connect 1234 # Esto ya nos devuleve la contraseña de bandit21

# La cuarta es con tmux:
# Este lo controlo más:
tmux new -s new # O simplemente:
tmux # Esto lo que hace es abrir otra terminal

nc -l -p 1234 < /etc/bandit_pass/bandit20

# Luego para volver: "Ctrl" + "b" + "d" o:
./connect 1234 # Esto ya nos devuleve la contraseña de bandit21
