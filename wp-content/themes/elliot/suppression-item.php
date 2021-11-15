<?php
require_once "../../../wp-load.php";
require_once 'functions.php';
global $wpdb;

// les variables de session seront initialisées à true seulement si tous les tests sont réussis
$_SESSION['SuccesSuppressionItem'] = false;
$_SESSION['MessageSuppressionItem'] = "";
$_SESSION['monprefixe_nonce_lien_valide'] = false;
$nonce_valide = false;

if ( isset( $_GET['_wpnonce'] ) ) {   // si la page a reçu le nonce en paramètre
	if ( isset( $_GET['id'] ) ) {

		$id = $_GET['id'];

		if ( wp_verify_nonce( $_GET['_wpnonce'], "supprimer_item_$id" ) ) {
			$nonce_valide = true;
		}
	}
}

$table_items = $wpdb->prefix . "elliot_items";
if ( $nonce_valide ) {
	if ( $wpdb->delete($table_items, [ 'id' => $id ] ) ) {
		$_SESSION['monprefixe_suppression_item_reussie'] = true;
		$_SESSION['MessageSuppressionItem'] = "Supression réussie!";

	} else {
		$_SESSION['MessageSuppressionItem'] = "Supression non réussie";
		elliot_log_debug( $wpdb->last_error );
	}
} else {
	$_SESSION['MessageSuppressionItem'] = "Erreur. Veuillez réessayer";
}
wp_redirect( get_admin_url() . 'admin.php?page=elliot_gestion' );