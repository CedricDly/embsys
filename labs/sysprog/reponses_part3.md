# Exercice 1 : Multiplexage


## Question 1

Il me semble que PTTY signifie "Pseudo-TTY". Ici, cela permet de simuler le comportement d'un GPS réel.


## Question 2

- il n'y a pas de "signal handler"
- taille du buffer codée en dur


## Question 3

trame GPRMC ou GPGGA, 1er champ de la trame (format : hhmmss.sss)


## Question 4

ouvrir  : open
écouter : select
lire    : read
fermer  : close

type de programmation : multiplexage


## Questions 5, 6 et 7

cf code


# Exercice 2 : Mémoire partagée et sémaphore


## Question 1

Tout d'abord, le parmaètre *lock* semble être un sémaphore. Quant à *shm_writer*, cela semble être un espace mémoire partagé


## Question 2

Pour avoir une représentation du segement de mémoire partagée, il suffit de faire un *ls /dev/shm*


## Question 3

PTTY GPS                            SHM_Writer
-------------                       -------------
-           -                       -           -
-           -                       -           -
-           -                       -           -
-           -                       -           -
-           -                       -           -
-           -                       -           -
-------------                       -------------
-  Memoire  -  --->POSIX Shared<--- -  Memoire  -
-  Partagee -        Memory         - Partagee  -
-------------                       -------------


## Question 4

hndinit  : initialise une structure HANDLERS
sem_open : initialise et ouvre un sémaphore
shm_open : initialise et ouvre un segment de mémoire partagée
mmap     : permet de "maper" l'espace de mémoire virtuelle du processus qui sera associé au segment de mémoire partagée POSIX ouvert précédemment


##Question 5

shm_open utilise le parametre *myshm* passé en ligne de commande.


## Question 6

flag indiquant la créatin : O_CREAT


## Question 7

