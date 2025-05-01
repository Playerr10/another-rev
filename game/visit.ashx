<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

header("content-type:text/plain");

$Parameters = (object)
[
	"Username" => "Player",
	"UserID" => 0,
	"CharacterAppearance" => ""
];

if(!empty($cookie)){

	$Parameters->Username = $userAuth->username;
	$Parameters->UserID = $userAuth->id;
	$Parameters->CharacterAppearance = Users::getUserWearing(0, $userAuth->id, null, "client");

}

?>

local player = game.Players:createLocalPlayer(<?=$Parameters->UserID;?>)
player.CharacterAppearance = "<?=$Parameters->CharacterAppearance;?>"
player.Name = "<?=$Parameters->Username?>"

function loadCharacter()
    -- load the character and listen for death
    -- player:loadCharacter("http://www.roblox.com//Data/Get.ashx?id=3533")
	player:LoadCharacter()
    local humanoid = player.Character.Humanoid
    humanoid.Died:connect(function() wait(5) loadCharacter() end)
end

game:service("RunService"):run()
loadCharacter()