<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

$stmt = $conn->prepare("SELECT * FROM asset WHERE type = 0 ORDER BY playercount");
$stmt->execute();
$gameResults = $stmt->fetchAll();
		
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); ?>
         
        <div id="Body">
            
    
    <div id="GamesContainer">
        
<div id="ctl00_cphRoblox_rbxGames_GamesContainerPanel">
	
    <div class="DisplayFilters">
	    <h2>Games&nbsp;<a id="ctl00_cphRoblox_rbxGames_hlNewsFeed" href="/Games.aspx?feed=rss"><img src="images/feed-icons/feed-icon-14x14.png" alt="RSS" border="0"></a></h2>
	    <div id="BrowseMode">
		    <h4>Browse</h4>
		    <ul>
			    <li><img id="ctl00_cphRoblox_rbxGames_MostPopularBullet" class="GamesBullet" src="images/games_bullet.png" alt="Bullet" border="0"><a id="ctl00_cphRoblox_rbxGames_hlMostPopular" href="Games.aspx?m=MostPopular&amp;t=Now"><b>Most Popular</b></a></li>
			    <li><a id="ctl00_cphRoblox_rbxGames_hlTopFavorites" href="Games.aspx?m=TopFavorites&amp;t=AllTime">Top Favorites</a></li>
			    <li><a id="ctl00_cphRoblox_rbxGames_hlRecentlyUpdated" href="Games.aspx?m=RecentlyUpdated">Recently Updated</a></li>
			    <li><a id="ctl00_cphRoblox_rbxGames_hlFeatured" href="User.aspx?id=1">Featured Games</a></li>
		    </ul>
	    </div>
	    <div id="ctl00_cphRoblox_rbxGames_pTimespan">
		
		    <div id="Timespan">
			    <h4>Time</h4>
			    <ul>
				    <li id="ctl00_cphRoblox_rbxGames_liNow"><img id="ctl00_cphRoblox_rbxGames_TimespanNowBullet" class="GamesBullet" src="images/games_bullet.png" alt="Bullet" border="0"><a id="ctl00_cphRoblox_rbxGames_hlTimespanNow" href="Games.aspx?m=MostPopular&amp;t=Now"><b>Now</b></a></li>
				    <li><a id="ctl00_cphRoblox_rbxGames_hlTimespanPastDay" href="Games.aspx?m=MostPopular&amp;t=PastDay">Past Day</a></li>
				    <li><a id="ctl00_cphRoblox_rbxGames_hlTimespanPastWeek" href="Games.aspx?m=MostPopular&amp;t=PastWeek">Past Week</a></li>
				    <li><a id="ctl00_cphRoblox_rbxGames_hlTimespanPastMonth" href="Games.aspx?m=MostPopular&amp;t=PastMonth">Past Month</a></li>
				    <li><a id="ctl00_cphRoblox_rbxGames_hlTimespanAllTime" href="Games.aspx?m=MostPopular&amp;t=AllTime">All-time</a></li>
			    </ul>
		    </div>
	    
	</div>
    </div>
<div id="Games" style="width:560px;">
			<span class="GamesDisplaySet">Most Popular (Now)</span>
						<div class="HeaderPager">
								<span>Page 1 of 142:</span>
				<a href="/Games.aspx?m=MostPopular&amp;t=Now&amp;p=2">Next <span class="NavigationIndicators">&gt;&gt;</span></a>			</div>
						<table cellspacing="0" align="Center" border="0" width="550">
		<tbody>
        <tr>
<?php 

$tr = 0;

foreach($gameResults as $info){
$userResults = Users::fetch($info['authorid']);

?>
			<td class="Game" valign="top">
	        <div style="padding-bottom:5px">
		        <div class="GameThumbnail">
			        <a id="ctl00_cphRoblox_rbxGames_dlGames_ctl00_ciGame" title="<?=htmlspecialchars($info['name']);?>" href="/Place.aspx?ID=<?=$info['id'];?>" style="display:inline-block;cursor:pointer;"><img src="/thumbs/asset.ashx?assetId=<?=$info['id'];?>" style="display:inline-block;height:100px;width:160px;" border="0" alt="<?=htmlspecialchars($info['name']);?>"></a>
		        </div>
		        <div class="GameDetails">
			        <div class="GameName"><a id="ctl00_cphRoblox_rbxGames_dlGames_ctl00_hlGameName" href="Place.aspx?ID=<?=$info['id'];?>"><?=htmlspecialchars($info['name']);?></a></div>
			        <div class="GameLastUpdate"><span class="Label">Updated:</span> <span class="Detail"><?=time_elapsed_string('@' . $info['createdon']);?></span></div>
			        <div class="GameCreator"><span class="Label">Creator:</span> <span class="Detail"><a id="ctl00_cphRoblox_rbxGames_dlGames_ctl00_hlGameCreator" href="User.aspx?id=<?=$info['authorid'];?>"><?=$userResults->username;?></a></span></div>
			        <div class="GamePlays"><span class="Label">Played:</span> <span class="Detail"><?=$info['visitedids'];?> times</span></div>
			        <div id="ctl00_cphRoblox_rbxGames_dlGames_ctl00_pGameCurrentPlayers">
				
				        <div class="GameCurrentPlayers"><span class="DetailHighlighted"><?=(number_format($info['playercount']));?> players online</span></div>
			        
			</div>
		        </div>
		    </div>
	        </td>
<?php 
$tr++;

if($tr === 3) {
echo "</tr><tr>";
$tr = 0;
}

}
?>
	</tbody></table>
						<div class="HeaderPager">
								<span>Page 1 of 142:</span>
				<a href="/Games.aspx?m=MostPopular&amp;t=Now&amp;p=2">Next <span class="NavigationIndicators">&gt;&gt;</span></a>			</div>
					</div>

</div>
        


        <div style="clear: both;"></div>
    </div>

        </div>
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>