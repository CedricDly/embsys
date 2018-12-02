Exercice 1 : Multiplexage
--------------------------


Question 1
===========


Il me semble que PTTY signifie "Pseudo-TTY". Ici, cela permet de simuler le comportement d'un GPS réel.


Question 2
============

- il n'y a pas de "signal handler"
- taille du buffer codée en dur


Question 3
============

trame GPRMC ou GPGGA, 1er champ de la trame (format : hhmmss.sss)


Question 4
============

ouvrir  : open
écouter : select
lire    : read
fermer  : close

type de programmation : multiplexage


Questions 5
============

cf code


Question 6 et 7
=============

L'affichage du PID du père se fait facielement. Néanmoins, pour l'affichage de la date, ainsi que l'écriture des logs dans un autre fichier, je pense qu'il faut modifier le fichier */etc/syslog.conf* et utiliser les bonnes options (ce que nous n'avons pas réussi à faire).



Exercice 2 : Mémoire partagée et sémaphore
-------------------------------------------


Question 1
============

Tout d'abord, le parmaètre *lock* semble être un sémaphore. Quant à *shm_writer*, cela semble être un espace mémoire partagé


Question 2
============

Pour avoir une représentation du segement de mémoire partagée, il suffit de faire un *ls /dev/shm*


Question 3
============

PTTY GPS                            SHM_Writer
.............                       .............
.           .                       .           .
.           .                       .           .
.           .                       .           .
.           .                       .           .
.           .                       .           .
.           .                       .           .
.............                       .............
.  Memoire  .  --->POSIX Shared<--- .  Memoire  .
.  Partagee .        Memory         . Partagee  .
.............                       .............


Question 4
============

hndinit  : initialise une structure HANDLERS
sem_open : initialise et ouvre un sémaphore
shm_open : initialise et ouvre un segment de mémoire partagée
mmap     : permet de "maper" l'espace de mémoire virtuelle du processus qui sera associé au segment de mémoire partagée POSIX ouvert précédemment


Question 5
============

shm_open utilise le parametre *myshm* passé en ligne de commande.


Question 6
============

flag indiquant la créatin : O_CREAT


Question 7
============

cf code


Question 8
============

Pour compiler correctement, j'ai dû modifier la ligne 4 de *handler.h*. Je ne sais pas si c'est normal, je pense que c'est dû au fait que mon MakeFile n'est pas correctement rédigé.


Question 9
============

Evolution de la variable time :
- le temps a l'air d'être exprimé en secondes, car la valant est incrémentée de 4 toutes les 4 secondes.
- Aun lancement, on passe de 0 à une valeur autour de 65000. (65000 sec ~= 18h, quel est le sens de cette valeur ?)

Sinon, j'imagine que shm_writer se contente de récupérer la valeur de temps du simulateur GPS, et qu'il l'écrit dans la zone de mémoire partagée. Shm_reader, quant à lui, lit cette valeur écrite dans la mémoire partagée afin de l'afficher dans la console.


Question 10
============

Une variable globale peut-être appelée par n'importe quelle fonction présente dans le programme où elle est déclarée.
Pour déclarer une variable globale, il faut la déclarer en début de fichier, à l'extérieur de toutes les fonctions.

Question 11 et 12
============

cf code


Question 13
============

Observation : plus rien ne s'affiche dans la console.
Pourquoi : La modification fait que le sémaphore est initialisé avec la valeur 0. Cela crée donc un blocage, puisque ni shm_reader, ni shm_writer ne peuvent entrer dans leur section critique, et aucune autre fonction ne permet d'incrémenter le sémaphore.


Question 14
============

Cf code


Question 15
============

Du côté de shm_reader, la fonction *hndclose* est moins longue et appelle moins de fonctions. Etant donné que la structure *handlers* est différente entre shm_reader et shm_writer, je dirais qu'il est plus facile de fermer les handlers de shm_reader, mais je ne vois pas réellement pourquoi.
