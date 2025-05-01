<?php
$success = false;
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/modules/api/messages.php');

use Website\Couscous\Users;

Users::requireLoggedIn();

$aspnetForm = true;

$getId = (int) $_GET['RecipientID'];

$getSubject = $_GET["subject"] ?? "";

if($getId == $userAuth->id || $cookie == null){
	die(header("Location: /"));
}

$userResults = Users::fetch($getId);

if(!$userResults){die(header('Location: /'));}

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php');

foreach($errorList as $info):
echo '<div class="SystemAlert">
						<div class="SystemAlertText" style="background-color: #ff0000">
							<div>'.$info.'</div>
						</div>
					</div>';
endforeach;
?>

<div id="Body">
					
	<div class="MessageContainer">
        <div id="MessagePane">
<?php if (!$success) { ?>
			<div id="ctl00_cphRoblox_pPrivateMessage">	
				<div id="ctl00_cphRoblox_pPrivateMessageEditor">
		
					<h3>Your Message</h3>
					<div id="MessageEditorContainer">
						
<div class="MessageEditor">
    <table width="100%">
        <tbody><tr valign="top">
           <td style="width:12em">
                <div id="From">
                    <span class="Label">
                        <span id="ctl00_cphRoblox_rbxMessageEditor_lblFrom">From:</span></span> <span class="Field">
                            <span id="ctl00_cphRoblox_rbxMessageEditor_lblAuthor"><?=$userAuth->username?></span></span>
                </div>
                <div id="To">
                    <span class="Label">
                        <span id="ctl00_cphRoblox_rbxMessageEditor_lblTo">Send To:</span></span> <span class="Field">
                            <span id="ctl00_cphRoblox_rbxMessageEditor_lblRecipient"><?=$userResults->username;?></span></span>
                </div>
                
            </td>
            <td style="padding:0 24px 6px 12px">
                <div id="Subject">
                    <div class="Label">
                        <label for="ctl00_cphRoblox_rbxMessageEditor_txtSubject" id="ctl00_cphRoblox_rbxMessageEditor_lblSubject">Subject:</label></div>
                    <div class="Field">
                        <input name="subject" <?php if (!empty($getSubject)) echo 'value="'.htmlspecialchars($getSubject).'"'; ?> type="text" id="ctl00_cphRoblox_rbxMessageEditor_txtSubject" class="TextBox" style="width:100%;"></div>
                </div>
                <div class="Body">
                    <div class="Label">
                        <label for="ctl00_cphRoblox_rbxMessageEditor_txtBody" id="ctl00_cphRoblox_rbxMessageEditor_lblBody">Message:</label></div>
                    <textarea name="body" rows="2" cols="20" id="ctl00_cphRoblox_rbxMessageEditor_txtBody" class="MultilineTextBox" style="width:100%;"></textarea>
                </div>
                
            </td>
        </tr>
    </tbody></table>
</div>

						<div style="clear:both"></div>
					</div>
					<div class="Buttons">
						<button name="send" id="ctl00_cphRoblox_lbSend" class="Button" type="submit">Send</button>
					</div>
				
	</div>
			
</div>
<?php } else { ?>
<div id="ctl00_cphRoblox_pConfirmation">
				<div id="Confirmation" style="float: right;">
					<h3>Message Sent</h3>
					<div id="Message"><span id="ctl00_cphRoblox_lConfirmationMessage">Your message has been sent to <?=$userResults->username;?>.</span></div>
					<div class="Buttons"><a id="ctl00_cphRoblox_lbContinue" class="Button" onclick="window.location='/User.aspx?ID=<?=$userAuth->id?>'">Continue</a></div>
				</div>		
</div>
<?php } ?>			
		</div>
		<div style="clear: both;"></div>
	</div>

				</div>
	
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>