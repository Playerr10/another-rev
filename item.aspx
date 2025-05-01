<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/modules/item/comment.php');

use Website\Couscous\Users;
use Website\Couscous\Assets;

$_GET = array_change_key_case($_GET, CASE_LOWER);
$getId = (int) $_GET['id'];

$itemResults = Assets::fetch($getId);
$creator = Users::fetch($itemResults->authorid);

$stmt = $conn->prepare("SELECT * FROM comments WHERE onassetid = :id ORDER BY time DESC");
$stmt->bindValue(":id", $getId);
$stmt->execute();
$commentResults = $stmt->fetchAll(PDO::FETCH_OBJ);
$commentCount = $stmt->rowCount();

if($itemResults->type == 0)die(header('Location: /Place.aspx?ID='.$getId));

if(!$itemResults)die(header('Location: /'));

$aspnetForm = true;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 
?>	
<div id="Body">
					
	<div id="ItemContainer">
		<h2>ROBLOX <?=htmlspecialchars($assetArray[$itemResults->type]['name'])?></h2>
		<div id="Item">
			<div id="Thumbnail">
				<a id="ctl00_cphRoblox_AssetThumbnailImage" title="<?=htmlspecialchars($itemResults->name);?>" onclick="javascript:__doPostBack('ctl00$cphRoblox$AssetThumbnailImage','')" style="display:inline-block;height:250px;width:250px;cursor:pointer;"><img src="/thumbs/asset.ashx?assetId=<?=$itemResults->id;?>" width="250" height="250" border="0" alt="<?=htmlspecialchars($itemResults->name);?>"></a>
			</div>
			<div id="Summary">
				<h3><?=htmlspecialchars($itemResults->name);?></h3>
			    
				
				<div id="Creator">Created by: <a id="ctl00_cphRoblox_CreatorHyperLink" href="User.aspx?ID=<?=$creator->id;?>"><?=$creator->username;?></a></div>
				<div id="LastUpdate">Updated: <?=time_elapsed_string('@' . $itemResults->createdon);?></div>
				<div id="ctl00_cphRoblox_DescriptionPanel">
	
					<div id="DescriptionLabel">Description:</div>
					<div id="Description"><?=htmlspecialchars($itemResults->info);?></div>
				
</div>
	            <p>
	                </p><div id="ctl00_cphRoblox_AbuseReportButton1_AbuseReportPanel" class="ReportAbusePanel">
	
    <span class="AbuseIcon"><a id="ctl00_cphRoblox_AbuseReportButton1_ReportAbuseIconHyperLink" href="AbuseReport/AssetVersion.aspx?ID=<?=$itemResults->id;?>&amp;ReturnUrl=http%3a%2f%2fwww.roblox.com%2fItem.aspx%3fID%3d1425839%26UserAssetID%3d968793"><img src="images/abuse.PNG" alt="Report Abuse" style="border-width:0px;"></a></span>
    <span class="AbuseButton"><a id="ctl00_cphRoblox_AbuseReportButton1_ReportAbuseTextHyperLink" href="AbuseReport/AssetVersion.aspx?ID=<?=$itemResults->id;?>&amp;ReturnUrl=http%3a%2f%2fwww.roblox.com%2fItem.aspx%3fID%3d1425839%26UserAssetID%3d968793">Report Abuse</a></span>

</div>
	            <p></p>
			</div>
			<?php if ($userAuth->id == $creator->id) { ?>  	
			<div id="ctl00_cphRoblox_EditItemPanel">
	
				<div id="Configuration">
					<a id="ctl00_cphRoblox_EditItemHyperLink" href="My/Item.aspx?ID=<?=$itemResults->id;?>">Edit this Shirt</a>
				</div>
			
            </div>
			<?php } ?>  	
			<div id="ctl00_cphRoblox_ItemOwnershipPanel">
	
				<div id="Ownership">
					
					<a id="ctl00_cphRoblox_RemoveFromInventoryButton" class="Button" href="javascript:__doPostBack('ctl00$cphRoblox$RemoveFromInventoryButton','')">Delete from My Stuff</a>
				</div>
			
</div>
			<div style="clear: both;">
		</div>
		<div id="ctl00_cphRoblox_CommentsPane_CommentsUpdatePanel">

  <?php require($_SERVER['DOCUMENT_ROOT'] . '/include/modules/api/comment.php'); ?>
	
</div>
	</div>
	
	<div id="ctl00_cphRoblox_ItemPurchasePopupPanel" class="modalPopup" style="width:27em;display: none">
	
		<div id="ctl00_cphRoblox_ItemPurchasePopupUpdatePanel">
		
				
			
	</div>
	
</div>
	
	<input type="hidden" name="ctl00$cphRoblox$HiddenField1" id="ctl00_cphRoblox_HiddenField1">
	<input type="hidden" name="ctl00$cphRoblox$HiddenField2" id="ctl00_cphRoblox_HiddenField2">
	<input type="hidden" name="ctl00$cphRoblox$HiddenField3" id="ctl00_cphRoblox_HiddenField3">
	

				</div>
			</div>

<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>
