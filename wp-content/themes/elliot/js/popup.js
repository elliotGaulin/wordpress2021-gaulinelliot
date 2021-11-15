
// Bibliothèque pour faire afficher des fenêtres popup.
// Bibliothèque bâtie sur jQuery-confirm : https://craftpip.github.io/jquery-confirm/
// Auteur : Christiane Lagacé <christianelagace.com>

var $ = jQuery.noConflict();

// Affiche un popup d'information et l'usager doit cliquer sur OK pour le refermer.
//
// Paramètre : le texte du message qui sera affiché dans le popup

function afficherPopupInformation(message) {
    $.confirm({
        title: 'Information',
        content: message,
        type: 'green',
        buttons: {
            OK : {
                text: 'OK',
                btnClass: 'btn-green',
            },
        }
    });
}

// Affiche un popup d'information qui se referme automatiquement.
//
// Paramètres : le texte du message qui sera affiché dans le popup
// nombre de secondes après quoi la boîte de dialogue se refermera (défaut : 3)
// true pour afficher le bouton OK, false pour n'avoir aucun bouton mais ajouter un X pour refermer.
// Utilisation : afficherPopupInformationAutoFermant(response.message, 1, false);
function afficherPopupInformationAutoFermant(message, secondes=3, afficherBoutonOK=true) {
    $.confirm({
        title: 'Information',
        content: message,
        type: 'green',
        autoClose: 'OK|' + secondes*1000,
        closeIcon: afficherBoutonOK ? false : true,
        buttons: {
            OK : {
                text: 'OK',
                btnClass : afficherBoutonOK ? 'btn-green' : 'cache',
            },
        }
    });
}

// Affiche un popup d'avertissement et l'usager doit cliquer sur OK pour le refermer.
//
// Paramètre : le texte du message qui sera affiché dans le popup
function afficherPopupAvertissement(message) {
    $.confirm({
        title: 'Erreur',
        content: message,
        icon: 'fa fa-warning',
        type: 'orange',
        buttons: {
            OK : {
                text: 'OK',
                btnClass: 'btn-orange',
            },
        }
    });
}

// Affiche un popup d'erreur et l'usager doit cliquer sur OK pour le refermer.
//
// Paramètre : le texte du message qui sera affiché dans le popup
function afficherPopupErreur(message) {
    $.confirm({
        title: 'Erreur',
        content: message,
        type: 'red',
        buttons: {
            OK : {
                text: 'OK',
                btnClass: 'btn-red',
            },
        }
    });
}

// À partir d'un lien <a href>, affiche un popup de confirmation et l'usager doit cliquer sur Oui ou sur Non.
// Le Oui redirige vers la page spécifiée dans l'attribut href du lien
// alors que le Non referme la boîte de dialogue sans rien modifier.
//
// Paramètres : question : le texte de la question qui sera affichée dans le popup
//              lien (optionnel) : référence au lien qui cause l'affichage du popup
//                                 On y lira l'attribut href pour savoir quelle page afficher sur un oui.
// Utilisation : afficherPopupConfirmationLien('Désirez-vous vraiment supprimer cet item ?', this);
function afficherPopupConfirmationLien(question, lien) {
    $.confirm({
        title: 'Confirmation',
        content: question,
        icon: 'fa fa-question',
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

// Affiche un popup de confirmation et l'usager doit cliquer sur Oui ou sur Non.
// Le Oui soumet le formulaire dont la référence a été reçue en paramètre
// alors que le Non referme la boîte de dialogue sans rien modifier.
//
// Paramètres : question : le texte de la question qui sera affichée dans le popup
//              $formulaire (optionnel) : référence au formulaire doit être soumis.
//                                         Si non spécifié, réaffichera la page actuelle.
// Utilisation : afficherPopupConfirmationSubmit('Désirez-vous vraiment supprimer cet item ?', $(this).parents("form:first"));
function afficherPopupConfirmationSubmit(question, $formulaire) {
    $.confirm({
        title: 'Confirmation',
        content: question,
        icon: 'fa fa-question',
        buttons: {
            oui: {
                text: "Oui",
                action: function () {
                    if ($formulaire != null) {
                        $formulaire.submit();
                    }
                    else {
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

// Affiche un popup de confirmation et l'usager doit cliquer sur Oui ou sur Non.
// Le Oui exécute la fonction dont la référence a été reçue en paramètre
// alors que le Non referme la boîte de dialogue sans rien modifier.
//
// Paramètres : question : le texte de la question qui sera affichée dans le popup
//              callback (optionnel) : référence à la fonction JavaScript qui doit être exécutée.
//                                     Si non spécifié, réaffichera la page actuelle.
// Utilisation : afficherPopupConfirmation('Désirez-vous vraiment supprimer cet item ?', nomFonction);
//
//               ou, pour passer des paramètres à la fonction :
//
//               afficherPopupConfirmation('Désirez-vous vraiment supprimer cet item ?', function() {
//                   nomFonction(unParametre, unAutreParametre)
//               });
//
//               autre technique avec paramètres :
//
//               var callback = nomFonction.bind(null, unParametre, unAutreParametre);
//               afficherPopupConfirmation('Désirez-vous vraiment supprimer cet item ?', callback);
function afficherPopupConfirmation(question, callback) {
    $.confirm({
        title: 'Confirmation',
        content: question,
        icon: 'fa fa-question',
        buttons: {
            oui: {
                text: "Oui",
                action: function () {
                    if (callback != null && typeof callback == "function") {
                        callback();
                    }
                    else {
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

// Affiche un popup de saisie avec une seule case de saisie.
// Le bouton de soumission exécute la fonction dont la référence a été reçue en paramètre
// alors que le bouton d'annulation referme la boîte de dialogue sans rien modifier.
//
// Paramètres : titre : le titre à afficher dans le haut du popup
//              question : le texte de la question qui sera affichée en haut de la case de saisie.
//              defaut : valeur par défaut à afficher dans la case de saisie.
//              callback (optionnel) : référence à la fonction JavaScript qui doit être exécutée.
//                                     Si non spécifié, réaffichera la page actuelle.
// Utilisation : afficherPopupSaisieSimple('Produit XYZ', 'Votre commentaire :', $('#commentaire').html());
//
//               ou, pour passer des paramètres à la fonction :
//
//               afficherPopupSaisieSimple('Produit XYZ', 'Votre commentaire :', $('#commentaire').html(), function() {
//                   nomFonction(unParametre, unAutreParametre)
//               });
//
//               autre technique avec paramètres :
//
//               var callback = nomFonction.bind(null, unParametre, unAutreParametre);
//               afficherPopupSaisieSimple('Produit XYZ', 'Votre commentaire :', $('#commentaire').html(), callback);

function afficherPopupSaisieSimple(titre, question, defaut, callback) {
    $.confirm({
        title: titre,
        content: '' +
            '<form action="callback" class="formName">' +
            '<div class="form-group">' +
            '<label>' + question + '</label>' +
            '<input type="text" class="form-control donnee" value="' + defaut + '" autofocus required />' +
            '</div>' +
            '</form>',
        buttons: {
            formSubmit: {
                text: 'Enregistrer',
                btnClass: 'btn-blue',
                action: function () {
                    var donnee = this.$content.find('.donnee').val();
                    if (callback != null && typeof callback == "function") {
                        callback(donnee);
                    } else {
                        // réaffiche la page actuelle
                        window.location.reload();
                    }
                }
            },
            cancel: {
                text: 'Annuler',
            },
        },
        onContentReady: function () {
            // précise le code qui sera exécuté lors de la soumission (source : https://craftpip.github.io/jquery-confirm/)
            var jc = this;
            this.$content.find('form').on('submit', function (e) {
                e.preventDefault();
                jc.$$formSubmit.trigger('click'); // génère un clic sur le bouton
            });
        }
    });
}

// Affiche un popup de saisie avec une seule case de saisie pour entrer une date.
// Le bouton de soumission exécute la fonction dont la référence a été reçue en paramètre
// alors que le bouton d'annulation referme la boîte de dialogue sans rien modifier.
//
// Paramètres : titre : le titre à afficher dans le haut du popup
//              question : le texte de la question qui sera affichée en haut de la case de saisie.
//              defaut : valeur par défaut à afficher dans la case de saisie.
//              callback (optionnel) : référence à la fonction JavaScript qui doit être exécutée.
//                                     Si non spécifié, réaffichera la page actuelle.
// Utilisation : afficherPopupSaisieDate('Annie Gagnon', 'Naissance :', $('#naissance').val());
//
//               ou, pour passer des paramètres à la fonction :
//
//               afficherPopupSaisieDate('Annie Gagnon', 'Naissance :', $('#naissance').val(), function() {
//                   nomFonction(unParametre, unAutreParametre)
//               });
//
//               autre technique avec paramètres :
//
//               var callback = nomFonction.bind(null, unParametre, unAutreParametre);
//               afficherPopupSaisieDate('Annie Gagnon', 'Naissance :', $('#naissance').val(), callback);
function afficherPopupSaisieDate(titre, question, defaut, callback) {
    $.confirm({
        title: titre,
        content: '' +
            '<form action="callback" class="formName">' +
            '<div class="form-group">' +
            '<label>' + question + '</label>' +
            '<input type="date" class="form-control donnee" value="' + defaut + '" autofocus required />' +
            '</div>' +
            '</form>',
        buttons: {
            formSubmit: {
                text: 'Enregistrer',
                btnClass: 'btn-blue',
                action: function () {
                    var donnee = this.$content.find('.donnee').val();
                    if (callback != null && typeof callback == "function") {
                        callback(donnee);
                    } else {
                        // réaffiche la page actuelle
                        window.location.reload();
                    }
                }
            },
            cancel: {
                text: 'Annuler',
            },
        },
        onContentReady: function () {
            // précise le code qui sera exécuté lors de la soumission (source : https://craftpip.github.io/jquery-confirm/)
            var jc = this;
            this.$content.find('form').on('submit', function (e) {
                e.preventDefault();
                jc.$$formSubmit.trigger('click'); // génère un clic sur le bouton
            });
        }
    });
}
