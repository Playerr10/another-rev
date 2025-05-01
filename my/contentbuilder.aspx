<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');

use Website\Couscous\Users;

Users::requireLoggedIn();

if($userAuth->rank != 1 && $userAuth->rank != 23){
	header("Location: /");
	die();
}

$aspnetForm = false;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/contentbuilder.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php');

foreach($errorList as $info){
echo '<div class="SystemAlert">
						<div class="SystemAlertText" style="background-color: #ff0000">
							<div>'.$info.'</div>
						</div>
					</div>';
}
?>
            
            <form name="aspnetForm" method="post" action="<?=$_SERVER["REQUEST_URI"];?>" enctype="multipart/form-data" id="aspnetForm"> 
            
			<div id="Body">
<style>
	.clothe
	{
		width:110px;
		/*height: 200px;*/
		margin: 10px;
		text-align: left;
		
		vertical-align: top;
		display: inline-block;
		display: -moz-inline-stack;
		*display: inline;
	}
	.clothe .name {
		font-weight: bold;
	}
	.nocl
	{
		font-family: Verdana;
		font-weight: bold;
		text-align: center;
	}
	.img{
		border:none;
		height: 100%;
	}
	.imgc
	{
		border:1px solid black;
		width: 110px;
		height: 110px;
		text-align: center;
		padding: 10px;
		position: relative;
	}
	.fixed
	{
		position:absolute;
		right:0;
		top:0;
		background-color: #EEEEEE;
		border: 1px solid #555555;
		color: blue;
		font-family: Verdana;
		font-size: 10px;
		font-weight: lighter;
	}
	#left{
		width: 69%;
		float: left;
	}
	#right{
		width: 30%;
		float: right;
	}
	#Body table
	{
		border: 1px black solid;
	}
	.tablehead
	{
		font-size:16px; font-weight: bold; width: 100%; background-color: #CCCCCC; color: #222222;
	}
	.tablebody
	{
		font-weight: lighter; background-color: transparent;font-family: Verdana;
	}
	.margin{
		margin:10px;
	}
	.clickable, .clickable3, .clickable2
	{
		border: none;
		margin:1px;
	}
	.clickable{
		width:50px;
		height: 50px;
	}
	.clickablesm{
		width:40px;
		height:40px;
		margin:5px;
	}
	.clickable2{
		width:47px;
		height: 100px;
	}
	.clickable3{
		width:100px;
		height: 100px;
	}
	.nonsbtn
	{
		font-weight:normal;
	}
	#col{
		position: fixed;
		top: 50%;
		left: 50%;
		margin-top: -105px;
		margin-left: -205px;
		width: 410px;
		height: 210px;
		z-index: 498;
		background-color: white;
		text-align: center;
		vertical-align: center;
	}
	.tablebody a {
	    color:blue;
	}
	.tablebody a:hover {
	    cursor:pointer;
	}
</style>

	<div id="ContentBuilderContainer" style="margin-left: 50px;">
	<h2>Content Builder</h2>
	<br>
	<table width="100%" cellspacing="0px">
	<tbody>
	<tr>
		   <th class="tablehead">Instructions</th>
	</tr>
	 </tbody></table>
           <div class="Content">
						 <p>Almost everything in ROBLOX is represented as a cloud-based asset with a unique corresponding ID. This ID is typically in the form of http://<?=$url;?>/asset/?id=[ID], which gets applied to various instances as a property that's appropriate for that particular asset type. For example, Texture, MeshPart, and Sound instances reference image, mesh, and audio assets through their respective TextureID, MeshID, and SoundID properties. </p>
						 <p>To upload an asset: </p>
					<ol>
						<li>Click the "Browse" button below</li>
						<li>Use the File Explorer that pops out to browse your computer</li>
						<li>Find and select the asset that you want to upload. Any standard image (.png, .jpg, .gif) will work. </li>
						     
						<li>Finally click the "Upload It!" button</li>
					</ol>
						 <p>The asset you selected will be uploaded to ROBLOX.</p>
				</div>
	 <div></div>
	
	<table width="100%" cellspacing="0px">
	<tbody>
	<tr>
		   <th class="tablehead">Upload Texture</th>
	</tr>
	 </tbody></table>
           <center><div class="Content">
<p>
            <input type="file" name="assetload" id="assetload">
			
			
			</p>
<p><label for="asset">Choose an asset type:</label>
              <select name="assettype" id="assettype">
			    <option value="2">Shirts</option>
                <option value="3">Hats</option>
                <option value="4">Decal</option>
                <option value="5">Model</option>
                <option value="6">Mesh</option>
               </select></p>
						 <p>
            <input type="submit" name="assetupload" id="assetupload" value="Upload It!"></p>
             <p>All uploaded assets are moderated. Please upload only appropiate content.</p>
						 </div></center>
<div></div>
		</div>
    		
    
    <!-- bottom of page (outside columns) -->
							

    
    <br clear="all">    
    

            </div>
            
<?php include($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>
