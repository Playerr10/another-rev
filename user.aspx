<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;
use Website\Couscous\Friends;

$_GET = array_change_key_case($_GET, CASE_LOWER);

$getId = (isset($_GET['id']) ? (int)$_GET["id"] : ($cookie !== null ? $userAuth->id : 0));

$publicView = !($cookie && $userAuth->id == $getId && (!isset($_GET["forcepublicview"]) || $_GET["forcepublicview"] == "false"));

$userResults = Users::fetch($getId);

$stmt = $conn->prepare("SELECT * FROM asset WHERE type = 0 AND authorid = :id");
$stmt->bindValue(":id", $getId);
$stmt->execute();
$gameResults = $stmt->fetchAll();

if(!$userResults)die(header('Location: /'));

$online = isTimeConsideredOnline($userResults->lastseen);
$onlineResults = "[ ".($online ? "Online: Website" : "Offline")." ]";

$stmt = $conn->prepare("SELECT * FROM friends WHERE (sender = :sid AND receiver = :rid) OR (sender = :rid AND receiver = :sid)");
$stmt->execute([':sid' => $getId, ':rid' => $userAuth->id ?? 0]);
$requestSent = $stmt->fetch(PDO::FETCH_ASSOC);

$aspnetForm = true;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); ?>
				<div id="Body">
					
	
	<div id="UserContainer">
		<div id="LeftBank">
			<div id="ctl00_cphRoblox_pProfile">
	
				<div id="ProfilePane">
		
<?php if (!$publicView) { ?>  		
<table width="100%" bgcolor="lightsteelblue" cellpadding="6" cellspacing="0">
    <tbody><tr>
        <td>
            <span id="ctl00_cphRoblox_rbxUserPane_lUserName" class="Title">Hi, <?=$userAuth->username;?>!</span><br>
            
        </td>
    </tr>
    <tr>
        <td>
            <span id="ctl00_cphRoblox_rbxUserPane_lUserRobloxURL">Your ROBLOX:</span><br>
            <a id="ctl00_cphRoblox_rbxUserPane_hlUserRobloxURL" href="User.aspx?ID=<?=$userAuth->id;?>">http://www.roblox.com/User.aspx?ID=<?=$userAuth->id;?></a><br>
            <br>
            <div style="left: 0px; float: left; position: relative; top: 0px">
                <a id="ctl00_cphRoblox_rbxUserPane_Image1" disabled="disabled" title="User" onclick="return false" style="display:inline-block;height:220px;width:180px;"><img style="height:220px;width:220px;" src="/Thumbs/Avatar.ashx?userId=<?=$userAuth->id;?>" border="0" id="img" alt="<?=$userAuth->username;?>"></a><br>
                
            </div>
            

<p><a id="ctl00_cphRoblox_rbxUserPane_rbxMyUser_UpgradesHyperLink" href="My/AccountUpgrades/Manage.aspx">Upgrades</a></p>
<p><a id="ctl00_cphRoblox_rbxUserPane_rbxMyUser_hlMyRobux" href="My/AccountBalance.aspx">Account Balance</a></p>
<p><a id="ctl00_cphRoblox_rbxUserPane_rbxMyUser_hlMyInbox" href="My/Inbox.aspx">Inbox</a>&nbsp;</p>
<p><a id="ctl00_cphRoblox_rbxUserPane_rbxMyUser_hlMyAvatar" href="My/Character.aspx">Change Character</a></p>
<p><a id="ctl00_cphRoblox_rbxUserPane_rbxMyUser_hlMyProfile_Edit" href="My/Profile.aspx">Edit Profile</a></p>
<p><a id="ctl00_cphRoblox_rbxUserPane_rbxMyUser_hlMyProfile_View" href="user.aspx?ForcePublicView=true&amp;id=<?=$userAuth->id;?>">View Profile</a></p>
<p><a id="ctl00_cphRoblox_rbxUserPane_rbxMyUser_hlInviteAFriend" href="My/InviteAFriend.aspx">Share ROBLOX</a></p>

            
        </td>
    </tr>
</tbody></table>
<?php } else { ?>  	
<table width="100%" bgcolor="lightsteelblue" cellpadding="6" cellspacing="0">
				<tbody>
					<tr>
						<td>
														<span class="Title"><?=$userResults->username;?></span><br>
								 
							<span class="User<?=$online ? "Online" : "Offline";?>Message"><?=$onlineResults?></span> 
													</td>
					</tr>
					<tr>
						<td>
														<span><?=$userResults->username;?>'s ROBLOX:</span><br>
							<a href="/User.aspx?ID=<?=$userResults->id;?>">https://www.roblox.com/User.aspx?ID=<?=$userResults->id;?></a><br>
							<br>
							<div style="left: 0px; float: left; position: relative; top: 0px">
								<a disabled="disabled" title="<?=$userResults->username;?>" onclick="return false" style="display:inline-block;"><img style="height:220px;width:220px;" src="/Thumbs/Avatar.ashx?userId=<?=$userResults->id;?>" id="img" alt="<?=$userResults->username;?>" border="0"></a><br>
								<div class="ReportAbusePanel">
									<a href="/AbuseReport.ashx?id=<?=$userResults->username;?>&amp;type=3"><span class="AbuseIcon"><img src="/images/abuse.png" alt="Report Abuse" border="0"></span>
									<span class="AbuseButton">Report Abuse</span></a>
								</div>
							</div>
							<p><a href="/my/NewMessage.aspx?RecipientID=<?=$userResults->id;?>">Send Message</a></p>
							<p>
							<?php if ($cookie !== null && !$requestSent) { ?>
							<a href="javascript:Friends::AddFriend(<?=$userResults->id;?>)">Send Friend Request</a>
							<?php } ?>
							</p>
														<p style="width:430px;"><span style="white-space:pre-wrap;white-space:-moz-pre-wrap;white-space:-pre-wrap;white-space:-o-pre-wrap;word-wrap:break-word;"><?=htmlspecialchars($userResults->bio);?></span></p>
													</td>
					</tr>
				</tbody>
			</table>
<?php } ?>
				</div>
			
</div>

<?php 
include($_SERVER['DOCUMENT_ROOT'] . '/include/modules/profile/badges.php'); 
include($_SERVER['DOCUMENT_ROOT'] . '/include/modules/profile/statistics.php'); 
?>

		</div>
		<div id="RightBank">
		
<?php 
include($_SERVER['DOCUMENT_ROOT'] . '/include/modules/profile/places.php'); 
include($_SERVER['DOCUMENT_ROOT'] . '/include/modules/profile/friends.php'); 
if(!$publicView){include($_SERVER['DOCUMENT_ROOT'] . '/include/modules/profile/requests.php');}
?>

		</div>

<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/modules/profile/inventory.php'); ?>

				</div>
			
<script>
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.AccordionBehavior, {"ClientStateFieldID":"AccordionExtender_ClientState","FramesPerSecond":40,"HeaderCssClass":"AccordionHeader","id":"ShowcasePlacesAccordion_AccordionExtender"}, null, null, $get("ShowcasePlacesAccordion")); 
}); 
</script>
<script>
function AddFriend(value) {
                $.ajax({
                    url: "/include/modules/api/addfriend?id=" + value,
                    success: function() {
                    document.location.reload();
                 },
            error: function() {
                alert("Couldn't add friend.");
            }
     });
}


altpanelShown = true;
function toggleAltPanel() 
{
	if(altpanelShown) 
	{
		$("#AltPanel").css("height", 19);
		$("#AltPanel").css("overflow", "hidden");
		$('#AltPanelToggleIcon').attr("src", "/images/ExpandButton.jpg");
		altpanelShown = false;
	} 
	else 
	{
		$("#AltPanel").css("height", 200);
		$("#AltPanel").css("overflow", "auto");
		$('#AltPanelToggleIcon').attr("src", "/images/MinimizeButton.jpg");
		altpanelShown = true;
	}
}

function getInventory(type, page, event) 
{
	if(page == undefined){ page = 1; }
	if(event != undefined){ event.preventDefault(); }
	$.post("/include/modules/api/inventory", {uid:<?=$userResults->id;?>,type:type,page:page}, function(data) 
	{
		$("#AssetsContent").empty();
		$("#AssetsContent").html(data);
	})
	.fail(function() 
	{
		$("#AssetsContent").text("An error occurred");
	});

	$('*[data-id]').removeClass().addClass("AssetsMenuItem");
	$('*[data-id]').children().removeClass().addClass("AssetsMenuButton");

	$('*[data-id="'+type+'"]').removeClass().addClass("AssetsMenuItem_Selected");
	$('*[data-id="'+type+'"]').children().removeClass().addClass("AssetsMenuButton_Selected");
}

$(function() 
{
	$('.AssetsMenuItem').on('click', this, function(){ getInventory($(this).attr("data-id")); });

	getInventory(3); 
});
</script>			
</div>

<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>
          