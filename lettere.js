//gestione dei pulsanti
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('correzioni').addEventListener('click', function() {
        const correzioni = document.getElementsByClassName("corr");
        for(i=0;i<correzioni.length;i++){
            correzioni[i].style.backgroundColor = "#ff0000";
        }
    });
  
    document.getElementById('paroleparticolari').addEventListener('click', function() {
        const parpart = document.getElementsByClassName("orig");
        for(i=0;i<parpart.length;i++){
            parpart[i].style.backgroundColor = "#009933";
        }
    });
  
    document.getElementById('persone').addEventListener('click', function() {
        const persname = document.getElementsByClassName("persName");
        for(i=0;i<persname.length;i++){
            persname[i].style.backgroundColor = "#66ccff";
        }
    });
  
    document.getElementById('luoghi').addEventListener('click', function() {
        const placename = document.getElementsByClassName("placeName");
        for(i=0;i<placename.length;i++){
            placename[i].style.backgroundColor = "#990000";
        }
    });
  
    document.getElementById('org').addEventListener('click', function() {
        const orgname = document.getElementsByClassName("orgName");
        for(i=0;i<orgname.length;i++){
            orgname[i].style.backgroundColor = "#00ff00";
        }
    });

    document.getElementById('abbreviazioni').addEventListener('click', function() {
        const abbr = document.getElementsByClassName("abbr");
        for(i=0;i<abbr.length;i++){
            abbr[i].style.backgroundColor = "#0000ff";
        }
    });

    document.getElementById('punteggiatura').addEventListener('click', function() {
        const pc = document.getElementsByClassName("pc");
        for(i=0;i<pc.length;i++){
            pc[i].style.backgroundColor = "#ffff00";
        }
    });
  });