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

	return '<link rel="apple-touch-icon" sizes="180x180" href="' . get_site_url() . '/apple-touch-icon.png">';
}

add_action( 'wp_head', 'elliot_ajuster_head' );
add_action( 'admin_head', 'elliot_ajuster_head' );

/*
 *
 */
function elliot_afficher_liste_items() {
	global $wpdb;
	$code_html = "";
	$message_aucune_donnee = _e( 'Aucune donnée ne correspond aux critères demandés.', 'fr_CA' );
	$message_erreur_sql = _e( 'Oups ! Un problème a été rencontré.', 'fr_CA' );

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
							<img class='card-img-top' src='$enreg->location_image' alt='Card image cap'>
							<div class='card-body'>
								<h5 class='card-title'>$enreg->titre</h5>
								<p class='card-text'>$enreg->description</p>
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
