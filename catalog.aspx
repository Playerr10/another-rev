<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

$type = $_GET['c'] ?? 3;
$page = $_GET['p'] ?? 1;

$itemSearched = $_GET["q"] ?? "";
$searchResults = [];

if(isset($itemSearched) && $itemSearched !== "")
{
	$searchQuery = " AND name LIKE \"%".htmlspecialchars($itemSearched)."%\"";
}

if(in_array($type, $catalogDisplay)){
  $stmt = $conn->prepare("SELECT * FROM asset WHERE type = :type".@$searchQuery." ORDER BY createdon");
  $stmt->execute([':type' => $type]);
  $assetCount = $stmt->rowCount();

  $pagination = Pagination($page, $assetCount, 20);

  $stmt = $conn->prepare("SELECT * FROM asset WHERE type = :type".@$searchQuery." ORDER BY createdon DESC LIMIT 20 OFFSET :offset");
  $stmt->bindValue(":type", $type);
  $stmt->BindParam(":offset", $pagination->Offset, PDO::PARAM_INT);
  $stmt->execute();
  $itemResults = $stmt->fetchAll();
  
  $totalPages = ceil($assetCount / 20);
} else {
  die(header("Location: /Catalog.aspx"));
}

$aspnetForm = false;
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); ?>
<div id="Body">
    

<div id="CatalogContainer">
    <form style="display:inline" id="search">
    <div id="SearchBar" class="SearchBar">
	    <input type="hidden" name="c" value="<?=$type?>">
		<input type="hidden" name="p" value="<?=$page?>">
        <span class="SearchBox"><input name="q" type="text" <?php if (!empty($itemSearched)) echo 'value="'.htmlspecialchars($itemSearched).'"'; ?> maxlength="100" id="ctl00_cphRoblox_rbxCatalog_SearchTextBox" class="TextBox"></span>
        <span class="SearchButton"><input type="submit" value="Search" id="ctl00_cphRoblox_rbxCatalog_SearchButton" href="#" onclick="$('#search').submit()" onkeypress="$('#search').submit()"></span>
    </div>
	</form>
    <div class="DisplayFilters">
	    <h2>Catalog</h2>
	    <div id="Category">
		    <h4>Category</h4>
		    
				    <ul>
<?php 
foreach(array_reverse($assetArray) as $info){ 
if($info['hidden'] == false){
?>
				    <li>
					    <?php if($type == $info['id']){ ?><img id="ctl00_cphRoblox_rbxCatalog_AssetCategoryRepeater_ctl04_SelectedCategoryBullet" class="GamesBullet" src="/images/games_bullet.png" border="0"><?php } ?>
					    <a id="ctl00_cphRoblox_rbxCatalog_AssetCategoryRepeater_ctl01_AssetCategorySelector" href="Catalog.aspx?c=<?=$info['id']?>"><?=$info['plural']?></a>
				    </li>
<?php } 
} ?>
			    
				    </ul>
			    
	    </div>
	    
    </div>
    <div class="Assets">
        <span id="ctl00_cphRoblox_rbxCatalog_AssetsDisplaySetLabel" class="AssetsDisplaySet"><?=$assetArray[$type]['plural']?></span>
<?php if($pagination->Pages>1) { ?>
	    <div id="ctl00_cphRoblox_rbxCatalog_HeaderPagerPanel" class="HeaderPager">
<?php if($page > 1) { ?>         
<a id="ctl00_cphRoblox_rbxCatalog_HeaderPagerHyperLink_Previous" href="Catalog.aspx?c=<?=$type?>&amp;p=<?=$pagination->Page-1?>"><span class="NavigationIndicators">&lt;&lt;</span> Previous</a>
<?php } ?>
		    <span id="ctl00_cphRoblox_rbxCatalog_HeaderPagerLabel">Page <?=number_format((($pagination->Page-1))+1)?> of <?=number_format($totalPages)?></span>
		    <a id="ctl00_cphRoblox_rbxCatalog_HeaderPagerHyperLink_Next" href="Catalog.aspx?c=<?=$type?>&amp;p=<?=$pagination->Page+1?>">Next <span class="NavigationIndicators">&gt;&gt;</span></a>
	    </div>
<?php } ?>
	    <table id="ctl00_cphRoblox_rbxCatalog_AssetsDataList" cellspacing="0" align="Center" border="0" width="735">
	<tbody>
	<tr>
<?php 
$tr = 0; // for rows
foreach($itemResults as $info){

$UserInfo = Users::fetch($info['authorid']);
$count = $conn->prepare("SELECT * FROM inventory WHERE boughtid = :bid");
$count->execute([':bid' => $info['id']]);
$boughtCount = $count->rowCount();
?>
		<td valign="top">
		        <div class="Asset">
			        <div class="AssetThumbnail">
				        <a id="ctl00_cphRoblox_rbxCatalog_AssetsDataList_ctl00_AssetThumbnailHyperLink" title="<?=htmlspecialchars($info['name']);?>" href="/Item.aspx?ID=<?=$info['id'];?>" style="display:inline-block;cursor:pointer;"><img src="/thumbs/asset.ashx?assetId=<?=$info['id'];?>" style="height:120px;width:120px" border="0" alt="<?=htmlspecialchars($info['name']);?>"></a>
			        </div>
			        <div class="AssetDetails">
				        <div class="AssetName"><a id="ctl00_cphRoblox_rbxCatalog_AssetsDataList_ctl00_AssetNameHyperLink" href="Item.aspx?ID=<?=$info['id'];?>"><?=htmlspecialchars($info['name']);?></a></div>
				        <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail"><a id="ctl00_cphRoblox_rbxCatalog_AssetsDataList_ctl00_CreatorHyperLink" href="User.aspx?ID=<?=$info['authorid'];?>"><?=$UserInfo->username;?></a></span></div>
			        </div>
			    </div>
		    </td>
<?php 
$tr++;

if($tr === 5) {
echo "</tr><tr>";
$tr = 0;
}

}
?>
</tbody></table>
<?php if($pagination->Pages>1) { ?>
        <div id="ctl00_cphRoblox_rbxCatalog_FooterPagerPanel" class="HeaderPager">
<?php if($page > 1) { ?>         
<a id="ctl00_cphRoblox_rbxCatalog_FooterPagerHyperLink_Previous" href="Catalog.aspx?c=<?=$type?>&amp;p=<?=$pagination->Page-1?>"><span class="NavigationIndicators">&lt;&lt;</span> Previous</a>
<?php } ?>
            <span id="ctl00_cphRoblox_rbxCatalog_FooterPagerLabel">Page <?=number_format((($pagination->Page-1))+1)?> of <?=number_format($totalPages)?></span>
            <a id="ctl00_cphRoblox_rbxCatalog_FooterPagerHyperLink_Next" href="Catalog.aspx?c=<?=$type?>&amp;p=<?=$pagination->Page+1?>">Next <span class="NavigationIndicators">&gt;&gt;</span></a>
        </div>
<?php } ?>
    </div>
    <div style="clear: both;">
</div>
    <script type="text/javascript">
        $(function () {
            $("#ctl00_cphRoblox_rbxCatalog_SearchTextBox").focus();
        });
		
    </script>
				</div>
				
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>
			</div>