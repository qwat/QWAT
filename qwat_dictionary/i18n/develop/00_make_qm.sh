!/bin/bash
#debian based
lrelease extradictionary_ro.ts
lrelease extradictionary_en.ts
lrelease extradictionary_fra.ts

#fedora based
lrelease-qt4 extradictionary_ro.ts
lrelease-qt4 extradictionary_en.ts
lrelease-qt4 extradictionary_fra.ts

#copy to production plugin
cp -v *.qm ../
