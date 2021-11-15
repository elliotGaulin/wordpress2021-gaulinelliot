<?php
require_once "../../../wp-load.php";
require_once 'functions.php';
global $wpdb;

$_SESSION['SuccesFormulaireContact'] = true;

if ( $_POST['prenom'] ){
	$prenom = $_POST['prenom'];
} else {
	$_SESSION['SuccesFormulaireContact'] = false;
	$_SESSION['MessageFormulaireContact'] = __("Veuillez entrer un prénom valide.", "elliot");
}
if ( isset( $_POST['nom'] ) ){
	$nom = $_POST['nom'];
} else {
	$_SESSION['SuccesFormulaireContact'] = false;
	$_SESSION['MessageFormulaireContact'] = __("Veuillez entrer un nom valide", "elliot");
}
if ( isset( $_POST['email'] ) ){
	$email = $_POST['email'];
	if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
		$_SESSION['MessageFormulaireContact'] = __("Format email invalide!", "elliot");
		$_SESSION['SuccesFormulaireContact'] = false;
	}
} else {
	$_SESSION['SuccesFormulaireContact'] = false;
	$_SESSION['MessageFormulaireContact'] = __("Veuillez entrer un email valide", "elliot");
}
if ( isset( $_POST['sujet'] ) ){
	$sujet = $_POST['sujet'];
} else {
	$_SESSION['SuccesFormulaireContact'] = false;
	$_SESSION['MessageFormulaireContact'] = __("Veuillez entrer un sujet valide", "elliot");
}
if ( isset( $_POST['message'] ) ){
	$message = $_POST['message'];
} else {
	$_SESSION['MessageFormulaireContact'] = __("Veuillez entrer un message valide", "elliot");
	$_SESSION['SuccesFormulaireContact'] = false;
}
$captcha = null;
if (isset($_POST['g-recaptcha-response'])){
	$captcha = $_POST['g-recaptcha-response'];
}
// si le captcha a été reçu
if ( $captcha ) {
	$url = 'https://www.google.com/recaptcha/api/siteverify';

	$data = [
		'secret' => '6LdZ4wodAAAAAOw5_65Zdvj1ueNZy8M9gTitXDnp',
		'response' => $captcha,
		'remoteip' => $_SERVER['REMOTE_ADDR'],
	];

	$options = [
		'http' => [
			'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
			'method'  => 'POST',
			'content' => http_build_query($data),
		],
		"ssl"=> [
			"verify_peer"=>!WP_DEBUG,   // pendant le développement, on ne veut pas de vérification SSL. Sans ceci, on obtiendrait  l'erreur "Warning: file_get_contents(): SSL operation failed with code 1"
			"verify_peer_name"=>!WP_DEBUG,
		],
	];

	$contexte  = stream_context_create( $options );
	$reponse = file_get_contents( $url, false, $contexte );
	$clesReponse = json_decode( $reponse, true );

	if ( $clesReponse['success'] == true && $clesReponse['action'] == 'soumissioncontact' ) {
		// le test est réussi, on peut poursuivre le traitement du formulaire, notamment la validation côté serveur, puis procéder à l'envoi du courriel
		if ( $_SESSION['SuccesFormulaireContact'] ){
			$prenom = htmlspecialchars($prenom);
			$nom = htmlspecialchars($nom);
			$email = htmlspecialchars($email);
			$sujet = htmlspecialchars($sujet);
			$message = htmlspecialchars($message);

			$nom_table = $wpdb->prefix . 'elliot_contact';
			$reussite = $wpdb->insert(
				$nom_table,
				array(
					'nom' => $nom,
					'prenom' => $prenom,
					'email' => $email,
					'sujet' => $sujet,
					'message' => $message,
					'ip' => $_SERVER['REMOTE_ADDR'],
					'date' =>current_time('mysql', 1)
				),
				array(
					'%s',
					'%s',
					'%s',
					'%s',
					'%s',
					'%s'
				)
			);
			if ( !$reussite ) {
				elliot_log_debug($wpdb->last_error);
				$_SESSION['MessageFormulaireContact'] = __('Une erreur est survenue', 'elliot');
			} else {
				$_SESSION['MessageFormulaireContact'] = __('Formulaire de contact rempli avec succès!','elliot');
			}
			$headers[] = "Reply-To: <$email>";
			$message = "De : $prenom $nom \nEmail : $email\n    \nMessage :\n" . $message;
			$envoi_reussi = wp_mail( "admin@elliotgaulin.ca", $sujet, $message, $headers );
			if ( ! $envoi_reussi ){
				$_SESSION['MessageFormulaireContact'] = __('Une erreur est survenue', 'elliot');
			}
			wp_redirect( get_stylesheet_directory_uri() . '/../../../' );
		} else {
			wp_redirect( get_stylesheet_directory_uri() . '/../../../contact' );
		}

	} else {
		// Test échoué. Afficher un message du genre "Le jeton de sécurité a expiré ou vous êtes considéré comme un robot. Votre message n'a pas pu être envoyé."
		$_SESSION['MessageFormulaireContact'] = __('Vous êtes considéré comme un robot','elliot');
		$_SESSION['SuccesFormulaireContact'] = false;
	}
} else {
	// Captcha pas reçu. Afficher un message du genre "Il n'est pas possible de vérifier si vous êtes un robot pour l'instant. Votre message n'a pas pu être envoyé."
	$_SESSION['MessageFormulaireContact'] = __( 'Il n\'est pas possible de vérifier si vous êtes un robot pour l\'instant. Votre message n\'a pas pu être envoyé.', 'elliot' );
	$_SESSION['SuccesFormulaireContact']  = false;
}
wp_redirect( get_stylesheet_directory_uri() . '/../../../' );
