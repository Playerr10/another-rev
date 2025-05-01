<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

Users::requireLoggedIn();

$aspnetForm = true;

$page = $_GET['page'] ?? 1;

$stmt = $conn->prepare("SELECT * FROM messages WHERE toid = :id ORDER BY date");
$stmt->bindValue(":id", $userAuth->id);
$stmt->execute();
$msgCount = $stmt->rowCount();

$totalPages = ceil($msgCount / 10);

$pagination = Pagination($page, $msgCount, 10);

$stmt = $conn->prepare("SELECT * FROM messages WHERE toid = :id ORDER BY date DESC LIMIT :offset, :objects");
$stmt->bindValue(":id", $userAuth->id);
$stmt->BindParam(":offset", $pagination->Offset, PDO::PARAM_INT);
$stmt->bindValue(":objects", 10, PDO::PARAM_INT);
$stmt->execute();
$inbox = $stmt->fetchAll();

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); ?>
<div id="Body">
					
	<div id="InboxContainer">
	    <div id="InboxPane">
            <h2>Inbox</h2>
		    <div id="Inbox">
			    
			    <div>
	<table cellspacing="0" cellpadding="3" border="0" id="ctl00_cphRoblox_InboxGridView" style="width:726px;border-collapse:collapse;">
		<tbody><tr class="InboxHeader">
			<th align="left" scope="col">
							    <input id="ctl00_cphRoblox_InboxGridView_ctl01_SelectAllCheckBox" type="checkbox" name="ctl00$cphRoblox$InboxGridView$ctl01$SelectAllCheckBox" onclick="javascript:setTimeout('__doPostBack(\'ctl00$cphRoblox$InboxGridView$ctl01$SelectAllCheckBox\',\'\')', 0)">
						    </th><th align="left" scope="col"><a href="javascript:__doPostBack('ctl00$cphRoblox$InboxGridView','Sort$m.[Subject]')">Subject</a></th><th align="left" scope="col"><a href="javascript:__doPostBack('ctl00$cphRoblox$InboxGridView','Sort$u.[userName]')">From</a></th><th align="left" scope="col"><a href="javascript:__doPostBack('ctl00$cphRoblox$InboxGridView','Sort$m.[Created]')">Date</a></th>
		</tr>

<?php 
foreach($inbox as $info){
    $userResults = Users::fetch($info['fromid']);
?>
		<tr class="InboxRow">
			<td>
							    <span style="display:inline-block;width:25px;"><input id="ctl00_cphRoblox_InboxGridView_ctl21_DeleteCheckbox" type="checkbox" name="ctl00$cphRoblox$InboxGridView$ctl21$DeleteCheckbox"></span>
						    </td><td align="left"><a href="<?php if ($info['request'] == 1) { ?>FriendInvitation.aspx<?php } else { ?>PrivateMessage.aspx<?php } ?>?MessageID=<?=$info['id'];?>" style="display:inline-block;width:325px;"><?=htmlspecialchars($info['subject']);?></a></td><td align="left">
							    <a id="ctl00_cphRoblox_InboxGridView_ctl21_hlAuthor" title="Visit <?=$userResults->username;?>'s Home Page" href="/User.aspx?ID=<?=$info['fromid'];?>" style="display:inline-block;width:175px;"><?=$userResults->username;?></a>
						    </td><td align="left"><?=time_elapsed_string('@' . $info['date']);?></td>
		</tr>
<?php } ?>
		
        <tr class="InboxPager">
			<td colspan="4"><table border="0">
				<tbody><tr>
					
<?php
if ($totalPages < 11) {
   for($pageNumber = 1; $pageNumber <= $totalPages; $pageNumber++) { ?>
	  <td><a href="/my/inbox.aspx?page=<?=$pageNumber?>"><?=$pageNumber?></a></td>
<?php }
} else { for($pageNumber = 1; $pageNumber < 10; $pageNumber++) { ?>
      <td><a href="/my/inbox.aspx?page=<?=$pageNumber?>"><?=$pageNumber?></a></td>
<?php } ?>
	  <td><span>...</span></td>
	  <td><a href="/my/inbox.aspx?page=<?=$totalPages-1?>"><?=$totalPages-1?></a></td>
	  <td><a href="/my/inbox.aspx?page=<?=$totalPages?>"><?=$totalPages?></a></td>
<?php } ?>
					
				</tr>
			</tbody></table></td>
		</tr>
	</tbody></table>
</div>
		    </div>
		    <div class="Buttons">
			    <a id="ctl00_cphRoblox_DeleteButton" class="Button" href="javascript:__doPostBack('ctl00$cphRoblox$DeleteButton','')">Delete</a>
			    <a id="ctl00_cphRoblox_CancelHyperLink" class="Button" href="../User.aspx">Cancel</a>
		    </div>
		</div>
</div>
		<div style="clear: both;"></div>
	</div>
	
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>