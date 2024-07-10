document.addEventListener('DOMContentLoaded', function() {
    // Funzione per scrollare alla sezione delle correzioni
    document.getElementById('correzioni').addEventListener('click', function() {
        const correzioni = document.getElementsByClassName("corr");
        for(i=0;i<correzioni.length;i++){
            correzioni[i].style.backgroundColor = "red";
        }
    });
  
    // Funzione per scrollare alla sezione delle parole particolari
    document.getElementById('paroleparticolari').addEventListener('click', function() {
      document.getElementById('orig').scrollIntoView({ behavior: 'smooth' });
    });
  
    // Funzione per scrollare alla sezione delle persone
    document.getElementById('persone').addEventListener('click', function() {
      document.getElementBy('persName').scrollIntoView({ behavior: 'smooth' });
    });
  
    // Funzione per scrollare alla sezione dei luoghi
    document.getElementById('luoghi').addEventListener('click', function() {
      document.getElementById('placeName').scrollIntoView({ behavior: 'smooth' });
    });
  
    // Funzione per scrollare alla sezione delle organizzazioni
    document.getElementById('org').addEventListener('click', function() {
      document.getElementById('orgName').scrollIntoView({ behavior: 'smooth' });
    });
  });