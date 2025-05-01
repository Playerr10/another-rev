<?php
function SignScript($script) {
    $signature;
$key = file_get_contents("./PrivateKey.pem");
openssl_sign($script,$signature,$key,OPENSSL_ALGO_SHA1);
return "--rbxsig2".sprintf("%%%s%%%s",base64_encode($signature),$script);
}
?>
