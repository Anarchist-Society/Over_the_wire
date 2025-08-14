# Level 12 -> Level 13: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
# Para ello necesitamos crear un directorio en "/tmp" para poder trabajar
mkdir /tmp/elliot
cp data.txt /tmp/elliot
cd /tmp/elliot

# Como el fichero es un hexdump lo voy a revertir con:
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
