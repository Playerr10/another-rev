<?php
header("Content-Type: application/json");

// Initialize $assetId and $assetid with default values
$assetId = isset($_GET['assetId']) ? $_GET['assetId'] : null;
$assetid = isset($_GET['assetid']) ? $_GET['assetid'] : null;

// Check for "assetid" or "assetId" and respond accordingly
if (isset($_GET['assetid'])) {
    echo '{"Url":"https://tr.rbxcdn.com/647b2019b78d7eca3fd92ec9e7809328/768/432/Image/Png","Final":true}';
} elseif (isset($_GET['assetId'])) {
    echo '{"Url":"https://tr.rbxcdn.com/647b2019b78d7eca3fd92ec9e7809328/768/432/Image/Png","Final":true}';
}
?>
