# Level 13 -> Level 14: MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
# Para ello nos dan una clave privada para autenticarnos en el usuario bandit14 mediante ssh
# Hacemos esto porque la contraseña está en /etc/bandit_pass/bandit14 y solo puede ser leído por el bandit14
ssh -p 2220 -i ~/sshkey.private bandit14@bandit.labs.overthewire.org # Con el -i se identifica la clave privada
cat /etc/bandit_pass/bandit14
