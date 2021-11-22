<?php
require_once "../../../wp-load.php";
require_once 'functions.php';
global $wpdb;


$_SESSION['SuccesFormulaireAjoutInscription'] = true;

if ( $_POST['prenom'] ){
	$prenom = $_POST['prenom'];
	if ( strlen($prenom) > 255 ) {
		$_SESSION['SuccesFormulaireAjoutInscription'] = false;
		$_SESSION['MessageFormulaireAjoutInscription'] = __("Le prénom peut être d'un maximum de 255 charactères.", "elliot");
	}
} else {
	$_SESSION['SuccesFormulaireAjoutInscription'] = false;
	$_SESSION['MessageFormulaireAjoutInscription'] = __("Veuillez entrer un prénom.", "elliot");
}
if ( $_POST['nom'] ){
	$nom = $_POST['nom'];
	if ( strlen($nom) > 255 ) {
		$_SESSION['SuccesFormulaireAjoutInscription'] = false;
		$_SESSION['MessageFormulaireAjoutInscription'] = __("Le nom peut être d'un maximum de 255 charactères.", "elliot");
	}
} else {
	$_SESSION['SuccesFormulaireAjoutInscription'] = false;
	$_SESSION['MessageFormulaireAjoutInscription'] = __("Veuillez entrer un nom.", "elliot");
}
if ( isset( $_POST['telephone'] ) ) {
	$telephone = $_POST['telephone'];
	if  ( ! is_numeric($telephone) ) {
		$_SESSION['SuccesFormulaireAjoutInscription'] = false;
		$_SESSION['MessageFormulaireAjoutInscription'] = __("Le numéro de téléphone ne peut être composé de 10 chiffres", "elliot");
	}
	if ( strlen($telephone) != 10){
		$_SESSION['SuccesFormulaireAjoutInscription'] = false;
		$_SESSION['MessageFormulaireAjoutInscription'] = __("Le numéro de téléphone doit être composé de 10 chiffres", "elliot");
	}
}

if ( isset( $_POST['nonce_ajouter_inscription'] ) ){
	if ( ! wp_verify_nonce( $_POST['nonce_ajouter_inscription'], 'ajouter_inscription' ) ) {
		$_SESSION['SuccesFormulaireAjoutInscription'] = false;
		$_SESSION['MessageFormulaireAjoutInscription'] = __('Une erreur est survenue. Veuillez réessayer.');
	}
} else {
	$_SESSION['SuccesFormulaireAjoutInscription'] = false;
	$_SESSION['MessageFormulaireAjoutInscription'] = __('Une erreur est survenue. Veuillez réessayer.');
}
$telephone = htmlspecialchars( $telephone );
$nom = htmlspecialchars( $nom );
$prenom = htmlspecialchars( $prenom);
$ip = "127.0.0.1";
$table = $wpdb->prefix . "elliot_inscription";

if ( $_SESSION['SuccesFormulaireAjoutInscription'] ){
	$reussite = $wpdb->insert(
		$table,
		array(
			'nomfamille' => $nom,
			'prenom'  => $prenom,
			'telephone' => $telephone,
			'ip' => $ip
		),
		array(
			'%s',
			'%s',
			'%s',
			'%s'
		)
	);
	if ( $reussite ){
		$_SESSION['MessageFormulaireAjoutInscription'] = __('Inscription ajouté avec succès.', 'elliot');
	} else {
		// réagir en cas de problème
		elliot_log_debug( $wpdb->last_error );
		$_SESSION['SuccesFormulaireAjoutInscription'] = false;
		$_SESSION['MessageFormulaireAjoutInscription'] = __('Une erreur s\'est produite.', 'elliot');
	}
}
if ( $_SESSION['SuccesFormulaireAjoutInscription'] ){
	wp_redirect( get_admin_url() . 'admin.php?page=elliot_inscription' );
} else {
	wp_redirect( get_admin_url() . 'admin.php?page=elliot_ajout_inscription' );
}
