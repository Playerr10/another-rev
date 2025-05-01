<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

header("Pragma: no-cache");
header("Cache-Control: no-cache");

$_GET = array_change_key_case($_GET, CASE_LOWER);
$userId = (int)($_GET['userid'] ?? 0);

$fetch = Users::fetch($userId);
if(!$fetch)die("Invalid request.");
$colors = explode(';', $fetch->bodycolors);

?>
<?xml version="1.0" encoding="utf-8"?>
<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">
	<External>null</External>
	<External>nil</External>
	<Item class="BodyColors">
		<Properties>
			<int name="HeadColor"><?=$colors[0]?></int>
			<int name="LeftArmColor"><?=$colors[2]?></int>
			<int name="LeftLegColor"><?=$colors[4]?></int>
			<string name="Name">Body Colors</string>
			<int name="RightArmColor"><?=$colors[3]?></int>
			<int name="RightLegColor"><?=$colors[5]?></int>
			<int name="TorsoColor"><?=$colors[1]?></int>
			<bool name="archivable">true</bool>
		</Properties>
	</Item>
</roblox>