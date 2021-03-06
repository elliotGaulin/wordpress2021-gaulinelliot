<?php
/**
 * Fonction de rappel du hook after_setup_theme, exécutée après que le thème ait été initialisé
 *
 * Utilisation : add_action( 'after_setup_theme', 'elliot_apres_initialisation_theme' );
 *
 * @author Christiane Lagacé
 *
 */
function elliot_apres_initialisation_theme() {
	// Retirer la balise <meta name="generator">
	remove_action( 'wp_head', 'wp_generator' );
}

add_action( 'after_setup_theme', 'elliot_apres_initialisation_theme' );

/**
 * Change l'attribut ?ver des .css et des .js pour utiliser celui de la version de style.css
 *
 * Utilisation : add_filter( 'style_loader_src', 'elliot_attribut_version_style', 9999 );
 *               add_filter( 'script_loader_src', 'elliot_attribut_version_style', 9999 );
 * Suppositions critiques : dans l'entête du fichier style.css du thème enfant, le numéro de version
 *                          à utiliser est inscrit à la ligne Version (ex : Version: ...)
 *
 * @return String Url de la ressource, se terminant par ?ver= suivi du numéro de version lu dans style.css
 *
 * @author Christiane Lagacé
 */
function elliot_attribut_version_style( $src ) {
	$version = elliot_version_style();
	if ( strpos( $src, 'ver=' . get_bloginfo( 'version' ) ) ) {
		$src = remove_query_arg( 'ver', $src );
		$src = add_query_arg( 'ver', $version, $src );
	}

	return $src;
}

add_filter( 'style_loader_src', 'elliot_attribut_version_style', 9999 );
add_filter( 'script_loader_src', 'elliot_attribut_version_style', 9999 );

/**
 * Retrouve le numéro de version de la feuille de style
 *
 * Utilisation : $version = elliot_version_style();
 * Suppositions critiques : dans l'entête du fichier style.css du thème enfant, le numéro de version
 *                          à utiliser est inscrit à la ligne Version (ex : Version: ...)
 *
 * @return String Le numéro de version lu dans style.css ou, s'il est absent, le numéro 1.0
 *
 * @author Christiane Lagacé
 */
function elliot_version_style() {
	$default_headers = array( 'Version' => 'Version' );
	$fichier         = get_stylesheet_directory() . '/style.css';
	$data            = get_file_data( $fichier, $default_headers );
	if ( empty( $data['Version'] ) ) {
		return "1.0";
	} else {
		return $data['Version'];
	}
}

/**
 * Enregistre une information de débogage dans le fichier debug.log, seulement si WP_DEBUG est à true
 *
 * Utilisation : elliot_log_debug( 'test' );
 * Inspiré de http://wp.smashingmagazine.com/2011/03/08/ten-things-every-wordpress-plugin-developer-should-know/
 *
 * @author Christiane Lagacé <christianelagace.com>
 *
 */
function elliot_log_debug( $message ) {
	if ( WP_DEBUG === true ) {
		if ( is_array( $message ) || is_object( $message ) ) {
			error_log( 'Message de débogage: ' . print_r( $message, true ) );
		} else {
			error_log( 'Message de débogage: ' . $message );
		}
	}
}

/**
 * Affiche une information de débogage à l'écran, seulement si WP_DEBUG est à true
 *
 * Utilisation : monprefixe_echo_debug( 'test' );
 * Suppositions critiques : le style .debug doit définir l'apparence du texte
 *
 * @author Christiane Lagacé <christianelagace.com>
 *
 */
function elliot_echo_debug( $message ) {
	if ( WP_DEBUG === true ) {
		if ( ! empty( $message ) ) {
			echo '<span class="debug">';
			if ( is_array( $message ) || is_object( $message ) ) {
				echo '<pre>';
				print_r( $message );
				echo '</pre>';
			} else {
				echo $message;
			}
			echo '</span>';
		}
	}
}

/*
 * Ajuster le head pour
 */
function elliot_ajuster_head( $content ) {
	return '<link rel="icon" href="' . get_site_url() . '/favicon.ico" />';
}

add_action( 'wp_head', 'elliot_ajuster_head' );
add_action( 'admin_head', 'elliot_ajuster_head' );

/*
 *
 */
function elliot_afficher_liste_items() {
	global $wpdb;
	$code_html = "";
	$message_aucune_donnee = __( 'Aucune donnée ne correspond aux critères demandés.', 'fr_CA' );
	$message_erreur_sql = __( 'Oups ! Un problème a été rencontré.', 'fr_CA' );

	$table_items     = $wpdb->prefix . "elliot_items";
	$table_categorie = $wpdb->prefix . "elliot_categorie";

	$requete = "
		SELECT titre, description, location_image 
			FROM $table_items
			ORDER BY titre";
	$resultat = $wpdb->get_results( $requete );
	$erreur_sql = $wpdb->last_error;

	if ( $erreur_sql == "" ) {
		if ( $wpdb->num_rows > 0 ) {
			$code_html = "";
			$code_html .= "	<div class='row mb-4'>";

			foreach ( $resultat as $enreg ) {
				$code_html .= "
					<div class='col-3'>
						<div class='card'>
							<img class='card-img-top' src='". htmlspecialchars($enreg->location_image) . "' alt='Card image cap'>
							<div class='card-body'>
								<h5 class='card-title'>". htmlspecialchars($enreg->titre) . "</h5>
								<p class='card-text'>" . htmlspecialchars( $enreg->description ) . "</p>
							</div>
						</div>
					</div>
				";
			}
			$code_html .= '</div>';
		} else {
			$code_html .= '<div class="messageavertissement">';
			$code_html .= $message_aucune_donnee;
			$code_html .= '</div>';
		}
	} else {
		$code_html .= '<div class="messageerreur">';
		$code_html .= $message_erreur_sql;
		$code_html .= '</div>';
		// écrit l'erreur dans le journal seulement si on est en mode débogage
		elliot_log_debug( $erreur_sql );
	}
	return $code_html;
}

add_shortcode( 'elliotafficherliste', 'elliot_afficher_liste_items' );



/**
 * Charge les scripts et feuilles de style propres au thème.
 *
 * Utilisation : add_action('wp_enqueue_scripts', 'monprefixe_charger_css_js_web');
 *
 * @author Annie Gagnon
 *
 */
function elliot_charger_css_js_web() {
	wp_enqueue_script( 'jquery', 'https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js', array( 'jquery' ), null, true );
	wp_enqueue_script( 'popper-js', 'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js', array( 'jquery' ), null, true );
	wp_enqueue_script( 'bootstrap-js', 'https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js', array( 'jquery' ), null, true );
	wp_enqueue_style( 'bootstrap-css', 'https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' );
    wp_enqueue_style( 'elliotafficherliste', get_stylesheet_directory_uri() . '/css/elliot-afficher-liste-items.css' );

	global $post;


	// charge Google reCAPTCHA seulement si on est sur le formulaire de contact
	if ( has_shortcode( $post->post_content, 'elliotafficherformulairecontact') ) {
		// charge l'API de Google reCAPTCHA
		wp_enqueue_script( 'apigooglerecaptcha', 'https://www.google.com/recaptcha/api.js?render=6LdZ4wodAAAAAGVlFINgAbdUUs3u9CZhtvv-WSlB' );

		// charge le code JavaScript pour gérer Google reCAPTCHA
		wp_enqueue_script( 'googlerecaptcha', get_stylesheet_directory_uri() . '/js/google-recaptcha.js' );
	}

}
add_action( 'wp_enqueue_scripts', 'elliot_charger_css_js_web' );


/**
 * Ajout des tables personalisée pour le thème enfant Elliot
 *
 * Utilisation add_action( "after_switch_theme", "elliot_creer_tables")
 * @author Elliot Gaulin
 */
function elliot_creer_tables() {
	global $wpdb;

	$charset_collate = $wpdb->get_charset_collate();

	$nom_table_item      = $wpdb->prefix . 'elliot_items';
	$nom_table_categorie = $wpdb->prefix . 'elliot_categorie';

	$requete_sql_categorie = "CREATE TABLE $nom_table_categorie (
    	id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    	description BLOB NOT NULL,
    	titre VARCHAR(255) NOT NULL,
    	PRIMARY KEY (id)
	);$charset_collate;";

	$requete_sql_items = "CREATE TABLE $nom_table_item (
    	id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
        titre VARCHAR(255) NOT NULL,
    	description BLOB NOT NULL,
    	location_image VARCHAR(255) NOT NULL,
    	categorie_id BIGINT(20) UNSIGNED NOT NULL,    	
    	PRIMARY KEY (id)
	);$charset_collate;";


	require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	dbDelta( $requete_sql_items );
	dbDelta( $requete_sql_categorie );
}

add_action( "after_switch_theme", "elliot_creer_tables" );

/**
 * Ajout des données initiales dans la base de donnée.
 * Utilisation: add_action( "after_switch_theme", "elliot_ajout_donnees_initiales" )
 */
function elliot_ajout_donnee_initiales() {
	global $wpdb;

	$table_items     = $wpdb->prefix . "elliot_items";
	$table_categorie = $wpdb->prefix . "elliot_categorie";

	$requete_select_items     = "SELECT COUNT(*) FROM " . $table_items;
	$requete_select_categorie = "SELECT COUNT(*) FROM " . $table_categorie;

	$presence_donnee_items     = $wpdb->get_var( $requete_select_items );
	$presence_donnee_categorie = $wpdb->get_var( $requete_select_categorie );

	if ( is_null( $presence_donnee_categorie ) ) {
		$presence_donnee_categorie = 0;
	}
	if ( ! $presence_donnee_categorie ) {

		$id = []; // pour stocker les identifiants au cas où ils devraient être utilisés plus loin

		$donnees = array(
			array( 'Categorie exemple 1', 'Ceci est une categorie d\'exemple' ),    // données du premier enregistrement
			array( 'Categorie exemple 2', 'Ceci est une categorie d\'exemple' ),    // données du premier enregistrement
		);
		foreach ( $donnees as $donnee ) {
			// à chaque boucle, va chercher les informations pour un enregistrement dans le tableau de données
			$reussite = $wpdb->insert(
				$table_categorie,
				array(
					'titre'       => $donnee[0],
					'description' => $donnee[1],
				),
				array(
					'%s',
					'%s',
				)
			);
			$id[]     = $wpdb->insert_id;   // Retient l'identifiant. Pas nécessaire si les identifiants ont été codés en dur.
			if ( ! $reussite ) {
				elliot_log_debug( $wpdb->last_error );
			}
		}

		if ( ! $reussite ) {
			// réagir en cas de problème
			elliot_log_debug( $wpdb->last_error );
			// ...
		}
	}


	if ( is_null( $presence_donnee_items ) ) {
		$presence_donnee_items = 0;
	}
	if ( ! $presence_donnee_items ) {

		$id = []; // pour stocker les identifiants au cas où ils devraient être utilisés plus loin

		$donnees = array(
			array(
				'Item exemple 1',
				'Ceci est un item d\'exemple',
				get_stylesheet_directory_uri() . '/medias/items/exemple1.png',
				1
			),    // données du premier enregistrement
			array(
				'Item exemple 2',
				'Ceci est une item d\'exemple',
				get_stylesheet_directory_uri() . '/medias/items/exemple2.png',
				1
			),    // données du premier enregistrement
		);
		foreach ( $donnees as $donnee ) {
			// à chaque boucle, va chercher les informations pour un enregistrement dans le tableau de données
			$reussite = $wpdb->insert(
				$table_items,
				array(
					'titre'          => $donnee[0],
					'description'    => $donnee[1],
					'location_image' => $donnee[2],
					'categorie_id'   => $donnee[3]
				),
				array(
					'%s',
					'%s',
					'%s',
					'%d',
				)
			);
			$id[]     = $wpdb->insert_id;   // Retient l'identifiant. Pas nécessaire si les identifiants ont été codés en dur.
			if ( ! $reussite ) {
				elliot_log_debug( $wpdb->last_error );
			}
		}

		if ( ! $reussite ) {
			// réagir en cas de problème
			elliot_log_debug( $wpdb->last_error );
			// ...
		}
	}
}

add_action( "after_switch_theme", "elliot_ajout_donnee_initiales" );

/**
 * Ajout des tables personalisée pour les likes dans le thème enfant Elliot
 *
 * Utilisation add_action( "after_switch_theme", "elliot_creer_table_like")
 * @author Elliot Gaulin
 */
function elliot_creer_table_jaime() {
	global $wpdb;

	$charset_collate = $wpdb->get_charset_collate();

	$nom_table = $wpdb->prefix . 'elliot_jaime';

	$requete_sql = "CREATE TABLE $nom_table (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`usager_id` int(11) NOT NULL,
		`date` datetime NOT NULL,
		PRIMARY KEY (`id`)
		)$charset_collate;";


	require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	dbDelta( $requete_sql );
}

add_action( "after_switch_theme", "elliot_creer_table_jaime" );

/**
 * Ajout des données initiales pour les jaimes dans la base de donnée.
 * Utilisation: add_action( "after_switch_theme", "elliot_ajout_donnees_initiales_jaime" )
 */
function elliot_ajout_donnees_initiales_jaime() {
	elliot_log_debug("Début ajout données");
	global $wpdb;

	$nom_table = $wpdb->prefix . "elliot_jaime";

	$requete_select = "SELECT COUNT(*) FROM " . $nom_table;

	$presence_donnee = $wpdb->get_var( $requete_select );

	if ( is_null( $presence_donnee ) ) {
		$presence_donnee = 0;
	}
	if ( ! $presence_donnee ) {

		$id = []; // pour stocker les identifiants au cas où ils devraient être utilisés plus loin

		$donnees = array(
			array( 2, '2020-10-10' ),    // données du premier enregistrement
			array( 3, '2015-04-15 10:10:10' ),    // données du premier enregistrement
			array( 4, '2021-10-04 15:16:34' ),    // données du premier enregistrement
		);
		foreach ( $donnees as $donnee ) {
			// à chaque boucle, va chercher les informations pour un enregistrement dans le tableau de données
			$reussite = $wpdb->insert(
				$nom_table,
				array(
					'usager_id' => $donnee[0],
					'date'      => $donnee[1],
				),
				array(
					'%d',
					'%s',
				)
			);
			$id[]     = $wpdb->insert_id;   // Retient l'identifiant. Pas nécessaire si les identifiants ont été codés en dur.
			if ( ! $reussite ) {
				elliot_log_debug( $wpdb->last_error );
			}
		}

		if ( ! $reussite ) {
			// réagir en cas de problème
			elliot_log_debug( $wpdb->last_error );
			// ...
		}
	}
	elliot_log_debug("Presense donnees : $presence_donnee");
}

add_action( "after_switch_theme", "elliot_ajout_donnees_initiales_jaime" );

function elliot_afficher_tableau_jaime() {
	global $wpdb;
	$code_html = "";
	$message_aucune_donnee = __( 'Aucune donnée ne correspond aux critères demandés.', 'fr_CA' );
	$message_erreur_sql = __( 'Oups ! Un problème a été rencontré.', 'fr_CA' );

	$table_jaime    = $wpdb->prefix . "elliot_jaime";
	$table_usagers    = $wpdb->prefix . "users";

	$requete = '
		SELECT ' . $table_jaime . '.date, ' . $table_usagers . '.user_nicename
			FROM ' . $table_jaime . '
			INNER JOIN ' . $table_usagers . ' ON usager_id = ' . $table_usagers . '.id
			ORDER BY '. $table_jaime . '.date';

	$resultat = $wpdb->get_results( $requete );
	$erreur_sql = $wpdb->last_error;

	if ( $erreur_sql == "" ) {
		if ( $wpdb->num_rows > 0 ) {
			$code_html = "";
			$code_html .= "	
				<table>
  				<tr>
				    <th>" . __('Utilisateur', 'fr_CA') . "</th>
				    <th>" . __('Date', 'fr_CA') . "</th>
			    </tr>
			";
			foreach ( $resultat as $enreg ) {
				$code_html .= "
					<tr>
						<td>$enreg->user_nicename</td>
						<td>" . date("Y-m-d", strtotime($enreg->date)) . "</td>
					</tr>
				";
			}
			$code_html .= '</table>';
		} else {
			$code_html .= '<div class="messageavertissement">';
			$code_html .= $message_aucune_donnee;
			$code_html .= '</div>';
		}
	} else {
		$code_html .= '<div class="messageerreur">';
		$code_html .= $message_erreur_sql;
		$code_html .= '</div>';
		// écrit l'erreur dans le journal seulement si on est en mode débogage
		elliot_log_debug( $erreur_sql );
	}
	return $code_html;
}
add_shortcode( 'elliotaffichertableaujaime', 'elliot_afficher_tableau_jaime' );

function elliot_afficher_liste_items_menu() {
	global $wpdb;
	$code_html = "";
	$message_aucune_donnee = __( 'Aucune donnée ne correspond aux critères demandés.', 'fr_CA' );
	$message_erreur_sql = __( 'Oups ! Un problème a été rencontré.', 'fr_CA' );

	$table_items     = $wpdb->prefix . "elliot_items";
	$table_categorie = $wpdb->prefix . "elliot_categorie";

	$requete = "
		SELECT titre, description, location_image, id 
			FROM $table_items
			ORDER BY titre";
	$resultat = $wpdb->get_results( $requete );
	$erreur_sql = $wpdb->last_error;

	if ( $erreur_sql == "" ) {
		if ( $wpdb->num_rows > 0 ) {
			$code_html = "";
			$code_html .= "
                <table class='table'>
                    <thead>
                        <tr>
                            <th>" . __('Titre', 'elliot') . "</th>
                            <th>" . __('Description', 'elliot') . "</th>
                            <th>" . __('Image', 'elliot') . "</th>
                            <th>" . __('Modifier l\'item', 'elliot') . "</th>
                            <th>" . __('Suppression l\'item', 'elliot') . "</th>
                    </thead>
                    <tbody>
            ";

			foreach ( $resultat as $enreg ) {
				$url_suppression = get_stylesheet_directory_uri() . "/suppression-item.php?id=$enreg->id";
				$url_suppression_protege = wp_nonce_url( $url_suppression, "supprimer_item_$enreg->id" );
				$code_html .= "
					<tr>
					    <th>$enreg->titre</th>
                        <th>$enreg->description</th>
                        <th><img src='$enreg->location_image' width='75' alt='$enreg->location_image'></th>
                        <th><a href='". get_admin_url() . "admin.php?page=elliot_gestion&action=edit&id=$enreg->id'  class='page-title-action'>" . __('Modifier l\'item', 'elliot') . "</a</th></th>
                        <th><a href='$url_suppression_protege' class='page-title-action bouton-suppression' data-titre='$enreg->titre'>" . __('Supprimer l\'item', 'elliot') . "</a</th>
					</tr>
				";
			}
			$code_html .= '</tbody></table>';
		} else {
			$code_html .= '<div class="messageavertissement">';
			$code_html .= $message_aucune_donnee;
			$code_html .= '</div>';
		}
	} else {
		$code_html .= '<div class="messageerreur">';
		$code_html .= $message_erreur_sql;
		$code_html .= '</div>';
		// écrit l'erreur dans le journal seulement si on est en mode débogage
		elliot_log_debug( $erreur_sql );
	}
	return $code_html;
}

function elliot_liste_item_tableau_bord(){
	global $title;   // titre de la page du menu, tel qu'initialisé dans la fonction de rappel de add_menu_page

    echo "
	<div class='wrap'>
	    <div class='mb-4'>
            <h1 class='wp-heading-inline'>$title</h1>
        </div>
	";
    if ( isset($_GET['action']) ) {
        if ( $_GET['action'] = "edit" && isset( $_GET["id"] ) ) {
            echo elliot_afficher_formulaire_edition();
        }
    } else {
	    echo "<p>
                <a href='" . get_admin_url() ."admin.php?page=elliot_ajout' class='page-title-action'>Ajouter un item</a>
            </p><hr class='wp-header-end'>";
	    echo elliot_afficher_liste_items_menu();
    }
	echo "
	</div>
	";
}

function elliot_ajouter_menu_tableau_bord(){
    global $elliot_hook_gestion;
	add_menu_page(
		__("Elliot - Gestion", "elliot"),
		__("Elliot - Gestion", "elliot"),
		"manage_options",
		"elliot_gestion",
		"elliot_liste_item_tableau_bord",
	);
    $elliot_hook_gestion = add_submenu_page(
        "elliot_gestion",
	    __("Elliot - Gestion", "elliot"),
        __("Gestion", "elliot"),
        "manage_options",
        "elliot_gestion",
        "elliot_liste_item_tableau_bord"
    );
	// seconde option du sous-menu
	add_submenu_page(
		"elliot_gestion",   // slug du menu parent
		__( "Elliot - Ajouter un item", "elliot" ),  // texte de la balise <title>, initialisera $title
		__( "Ajouter un item", "elliot" ),   // titre de l'option de sous-menu
		"manage_options",  // droits requis pour voir l'option de menu
		"elliot_ajout", // slug
		"elliot_creer_page_ajout"  // fonction de rappel pour créer la page
	);

	add_submenu_page(
		"elliot_gestion",   // slug du menu parent
		__( "Elliot - Inscription", "elliot" ),  // texte de la balise <title>, initialisera $title
		__( "Inscription", "elliot" ),   // titre de l'option de sous-menu
		"manage_options",  // droits requis pour voir l'option de menu
		"elliot_inscription", // slug
		"elliot_creer_page_inscriptions"  // fonction de rappel pour créer la page
	);

	add_submenu_page(
		"elliot_gestion",   // slug du menu parent
		__( "Elliot - Ajout inscription", "elliot" ),  // texte de la balise <title>, initialisera $title
		__( "Ajout inscription", "elliot" ),   // titre de l'option de sous-menu
		"manage_options",  // droits requis pour voir l'option de menu
		"elliot_ajout_inscription", // slug
		"elliot_creer_page_ajout_inscription"  // fonction de rappel pour créer la page
	);
}

add_action( "admin_menu", "elliot_ajouter_menu_tableau_bord" );

function elliot_afficher_formulaire_contact() {
    $code_html = "
        <form id='formulaireContact' method='post' action='". get_stylesheet_directory_uri(). "/envoyer-courriel-contact.php'>
            <div class='row'>
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='prenom'>" . __('Prénom', 'elliot'). "</label>
                        <input type='text' class='form-control' id='prenom' name='prenom' required>
                    </div>
                </div>
                <!--  col-md-6   -->
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='nom'>" . __('Nom', 'elliot') . "</label>
                        <input type='text' class='form-control' id='nom' name='nom' required>
                    </div>
                </div>
                <!--  col-md-6   -->
            </div>
            <div class='row'>
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='email'>" . __('Adresse email', 'elliot') . "</label>
                        <input type='email' class='form-control' id='email' name='email' required>
                    </div>
                </div>
                <!-- col-md-6 -->
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='sujet'>" . __('Sujet', 'elliot') . "</label>
                        <input type='text' class='form-control' id='sujet' name='sujet' required>
                    </div>
                </div>
                <!--  col-md-6   -->
            </div>
            <div class='row'>
                <div class='col-md-12'>
                    <label for='message'>" . __('Message', 'elliot') . "</label>
                    <textarea class='form-control' id='message' rows='4' name='message' required></textarea>
                </div>
            </div>
            <button type='submit' class='btn btn-dark'>" . __('Envoyer', 'elliot') . "</button>
        </form>
	";

    return $code_html;
}
add_shortcode( 'elliotafficherformulairecontact', 'elliot_afficher_formulaire_contact' );

/**
 * Ajout des tables personalisée pour les likes dans le thème enfant Elliot
 *
 * Utilisation add_action( "after_switch_theme", "elliot_creer_table_like")
 * @author Elliot Gaulin
 */
function elliot_creer_table_contact() {
	global $wpdb;

	$charset_collate = $wpdb->get_charset_collate();

	$nom_table = $wpdb->prefix . 'elliot_contact';

	$requete_sql = "CREATE TABLE $nom_table (
		`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
		`nom` VARCHAR(255) NOT NULL,
		`prenom` VARCHAR(255) NOT NULL,
		`email` VARCHAR(255) NOT NULL,
		`sujet` VARCHAR(255) NOT NULL,
		`message` TEXT NOT NULL,
		`ip` VARCHAR(15) NOT NULL,
		`date` datetime NOT NULL,
		PRIMARY KEY (`id`)
		)$charset_collate;";


	require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	dbDelta( $requete_sql );
}

add_action( "after_switch_theme", "elliot_creer_table_contact" );



/**
 * Active les variables de session.
 *
 * Utilisation : add_action( 'init', 'elliot_session_start', 1 );
 *
 * @author Elliot Gaulin
 *
 */

function elliot_session_start() {
	if ( ! session_id() ) {
		@session_start();
	}
}

add_action( 'init', 'elliot_session_start', 1 );

/**
 * Configurer l'envoi de courriel par SMTP.
 *
 * Utilisation : add_action( 'phpmailer_init', 'monprefixe_configurer_courriel' );
 * L'envoi de courriel ser fera comme suit :
 * wp_mail( "destinataire@sondomaine.com", "Sujet", "Message" );
 *
 * @author Christiane Lagacé
 *
 */
function elliot_configurer_courriel( $phpmailer ) {
	$phpmailer->isSMTP();
	$phpmailer->Host = SMTP_HOST;
	$phpmailer->SMTPAuth = SMTP_AUTH;
	$phpmailer->Port = SMTP_PORT;
	$phpmailer->SMTPSecure = SMTP_SECURE;
	$phpmailer->Username = SMTP_USERNAME;
	$phpmailer->Password = SMTP_PASSWORD;
	$phpmailer->From = SMTP_FROM;
	$phpmailer->FromName = SMTP_FROMNAME;
}

add_action( 'phpmailer_init', 'elliot_configurer_courriel' );

/**
 * Logue les erreurs en cas de problème si WP_DEBUG est à true.
 *
 * Utilisation : add_action('wp_mail_failed', 'monprefixe_erreur_courriel', 10, 1);
 * Ceci appellera automatiquement cette fonction en cas d'erreur après avoir fait
 * wp_mail( "destinataire@sondomaine.com", "Sujet", "Message" );
 *
 * @author Christiane Lagacé
 *
 */
function elliot_erreur_courriel( $wp_error ) {
	elliot_log_debug( $wp_error );
}

add_action( 'wp_mail_failed', 'elliot_erreur_courriel', 10, 1 );

/**
 *
 * Affiche le résultat du traitement du formulaire de contact.
 *
 * @author Elliot Gaulin
 */
function elliot_afficher_resultat_formulaire_contact(){
    if ( isset( $_SESSION['SuccesFormulaireContact'] ) ){
        //Si le formulaire à fonctionner : vert
        if ( $_SESSION['SuccesFormulaireContact'] ){
	        echo "<div class='alert alert-success' role='alert'>";
        //Sinon danger pour rouge
        } else {
	        echo "<div class='alert alert-danger' role='alert'>";
        }

        if ( isset( $_SESSION['MessageFormulaireContact'] ) ) {
            echo $_SESSION['MessageFormulaireContact'];
            unset($_SESSION['MessageFormulaireContact']);
        } else {
            echo "Veuillez vous fier à la couleur de cette alerte pour savoir si le contact à fonctionner";
        }
        echo "</div>";

        unset($_SESSION['SuccesFormulaireContact']);
    }
}
add_action( 'hypermarket_before_header_area', 'elliot_afficher_resultat_formulaire_contact' );

function elliot_creer_page_ajout(){
    global $title;   // titre de la page du menu, tel qu'initialisé dans la fonction de rappel de add_menu_page
    ?>
    <div class="wrap">
        <h1 class="wp-header-head"><?php echo $title; ?></h1>
        <hr class="wp-header-end">
        <?php
        echo elliot_afficher_formulaire_ajout_item();
        ?>
    </div>
    <?php
}

function elliot_afficher_formulaire_ajout_item(){
	global $wpdb;

    $code_html_select = "";

	$table_categorie = $wpdb->prefix . "elliot_categorie";
	$requete = "
		SELECT titre, id
			FROM $table_categorie
			ORDER BY titre";
	$resultat = $wpdb->get_results( $requete );
	$erreur_sql = $wpdb->last_error;
	if ( $erreur_sql == "" ) {
		if ( $wpdb->num_rows > 0 ) {
			$code_html_select .= "<select class='form-control' name='categorie' required>";

			foreach ( $resultat as $enreg ) {
				$code_html_select .= "
					<option value='$enreg->id'>$enreg->titre</option>
				";
			}
			$code_html_select .= '</select>';
		} else {
			$code_html_select .= '<div class="alert alert-danger">';
			$code_html_select .= __("Aucune catégorie n'a été trouvée", "elliot");
			$code_html_select .= '</div>';
		}
	} else {
		$code_html_select .= '<div class="alert alert_danger">';
		$code_html_select .= __("Erreur de connexion au système");
		$code_html_select .= '</div>';
		// écrit l'erreur dans le journal seulement si on est en mode débogage
		elliot_log_debug( $erreur_sql );
	}

	$nonce = wp_nonce_field( 'ajouter_item', 'nonce_ajouter_item', true, false);

	$code_html = "
        <form method='post' action='". get_stylesheet_directory_uri(). "/ajouter-item.php'>
            $nonce
            <div class='row'>
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='titre'>" . __('* Titre', 'elliot'). "</label>
                        <input type='text' class='form-control' id='titre' name='titre' maxlength='255' required>
                    </div>
                </div>
                <!--  col-md-6   -->
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='url'>" . __('* Adresse url', 'elliot') . "</label>
                        <input type='url' class='form-control' id='url' name='url' maxlength='255' required>
                    </div>
                </div>
                <!--  col-md-6   -->
            </div>
            <div class='row mb-3'>
                <div class='col-md-12'>
                    <label for='description'>" . __('* Description', 'elliot') . "</label>
                    <textarea class='form-control' id='description' rows='4' name='description' required></textarea>
                </div>
            </div>
            <div class='row'>
                <div class='col-md-12'>
                    <div class='form-group'>
                    <label for='categorie'>" . __('* Catégorie', 'elliot') . "</label>
                    " . $code_html_select ."
                    </div>
                </div>
            </div>
            <button type='submit' class='page-title-action'>" . __('Envoyer', 'elliot') . "</button>
        </form>
	";

	return $code_html;
}
/**
 * Charge les scripts et feuilles de style propres au thème.
 *
 * Utilisation : add_action('wp_enqueue_scripts', 'monprefixe_charger_css_js_web');
 *
 * @author Annie Gagnon
 *
 */
function elliot_charger_css_js_web_admin( $hook ) {
	wp_enqueue_script( 'jquery', 'https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js', array( 'jquery' ), null, true );
	wp_enqueue_script( 'popper-js', 'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js', array( 'jquery' ), null, true );
	wp_enqueue_script( 'bootstrap-js', 'https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js', array( 'jquery' ), null, true );
	wp_enqueue_style( 'bootstrap-css', 'https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' );

    global $elliot_hook_gestion; // variable initialisée lors de l'ajout de l'option de menu

    // fichiers à charger seulement pour la page de gestion de mon thème
    if ( $hook == $elliot_hook_gestion ) {

	    wp_enqueue_style( 'fontawesome-css', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css' );
	    wp_enqueue_style( 'jquery-confirm-css', 'https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.4/jquery-confirm.min.css' );
	    wp_enqueue_script( 'jquery-confirm-js', 'https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.4/jquery-confirm.min.js', array( 'jquery' ), null, true );
	    wp_enqueue_script( 'elliot-popup-js', get_stylesheet_directory_uri() . '/js/popup.js', array( 'jquery-confirm-js' ), null, true );
	    wp_enqueue_script( 'elliot-ready-js', get_stylesheet_directory_uri() . '/js/ready.js', array( 'elliot-popup-js' ), null, true );
    }
}
add_action( 'admin_enqueue_scripts', 'elliot_charger_css_js_web_admin' );

function elliot_verifier_categorie($categorie_id){
    global $wpdb;
    $categorie_valide = false;
	$table_categorie = $wpdb->prefix . "elliot_categorie";
	$requete = "
		SELECT id
			FROM $table_categorie
			WHERE id = $categorie_id";

	$wpdb->get_results( $requete );
	$erreur_sql = $wpdb->last_error;
	if ( $erreur_sql == "" ) {
		if ( $wpdb->num_rows > 0 ) {
            $categorie_valide = true;
		} else {
			$categorie_valide = false;
		}
	} else {
		// écrit l'erreur dans le journal seulement si on est en mode débogage
		elliot_log_debug( $erreur_sql );
	}

    return $categorie_valide;
}

/**
 *
 * Affiche le résultat du traitement du formulaire de contact.
 *
 * @author Elliot Gaulin
 */
function elliot_afficher_resultat_formulaire_ajout_item(){
	$code_html = "";
	if ( isset( $_SESSION['SuccesFormulaireAjoutItem'] ) ){
		//Si le formulaire à fonctionner : vert
		if ( $_SESSION['SuccesFormulaireAjoutItem'] ){
			echo "<div class='notice notice-success is-dismissible' role='alert'>";
			//Sinon danger pour rouge
		} else {
			echo "<div class='notice notice-warning is-dismissible' role='alert'>";
		}

		if ( isset( $_SESSION['MessageFormulaireAjoutItem'] ) ) {
			echo $_SESSION['MessageFormulaireAjoutItem'];
			unset($_SESSION['MessageFormulaireAjoutItem']);
		} else {
			echo "Veuillez vous fier à la couleur de cette alerte pour savoir si le contact à fonctionner";
		}
		echo "</div>";

		unset($_SESSION['SuccesFormulaireAjoutItem']);
	}
	return $code_html;
}
add_action( 'admin_notices', 'elliot_afficher_resultat_formulaire_ajout_item' );

function elliot_afficher_formulaire_edition(){
    global $wpdb;
    $code_html = "";

	$message_aucune_donnee = __( 'Aucune donnée ne correspond aux critères demandés.', 'fr_CA' );
	$message_erreur_sql = __( 'Oups ! Un problème a été rencontré.', 'fr_CA' );

    $table_items = $wpdb->prefix . "elliot_items";
	$nonce = wp_nonce_field( 'modifier_item', 'nonce_modifier_item', true, false);


	$requete_item = "
		SELECT titre, description, location_image, categorie_id, id 
			FROM $table_items
			WHERE id = %s";
    $requete_item = $wpdb->prepare($requete_item, array( $_GET['id'] ) );
	$resultat_item = $wpdb->get_results( $requete_item );
	$num_row_items = $wpdb->num_rows;
	$erreur_sql_item = $wpdb->last_error;

	$code_html_select = "";


	if ( $erreur_sql_item == "" ) {
		if ( $num_row_items > 0 ) {

			$table_categorie = $wpdb->prefix . "elliot_categorie";
			$requete_categorie = "
		SELECT titre, id
			FROM $table_categorie
			ORDER BY titre";

			$resultat = $wpdb->get_results( $requete_categorie );
			$erreur_sql = $wpdb->last_error;
			if ( $erreur_sql == "" ) {
				if ( $wpdb->num_rows > 0 ) {
					foreach ( $resultat as $enreg ) {
						$code_html_select .= "
					<option value='$enreg->id'>$enreg->titre</option>
				";
					}
				} else {
					$code_html_select .= '<div class="alert alert-danger">';
					$code_html_select .= __("Aucune catégorie n'a été trouvée", "elliot");
					$code_html_select .= '</div>';
				}
			} else {
				$code_html_select .= '<div class="alert alert_danger">';
				$code_html_select .= __("Erreur de connexion au système");
				$code_html_select .= '</div>';
				// écrit l'erreur dans le journal seulement si on est en mode débogage
				elliot_log_debug( $erreur_sql );
			}


			$code_html = "";
			$code_html .= "	<div class='row mb-4'>";


			foreach ( $resultat_item as $enreg ) {
				$code_html .= "
                    <form method='post' action='". get_stylesheet_directory_uri(). "/modifier-item.php'>
                        $nonce
                        <input type='hidden' name='id' value='$enreg->id'>
                        <div class='row'>
                            <div class='col-md-6'>
                                <div class='form-group'>
                                    <label for='titre'>" . __('* Titre', 'elliot'). "</label>
                                    <input type='text' class='form-control' id='titre' name='titre' value='$enreg->titre' maxlength='255' required>
                                </div>
                            </div>
                            <!--  col-md-6   -->
                            <div class='col-md-6'>
                                <div class='form-group'>
                                    <label for='url'>" . __('* Adresse url', 'elliot') . "</label>
                                    <input type='url' class='form-control' id='url' name='url' value='$enreg->location_image' maxlength='255' required>
                                </div>
                            </div>
                            <!--  col-md-6   -->
                        </div>
                        <div class='row mb-3'>
                            <div class='col-md-12'>
                                <label for='description'>" . __('* Description', 'elliot') . "</label>
                                <textarea class='form-control' id='description' rows='4' name='description' required>$enreg->description</textarea>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='col-md-12'>
                                <div class='form-group'>
                                    <label for='categorie'>" . __('* Catégorie', 'elliot') . "</label>
                                    <select class='form-control' name='categorie' required>
                                    " . $code_html_select ."
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type='submit' class='page-title-action'>" . __('Envoyer', 'elliot') . "</button>
                    </form>
				";
			}
			$code_html .= '</div>';
		} else {
			$code_html .= '<div class="notice notice-warning is-dismissible">';
			$code_html .= $message_aucune_donnee;
			$code_html .= '</div>';
		}
	} else {
		$code_html .= '<div class="notice notice-error is-dismissible">';
		$code_html .= $message_erreur_sql;
		$code_html .= '</div>';
		// écrit l'erreur dans le journal seulement si on est en mode débogage
		elliot_log_debug( $erreur_sql_item );
	}
	return $code_html;
}

/**
 *
 * Affiche le résultat du traitement du formulaire de contact.
 *
 * @author Elliot Gaulin
 */
function elliot_afficher_resultat_formulaire_modification_item(){
	$code_html = "";
	if ( isset( $_SESSION['SuccesFormulaireModificationItem'] ) ){
		//Si le formulaire à fonctionner : vert
		if ( $_SESSION['SuccesFormulaireModificationItem'] ){
			echo "<div class='notice notice-success is-dismissible' role='alert'>";
			//Sinon danger pour rouge
		} else {
			echo "<div class='notice notice-warning is-dismissible' role='alert'>";
		}

		if ( isset( $_SESSION['MessageFormulaireModificationItem'] ) ) {
			echo $_SESSION['MessageFormulaireModificationItem'];
			unset($_SESSION['MessageFormulaireModificationItem']);
		} else {
			echo "Veuillez vous fier à la couleur de cette alerte pour savoir si le contact à fonctionner";
		}
		echo "</div>";

		unset($_SESSION['SuccesFormulaireModificationItem']);
	}
	return $code_html;
}
add_action( 'admin_notices', 'elliot_afficher_resultat_formulaire_modification_item' );

/**
 * Ajout des tables personalisée pour les inscriptions dans le thème enfant Elliot
 *
 * Utilisation add_action( "after_switch_theme", "elliot_creer_table_inscription")
 * @author Elliot Gaulin
 */
function elliot_creer_table_inscription() {
	global $wpdb;

	$charset_collate = $wpdb->get_charset_collate();

	$nom_table = $wpdb->prefix . 'elliot_inscription';

	$requete_sql = "CREATE TABLE $nom_table (
		`id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
		nomfamille varchar(255),
		prenom varchar(255),
		telephone varchar(10),
		ip varchar(15),
		PRIMARY KEY (`id`)
		)$charset_collate;";


	require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	dbDelta( $requete_sql );
}

add_action( "after_switch_theme", "elliot_creer_table_inscription" );

function elliot_creer_page_inscriptions(){
	global $title;   // titre de la page du menu, tel qu'initialisé dans la fonction de rappel de add_menu_page
	?>
    <div class="wrap">
        <h1 class="wp-header-head"><?php echo $title; ?></h1>
        <hr class="wp-header-end">
		<?php
		echo elliot_afficher_liste_inscriptions();
		?>
    </div>
	<?php
}

function elliot_afficher_liste_inscriptions() {
	global $wpdb;
	$code_html = "";
	$message_aucune_donnee = __( 'Aucune donnée ne correspond aux critères demandés.', 'fr_CA' );
	$message_erreur_sql = __( 'Oups ! Un problème a été rencontré.', 'fr_CA' );

	$table = $wpdb->prefix . "elliot_inscription";

	$requete = "
		SELECT nomfamille, prenom, ip, telephone 
			FROM $table
			ORDER BY prenom";
	$resultat = $wpdb->get_results( $requete );
	$erreur_sql = $wpdb->last_error;

	if ( $erreur_sql == "" ) {
		if ( $wpdb->num_rows > 0 ) {
			$code_html = "";
			$code_html .= "
                <table class='table'>
                    <thead>
                        <tr>
                            <th>" . __('Prénom', 'elliot') . "</th>
                            <th>" . __('Nom de famille', 'elliot') . "</th>
                            <th>" . __('Adresse ip', 'elliot') . "</th>
                            <th>" . __('Téléphone', 'elliot') . "</th>
                        </tr>
                    </thead>
                    <tbody>
            ";

			foreach ( $resultat as $enreg ) {
				//$url_suppression = get_stylesheet_directory_uri() . "/suppression-item.php?id=$enreg->id";
				//$url_suppression_protege = wp_nonce_url( $url_suppression, "supprimer_item_$enreg->id" );
				$code_html .= "
					<tr>
					    <th>$enreg->prenom</th>
                        <th>$enreg->nomfamille</th>
                        <th>$enreg->ip</th>
                        <th>$enreg->telephone</th>
                    </tr>
				";
			}
			$code_html .= '</tbody></table>';
		} else {
			$code_html .= '<div class="messageavertissement">';
			$code_html .= $message_aucune_donnee;
			$code_html .= '</div>';
		}
	} else {
		$code_html .= '<div class="messageerreur">';
		$code_html .= $message_erreur_sql;
		$code_html .= '</div>';
		// écrit l'erreur dans le journal seulement si on est en mode débogage
		elliot_log_debug( $erreur_sql );
	}
	return $code_html;
}

function elliot_creer_page_ajout_inscription(){
	global $title;   // titre de la page du menu, tel qu'initialisé dans la fonction de rappel de add_menu_page
	?>
    <div class="wrap">
    <h1 class="wp-header-head"><?php echo $title; ?></h1>
    <hr class="wp-header-end">
    <?php
	$nonce = wp_nonce_field( 'ajouter_inscription', 'nonce_ajouter_inscription', true, false);

	$code_html = "
        <form method='post' action='". get_stylesheet_directory_uri(). "/enregistrer-inscription.php'>
            $nonce
            <div class='row'>
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='prenom'>" . __('* Prenom', 'elliot'). "</label>
                        <input type='text' class='form-control' id='prenom' name='prenom' maxlength='255' required>
                    </div>
                </div>
                <!--  col-md-6   -->
                <div class='col-md-6'>
                    <div class='form-group'>
                        <label for='nom'>" . __('* Nom', 'elliot') . "</label>
                        <input type='text' class='form-control' id='nom' name='nom' maxlength='255' required>
                    </div>
                </div>
                <!--  col-md-6   -->
            </div>
            <div class='row mb-3'>
                <div class='col-md-12'>
                    <label for='description'>" . __('* Téléphone', 'elliot') . "</label>
                        <input type='tel' class='form-control' id='telephone' name='telephone' pattern='[0-9]{10}' required>
                </div>
            </div>
            <button type='submit' class='page-title-action'>" . __('Envoyer', 'elliot') . "</button>
        </form>
	";

	echo $code_html;
    ?>
    </div>
    <?php
}

/**
 *
 * Affiche le résultat du traitement du formulaire de contact.
 *
 * @author Elliot Gaulin
 */
function elliot_afficher_resultat_formulaire_ajout_inscription(){
	$code_html = "";
	if ( isset( $_SESSION['SuccesFormulaireAjoutInscription'] ) ){
		//Si le formulaire à fonctionner : vert
		if ( $_SESSION['SuccesFormulaireAjoutInscription'] ){
			echo "<div class='notice notice-success is-dismissible' role='alert'>";
			//Sinon danger pour rouge
		} else {
			echo "<div class='notice notice-warning is-dismissible' role='alert'>";
		}

		if ( isset( $_SESSION['MessageFormulaireAjoutInscription'] ) ) {
			echo $_SESSION['MessageFormulaireAjoutInscription'];
			unset($_SESSION['MessageFormulaireAjoutInscription']);
		} else {
			echo "Veuillez vous fier à la couleur de cette alerte pour savoir si le contact à fonctionner";
		}
		echo "</div>";

		unset($_SESSION['SuccesFormulaireAjoutInscription']);
	}
	return $code_html;
}
add_action( 'admin_notices', 'elliot_afficher_resultat_formulaire_ajout_inscription' );