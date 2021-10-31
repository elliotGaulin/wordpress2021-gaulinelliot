@ECHO OFF
REM Copie un dossier et ses sous-dossiers dans le nuage (Google Drive, DropBox ou autre dossier synchronis? sur un serveur)
REM en ajoutant la date du jour au dossier principal
REM Cr‚e ‚galement un script SQL de la base de donn‚es MySQL et le copie dans le mˆme dossier.
REM Note : Pour que les accents pr‚sents dans les echo s'affichent correctement, utiliser l'encodage IBM850 ou OEM 720.
REM Note : Si des noms de dossiers contiennent des caractŠres accentu‚s, utilisez l'encodage Windows 1252 ou ANSI
REM ? ? ? ?et ajoutez l'instruction CHCP 1252.
REM Programm? par Christiane Lagac? : https://christianelagace.com
REM Le 26 mars 2013
REM Dernier ajustement par Christiane Lagac?
REM Le 28 janvier 2020
REM Modifications : Chemins sugg?r?s ajust?s pour AMPPS.
˜
REM *************************
REM ***** Configuration *****
REM *************************
˜
REM ***** VOUS DEVEZ REMPLIR CETTE SECTION *****
˜
REM Chemin pour acc‚der au dossier du projet. Placer entre guillemets s'il contient des espaces.
REM (ex : "C:\Program Files\Ampps\www")
set cheminSource="D:\Program Files\Ampps\www"
˜
REM Nom du dossier contenant le projet ? sauvegarder (ex : monprojet)
set dossierSource=wordpress2021-gaulinelliot
˜
REM Chemin du dossier infonuagique (ex : C:\Users\MonNom\Google Drive)
set cheminCible=D:\cole\Web2\backups
˜
REM Nom du dossier dans lequel le projet doit ˆtre copi‚(ex : monprojet)
REM Le dossier sera cr‚‚ sur Google Drive ou DropBox avec la date du jour … la fin de son nom.
set dossierCible=wordpress2021-gaulinelliot
˜
REM Chemin du dossier contenant le fichier mysqldump.exe?
REM (ex : "D:\Program Files\Ampps\mysql\bin")
set cheminMySQLBin="D:\Program Files\Ampps\mysql\bin"
˜
REM Nom de l'usager MySQL qui d?tient les droit requis pour sauvegarder la base de donn?es
set usagerMySQL=root
˜
REM Nom de la base de donn?es ? sauvegarder
set nomBD=wordpress2021_gaulinelliot
˜
REM *****************************
REM ***** Fin configuration *****
REM *****************************
˜
REM ***** Cr?ation des variables pour la date *****
REM La commande "WMIC OS GET localdatetime" retrouve la date au format ISO.?
REM Le caract?re ^ (caret) est un caract?re d'?chappement.
REM Le caract?re | (pipe) permet de rediriger la sortie de WMIC vers la commande find.?
REM Puisqu'on veut conserver toute la cha?ne, on recherche n'importe quel caract?re : find "."
REM Autrement dit, cette ligne place toute la date dans la variable dateISO.
˜
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
˜
echo *************************
echo ***** Copie du site *****
echo *************************
˜
@echo on
XCOPY %cheminSource%\%dossierSource%\* %cheminCible%\%dossierCible%-%mydate% /S /I
@echo off
˜
echo ***********************************************
echo ***** Cr‚ation du script pour la BD MySQL *****
echo ***********************************************
˜
@echo on
CD %cheminMySQLBin%
mysqldump -u %usagerMySQL% -p --default-character-set=utf8 --routines --comments --triggers %nomBD% > %cheminCible%\%dossierCible%-%mydate%\wp-admin\dev\%nomBD%-%mydate%.sql
@echo off
echo *******************
echo ***** Termin‚ *****
echo *******************
echo.
echo Les fichiers ont ‚t‚ copi‚s dans le dossier
echo %cheminCible%\%dossierCible%-%annee%-%mois%-%jour%
echo.
PAUSE
