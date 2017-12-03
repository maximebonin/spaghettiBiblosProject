<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 17-04-10
 * Time: 18:15
 */

try
{
    $db = new PDO('mysql:host=localhost;dbname=biblos', 'root', '');

} catch (PDOException $e)
{
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

$db->exec("set names utf8");

$stmt = $db->prepare("SELECT id, concat(Prenom, ' ' , Nom) AS auteur FROM Auteur ");
$stmt->execute();
$rowAuteur = $stmt->fetchAll();

$queryOeuvre = $db->prepare("SELECT id, titre FROM Oeuvre ");
$queryOeuvre->execute();
$rowOeuvre = $queryOeuvre->fetchAll();

function getNoteByAuthor($db, $id)
{
    $queryNote = $db->prepare("select concat(Auteur.Prenom, ' ', Auteur.Nom) as auteur , Note.texte, Note.date_creation 
    FROM Note 
    left join note_concernant_auteur 
    on note_concernant_auteur.id = Note.id 
    left join Auteur on note_concernant_auteur.id_Auteur =  note_concernant_auteur.id");
    $queryNote->execute();
    $rowNote = $queryNote->fetchAll();

    return $rowNote;
}



$queryOeuvre = null;
$stmt = null;
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

    <h1>Lire les citations par auteur</h1>


    <select id="selectAuteur" onchange="displayNotes()">
        <option value="0" checked></option>
        <?php foreach ($rowAuteur as $row): ?>
            <option value="<?=$row["id"]?>"> <?=$row["auteur"]?></option>
        <?php endforeach ?>
    </select> <br>


    <div id="listingNotesByAuthor" class="tabcontent">
        <H1>Listing des notes</H1>

        <table>
            <tr>
                <th class="thListingNoteAuteur">Auteur</th>
                <th class="thListingNoteNote">  Note</th>
            </tr>

            <?php foreach ($rowNote as $row): ?>
            <?php if $row['id']
                <tr>
                    <td class="thListingNoteAuteur"><?php if ($row['auteur'] != null){ echo $row['auteur'];} else {echo 'inconnu';} ?></td>
                    <td class="thListingNoteNote"><?php echo $row['texte'] ?></td>

                </tr>
            <?php endforeach ?>
            <input id="hiddenSelectedAuteur" type="hidden" name="selectedAuteur" type="text">
        </table>
    </div>









    <footer>
        <h3 align="center">Version 0.1 - 2017 </h3>
    </footer>

    </body>
    </div>


</html>

