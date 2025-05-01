<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');

header("content-type: text/plain");

$id = $_GET['ID'] ?? $_GET['id'] ?? die(json_encode(["message" => "Unable to process request."]));

switch(true) {
	case file_exists($_SERVER["DOCUMENT_ROOT"] . "/asset/uploaded/$id"): // if it exists on the site
        $asset = file_get_contents($_SERVER["DOCUMENT_ROOT"] . "/asset/uploaded/" . $id);
        $asset = str_replace("www.roblox.com", $url, $asset);
		break;
	default: // if it's a roblox asset
	    die(header('Location: https://assetdelivery.roblox.com/v1/asset/?id='. $id));
/*
	    $asset = file_get_contents('https://assetdelivery.roblox.com/v1/asset/?id='. $id);
		$asset = str_replace("www.roblox.com", $host, $asset); 
		
  doing this would lead to assets not loading properly at first, which would be fine, but usually the first assets to load are corescripts or ones that can't be reloaded in a game
  leading to for example the settings help page or health bar being permanently fucked, same can apply for decals in general
  might just use a dll in a client to get the links to convert to roblox.com automatically, lure exists after all


*/
		break;
}

if ($asset) {
    die($asset);
} else {
    header("Content-Type: image/jpg");
    die(file_get_contents("../images/thumbs/broken.png"));
}