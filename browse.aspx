<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

$aspnetForm = true;

$userSearched = $_GET["search"] ?? "";
$page = $_GET["page"] ?? 1;

if(isset($userSearched) && $userSearched !== ""){
	$sqlSearch = " WHERE username LIKE \"%".htmlspecialchars($userSearched)."%\"";
}

$fetchPages = $conn->prepare("SELECT * FROM users".@$sqlSearch." ORDER BY lastseen DESC"); 
$fetchPages->execute(); 
$totalRows = $fetchPages->rowCount(); 

$totalPages = ceil($totalRows / 16);

$pagination = Pagination($page, $totalRows, 16);

$UserResults = Users::fetchAll($userSearched, $pagination->Offset, 16);

$pageNumber = 1;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 
?>
<div id="Body">
					
    
    <div id="ctl00_cphRoblox_Panel1">
	
	    <div id="BrowseContainer" style="text-align:center">
		    <br>
		    <input name="ctl00$cphRoblox$FormSubmitWithoutOnClickEventWorkaround" type="text" value="http://aspnet.4guysfromrolla.com/articles/060805-1.aspx" id="ctl00_cphRoblox_FormSubmitWithoutOnClickEventWorkaround" style="visibility:hidden;display:none;">
		    <input name="search" type="text" value="<?=$userSearched?>" maxlength="100" id="ctl00_cphRoblox_tbSearch">&nbsp;<a id="ctl00_cphRoblox_lbSearch" href="javascript:__doPostBack('ctl00$cphRoblox$lbSearch','')">Search</a>
		    <br><br>
		    
				    
				    <div>
		<table class="Grid" cellspacing="0" cellpadding="4" border="0" id="ctl00_cphRoblox_gvUsersBrowsed" style="border-collapse:collapse;">
			<tbody><tr class="GridHeader">
				<th scope="col">Avatar</th><th scope="col"><a href="javascript:__doPostBack('ctl00$cphRoblox$gvUsersBrowsed','Sort$userName')">Name</a></th><th scope="col">Status</th><th scope="col"><a href="javascript:__doPostBack('ctl00$cphRoblox$gvUsersBrowsed','Sort$lastActivity')">Location / Last Seen</a></th>
			</tr>
<?php foreach ($UserResults as $Users) { 

$online = isTimeConsideredOnline($Users['lastseen']);

?>
			<tr class="GridItem">
				<td>
                                   <a id="ctl00_cphRoblox_gvUsersBrowsed_ctl02_hlAvatar" title="<?=$Users['username']?>" href="/User.aspx?ID=<?=$Users['id']?>" style="display:inline-block;height:48px;width:48px;cursor:pointer;"><img src="/thumbs/avatar.ashx?userId=<?=$Users['id']?>" height="48" width="48" border="0" id="img" alt="<?=$Users['username']?>"></a>
							    </td><td>
								    <a id="ctl00_cphRoblox_gvUsersBrowsed_ctl02_hlName" href="User.aspx?ID=<?=$Users['id']?>"><?=$Users['username']?></a><br>
								    <span id="ctl00_cphRoblox_gvUsersBrowsed_ctl02_lBlurb"><?=htmlspecialchars($Users['bio'])?></span>
							    </td><td>
								    <span id="ctl00_cphRoblox_gvUsersBrowsed_ctl02_lblUserOnlineStatus"><?php echo $online ? "Online" : "Offline"; ?></span><br>
							    </td><td>
								    <span id="ctl00_cphRoblox_gvUsersBrowsed_ctl02_lblUserLocationOrLastSeen">Website</span>
							    </td>
			</tr>
<?php } ?>
			
			<tr class="GridPager">
				<td colspan="4"><table border="0">
					<tbody><tr>
<?php
if ($totalPages < 11) {
   for($pageNumber = 1; $pageNumber <= $totalPages; $pageNumber++) { ?>
	  <td><a href="/Browse.aspx?page=<?=$pageNumber?>&search=<?=$userSearched?>"><?=$pageNumber?></a></td>
<?php }
} else { for($pageNumber = 1; $pageNumber < 10; $pageNumber++) { ?>
      <td><a href="/Browse.aspx?page=<?=$pageNumber?>&search=<?=$userSearched?>"><?=$pageNumber?></a></td>
<?php } ?>
	  <td><span>...</span></td>
	  <td><a href="/Browse.aspx?page=<?=$totalPages-1?>&search=<?=$userSearched?>"><?=$totalPages-1?></a></td>
	  <td><a href="/Browse.aspx?page=<?=$totalPages?>&search=<?=$userSearched?>"><?=$totalPages?></a></td>
<?php } ?>

					</tr>
				</tbody></table></td>
			</tr>
		</tbody></table>
	</div>
			    
	    </div>
	
</div>

				</div>
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>