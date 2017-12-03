/**
 * Created by root on 17-03-19.
 */

//  non fonctionnnel pour le moment : n'est pas appelée
//
function validationChampTitreNote(titreNote){
    if ( titreNote != ''){
        return true;
    }else{
        alert('Le titre ne doit pas être vide !');
        return false;
    }
}

function getAuthorSelectedId(){
    var auteurChoice = document.getElementById("selectAuteur");

    return auteurChoice.options[auteurChoice.selectedIndex].value;
}

function getOeuvreSelectedId(){
    var oeuvreChoice = document.getElementById("selectOeuvre");

    return oeuvreChoice.options[oeuvreChoice.selectedIndex].value;
}

function getValues() {

    var simpleNote = 0;
    var citation = 0;
    var souvenir = 0;
    var reve = 0;
    var fiction = 0;
    var academique = 0;


    if (document.getElementById('radioSimpleNote').checked) {
        simpleNote = 1;
    } else if (document.getElementById('radioCitation').checked) {
        citation = 1;
    } else if (document.getElementById('radioSouvenir').checked) {
        souvenir = 1;
    } else if (document.getElementById('radioReve').checked) {
        reve = 1;
    } else if (document.getElementById('radioFiction').checked) {
        fiction = 1;
    } else if (document.getElementById('radioAcademique').checked) {
        academique = 1;
    } else {
        // nothing to say ... won't happen !
    }

    var importance = document.getElementById("degreeImportance");
    var degreeImportance = importance.options[importance.selectedIndex].value;

    var auteurChoice = document.getElementById("selectAuteur");
    var auteurSelected = auteurChoice.options[auteurChoice.selectedIndex].value;


    var oeuvreChoice = document.getElementById("selectOeuvre");
    var oeuvreSelected = oeuvreChoice.options[oeuvreChoice.selectedIndex].value;


    document.getElementById('hiddenCitation').value = citation;
    document.getElementById('hiddenSouvenir').value = souvenir;
    document.getElementById('hiddenReve').value = reve;
    document.getElementById('hiddenFiction').value = fiction;
    document.getElementById('hiddenAcademique').value = academique;

    document.getElementById('hiddenDegreeImportance').value = degreeImportance;

    document.getElementById('hiddenSelectedAuteur').value = auteurSelected;
    document.getElementById('hiddenSelectedOeuvre').value = oeuvreSelected;


    var titreNote = document.getElementById("titreNote").value;

    validationChampTitreNote(titreNote);
}

function openTab(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}


function displayNotes(){
    var auteurSelected;
    auteurSelected = auteurChoice.options[comboboxSelectAuthor.selectedIndex].value;

    document.getElementById('hiddenSelectedAuteur').value = auteurSelected;

    location.reload();
}

function adjustOeuvreAccordingToAuthorSelected(auteurID) {
    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
                document.getElementById("selectOeuvre").innerHTML = this.responseText;
            }
        }

    xhttp.open("GET", "ajax.php/?auteurID=" + auteurID, true);
    xhttp.send();

    xhttp = null;
}

function adjustAuteurAccordingToOeuvreSelected(oeuvreID){
    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("selectAuteur").innerHTML = this.responseText
        }
    }

    xhttp.open("GET", "ajax.php/?oeuvreID=" + oeuvreID, true);
    xhttp.send();

    xhttp = null;
}

