# level 6 -> level 7: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
find / -user 11007 -group 11006 -size 33c | grep "password"
find / -user bandit7 -group bandit6 -size 33c | grep "password"
# / ->  buscamos en todo el servidor
# -user bandit7 -> que el usuario bandit7 es el propietario del fichero
# -group bandit6 -> que pertenece al grupo bandit6
# -size 33c -> tamaño de 33 bytes
