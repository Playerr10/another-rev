<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

$getId = $_GET['ID'] ?? $_GET['id'];

use Website\Couscous\Users;
use Website\Couscous\Assets;

$gameResults = Assets::fetch($getId, 0);
$creator = Users::fetch($gameResults->authorid);

if(!$gameResults){die(header('Location: /'));}

$aspnetForm = false;

if($gameResults->type != 0)
 die(header('Location: /Item.aspx?ID='.$getId));

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 
?>	

<div id="Body">
					
    
    <div id="Advertisement" class="Ads_RightSidebar" style="border-style: none">
        
<div class="Ads_RightSidebar">
</div>
    </div>
    <div id="Place_PlacePanel" class="Panel">
        <h4>
            <span id="ctl00_cphRoblox_PlaceName"><?=htmlspecialchars($gameResults->name);?></span>
        </h4>
        <div style="padding: 1em">
            <div style="text-align: center">
                <a id="ctl00_cphRoblox_PlaceThumbnail" disabled="disabled" title="<?=htmlspecialchars($gameResults->name);?>" onclick="return false" style="display:inline-block;"><img src="/Thumbs/Asset.ashx?assetId=<?=$gameResults->id;?>" width="420" height="230" border="0" id="img" alt="<?=htmlspecialchars($gameResults->name);?>"></a>
            </div>
            <div style="text-align: center; margin-top: 1em">
                <span id="ctl00_cphRoblox_VisitButtons_VisitMPButton">
    
<div id="ctl00_cphRoblox_VisitButtons_PlaceLauncher1_Panel1" class="modalPopup" style="display: none">
	
    <div style="margin: 1.5em">
        <div id="Spinner" style="float:left;margin:0 1em 1em 0">
            <img id="ctl00_cphRoblox_VisitButtons_PlaceLauncher1_Image1" src="/images/ProgressIndicator2.gif" border="0"></div>
        <div id="Requesting" style="display: inline">
            Requesting a server</div>
        <div id="Waiting" style="display: none">
            Waiting for a server</div>
        <div id="Loading" style="display: none">
            A server is loading the game</div>
        <div id="Joining" style="display: none">
            The server is ready. Joining the game...</div>
        <div id="Error" style="display: none">
            An error occured. Please try again later</div>
        <div id="Expired" style="display: none">
            There are no game servers available at this time. Please try again later</div>
        <div id="GameEnded" style="display: none">
            The game you requested has ended</div>
        <div id="GameFull" style="display: none">
            The game you requested is full. Please try again later</div>
        <div style="text-align: center; margin-top: 1em">
            <input id="Cancel" type="button" class="Button" value="Cancel"></div>
    </div>

</div>
<input type="hidden" name="ctl00$cphRoblox$VisitButtons$PlaceLauncher1$HiddenField1" id="ctl00_cphRoblox_VisitButtons_PlaceLauncher1_HiddenField1">


    <button id="ctl00_cphRoblox_VisitButtons_hlMultiplayerVisit" class="Button" onclick="window.location = '/Login/Default.aspx'; return false;">Visit Online</button>
</span>


            </div>
            <div style="text-align: center; margin-top: 1em">
                <div id="ctl00_cphRoblox_AbuseReportButton1_AbuseReportPanel" class="ReportAbusePanel">
	
    <span class="AbuseIcon"><a id="ctl00_cphRoblox_AbuseReportButton1_ReportAbuseIconHyperLink" href="AbuseReport/Place.aspx?ID=47828&amp;ReturnUrl=http%3a%2f%2fwww.roblox.com%2fPlace.aspx%3fid%3d47828"><img src="/images/abuse.PNG" alt="Report Abuse" border="0"></a></span>
    <span class="AbuseButton"><a id="ctl00_cphRoblox_AbuseReportButton1_ReportAbuseTextHyperLink" href="AbuseReport/Place.aspx?ID=47828&amp;ReturnUrl=http%3a%2f%2fwww.roblox.com%2fPlace.aspx%3fid%3d47828">Report Abuse</a></span>

</div>
            </div>
            <div style="text-align: center; margin-top: 1em">
                <span id="ctl00_cphRoblox_PlaceAccessIndicator_FriendsOnlyLocked" style="display: none"><img id="ctl00_cphRoblox_PlaceAccessIndicator_iFriendsOnly_Locked" src="/images/locked.png" border="0">&nbsp;Friends-only</span>
<span id="ctl00_cphRoblox_PlaceAccessIndicator_FriendsOnlyUnlocked" style="display: <?=$gameResults->public == false ? $public = "inline;" : $public = "none;"; ?>"><img id="ctl00_cphRoblox_PlaceAccessIndicator_iFriendsOnly_Unlocked" src="/images/locked.png" border="0">&nbsp;Friends-only: You have access</span>
<span id="ctl00_cphRoblox_PlaceAccessIndicator_Public" style="display:<?=$gameResults->public == true ? $public = "inline;" : $public = "none;"; ?>"><img id="ctl00_cphRoblox_PlaceAccessIndicator_iPublic" src="/images/public.png" border="0">&nbsp;Public</span>

                <img id="ctl00_cphRoblox_CopyLockedIcon" src="/images/CopyLocked.png" border="0">
                Copy Protection: CopyLocked
            </div>
            <div style="text-align: center; margin-top: 1em">
                Visited
                <span id="ctl00_cphRoblox_VisitsLabel"><?=$gameResults->visitedids;?></span> times
            </div>
            <div style="margin-top: 1em">
                <span id="ctl00_cphRoblox_PlaceDescription"><?=htmlspecialchars($gameResults->info);?></span>
            </div>
        </div>
    </div>
    <div id="Place_AuthorPanel" class="Panel">
        <h4>
            Author</h4>
        <div style="padding: 1em">
            <a id="ctl00_cphRoblox_AvatarImage" disabled="disabled" title="<?=$creator->username;?>" href="/User.aspx?id=<?=$gameResults->authorid;?>" style="display:inline-block;"><img src="/Thumbs/Avatar.ashx?userId=<?=$gameResults->authorid;?>" width="180" height="180" border="0" id="img" alt="<?=$creator->username;?>"></a>
            <p style="text-align: center">
                <a id="ctl00_cphRoblox_AuthorName" href="User.aspx?id=<?=$gameResults->authorid;?>"><?=$creator->username;?></a>
            </p>
        </div>
    </div>
	
    <div id="Place_GamesPanel" >
       
        <div style="padding: 1em">
            
 
                
        </div>
    </div>

				</div>

<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>
