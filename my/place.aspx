<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/modules/my/place.php');

use Website\Couscous\Users;
use Website\Couscous\Assets;

Users::requireLoggedIn();

$aspnetForm = true;

$getId = $_GET['PlaceID'] ?? die(header("Location: /"));
$gameResults = Assets::fetch($getId, 0);

if(!$gameResults || $userAuth->id != $gameResults->authorid){die(header("Location: /"));}

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
					
	
	<div id="ConfigurePlaceContainer">
		<h2>Configure Place</h2>
		
		<div id="PlaceName">
			<span class="Label">Name:</span><br>
			<input name="title" type="text" value="<?=htmlspecialchars($gameResults->name);?>" maxlength="50" class="TextBox">
		</div>
	
		<div id="PlaceThumbnail"><a disabled="disabled" supportsalphachannel="False" title="<?=htmlspecialchars($gameResults->name);?>" onclick="return false" style="display:inline-block;height:230px;width:420px;"><img src="/thumbs/asset.ashx?assetId=<?=$gameResults->id?>" height="230" width="420" border="0" id="img" alt="<?=htmlspecialchars($gameResults->name);?>"></a></div>
		
		<div id="PlaceDescription">
			<span class="Label">Description:</span><br>
			<textarea name="description" rows="2" cols="20" class="MultilineTextBox" style="height:150px;"><?=htmlspecialchars($gameResults->info);?></textarea>
		</div>

		<div id="PlaceAccess">
			<fieldset title="Access">
				<legend>Access</legend>
				<div class="Suggestion">
					This determines who can access your place.
				</div>
				<div class="PlaceAccessRow">
					<img src="/images/public.png" alt="Public" style="border-width:0px;"><input type="radio" name="access" value="rbPublicAccess" <?php if($gameResults->public == true){ ?> checked="checked" <?php } ?>><label for="ctl00_cphRoblox_rbPublicAccess">Public: Anybody can visit my place</label><br>
					<img src="/images/locked.png" alt="Friends-only" style="border-width:0px;"><input type="radio" name="access" value="rbPrivateAccess" <?php if($gameResults->public == false){ ?> checked="checked" <?php } ?>><label for="ctl00_cphRoblox_rbPrivateAccess">Friends: Only my friends can visit my place</label>
				</div>
			</fieldset>
        </div>
        
        <div id="PlaceCopyProtection">
			<fieldset title="Copy Protection">
				<legend>Copy Protection</legend>
				<div class="Suggestion">
					Checking this will prevent your place from being copied but will also make it available to others only in online mode.
				</div>
				<div class="CopyProtectionRow">
					<input type="checkbox" name="ctl00$cphRoblox$cbIsCopyProtected"><label for="ctl00_cphRoblox_cbIsCopyProtected">Copy-Lock my place</label>
				</div>
			</fieldset>
        </div>
        
        
        
        <div id="PlaceReset">
			<div class="popupControl" style="width:400px;">
	
				<div>
		
						<div align="right">
							<a class="PopUpOption" href="javascript:__doPostBack('ctl00$cphRoblox$lbClosePopUp','')">[ close window ]</a>
						</div>
						<div class="PopUpInstruction">To reset your place, click an image below:</div>
						<table cellspacing="0" cellpadding="10" align="Center" border="0" style="border-collapse:collapse;">
			<tbody><tr>
				<td align="center" valign="middle" style="color:#003399;background-color:White;">
								<a supportsalphachannel="false" title="Happy Home in Robloxia" onclick="javascript:__doPostBack('ctl00$cphRoblox$dlPlaceTemplates$ctl00$rbxPlaceTemplateThumbnail','')" style="display:inline-block;height:70px;width:120px;cursor:pointer;"><img src="http://t6.roblox.com:80/Place-120x70-a2450b0aa54744d7ab199b4ee96f1fc5.Png" border="0" id="img" alt="Happy Home in Robloxia"></a><br>
								<span>Happy Home in Robloxia</span>
							</td><td align="center" valign="middle" style="color:#003399;background-color:White;">
								<a supportsalphachannel="false" title="Starting BrickBattle Map" onclick="javascript:__doPostBack('ctl00$cphRoblox$dlPlaceTemplates$ctl02$rbxPlaceTemplateThumbnail','')" style="display:inline-block;height:70px;width:120px;cursor:pointer;"><img src="http://t4.roblox.com:80/Place-120x70-d573a1bb3ee3bc14f535026e8c234671.Png" border="0" id="img" alt="Starting BrickBattle Map"></a><br>
								<span>Starting BrickBattle Map</span>
							</td>
			</tr><tr>
				<td align="center" valign="middle" style="color:#003399;background-color:White;">
								<a supportsalphachannel="false" title="Empty Baseplate" onclick="javascript:__doPostBack('ctl00$cphRoblox$dlPlaceTemplates$ctl01$rbxPlaceTemplateThumbnail','')" style="display:inline-block;height:70px;width:120px;cursor:pointer;"><img src="http://t1.roblox.com:80/Place-120x70-a67675f3c46d54fa166edaf4e2e8d6e2.Png" border="0" id="img" alt="Empty Baseplate"></a><br>
								<span>Empty Baseplate</span>
							</td><td></td>
			</tr>
		</tbody></table>
						
						
					
	</div>
			
</div>
			<fieldset title="Reset Place">
				<legend>Reset Place</legend>
				<div class="Suggestion">
					Only do this if you want to reset your place to one of our starting templates.  This will cause you to lose any changes you have made and cannot be un-done.
				</div>
				<div class="ResetPlaceRow">
					<div class="Button" style="width:80px;">
	
						Reset Place
					
</div>
				</div>
			</fieldset>
			
        </div>
		
        <div class="Buttons">
			<button class="Button" name="update" id="update">Update</button>&nbsp;<a class="Button" href="javascript:window.history.back();">Cancel</a>
        </div>
	</div>

				</div>

				
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>