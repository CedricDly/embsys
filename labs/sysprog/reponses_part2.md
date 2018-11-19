##### Exercice 1 : GDB et fichier core #####


### Question 1 ###

Au bout de quelques secondes, un SegFault se produit, dû à l'accès à un emplacement mémoire non autorisé (non alloué)

### Question 2 ###

code erreur reçu : 139 -> correspond à un SIGSEGV
pour vérifier le signal reçu:
    - "echo $?" pour connaitre le code erreur
    - "kill -l [code erreur]" pour connaitre le signal associé au code erreur

### Question 3 ###

L'erreur se situe lors de l'exécution de l'instruction "write_vtg(ptmx.fd);". Selon moi, la taille de ce que l'on écrit est limitée et on le dépasse à un moment donné, d'où le plantage.

### Question 4 ###

En mode interactif, une erreur apparaît : une librairie partagée ne peut pas être ouverte.

### Question 5 ###

La commande ldd permet d'afficher les shared objects requis par un exécutable pour fonctionner. Il permet de visualiser le chemin de ses librairies, quand celles-ci sont trouvées.

### Question 6 ###

Ici, le problème est qu'en lançant la commande "sh run.sh", un shell est ouvert pour l'exécution du programme, puis fermé. Il n'y a donc pas de "persistance" des variables d'environnement. Ainsi, lors de l'exécution via gdb, il est impossible de trouver les Shared Objects.
Une solution est d'utiliser ". ./run.sh" afin de charger les librairies partagées dans le shell dans lequel est lancé gdb ensuite.

### Question 7 ###

"step" parcourt le programme de lignes en lignes, tandis que "next" parcourt le programme de scope en scope

### Question 8 ###

- Equipements ne pouvant pas recevoir de périphériques
- Equipements distants
- Centralisation d'équipements


##### Exercice 2 : LD_PRELOAD et sigaction #####




