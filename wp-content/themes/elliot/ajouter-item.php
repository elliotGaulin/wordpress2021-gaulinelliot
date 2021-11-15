<?php
require_once "../../../wp-load.php";
require_once 'functions.php';
global $wpdb;


$_SESSION['SuccesFormulaireAjoutItem'] = true;

if ( $_POST['titre'] ){
	$titre = $_POST['titre'];
	if ( strlen($titre) > 255 ) {
		$_SESSION['SuccesFormulaireAjoutItem'] = false;
		$_SESSION['MessageFormulaireAjoutItem'] = __("Le titre peut être d'un maximum de 255 charactères.", "elliot");
	}
} else {
	$_SESSION['SuccesFormulaireAjoutItem'] = false;
	$_SESSION['MessageFormulaireAjoutItem'] = __("Veuillez entrer un titre.", "elliot");
}
if ( isset( $_POST['url'] ) ){
	$url = $_POST['url'];
	if ( ! filter_var($url, FILTER_VALIDATE_URL) ){
		$_SESSION['SuccesFormulaireAjoutItem'] = false;
		$_SESSION['MessageFormulaireAjoutItem'] = __("L'adresse url est invalide", "elliot");
	}
	if ( strlen($titre) > 255 ) {
		$_SESSION['SuccesFormulaireAjoutItem']  = false;
		$_SESSION['MessageFormulaireAjoutItem'] = __( "L'url peut être d'un maximum de 255 charactères.", "elliot" );
	}
} else {
	$_SESSION['SuccesFormulaireAjoutItem'] = false;
	$_SESSION['MessageFormulaireAjoutItem'] = __("Veuillez entrer un adresse url vers une image valide", "elliot");
}
if ( isset( $_POST['description'] ) ){
	$description = $_POST['description'];
} else {
	$_SESSION['SuccesFormulaireAjoutItem'] = false;
	$_SESSION['MessageFormulaireAjoutItem'] = __("Veuillez entrer une description", "elliot");
}
if ( isset( $_POST['categorie'] ) ){
	$categorie = $_POST['categorie'];
	if ( ! elliot_verifier_categorie($categorie) ){
		$_SESSION['SuccesFormulaireAjoutItem'] = false;
		$_SESSION['MessageFormulaireAjoutItem'] = __("La catégorie choisie n'existe pas", "elliot");
	}
} else {
	$_SESSION['SuccesFormulaireAjoutItem'] = false;
	$_SESSION['MessageFormulaireAjoutItem'] = __("Veuillez entrer une categorie", "elliot");
}
if ( isset( $_POST['nonce_ajouter_item'] ) ){
	if ( ! wp_verify_nonce( $_POST['nonce_ajouter_item'], 'ajouter_item' ) ) {
		$_SESSION['SuccesFormulaireAjoutItem'] = false;
		$_SESSION['MessageFormulaireAjoutItem'] = __('Une erreur est survenue. Veuillez réessayer.');
	}
} else {
	$_SESSION['SuccesFormulaireAjoutItem'] = false;
	$_SESSION['MessageFormulaireAjoutItem'] = __('Une erreur est survenue. Veuillez réessayer.');
}
$titre = htmlspecialchars( $titre );
$url = htmlspecialchars( $url );
$description = htmlspecialchars( $description );
$categorie = htmlspecialchars( $categorie );

$table_categorie = $wpdb->prefix . "elliot_items";

if ( $_SESSION['SuccesFormulaireAjoutItem'] ){
	$reussite = $wpdb->insert(
		$table_categorie,
		array(
			'titre' => $titre,
			'description'  => $description,
			'location_image' => $url,
			'categorie_id' => $categorie
		),
		array(
			'%s',
			'%s',
			'%s',
			'%d'
		)
	);
	if ( $reussite ){
		$_SESSION['MessageFormulaireAjoutItem'] = __('Item ajouté avec succès.', 'elliot');
	} else {
		// réagir en cas de problème
		elliot_log_debug( $wpdb->last_error );
		$_SESSION['SuccesFormulaireAjoutItem'] = false;
		$_SESSION['MessageFormulaireAjoutItem'] = __('Une erreur s\'est produite.', 'elliot');
	}
}
if ( $_SESSION['SuccesFormulaireAjoutItem'] ){
	wp_redirect( get_admin_url() . 'admin.php?page=elliot_gestion' );
} else {
	wp_redirect( get_admin_url() . 'admin.php?page=elliot_ajout' );
}
