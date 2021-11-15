<?php
require_once "../../../wp-load.php";
require_once 'functions.php';
global $wpdb;


$_SESSION['SuccesFormulaireModificationItem'] = true;

if ( $_POST['titre'] ){
	$titre = $_POST['titre'];
	if ( strlen($titre) > 255 ) {
		$_SESSION['SuccesFormulaireModificationItem'] = false;
		$_SESSION['MessageFormulaireModificationItem'] = __("Le titre peut être d'un maximum de 255 charactères.", "elliot");
	}
} else {
	$_SESSION['SuccesFormulaireModificationItem'] = false;
	$_SESSION['MessageFormulaireModificationItem'] = __("Veuillez entrer un titre.", "elliot");
}
if ( isset( $_POST['url'] ) ){
	$url = $_POST['url'];
	if ( ! filter_var($url, FILTER_VALIDATE_URL) ){
		$_SESSION['SuccesFormulaireModificationItem'] = false;
		$_SESSION['MessageFormulaireModificationItem'] = __("L'adresse url est invalide", "elliot");
	}
	if ( strlen($titre) > 255 ) {
		$_SESSION['SuccesFormulaireModificationItem']  = false;
		$_SESSION['MessageFormulaireModificationItem'] = __( "L'url peut être d'un maximum de 255 charactères.", "elliot" );
	}
} else {
	$_SESSION['SuccesFormulaireModificationItem'] = false;
	$_SESSION['MessageFormulaireModificationItem'] = __("Veuillez entrer un adresse url vers une image valide", "elliot");
}
if ( isset( $_POST['description'] ) ){
	$description = $_POST['description'];
} else {
	$_SESSION['SuccesFormulaireModificationItem'] = false;
	$_SESSION['MessageFormulaireModificationItem'] = __("Veuillez entrer une description", "elliot");
}
if ( isset( $_POST['categorie'] ) ){
	$categorie = $_POST['categorie'];
	if ( ! elliot_verifier_categorie($categorie) ){
		$_SESSION['SuccesFormulaireModificationItem'] = false;
		$_SESSION['MessageFormulaireModificationItem'] = __("La catégorie choisie n'existe pas", "elliot");
	}
} else {
	$_SESSION['SuccesFormulaireModificationItem'] = false;
	$_SESSION['MessageFormulaireModificationItem'] = __("Veuillez entrer une categorie", "elliot");
}
if ( isset( $_POST['nonce_modifier_item'] ) ){
	if ( ! wp_verify_nonce( $_POST['nonce_modifier_item'], 'modifier_item' ) ) {
		$_SESSION['SuccesFormulaireModificationItem'] = false;
		$_SESSION['MessageFormulaireModificationItem'] = __('Une erreur est survenue. Veuillez réessayer.');
	}
} else {
	$_SESSION['SuccesFormulaireModificationItem'] = false;
	$_SESSION['MessageFormulaireModificationItem'] = __('Une erreur est survenue. Veuillez réessayer.');
}
if ( isset( $_POST['id'] ) ) {
	$id = htmlspecialchars($_POST['id']);
	//Vérification de la validité de l'id
	$table_items = $wpdb->prefix . "elliot_items";
	$requete_item = "
		SELECT 1 
			FROM $table_items
			WHERE id = %s";
	$requete_item = $wpdb->prepare($requete_item, array( $_POST['id'] ) );
	$resultat_item = $wpdb->get_results( $requete_item );
	if ( ! $wpdb->num_rows  > 0){
		$_SESSION['SuccesFormulaireModificationItem'] = false;
		$_SESSION['MessageFormulaireModificationItem'] = __('L\'item que vous essayer de modifier ne semble pas exister');	
	}
} else {
	$_SESSION['SuccesFormulaireModificationItem'] = false;
	$_SESSION['MessageFormulaireModificationItem'] = __('Une erreur est survenue. Veuillez réessayer.');
}

$titre = htmlspecialchars( $titre );
$url = htmlspecialchars( $url );
$description = htmlspecialchars( $description );
$categorie = htmlspecialchars( $categorie );

$table_categorie = $wpdb->prefix . "elliot_items";

if ( $_SESSION['SuccesFormulaireModificationItem'] ){
	$reussite = $wpdb->update(
		$table_categorie,
		array(
			'titre' => $titre,
			'description'  => $description,
			'location_image' => $url,
			'categorie_id' => $categorie
		),
		array(
			'ID'=> $id
		),
		array(
			'%s',
			'%s',
			'%s',
			'%d'
		)
	);
	if ( $reussite ){
		$_SESSION['MessageFormulaireModificationItem'] = __('Item modifier avec succès.', 'elliot');
	} else {
		// réagir en cas de problème
		elliot_log_debug( $wpdb->last_error );
		$_SESSION['SuccesFormulaireModificationItem'] = false;
		$_SESSION['MessageFormulaireModificationItem'] = __('Une erreur s\'est produite.', 'elliot');
	}
}
wp_redirect( get_admin_url() . 'admin.php?page=elliot_gestion' );