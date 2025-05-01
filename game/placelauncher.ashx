<?php
header("Content-Type: application/json");
?>
{
    "jobId":"Test",
    "status":2,
    "joinScriptUrl":"http://www.acerev.xyz/game/join.ashx?ip=<?php echo $_GET["ip"] ?? "localhost"?>",
    "authenticationUrl":"http://www.acerev.xyz/game/Negotiate.ashx",
    "authenticationTicket":"SomeTicketThatDosentCrash",
    "message":""
}