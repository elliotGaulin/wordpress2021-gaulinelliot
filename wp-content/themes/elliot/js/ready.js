jQuery(function($) {

    // l'événement doit être associé à la balise <a> pour que this soit cette balise
    $('a.bouton-suppression').click(function(event) {
        event.preventDefault();
        let message = "Désirez-vous vraiment supprimer";
        if(this.attributes['data-titre']){
            message += ' l\'item : ' + this.attributes['data-titre'].value + '?';
        } else {
            message+= ' cet item?';
        }
        elliot_afficherPopupConfirmationLien(message, this, 'fa fa-trash-alt');
    });
});

// À partir d'un lien <a href>, affiche un popup de confirmation et l'usager doit cliquer sur Oui ou sur Non.
// Le Oui redirige vers la page spécifiée dans l'attribut href du lien
// alors que le Non referme la boîte de dialogue sans rien modifier.
//
// Paramètres : question : le texte de la question qui sera affichée dans le popup
//              lien (optionnel) : référence au lien qui cause l'affichage du popup
//                                 On y lira l'attribut href pour savoir quelle page afficher sur un oui.
// Utilisation : afficherPopupConfirmationLien('Désirez-vous vraiment supprimer cet item ?', this);
function elliot_afficherPopupConfirmationLien(question, lien, icon) {
    $.confirm({
        title: 'Confirmation',
        content: question,
        icon: icon,
        buttons: {
            oui: {
                text: "Oui",
                action: function () {
                    var hrefdefini = false;


                    if (lien != null) {
                        if ($(lien).attr("href") != undefined) {
                            hrefdefini = true;
                            // affiche la page de l'attribut href
                            window.location.href = $(lien).attr("href");
                        }
                    }

                    if (!hrefdefini) {
                        // réaffiche la page actuelle
                        window.location.reload();
                    }
                }
            },
            non: {
                text: "Non",
            }
        }
    });
}