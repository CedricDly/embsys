Partie 1: Construction d'OS avec Buildroot et chaine de cross-compilation
-------------------------------------------


Question 1
==========

- configs/embsys_defconfig : fichier de configuration pour BuildRoot, qui sera utilisé lors du make de Buildroot. Généré automatiquement
-                            Structure : contient les modules qui seront installés, et les modules non installés sont commentés via un *#*

- busybox.config :  fichier de configuration Busybox, qui sera utilisé lors du make. Il est généré automatiquement.
-                   Structure : contient les modules qui seront installés, et les modules non installés sont commentés via un *#*

- users.table : table des utiisateurs du buildroot ciblé / La syntaxe présente le nom d'utilisateur, le groupe auquel il appartient, le répertoire personnel et je ne sais pas quelle est le but du '/bin/bash'.


Question 2
==========

Pur la configuration d'une RaspberryPi 3 32 bits, le fichier à utiliser est *config/raspberrypi3_defconfig*


Question 3
==========

Le dossier *package/* contient les règles de compilation pour les services qui seront utilisés dans le buildroot


Question 4
==========

Dans le dossier *package/openssh*, il y a :
    - les patches correctifs de l'utilitaire (fichiers .patch)
    - un fichier de configuration pour les autotools (Config.in) ainsi qu'un MakeFile pour ces mêmes autotools (openssh.mk)
    - un hash permettant d'assurer l'intégrité de l'utilitaire openssh (openssh.hash)
    - un script de lancement du service opensshd (S50sshd)
    - un fichier de configuration du service openSSH (sshd.service)


Question 5
==========

Le dossier *board/* contient l'ensemble des cibles disponibles sur lesquelles on peut build notre OS


Question 6
==========

la commande *make embsys_defconfig* permet de build suivant la configuration par défaut.


Question 7
==========


- l'architecture matérielle cible : ARM
- le CPU ciblé : cortex-A53
- l'ABI (en rappellant la signification de celle choisie): EABIhf (Embeeded Application Binary Interface - hardfloat : part du principe que le CPU cible ne possède pas de FPU)
- la librairie C utilisée : uClibc-ng
- la version du cross-compilateur : gcc 6.x
- la version du kernel : custom kernel, venant de git : https://github.com/raspberrypi/linux.git


Question 8
==========

Le paquet openssh est bien sélectionné dans les *target packages*, donc il sera compilé et disponible dans l'OS cible. De plus, on peut le voir dans le fichier de configuration *embsys_defconfig* grace à la ligne : BR2_PACKAGE_OPENSSH=y


Question 9
==========

Buildroot est un outil qui facilite et autorise la compilation de systèmes d'exploitation destinés à l'embarqué, composé d'une chaine de compilation automtisée et d'un ensemble de Makefile.  *busybox-menuconfig* permet d'accéder à l'interface de configuration de busybox, permettant de définir de nombreuses options telles que : la plateforme cible, le cross-compiler, les paquets à installer, etc...


Question 10
===========

Le dossier *output/host* contient une "image" du système de fichiers qui sera sur la cible. le binaire *output/host/usr/bin/arm-linux-gcc* est le binaire du compilateur qui sera disponible sur la plateforme cible.


Question 11
===========

file est une commande UNIX qui permet de déterminer le type d'un fichier. Ici, le résultat obtenu nous indique que le fichier a été compilé pour être utilisable sur mon architecture CPU (x86) et non pas sur l'architecture cible.
En exécutant *./hw*, un hello world s'affiche dans la console !


Question 12
===========

Dans la cas présent, on a compilé le fichier helloworld.c avec le comoilateur qui sera disponible sur l'architecture cible, donc le binaire est destiné à une architecture ARM 32 bits. De ce fait, lorsqu'on fait *./hw*, une erreur se produit, puisque le binaire n'est plus interprétable par le processeur de notre ordinateur.


Question 13
===========

Le dossier *output/images* contient les images compilées de l'OS. *rootfs.tar* doit être le Root File System, compressé au format tar, *zImage* est l'image du noyau Linux, et *sdcard.img* est le secteur d'amorçage permettant le démarrage de l'OS.


Question 14
===========

file zImage :
zImage: Linux kernel ARM boot executable zImage (little-endian)

file sdcard.img:
sdcard.img: DOS/MBR boot sector; partition 1 : ID=0xc, active, start-CHS (0x0,0,2), end-CHS (0x4,20,17), startsector 1, 65536 sectors; partition 2 : ID=0x83, start-CHS (0x4,20,18), end-CHS (0x1d,146,54), startsector 65537, 409600 sectors


Question 15
===========

Ce répertoire contient le sytème de fichiers Linux qui sera présent sur la machine cible.