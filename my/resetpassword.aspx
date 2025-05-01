<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/modules/my/account.php');

use Website\Couscous\Users;

Users::requireLoggedIn();

$aspnetForm = true;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 

foreach($errorList as $info):
echo '<div class="SystemAlert">
						<div class="SystemAlertText" style="background-color: #ff0000">
							<div class="Exclamation">
							</div>
							<div>'.$info.'</div>
						</div>
					</div>';
endforeach;
?>

<div id="Body">	

<div class="DGB_Content">
<table>
<p>Change Your Password</p>
    <tr>
        <td>Password:</td>
        <td><input type="password" style="width: 180px;" class="TextBox" name="oldpass" id="txtPassword" tabindex="1"></td>
    </tr>
     <tr>
        <td>New Password:</td>
        <td><input type="password" style="width: 180px;" class="TextBox" name="newpass" id="txtPassword" tabindex="1"></td>
    </tr>
    <tr>
        <td>Confirm New Password:</td>
        <td><input type="password" style="width: 180px;" class="TextBox" name="confirmpass" id="txtPassword" tabindex="1"></td>
    </tr>
</table>
		    <div class="Confirm">
				<input type="submit" name="passupd" value="Change Password" id="ctl00_cphRoblox_CreateAccountButton" tabindex="5" class="Button">
			</div>
</div>
				</div>

				
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php');  ?>