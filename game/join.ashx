<?php
    header("Content-Type: application/json");
	
	//date_default_timezone_set('America/Chicago');
	function createClientTicket($userId = 1, $username = "Player", $jobId = "Test"){
			
		$timestamp = date("n/j/Y g:i:s A");

    // Create Pre Authentication string
    $preauth = "$userId\n$jobId\n$timestamp";
    // Create Authentication string
    $auth = "$userId\n$username\n". 0 ."\n$jobId\n$timestamp";

		$key = "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAyX0fo+7XYM4Sc+QUgzTVrlFH4wemHoZSRJAOOkZ80sNY4uJj5Rj4wVoUwqNgQvdTwUw5pfKolhd8e8bY0aWtOLn04fmf14obl26OxcfIZ2FAEQCA2TziN+sM0/SvSSpSlvDEUeFwZXdv1ia1nLeNLtTw0gN/6Vq9ncJMwt7lTjfIYfXHxxDDD0ryQ0C9EIQ/880Z9jUvBWx2QaB9fqPykYLVk3GmVri2B65M6GeUSRJS9Xu+vsMrtKQtUORqAoVFM+9RUBEc4v9dVJkpyIvlBOAssX+nODxHiMyne1c0R7CcUiC4wJZyQELZblvPdQNtOyMQcKoCcdneiHSq2d0W2QIDAQABAoIBAGQHkmW4dYTBybdvTB+3Yz4fbCjx6y7MUJtpSSb1R5L7GG3LJvzd4OFc72GR6oBUeWhFh3kzdy7MiiiJF6s9LTo0V7a4Tvqavgf4Azl9bailR0Epls5Cw6wvLTctCriwIkB9V3mvCjXVjdgrb45WMelGHiilRCN9wRVJGQLF1eF2PnMHKXxKiU4HkCXSGZcWAiQodDEWCv4LvpnSxUV7Ypw8o43ICebLJB5srGy8T3PrHn0nR03gTxI34fvQ5AGhjklxRGJZ/68eSd4Qp6BPdi86Bwe0NWjAvL1q3tKWLwIOAOAW65+/VXc9pNXHbDhWA105K8wZQvkClXmesQfAu2ECgYEA2Uwa2B1X1MIcVenPvsR/yJC+Nv6ayTXg4qRpEe989L7ED4zgn7ORS+NW0sLUl4AvI+RhdRByo1aqzZ8hhkc2MhcD0dOdKZbdtbpfSEneFItVqNVlS9kEs0+gqyTrdGU7cMVdLyX6fh5gYRsZLIKZhmwpF6iqVw4qT4fi+azR/HsCgYEA7WA2fJI2RkuJ5XMrINhDdx489cadIp2TiL5gyFbPjyrwH+ScS7Kpb/vMaGKQDxmgYSteXCV5SFTa8CAlNkvqDCpUsoGwrUsDr099YHLaM/BxmjEd97Ce1GElN5bmm1/OV0/ln/XLT4pptUrrABvAXB0eiQLgRFRYpH8eu4LjK7sCgYAlIpxz0o/wDDxLcmnOcEZmQFZBj8FkIZENKovKRONV8EQRZEH/CPELxw5PdnxeZ8mmmKEPIIB26ZjHCyrvh7v7U3OTqFZzhRTeubsO35DUcftxnwZwr+Xdvv32QZj7i1FdNF14cUUdyJMwBTGIKcmS72kWYfy6Y/FXJiHkCWTZgQKBgA9rPX7P/IiKZZWq6nVCtvco1qrcUN6rv6aVPzIkOW1CS8C2l9Ru8YSdpYRuSo9AieNl7sYrhPpG0MXiQKiLO9O4eDH0LKbFBaNAlZNLQpM3Hhn28MxjA54mBUXcHnSfP4b6YJ8IV0F+aylkiWlDZDZXieE6d5jYpb1hqHxjnx/7AoGBAMK+Mh/0SNi3pSO4h3vc64VvFtdtjX+/UiULUCYi3j8Gc1gQ6437RkozNHsViUbh7fp8JlWd+zioulBKaAfsGod8cJcC4fkmWVfoWkFNcTCjrtR/lvydn9dB1NVNFOh4XhKu8odRhv+vrgdu2reTYguauY+rhNf9JMVo4xagPS3o
-----END RSA PRIVATE KEY-----";
		$key2 = "-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCmpnxW3yZenimJaqMHnk/UB7bh5HqKe1jcGHdkyd6ty9S4CCROj8G4Ut/BMg27XarY+wGATdDy7n1sOHumT5DvLiM/3stgT5/KICiKeXDSLSCBRFVoXuGIC8M3bDoA+8epPw1PPJLu5a+ozT2XB2VvJf4UEw5CWby0Pybt3NfObQIDAQABAoGASWWJ3bjqbUG7iYotw202O2wqX9MBJXyt5kHgU8OVD3Z2eZccZn1qFIRrh+tDoQHf/TCPuLKNFHF1S/SUgOsKKZcLc6BDy1uXbE6j0GgzS40PReJ9ha3MsqqMgH64vexhzafktx2ZKLiVzsRx8pE9SC749mttpZ9rLyylk3tnVQECQQDdHWX4nyRiAtuhh1IplZYEgtxGNzguCmDH0It+K9/6NxAzeYuL1MoBIwI7zqspQFKh5O19THgH3Wp7OkbcjjevAkEAwPFSaoGPF08YuqfBkjxobjIx4/oSSjh/U0gAaCezsT963/2iv1tSJUWhy1Mv9Gz5f4wMJr/vqtc2QS+hmZfGowJAKqcbHoSEXiuy9kvGO6NRVvlvSFQqkCcMWD8QSXxpLjkk9OkDVCvt854vNh49wi1YQ0aH0V3I4auCeNbbCHyenQJADtvGxAr8MQhXWDCJGLDsPehBrVPZyrt1Gr3Fwj+kd/byiINo4CGxPsuQ/S6H1+P4htkLKoTHeTmfpP99C24DzwJBAM+KoXvWlvhLiGpI5TGbnrF3FrFCHLLsO7qOuSEQXu25rTBnnbtkMq0G9hIc7PDfVmStQdzMbLGDv7xvzuePNkM=
-----END RSA PRIVATE KEY-----";

    // Sign the Pre Authentication string
    openssl_sign($preauth, $preauthSignature, $key, OPENSSL_ALGO_SHA1);
    // Sign the Authentication string
    openssl_sign($auth, $remotePlayerAuthSignature, $key, OPENSSL_ALGO_SHA1);

		    return $timestamp.';'.(base64_encode($remotePlayerAuthSignature)).';'.(base64_encode($preauthSignature)) . ';2';
		
	}

    function get_signature($script)
    {
        $signature = "";
        openssl_sign($script, $signature, "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAyX0fo+7XYM4Sc+QUgzTVrlFH4wemHoZSRJAOOkZ80sNY4uJj5Rj4wVoUwqNgQvdTwUw5pfKolhd8e8bY0aWtOLn04fmf14obl26OxcfIZ2FAEQCA2TziN+sM0/SvSSpSlvDEUeFwZXdv1ia1nLeNLtTw0gN/6Vq9ncJMwt7lTjfIYfXHxxDDD0ryQ0C9EIQ/880Z9jUvBWx2QaB9fqPykYLVk3GmVri2B65M6GeUSRJS9Xu+vsMrtKQtUORqAoVFM+9RUBEc4v9dVJkpyIvlBOAssX+nODxHiMyne1c0R7CcUiC4wJZyQELZblvPdQNtOyMQcKoCcdneiHSq2d0W2QIDAQABAoIBAGQHkmW4dYTBybdvTB+3Yz4fbCjx6y7MUJtpSSb1R5L7GG3LJvzd4OFc72GR6oBUeWhFh3kzdy7MiiiJF6s9LTo0V7a4Tvqavgf4Azl9bailR0Epls5Cw6wvLTctCriwIkB9V3mvCjXVjdgrb45WMelGHiilRCN9wRVJGQLF1eF2PnMHKXxKiU4HkCXSGZcWAiQodDEWCv4LvpnSxUV7Ypw8o43ICebLJB5srGy8T3PrHn0nR03gTxI34fvQ5AGhjklxRGJZ/68eSd4Qp6BPdi86Bwe0NWjAvL1q3tKWLwIOAOAW65+/VXc9pNXHbDhWA105K8wZQvkClXmesQfAu2ECgYEA2Uwa2B1X1MIcVenPvsR/yJC+Nv6ayTXg4qRpEe989L7ED4zgn7ORS+NW0sLUl4AvI+RhdRByo1aqzZ8hhkc2MhcD0dOdKZbdtbpfSEneFItVqNVlS9kEs0+gqyTrdGU7cMVdLyX6fh5gYRsZLIKZhmwpF6iqVw4qT4fi+azR/HsCgYEA7WA2fJI2RkuJ5XMrINhDdx489cadIp2TiL5gyFbPjyrwH+ScS7Kpb/vMaGKQDxmgYSteXCV5SFTa8CAlNkvqDCpUsoGwrUsDr099YHLaM/BxmjEd97Ce1GElN5bmm1/OV0/ln/XLT4pptUrrABvAXB0eiQLgRFRYpH8eu4LjK7sCgYAlIpxz0o/wDDxLcmnOcEZmQFZBj8FkIZENKovKRONV8EQRZEH/CPELxw5PdnxeZ8mmmKEPIIB26ZjHCyrvh7v7U3OTqFZzhRTeubsO35DUcftxnwZwr+Xdvv32QZj7i1FdNF14cUUdyJMwBTGIKcmS72kWYfy6Y/FXJiHkCWTZgQKBgA9rPX7P/IiKZZWq6nVCtvco1qrcUN6rv6aVPzIkOW1CS8C2l9Ru8YSdpYRuSo9AieNl7sYrhPpG0MXiQKiLO9O4eDH0LKbFBaNAlZNLQpM3Hhn28MxjA54mBUXcHnSfP4b6YJ8IV0F+aylkiWlDZDZXieE6d5jYpb1hqHxjnx/7AoGBAMK+Mh/0SNi3pSO4h3vc64VvFtdtjX+/UiULUCYi3j8Gc1gQ6437RkozNHsViUbh7fp8JlWd+zioulBKaAfsGod8cJcC4fkmWVfoWkFNcTCjrtR/lvydn9dB1NVNFOh4XhKu8odRhv+vrgdu2reTYguauY+rhNf9JMVo4xagPS3o
-----END RSA PRIVATE KEY-----", OPENSSL_ALGO_SHA1);
        return base64_encode($signature);
    }

    $ip = (isset($_GET["ip"]) ? $_GET["ip"] : "127.0.0.1"); // sets server ip
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
        "SessionId" => "39412c34-2f9b-436f-b19d-b8db90c2e186|00000000-0000-0000-0000-000000000000|0|$ip|8|2021-03-03T17:04:47+01:00|0|null|null",
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