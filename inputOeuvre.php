<?php

$titre = $_POST['titre'];
$prenom = $_POST['prenomAuteur'];
$nom = $_POST['nomauteur'];

try
{
    $db = new PDO('mysql:host=localhost;dbname=biblos', 'root', '');

} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

$db->exec("set names utf8");

$stmt = $db->prepare('SELECT * FROM Oeuvre WHERE titre=(:titre)');
$stmt->bindParam(':titre', $titre);
$stmt->execute();
$row = $stmt->fetch(PDO::FETCH_ASSOC);
if( !$row )
{

    if ( $titre != ''){
        $stmt = $db->prepare("INSERT INTO Oeuvre (titre) VALUES (:titre)");
        $stmt->bindParam(':titre', $titre);
        $stmt->execute();
    }

}

$stmt = $db->prepare('SELECT * FROM Auteur WHERE Prenom=(:prenom) and Nom=(:nom) ');
$stmt->bindParam(':prenom', $prenom);
$stmt->bindParam(':nom', $nom);
$stmt->execute();
$row = $stmt->fetch(PDO::FETCH_ASSOC);
if( !$row )
{
   if (($prenom != '') && ($nom != '')){


    $stmt = $db->prepare("INSERT INTO Auteur (Prenom, Nom) VALUES (:prenom, :nom)");
    $stmt->bindParam(':prenom', $prenom);
    $stmt->bindParam(':nom', $nom);
    $stmt->execute();
   }
}

$idOeuvreQuery = $db->prepare('SELECT id FROM Oeuvre WHERE titre=(:titre)');
$idOeuvreQuery->bindParam(':titre', $titre);
$idOeuvreQuery->execute();
$row = $idOeuvreQuery->fetch(PDO::FETCH_ASSOC);
$idOeuvre = $row['id'];

$idAuteurQuery = $db->prepare('SELECT id FROM Auteur WHERE Prenom=(:prenom) and Nom=(:nom)');
$idAuteurQuery->bindParam(':prenom', $prenom);
$idAuteurQuery->bindParam(':nom', $nom);
$idAuteurQuery->execute();
$row = $idAuteurQuery->fetch(PDO::FETCH_ASSOC);
$idAuteur = $row['id'];

$stmt = $db->prepare("INSERT INTO ecrire (id, id_Auteur) VALUES (:idOeuvre, :idAuteur)");
$stmt->bindParam(':idOeuvre', $idOeuvre);
$stmt->bindParam(':idAuteur', $idAuteur);
$stmt->execute();


$stmt = null;
$idOeuvreQuery = null;
$idAuteurQuery = null;
$db = null;

?>

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


    <div id="FormInscrireNotevisible">

        <H1>Résumé de votre insertion</H1>

        <table class="reviewNoteInsertTable">
            <tr class="reviewNoteInsertTable">
                <th class="tableTitreNote">Nom de l'auteur</th>
                <th class="tableNoteTexte">Titre de l'oeuvre</th>
            </tr>
            <tr class="reviewNoteInsertTable">
                <td class="tableTitreNote"><?php echo $prenom." ".$nom ?></td>
                <td class="tableNoteTexte"><?php echo $titre ?></td>
            </tr>
        </table>
    </div>

    <a href="index.php">Retourner à la page principale</a>

    <div id="containerLadyImg">
        <img src="img/lady.png" alt="lady" id="ladyImg" height="320" width="212">
    </div>
</div>
<footer>
    <h3 align="center">Version 0.1 - 2017 </h3>
</footer>

<img src="img/clowns.jpg" alt="clown" id="bottomImg">

</body>
</html>
