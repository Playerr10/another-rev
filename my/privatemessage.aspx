<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

Users::requireLoggedIn();

$aspnetForm = true;

$getId = (int) $_GET['MessageID'];

// deleting
if (isset($_POST['delete']))
{
	$stmt = $conn->prepare("DELETE FROM messages WHERE toid = :id AND id = :mid");
	$stmt->bindValue(":id", $userAuth->id);
	$stmt->bindValue(":mid", $getId);
	$stmt->execute();
	die(header("Location: /My/Inbox.aspx"));
}

$stmt = $conn->prepare("SELECT * FROM messages WHERE toid = :id AND id = :mid");
$stmt->bindValue(":id", $userAuth->id);
$stmt->bindValue(":mid", $getId);
$stmt->execute();
$Message = $stmt->fetch(PDO::FETCH_ASSOC);

$userResults = Users::fetch($Message['fromid']);

if(!$Message){die(header('Location: /'));}

if($userAuth->id !== $userResults->id) {
	$conn->prepare("UPDATE messages SET wasread = 1 WHERE id = ?")->execute([$getId]);
}

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); ?>
<div id="Body">
					
	<div class="MessageContainer">
        <div id="MessagePane">
			<div id="ctl00_cphRoblox_pPrivateMessage">
	
				<div id="ctl00_cphRoblox_pPrivateMessageReader">
		
					<h3>Private Message</h3>
					<div class="MessageReaderContainer">
					    

<div id="Message">
    <table width="100%">
        <tbody><tr valign="top">
            <td style="width: 10em">
                <div id="DateSent"><?=time_elapsed_string('@' . $Message['date']);?></div>
                <div id="Author">
                    <a id="ctl00_cphRoblox_rbxMessageReader_Avatar" disabled="disabled" title="<?=$userResults->username;?>" onclick="return false" style="display:inline-block;height:64px;width:64px;"><img src="/thumbs/avatar.ashx?userId=<?=$userResults->id;?>" style="height:64px;width:60px;" border="0" id="img" alt="<?=$userResults->username;?>"></a><br>
                    <a id="ctl00_cphRoblox_rbxMessageReader_AuthorHyperLink" title="Visit <?=$userResults->username;?>'s Home Page" href="/User.aspx?id=<?=$Message['fromid'];?>"><?=$userResults->username;?></a>
                </div>
                <div id="Subject">
                    <?=htmlspecialchars($Message['subject']);?><br>
                    <br>
                    <div id="ctl00_cphRoblox_rbxMessageReader_AbuseReportButton_AbuseReportPanel" class="ReportAbusePanel">
			
    <span class="AbuseIcon"><a id="ctl00_cphRoblox_rbxMessageReader_AbuseReportButton_ReportAbuseIconHyperLink" href="/AbuseReport/Message.aspx?ID=2274781&amp;ReturnUrl=http%3a%2f%2fwww.roblox.com%2fMy%2fPrivateMessage.aspx%3fMessageID%3d2274781"><img src="/images/abuse.PNG" alt="Report Abuse" style="border-width:0px;"></a></span>
    <span class="AbuseButton"><a id="ctl00_cphRoblox_rbxMessageReader_AbuseReportButton_ReportAbuseTextHyperLink" href="/AbuseReport/Message.aspx?ID=2274781&amp;ReturnUrl=http%3a%2f%2fwww.roblox.com%2fMy%2fPrivateMessage.aspx%3fMessageID%3d2274781">Report Abuse</a></span>

		</div>
                </div>
            </td>
            <td style="padding: 0 10px 0 10px">
                <div class="Body">
                    <div id="ctl00_cphRoblox_rbxMessageReader_pBody" class="MultilineTextBox" style="width:450px;height:250px;overflow-y:scroll;">
			
                        <?=htmlspecialchars($Message['content']);?>
                    
		</div>
                </div>
                
            </td>
        </tr>
    </tbody></table>
</div>
					    <div style="clear:both"></div>
					</div>
					<div class="Buttons">
						<a id="ctl00_cphRoblox_lbCancel" class="Button" onclick="history.back()">Cancel</a>
						<button name="delete" id="ctl00_cphRoblox_DeleteButton" class="Button">Delete</button>
						<a id="ctl00_cphRoblox_lbReply" class="Button" onclick="window.location='/My/NewMessage.aspx?RecipientID=<?=$Message['fromid'];?>&subject=RE: <?=htmlspecialchars($Message['subject']);?>';">Reply</a>
					</div>
					<div style="clear:both"></div>
				
	</div>
				
			
</div>
			
		</div>
		<div style="clear: both;"></div>
	</div>

				</div>
	
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>