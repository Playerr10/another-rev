<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

header("content-type:text/plain");

$Parameters = (object)
[
	"userid" => $_GET["userid"] ?? 1
];

echo Users::getUserWearing(0, $Parameters->userid, null, "client");
?>