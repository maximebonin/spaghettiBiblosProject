<?php

    try
    {
        $db = new PDO('mysql:host=localhost;dbname=biblos', 'root', '');

    } catch (PDOException $e)
    {
        print "Error!: " . $e->getMessage() . "<br/>";
        die();
    }

    $db->exec("set names utf8");


    $queryOeuvre = $db->prepare("SELECT id, titre FROM Oeuvre ");
    $queryOeuvre->execute();
    $rowOeuvre = $queryOeuvre->fetchAll();

    $queryAuteur = $db->prepare("SELECT id, concat(Auteur.Prenom, ' ', Auteur.Nom) AS auteur FROM Auteur");
    $queryAuteur->execute();
    $rowAuteur = $queryAuteur->fetchAll();

    $queryNote = $db->prepare("SELECT CONCAT(Auteur.Prenom, ' ', Auteur.Nom) AS auteur , Note.texte, Note.date_creation 
                                FROM Note 
                                LEFT JOIN note_concernant_auteur 
                                ON note_concernant_auteur.id = Note.id 
                                LEFT JOIN Auteur on note_concernant_auteur.id_Auteur = Auteur.id 
                                ORDER BY Note.date_creation DESC ");
    $queryNote->execute();
    $rowNote = $queryNote->fetchAll();

    $queryOeuvre = null;
    $stmt = null;
    $db = null;

?>


<!DOCTYPE html>
<html>
    <head>
        <title>Pharmakon</title>
        <script type="text/javascript" src="js/pharmakon.js"></script>
        <link rel="stylesheet" href="css/styles.css">

     </head>

    <div id="container">

    <body>
        <header>
            <h1 align="center">projet Pharmakon: </h1>
            <h2 align="center">solution web</h2>
        </header>

        <div id="principale">
            <div class="tab">
                <button class="tablinks" onclick="openTab(event, 'FormInscrireOeuvreAuteur')">Inscrire Oeuvre/Auteur</button>
                <button class="tablinks" onclick="openTab(event, 'FormInscrireNote')">Inscrire note</button>
                <button class="tablinks" onclick="openTab(event, 'listingNotes')">Listing des notes</button>
            </div>

             <div id="listingNotes" class="tabcontent">
                <h1>Listing des notes</h1>
                    <table>
                        <tr>
                            <th class="thListingNoteAuteur">Auteur</th>
                            <th class="thListingNoteNote">  Note</th>
                        </tr>

                         <?php foreach ($rowNote as $row): ?>
                             <tr>
                                <td class="thListingNoteAuteur"><?php if ($row['auteur'] != null){ echo $row['auteur'];} else {echo 'inconnu';} ?></td>
                                <td class="thListingNoteNote"><?php echo nl2br($row['texte']) ?></td>

                             </tr>
                         <?php endforeach ?>
                    </table>
             </div>


 <div id="FormInscrireOeuvreAuteur" class="tabcontent">
 <form action="/projetWeb/php/inputOeuvre.php" method="post">
  Titre de l'oeuvre :<br>
  <input type="text" name="titre"><br>
  Prénom de l'auteur:<br>
  <input type="text" name="prenomAuteur"><br>
  Nom de famille de l'auteur:<br>
  <input type="text" name="nomauteur"><br>
<input type="submit" value="Soumettre">
</form>
 </div>

 <div id="FormInscrireNote" class="tabcontent">
     <form onsubmit="getValues()" action="/projetWeb/php/inputNote.php" method="post">
         Titre de la note: <br>
         <input type="text" name="titreNote"><br>
         Note: <br>
         <textarea name="noteTexte" cols="40" rows="5"></textarea><br>

         <input type="radio" id="radioCitation" name="radioNote" value="citationNote" checked> Citation<br>
         <input type="radio" id="radioSimpleNote" name="radioNote" value="simpleNote"> Simple note<br>
         <input type="radio" id="radioSouvenir" name="radioNote" value="souvenirNote"> Souvenir<br>
         <input type="radio" id="radioReve"  name="radioNote" value="reveNote"> Rêve <br>
         <input type="radio" id="radioFiction"  name="radioNote" value="fictionNote"> Fiction<br>
         <input type="radio" id="radioAcademique"  name="radioNote" value="academiqueNote"> Académique <br>

         Niveau d'importance accordée à la note :
         <select id="degreeImportance">
             <option value="0" checked></option>
             <option value="5">Essentiel</option>
             <option value="4">Très important</option>
             <option value="3">Important</option>
             <option value="2">Intéressant</option>
             <option value="">Pourquoi pas ?</option>
         </select><br>

         La note concerne quel auteur ?

         <select id="selectAuteur" onchange="adjustOeuvreAccordingToAuthorSelected(getAuthorSelectedId())">


             <option value="-1" checked></option>
             <?php foreach ($rowAuteur as $row): ?>
                <option value="<?=$row["id"]?>"> <?=$row["auteur"]?></option>
             <?php endforeach ?>
         </select> <br>

         La note concerne quelle oeuvre ?
         <select id="selectOeuvre">
             <option value="-1" checked></option>
             <?php foreach ($rowOeuvre as $row): ?>
                 <option value="<?=$row["id"]?>"> <?=$row["titre"]?></option>
             <?php endforeach ?>

         </select> <br>

         <input id="hiddenCitation" type="hidden" name="citation" type="text">
         <input id="hiddenSouvenir" type="hidden" name="souvenir" type="text">
         <input id="hiddenReve" type="hidden" name="reve" type="text">
         <input id="hiddenFiction" type="hidden" name="fiction" type="text">
         <input id="hiddenAcademique" type="hidden" name="academique" type="text">
         <input id="hiddenDegreeImportance" type="hidden" name="degreeImportance" type="text">
         <input id="hiddenSelectedAuteur" type="hidden" name="selectedAuteur" type="text">
         <input id="hiddenSelectedOeuvre" type="hidden" name="selectedOeuvre" type="text">

         <input id="submitNote"  type="submit" value="Soumettre">

     </form>



 <footer>
     <h3 align="center">Version 0.1 - 2017 </h3>
 </footer>

 </body>


</html>

