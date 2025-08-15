# Level 14 -> Level 15: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
# Podemos comprobar con nmap que servicio está en el puerto 30000
nmap localhost # Verifica todos los puertos
nmap -p 30000 localhost # -p -> indica el puerto
# El cual nos indica que el servicio que corre es ndmps (Protocolo de gestión de datos de red)
telnet localhost 30000
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS # Con esto ya te dá la contraseña

# Mi manera
echo MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS | nc 127.0.0.1 30000
echo MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS | nc localhost 30000

# Otra forma de hacerlo
nc localhost 30000
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS # Y con esto ya te dá la contraseña

# Otra dos formas de hacerlo, como sabemos del ejercicio anterior, la contraseña de bandit14 está en /etc/bandit_pass/bandit14:
nc localhost 30000 < /etc/bandit_pass/bandit14
cat /etc/bandit_pass/bandit14 | nc localhost 30000
