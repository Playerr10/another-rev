<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/modules/my/account.php');

use Website\Couscous\Users;

Users::requireLoggedIn();

$aspnetForm = true;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 

foreach($errorList as $info){
echo '<div class="SystemAlert">
						<div class="SystemAlertText" style="background-color: #ff0000">
							<div class="Exclamation">
							</div>
							<div>'.$info.'</div>
						</div>
					</div>';
}
?>

<div id="Body">	
	<div id="EditProfileContainer">
		<h2>Edit Profile</h2>
		<div id="AgeGroup">
			<fieldset title="Update your age-group">
				<legend>Update your age-group</legend>
				<div class="Suggestion">
					This is used to customize your ROBLOX experience.  Users under 13 years are only shown pre-approved images.
				</div>
				<div class="AgeGroupRow">
					<table id="ctl00_cphRoblox_rblAgeGroup" border="0">
	<tbody><tr>
		<td><input id="ctl00_cphRoblox_rblAgeGroup_0" type="radio" name="ctl00$cphRoblox$rblAgeGroup" value="1" tabindex="1"><label for="ctl00_cphRoblox_rblAgeGroup_0">Under 13 years</label></td>
	</tr><tr>
		<td><input id="ctl00_cphRoblox_rblAgeGroup_1" type="radio" name="ctl00$cphRoblox$rblAgeGroup" value="2" checked="checked" tabindex="1"><label for="ctl00_cphRoblox_rblAgeGroup_1">13 years or older</label></td>
	</tr>
</tbody></table>
				</div>
			</fieldset>
        </div>
        <div id="ChatMode">
			<fieldset title="Update your chat mode">
				<legend>Update your chat mode</legend>
				<div class="Suggestion">
					All in-game chat is subject to profanity filtering and moderation.  For enhanced chat safety, choose SuperSafe Chat; only chat from pre-approved menus will be shown to you.
				</div>
				<div class="ChatModeRow">
					<table id="ctl00_cphRoblox_rblChatMode" border="0">
	<tbody><tr>
		<td><input id="ctl00_cphRoblox_rblChatMode_0" type="radio" name="chatmode" value="False" <?php if($userAuth->safechat == false){ ?> checked="checked" <?php } ?> tabindex="2"><label for="ctl00_cphRoblox_rblChatMode_0">Safe Chat</label></td>
	</tr><tr>
		<td><input id="ctl00_cphRoblox_rblChatMode_1" type="radio" name="chatmode" value="True" <?php if($userAuth->safechat == true){ ?> checked="checked" <?php } ?> tabindex="2"><label for="ctl00_cphRoblox_rblChatMode_1">SuperSafe Chat</label></td>
	</tr>
</tbody></table>
				</div>
			</fieldset>
        </div>
        <div id="ResetPassword">
			<fieldset title="Reset your password">
				<legend>Change your password</legend>
				<div class="Suggestion">Click the button below to change your password.</div>
				<div class="ResetPasswordRow">
                    &nbsp;<a id="ctl00_cphRoblox_ChangePassword" href="/my/resetpassword.aspx">Change Password</a></div>
			</fieldset>
        </div>
        <div id="EnterEmail">
		    <fieldset title="Update Email Address">
			    <legend>Update Email Address</legend>
			    <div class="Validators">
				    <div><span id="ctl00_cphRoblox_RegularExpressionValidator2" style="color:Red;display:none;">Please enter a valid email address.</span></div>
				    <div><span id="ctl00_cphRoblox_RequiredFieldValidator1" style="color:Red;display:none;">Email is required.</span></div>
				    <div><span id="ctl00_cphRoblox_CustomValidatorEmail" style="color:Red;display:none;">An account with this email address already exists.</span></div>
			    </div>
			    <div class="EmailRow">
				    <label for="email" id="ctl00_cphRoblox_LabelEmail" class="Label">Email:</label>&nbsp;<input name="email" type="text" value="<?=$userAuth->email;?>" id="ctl00_cphRoblox_TextBoxEMail" tabindex="4" class="TextBox">
			    </div>
		    </fieldset>
		</div>
        <div id="Blurb">
			<fieldset title="Update your personal blurb">
				<legend>Update your personal blurb</legend>
				<div class="Suggestion">
					Describe yourself here (max. 1000 characters).  Make sure not to provide any details that can be used to identify you outside ROBLOX.
				</div>
				<div class="BlurbRow">
					<textarea name="bio" rows="2" cols="20" id="ctl00_cphRoblox_tbBlurb" tabindex="3" class="MultilineTextBox"><?=htmlspecialchars($userAuth->bio);?></textarea>
				</div>
			</fieldset>
        </div>
        <div class="Buttons">
			<button name="update" type="submit" id="update" tabindex="4" class="Button">Update</button>&nbsp;<a id="ctl00_cphRoblox_lbCancel" tabindex="5" class="Button" href="javascript:window.history.back();">Cancel</a>
        </div>
	</div>

				</div>

				
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>