<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');

if (isset($_COOKIE['R08LOXSECURITY'])) {
		setcookie('R08LOXSECURITY', null, -1, '/', $_SERVER['SERVER_NAME']); 
		header("Location: /");
		die();
} else {
		header("Location: /");
		die();
}