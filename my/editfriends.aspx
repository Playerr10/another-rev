<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;
use Website\Couscous\Friends;

Users::requireLoggedIn();

$userResults = Users::fetch($userAuth->id);
$UserFriends = Friends::areFriends($userAuth->id, $userAuth->id);

if (isset($_POST['delete']))
{
	Friends::RemoveFriend($userAuth->id, $_POST['userid']);
}

$aspnetForm = true;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 
?>
<div id="Body">
					
	<div id="FriendsContainer">
		

<div id="Friends">
	<h4>Your Friends (<?=count($UserFriends);?>)</h4>

	<table id="ctl00_cphRoblox_rbxFriendsPane_dlFriends" cellspacing="0" border="0" align="Center">
	<tbody><tr>

<?php
$tr = 0;

if($UserFriends) {
	
	foreach($UserFriends as $Friend){
	
	$FriendID = ($Friend['receiver'] == $userAuth->id) ? $Friend['sender'] : $Friend['receiver'];

	$AllFriends = Users::fetch($FriendID);

    $FriendOnline = isTimeConsideredOnline($AllFriends->lastseen);

?>

	        <td>
			<div class="Friend" onmouseover="this.style.borderStyle='outset';this.style.margin='6px'" onmouseout="this.style.borderStyle='none';this.style.margin='10px'">
				<div class="Avatar"><a id="ctl00_cphRoblox_rbxFriendsPane_dlFriends_ctl00_hlAvatar" title="<?=$AllFriends->username?>" href="/User.aspx?ID=<?=$AllFriends->id?>" style="display:inline-block;height:100px;width:100px;cursor:pointer;"><img src="/thumbs/avatar.ashx?userId=<?=$AllFriends->id?>" style="display:inline-block;height:100px;width:100px;cursor:pointer;" border="0" id="img" alt="<?=$AllFriends->username?>"></a></div>
				<div class="Summary">
					<span class="<?=$FriendOnline ? "Online" : "Offline";?>Status"><img id="ctl00_cphRoblox_rbxFriendsPane_dlFriends_ctl00_i<?=$FriendOnline ? "Online" : "Offline";?>Status" src="/images/<?php echo $FriendOnline ? "online" : "offline"; ?>.png" alt="<?=$AllFriends->username?> is <?=$FriendOnline ? "online" : "offline"; ?> at Web Site." style="border-width:0px;"></span>
					<span class="Name"><a id="ctl00_cphRoblox_rbxFriendsPane_dlFriends_ctl00_hlFriend" href="User.aspx?ID=<?=$AllFriends->id?>"><?=$AllFriends->username?></a></span>
				</div>
				<div class="Options"><input type="hidden" name="userid" value="<?=$AllFriends->id?>"><input type="submit" name="delete" value="Delete" id="ctl00_cphRoblox_rbxEditFriendsPane_dlFriends_ctl01_bDelete"></div>
			</div>
		</td>

<?php 
   $tr++;
	
   // create new row
	if($tr === 3) 
        echo "</tr><tr>";
	
    }
  }

?>

</tbody></table>
	
</div>
	</div>

				</div>
        
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>