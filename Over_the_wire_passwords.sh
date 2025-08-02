level 0 -> level 1: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
cat readme

level 1 -> level 2: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
cat < -     # (El shell redirige stdin desde el fichero)
cat ./-     # (Usa ruta explícita para evitar confusión)

level 2 -> level 3: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
cat spaces\ in\ this\ filename

level 3 -> level 4: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
find ~ -name ".*" -type f
cd inhere
ls -la ...Hiding-From-You
cat ...Hiding-From-You

level 4 -> level 5: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
cd inhere
find ./*
cat ./-file07

level 5 -> level 6: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
find /home/bandit5/inhere/ -type f -size 1033c ! -executable -exec file '{}' \; | grep "ASCII text"
-exec -> Por cada fichero quen encuentre, ejecuta este comando
{} -> El fichero que encontró
\; -> Termina el exec

level 6 -> level 7: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
find / -user 11007 -group 11006 -size 33c | grep "password"
find / -user bandit7 -group bandit6 -size 33c | grep "password"

level 7 -> level 8: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
cat data.txt | grep "millionth"
grep "millionth" data.txt

level 8 -> level 9: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
sort data.txt | uniq --count | grep "^ *1 "
sort data.txt | uniq --unique

level 9 -> level 10: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
strings data.txt | grep "======"

level 10 -> level 11: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
base64 --decode data.txt
