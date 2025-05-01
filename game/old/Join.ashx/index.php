<?php
    header("Content-Type: application/json");
	
	function raw_signature($script)
	{
		openssl_sign($script, $signature, file_get_contents("../mwahmwah.pem"), OPENSSL_ALGO_SHA1);
		return base64_encode($signature);
	}
	
	function createClientTicket($userId = 0, $username = "Player", $jobId = "Test"){
        
		$preAuth = strval($userId). "\n" . $jobId . "\n". date("n/j/Y") ." ". date("g:i:s A");
		$signedPre = raw_signature($preAuth);
			
		$fullAuth = strval($userId) ."\n". $username. "\n". $userId ."\n" . $jobId . "\n". date("n/j/Y") ." ". date("g:i:s A");
		$signedFull = raw_signature($fullAuth);
			
		// return finished client ticket
		$clientTicket = date("n/j/Y") ." ". date("g:i:s A") .";". $signedFull . ";" . $signedPre . ";2";
		return $clientTicket;
		
	}

    function get_signature($script)
    {
        $signature = "";
        openssl_sign($script, $signature, file_get_contents("../mwahmwah.pem"), OPENSSL_ALGO_SHA1);
        return base64_encode($signature);
    }

    $ip = (isset($_GET["ip"]) ? $_GET["ip"] : "37.114.50.22"); // sets server ip
    $port = (isset($_GET["port"]) ? $_GET["port"] : 53640); // sets server port
    $name = (isset($_GET["name"]) ? $_GET["name"] : "Player"); // sets username
    $mship = (isset($_GET["mship"]) ? $_GET["mship"] : "None"); // sets membership
    $id = (isset($_GET["id"]) ? $_GET["id"] : 1); // sets user id
	$clientticket = createClientTicket($id, $name); // creates client ticket


    /*
	
	kys snowy im NOT doing that shit bruh
	
	*/
    $joinscript = [
        "ClientPort" => 0,
        "MachineAddress" => $ip, // server ip
        "ServerPort" => $port, // server port
        "PingUrl" => "",
        "PingInterval" => 20,
        "UserName" => $name,
        "SeleniumTestMode" => false,
        "UserId" => $id,
        "SuperSafeChat" => false, // disables chat if set to true
        "CharacterAppearance" => "http://api.acerev.xyz/v1.1/avatar-fetch/?userId=".$id."",
        "ClientTicket" => $clientticket,
        "GameId" => 1818, // default game id (it's crossroads)
        "PlaceId" => 1818, // place id too (the place id you use to host with the RCC must match the place id in the joinscript!!)
        "MeasurementUrl" => "", // No telemetry here :)
        "WaitingForCharacterGuid" => "26eb3e21-aa80-475b-a777-b43c3ea5f7d2",
        "BaseUrl" => "http://www.acerev.xyz/", // base url, asks for it so it knows which url to use to fetch apis
        "ChatStyle" => "ClassicAndBubble", // chat style, can be Classic, Bubble and ClassicAndBubble
        "VendorId" => "0",
        "ScreenShotInfo" => "",
        "VideoInfo" => "",
        "CreatorId" => "1", // game creator id, if you join with the id set here you'll have the game creator badge in-game
        "CreatorTypeEnum" => "User",
        "MembershipType" => $mship, // membership, can be None, BuildersClub, TurboBuildersClub and OutrageousBuildersClub in that exact capitalization, if not, client crashes
        "AccountAge" => "3000000", // age of the player's account, for some reason
        "CookieStoreFirstTimePlayKey" => "rbx_evt_ftp",
        "CookieStoreFiveMinutePlayKey" => "rbx_evt_fmp",
        "CookieStoreEnabled" => true,
        "IsRobloxPlace" => true, // checks if the asset id the player is trying to join is a valid place, if not, client won't allow you to join
        "GenerateTeleportJoin" => false,
        "IsUnknownOrUnder13" => false, // used to check if you're a guest or under 13
        "SessionId" => "39412c34-2f9b-436f-b19d-b8db90c2e186|00000000-0000-0000-0000-000000000000|0|190.23.103.228|8|2021-03-03T17:04:47+01:00|0|null|null",
        "DataCenterId" => 0,
        "UniverseId" => 3,
        "BrowserTrackerId" => 0,
        "UsePortraitMode" => false,
        "FollowUserId" => $id,
        "characterAppearanceId" => $id
    ];

    // Encode it!
    $data = json_encode($joinscript, JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);

    // Sign joinscript
	$data = json_encode($joinscript, JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    $signature = get_signature("\r\n" . $data);
    exit("--rbxsig2%". $signature . "%\r\n" . $data);
?>