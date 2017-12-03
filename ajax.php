<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 17-04-17
 */


/** -----------------------------------------------------------------------------------------------------------------*/
/**  Données en INPUT from POST to this URL from AJAX request                                                        */

$auteurID = $_GET['auteurID'];
$oeuvreID = $_GET['oeuvreID'];

if ( !empty ($auteurID) or $auteurID == -1 ){
 AdjustOeuvres($auteurID);
} elseif ( !empty($oeuvreID) or $oeuvreID == -1 ){
 AdjustAuteur($oeuvreID);
}

/** -----------------------------------------------------------------------------------------------------------------*/
/**  Établissement d'une connection MySQL -> l'Objet connection est retourné                                         */

function GetConnection(){

 try
 {
  $db = new PDO('mysql:host=localhost;dbname=testBiblioPerso', 'root', '');

 } catch (PDOException $e)
 {
  print "Error!: " . $e->getMessage() . "<br/>";
  die();
 }

 $db->exec("set names utf8");

 return $db;
}

function AdjustAuteur($oeuvreID){

 $db = GetConnection();

 $oeuvreSelected = "SELECT Auteur.id, Concat(Auteur.Prenom,' ',  Auteur.Nom) AS Nom
                      FROM Auteur
                      INNER JOIN ecrire ON
                      ecrire.id_Auteur = Auteur.id
                      INNER JOIN Oeuvre ON
                      Oeuvre.id = ecrire.id
                      WHERE Oeuvre.id = :oeuvreID";

 $noOeuvreSelected = "SELECT Auteur.id, Concat(Auteur.Prenom,' ',  Auteur.Nom) AS Nom
                        FROM Auteur
                        INNER JOIN ecrire ON
                          ecrire.id_Auteur = Auteur.id
                        INNER JOIN Oeuvre ON
                          Oeuvre.id = ecrire.id";

 if ( $oeuvreID > 0 ){
  $stmt = $db->prepare($oeuvreSelected);
  $stmt->bindParam(':oeuvreID', $oeuvreID);
 }else{
  $stmt = $db->prepare($noOeuvreSelected);
 }

 $stmt->execute();
 $rowAuteur = $stmt->fetchAll();

 echo '<option value="-1"></option>';

 foreach ($rowAuteur as $item){
  $id = $item["id"];
  $nomAuteur = $item["Nom"];

  echo <<<END
        <option value="$id" checked>$nomAuteur</option>
END;

 }

 $db = null;

}

  //  AdjustOeuvres($auteurID);

function AdjustOeuvres($auteurID)
{

 $db = GetConnection();

 $auteurSelected = " SELECT Oeuvre.id, Oeuvre.titre FROM Oeuvre
                            inner join ecrire 
                            on Oeuvre.id = ecrire.id 
                            inner join Auteur 
                            on Auteur.id = ecrire.id_Auteur
                            WHERE Auteur.id = :auteurId  ";

 $noAuteurSelected = " SELECT Oeuvre.id, Oeuvre.titre FROM Oeuvre
                            inner join ecrire 
                            on Oeuvre.id = ecrire.id 
                            inner join Auteur 
                            on Auteur.id = ecrire.id_Auteur";

 if ($auteurID > 0) {
  $stmt = $db->prepare($auteurSelected);
  $stmt->bindParam(':auteurId', $auteurID);
 } else {
  $stmt = $db->prepare($noAuteurSelected);
 }

 $stmt->execute();
 $rowOeuvres = $stmt->fetchall();

 if ($auteurID > 0) {
  $index = 0;
  foreach ($rowOeuvres as $oeuvre) {
   $id = $oeuvre["id"];
   $titre = $oeuvre["titre"];

   if ($index > 0) {
    echo <<<END
                  <option value="$id">$titre</option>
END;
   } else {
    echo <<<END
                  <option value="$id" checked>$titre</option>
END;
   }
   $index++;

  }
 } else {
  foreach ($rowOeuvres as $oeuvre) {
   $id = $oeuvre["id"];
   $titre = $oeuvre["titre"];

   echo <<<END
                  <option value="$id">$titre</option>
END;
  }

  $db = null;
 }
}

?>