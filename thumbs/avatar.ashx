<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
header('Content-type:image/png');

use Website\Couscous\Users;

$error = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/images/broken.png");
$pending = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/images/pending.png");

$userId = (int)($_GET['userId'] ?? die($error));
$userThumb = Users::fetch($userId);

if(!$userThumb){die($error);}

if(file_exists($_SERVER['DOCUMENT_ROOT'] . "/renders/users/". $userId .".png")){
	die(file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/renders/users/". $userId .".png"));
} else {
	die($pending);
}