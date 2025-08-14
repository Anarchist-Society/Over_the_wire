# level 1 -> level 2: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
# La contraseña está en un fichero que empieza por "-" y para ello tenemos estos dos métodos
cat < -     # (El shell redirige stdin desde el fichero)
cat ./-     # (Usa ruta explícita para evitar confusión)
