<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;
use Website\Couscous\Friends;

$getId = (int) $_GET['UserID'];

$userResults = Users::fetch($getId);
$UserFriends = Friends::areFriends($getId, $getId);

if(!$userResults)die(header('Location: /'));

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 
?>
<div id="Body">
					
	<div id="FriendsContainer">
		

<div id="Friends">
	<h4><?=$userResults->username?>'s Friends (<?=count($UserFriends);?>)</h4>

	<table id="ctl00_cphRoblox_rbxFriendsPane_dlFriends" cellspacing="0" border="0" align="Center">
	<tbody><tr>

<?php
$tr = 0;

if($UserFriends) {
	
	foreach($UserFriends as $Friend){
	
	$FriendID = ($Friend['receiver'] == $getId) ? $Friend['sender'] : $Friend['receiver'];

	$AllFriends = Users::fetch($FriendID);

    $FriendOnline = isTimeConsideredOnline($AllFriends->lastseen);

?>

	        <td>
			<div class="Friend">
				<div class="Avatar"><a id="ctl00_cphRoblox_rbxFriendsPane_dlFriends_ctl00_hlAvatar" title="<?php echo $AllFriends->username ?>" href="/User.aspx?ID=<?php echo $AllFriends->id ?>" style="display:inline-block;height:100px;width:100px;cursor:pointer;"><img src="/thumbs/avatar.ashx?userId=<?php echo $AllFriends->id ?>" style="display:inline-block;height:100px;width:100px;cursor:pointer;" border="0" id="img" alt="<?php echo $AllFriends->username ?>"></a></div>
				<div class="Summary">
					<span class="<?php echo $FriendOnline ? "Online" : "Offline"; ?>Status"><img id="ctl00_cphRoblox_rbxFriendsPane_dlFriends_ctl00_i<?php echo $FriendOnline ? "Online" : "Offline"; ?>Status" src="images/<?php echo $FriendOnline ? "online" : "offline"; ?>.png" alt="<?php echo $AllFriends->username ?> is <?php echo $FriendOnline ? "online" : "offline"; ?> at Web Site." style="border-width:0px;"></span>
					<span class="Name"><a id="ctl00_cphRoblox_rbxFriendsPane_dlFriends_ctl00_hlFriend" href="User.aspx?ID=<?php echo $AllFriends->id ?>"><?php echo $AllFriends->username ?></a></span>
				</div>
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