<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
header('Content-type:image/png');

use Website\Couscous\Assets;

$error = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/images/broken.png");
$pending = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/images/pending.png");

$assetId = (int)($_GET['assetId'] ?? die($error));
$assetThumb = Assets::fetch($assetId);

if(!$assetThumb){die($error);}

if(file_exists($_SERVER['DOCUMENT_ROOT'] . "/renders/assets/". $assetId .".png")){
	die(file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/renders/assets/". $assetId .".png"));
} else {
	die($pending);
}