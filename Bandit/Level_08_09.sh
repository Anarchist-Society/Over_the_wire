# Level 8 -> Level 9: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
sort data.txt | uniq --count | grep "^ *1 "
sort data.txt | uniq --unique
sort data.txt | uniq -u
# Con sort ordenamos el texto que está en el fichero y con uniq buscamos la única coincidencia (en este caso es la contraseña)
