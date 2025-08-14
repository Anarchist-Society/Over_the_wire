# level 13 -> level 14: MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
# Para ello nos dan una clave privada para autenticarnos en el usuario bandit14 mediante ssh
# Hacemoso esto porque la contraseña está en /etc/bandit_pass/bandit14 y solo puede ser leído por el bandit14
ssh -p 2220 -i ~/sshkey.private bandit14@bandit.labs.overthewire.org # Con el -i se identifica la clave privada
cat /etc/bandit_pass/bandit14

# level 14 -> level 15: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
# Podemos comprobar con nmap que servicio está en el puerto 30000
nmap -p 30000 localhost # El cual nos indica que el servicio que corre es ndmps (Protocolo de gestión de datos de red)
telnet localhost 30000
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS # Con esto ya te dá la contraseña

# Mi manera
echo MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS | nc 127.0.0.1 30000
echo MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS | nc localhost 30000

# Otra forma de hacerlo
nc localhost 30000
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS # Y con esto ya te dá la contraseña
