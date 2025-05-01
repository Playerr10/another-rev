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
<div id="InviteAFriendContainer">
	<form method="POST">
		<h3>Share ROBLOX with a Friend</h3>
		<div id="Exposition">
			<div style="margin-bottom:10px">Fill out the form below to share ROBLOX with a friend who's not already a member of the site.</div>
			<div id="MessageEditorContainer" style="width:677px">
				<div class="MessageEditor">
					<table width="100%">
						<tbody>
							<tr valign="top">
								<td style="width:7em">
									<div style="margin-bottom:15px"><b>Your Name:</b></div>
									<br>
									<div style="margin-bottom:22px">
										<b>Email To:</b>
									</div>
									<b>Message:</b>
								</td>
								<td style="padding:0 24px 6px 12px">
									<div id="Subject">
										<div class="Label">
										</div>
										<div class="Field" style="margin-bottom:10px">
											<div style="margin-left:300px"><font size="0">This will identify you to a friend who may not recognize your ROBLOX account name.</font></div>
											<div style="margin-top:-27px"><input name="name" type="text" id="MsgSubject" class="TextBox" style="width:50%;" value="<?=$userAuth->username;?>"></div>
											<div style="float:right;"></div>
										</div>
									</div>
									<div id="Recipients">
										<div style="margin-bottom:10px">
											<div style="margin-left:300px"><font size="0">ROBLOX takes your privacy and the privacy of your friends seriously. <a href="/info/Privacy.aspx">View our privacy policy.</a></font></div>
											<div style="margin-top:-29px"><input name="Email" type="text" id="MsgSubject" class="TextBox" style="width:50%;"></div>
										</div>
									</div>
									<div id="Message">
										<div style="margin-left:300px">
											<font size="0">Feel free to include a note to your friend before sending. We'll include some information and a link back to ROBLOX.</font>
										</div>
										<div style="margin-top:-43px"><textarea name="Message" rows="2" cols="20" id="MsgBody" class="MultilineTextBox" style="width:50%;height:150px">Greetings from ROBLOX!</textarea></div>
									</div>
																	</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="clear:both"></div>
			</div>
			<div></div>
		</div>
		<div class="Buttons">
			<input name="Send" value="Send Invite" id="Send" class="Button" type="submit">
		</div><br><br>
	</form>
</div>
</div>
				
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php');  ?>