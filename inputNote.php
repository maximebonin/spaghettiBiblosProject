<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 17-03-19
 * Time: 14:23
 */


// -----------------------------------------------------------------------------------------------------------------//
//  Données en INPUT from POST to this URL
//


$titreNote = $_POST['titreNote'];
$noteTexte = $_POST['noteTexte'];
$citation = $_POST['citation'];
$souvenir = $_POST['souvenir'];
$reve = $_POST['reve'];
$fiction = $_POST['fiction'];
$academique = $_POST['academique'];
$niveau_importance = $_POST['degreeImportance'];


$id_auteur = $_POST['selectedAuteur'];
$id_oeuvre = $_POST['selectedOeuvre'];
date_default_timezone_set('America/New_York');
$date_now = date("Y-m-d");
$id_usager = 1;
//$concepts = $_POST['concepts']; // pas encore implémenté

// -----------------------------------------------------------------------------------------------------------------//
//   MySQL connection
//

try
{
    $db = new PDO('mysql:host=localhost;dbname=biblos', 'root', '');

} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

$db->exec("set names utf8");


// -----------------------------------------------------------------------------------------------------------------//
//   MySQL connection
//

$stmt = $db->prepare('SELECT * FROM Note WHERE titre=(:titre)');
$stmt->bindParam(':titre', $titreNote);
$stmt->execute();

// -----------------------------------------------------------------------------------------------------------------//
//   Processus de sauvegarde d'une nouvelle note :
//
//   1- Vérification que la note n'existe pas déjà ->  duplicate POST
//   2- On n'accepte la sauvegarde que si le titre de la note est non-vide
//   3-  Insertion, trouver l'ID de la nouvelle note, lier l'ID de la nouvelle note avec l'auteur et l'oeuvre;
//       s'il y'a lieu.
//

$row = $stmt->fetch(PDO::FETCH_ASSOC);
if( !$row )
{
    if ( $titreNote != '' and $noteTexte != ''){
        $stmt = $db->prepare("INSERT INTO Note (titre, texte, souvenir, reve, fiction, academique, date_creation, id_usager, niveau_importance, citation ) VALUES (:titre, :texte, :souvenir, :reve, :fiction, :academique, :date_creation, :id_usager, :niveau_importance, :citation)");
        $stmt->bindParam(':titre', $titreNote);
        $stmt->bindParam(':texte', $noteTexte);
        $stmt->bindParam(':souvenir', $souvenir);
        $stmt->bindParam(':reve', $reve);
        $stmt->bindParam(':fiction', $fiction);
        $stmt->bindParam(':academique', $titreNote);
        $stmt->bindParam(':date_creation',$date_now);
        $stmt->bindParam(':id_usager', $id_usager);
        $stmt->bindParam(':niveau_importance', $niveau_importance);
        $stmt->bindParam(':citation', $citation);
        $stmt->execute();

        $idNote = $db->prepare("SELECT id FROM Note WHERE titre=(:titreNote)");
        $idNote->bindParam(':titreNote', $titreNote);
        $idNote->execute();
        $row = $idNote->fetch(PDO::FETCH_ASSOC);
        $idNote = $row['id'];


        if ( $id_auteur != 0){
            $stmt = $db->prepare("INSERT INTO note_concernant_auteur (id, id_Auteur) VALUES (:idNote, :idAuteur)");
            $stmt->bindParam(':idNote', $idNote);
            $stmt->bindParam(':idAuteur', $id_auteur);
            $stmt->execute();
        }

        if ( $id_oeuvre != 0){
            $stmt = $db->prepare("INSERT INTO note_concernant_oeuvre (id, id_Oeuvre) VALUES (:idNote, :idOeuvre)");
            $stmt->bindParam(':idNote', $idNote);
            $stmt->bindParam(':idOeuvre', $id_oeuvre);
            $stmt->execute();
        }

        $statutInsertion = 'Insertion réussie';
    }else{
        $statutInsertion = 'INSERTION NON RÉUSSIE : LE TITRE et LA NOTE DOIVE ÊTRE NON-VIDE !!!!';
    }
}
?>

<!-- page de confirmation de l'insertion. devrait être remplacer par un mécanisme moins envahissant -->

<!DOCTYPE html>
<html>
<head>
    <title>Pharmakon</title>
    <script type="text/javascript" src="js/pharmakon.js"></script>
    <!--<link rel="stylesheet" href="css/reset.css">-->
    <link rel="stylesheet" href="css/styles.css">

</head>
<div id="container">
    <body>
    <header>
        <h1 align="center">projet Pharmakon: </h1>
        <h2 align="center">solution web</h2>
    </header>


    <div id="FormInscrireNoteVisible">

        <H1>Résumé de votre insertion</H1>

        <table class="reviewNoteInsertTable">
            <tr class="reviewNoteInsertTable">
                <th class="InsertionStatus">Résultat de l'insertion</th>
                <th class="tableTitreNote">Titre de la note</th>
                <th class="tableNoteTexte">Note</th>
            </tr>
            <tr class="reviewNoteInsertTable">
                <td class="InsertionStatus"><?php echo $statutInsertion ?></td>
                <td class="tableTitreNote"><?php echo $titreNote ?></td>
                <td class="tableNoteTexte"><?php echo $noteTexte ?></td>
            </tr>
        </table>
    </div>

    <a href="index.php">Retourner à la page principale</a>

    <div id="containerLadyImg">
        <img src="img/lady.png" alt="lady" id="ladyImg" height="320" width="212">
    </div>
</div>
<footer>
</footer>

<img src="img/clowns.jpg" alt="clown" id="bottomImg">

</body>
</html>
