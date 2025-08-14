# Level 5 -> Level 6: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
find /home/bandit5/inhere/ -type f -size 1033c ! -executable -exec file '{}' \; | grep "ASCII text"
# /home/bandit5/inhere ->  busca en esa ruta
# -type f -> que sea un fichero
# -size 1033c -> que el tamaño sea de 1033 bytes
# ! -executable -> que no sea un ejecutable
# -exec file -> por cada fichero que encuentre, ejecuta este comando
# {} -> El fichero que encontró
# \; -> Termina el exec
# | grep "ASCII text" -> filtramos que sea "ASCII text"

cat inhere/maybehere07/.file2

# Otra forma es con du, lo que hace du es que estima el uso de espacio de ficheros
du -a -b | grep 1033
du --all --bytes | grep 1033
# -a -> muestra el resultado para todos los ficheros, no solo para los directorios
# -b -> filtra por bytes
