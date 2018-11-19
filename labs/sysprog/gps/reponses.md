### Question 1 ###

Un Makefile est un fichier qui va permettre au compilateur de savoir quels sont les fichiers à compiler ainsi que l'ordre de compilation permettant la génération d'un exécutable. Une différence notable entre un script et un makefile est que le makefile ne compile les fichiers que si c'est necessaire.
Make est tou simplement le logiciel qui construit l'exécutable en suivant les "instructions" presentes dans le makefile

### Question 2 ###

Le compilateur utilisé ici est gcc

### Question 3 ###

Une librairie partagée, ou "shared object", est une librairie qui est liée au programme qui l'utilise lors de son exécution. Elle n'est chargée qu'une fois en mémoire, même si elle est utilisée par plusieurs proigrammes. De plus, si la librairie partagée est modifiée, les programmes l'utilisant n'ont pas besoin d'être recompilés.

### Question 4 ###

cf hello_world.c
ligne de compilation : gcc -Wall -o hello_world hello_world.c

### Question 5 ###

Pour compiler un shared object, il faut utiliser la commande :
gcc -Wall -o hello_world.so -shared hello_world.o
