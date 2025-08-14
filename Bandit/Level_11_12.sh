# Level 11 -> Level 12: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
# Necesito usar tr ya que tiene un cifrado césar de 13 posiciones
# tr traduce o elimina caracteres
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
# Lo que hace es que cada letra desde la A-Z y desde la a-z los cambie por N-ZA-M y n-za-m
# Por lo que la letra A pasa a ser N, B -> O, N -> A...
