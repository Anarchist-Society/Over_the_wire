# level 0 -> level 1: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
cat readme

# level 1 -> level 2: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
cat < -     # (El shell redirige stdin desde el fichero)
cat ./-     # (Usa ruta explícita para evitar confusión)

# level 2 -> level 3: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
# cat spaces\ in\ this\ filename

# level 3 -> level 4: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
find ~ -name ".*" -type f
cd inhere
ls -la ...Hiding-From-You
cat ...Hiding-From-You

# level 4 -> level 5: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
cd inhere
find ./*
cat ./-file07

# level 5 -> level 6: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
find /home/bandit5/inhere/ -type f -size 1033c ! -executable -exec file '{}' \; | grep "ASCII text"
# -exec -> Por cada fichero quen encuentre, ejecuta este comando
# {} -> El fichero que encontró
# \; -> Termina el exec

# level 6 -> level 7: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
find / -user 11007 -group 11006 -size 33c | grep "password"
find / -user bandit7 -group bandit6 -size 33c | grep "password"

# level 7 -> level 8: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
cat data.txt | grep "millionth"
grep "millionth" data.txt

# level 8 -> level 9: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
sort data.txt | uniq --count | grep "^ *1 "
sort data.txt | uniq --unique

# level 9 -> level 10: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
# Imprime secuencia de caracteres en ficheros
strings data.txt | grep "======"

# level 10 -> level 11: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
# base64 sirve para convertir datos binarios a ASCII y viceversa
base64 --decode data.txt 

# level 11 -> level 12: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
# Necesito usar tr ya que tiene un cifrado césar de 13 posiciones
# rt traduce o elimina caracteres
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'

# level 12 -> level 13: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
# Para ello necesitamos crear un directorio en "/tmp" para poder trabajar
mkdir /tmp/elliot
cp data.txt /tmp/elliot
cd /tmp/elliot
xxd -r data.txt
xxd --revert data.txt >> new_data_revert.txt
file new_data_revert.txt # Con esto podremos ver que tipo de fichero, nos dice que está comprimido con gzip
mv new_data_revert.txt new_data_revert.gz
gzip -d new_data_revert.gz
gzip --decompress new_data_revert.gz
gzip --uncompress new_data_revert.gz

file new_data_revert # Ahora nos dice que está comprimido con bzip2
mv new_data_revert new_data_revert.bz2
bzip2 -d new_data_revert.bz2
bzip2 --decompress new_data_revert.bz2

file new_data_revert # Ahora nos dice que está comprimido con gzip
mv new_data_revert.txt new_data_revert.gz
gzip -d new_data_revert.gz

file new_data_revert # Ahora nos dice que es un fichero tar
mv new_data_revert new_data_revert.tar
tar -xf new_data_revert.tar
tar --extract --file new_data_revert.tar

file data5.bin # Nos vuelve a decir que es un fichero tar
mv data5.bin data5.tar
tar -xf data5.tar

file data6.bin # Ahora nos dice que esta comprimido con bzip2
mv data6.bin data6.bz2
bzip2 -d data6.bz2

file data6 # Ahora nos que un fichero tar
mv data6 data6.tar
tar -xf data6.tar

file data8.bin # Comprimido con gzip
mv data8.bin data8.gz
gzip -f data8.gz

cat data8 # Esta ya es la contraseña

# level 13 -> level 14: MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
# Para ello nos dan una clave privada para autenticarnos en el usuario bandit14 mediante ssh
# Hacemoso esto porque la contraseña está en /etc/bandit_pass/bandit14 y solo puede ser leído por el bandit14
ssh -p 2220 -i ~/sshkey.private bandit14@bandit.labs.overthewire.org # Con el -i se identifica la clave privada
cat /etc/bandit_pass/bandit14

