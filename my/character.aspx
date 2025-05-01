<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/character.php');

use Website\Couscous\Users;
use Website\Couscous\Assets;
use Website\Couscous\Client;

Users::requireLoggedIn();

// wardrobe:
$shirtResults = Users::getUserWearing(0, $userAuth->id, 2, "wardrobe");
$hatResults = Users::getUserWearing(0, $userAuth->id, 3, "wardrobe");

// currently wearing:
$shirt = Users::getUserWearing(0, $userAuth->id, 2, "wearing");
$hat = Users::getUserWearing(0, $userAuth->id, 3, "wearing");

$HtmlColors = [];
foreach($colorArray as $ColorInfo):
	array_push($HtmlColors, Client::convertBodyColorToHtml($ColorInfo));
endforeach;

$aspnetForm = true;

require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); ?>
				<div id="Body">

    <div style="float: right; width: 230px; padding: 0px 24px 0px">
        <h3>
            Pick Colors</h3>
        <p>
            Click a body part to change its color</p>
        <div id="ctl00_cphRoblox_UpdatePanel1">
	
                <div id="ctl00_cphRoblox_Frame" style="height:236px;width:176px;background-image:url(/images/CharacterBackdrop.png);margin-bottom: 10px;">
		
                    <div style="position: relative; margin: 31px 11px">
                        <div style="">
                            <div style="position: absolute; left: 120px; top: 44px; cursor: pointer">
                                <div id="ctl00_cphRoblox_HotButtonRightArm" onclick="toggle_visibility('ctl00_cphRoblox_PopupPanelRightArm');" style="background-color:<?=$HtmlColors[3];?>;height:72px;width:32px;">
			
                                
		</div>
                            </div>
                            <div style="position: absolute; left: 40px; top: 44px; cursor: pointer">
                                <div id="ctl00_cphRoblox_HotButtonTorso" onclick="toggle_visibility('ctl00_cphRoblox_PopupPanelTorso');" style="background-color:<?=$HtmlColors[1];?>;height:72px;width:72px;">
<?php if($shirt){ ?>
                                    <div style="position: absolute; left: 16px; top: 16px; cursor: pointer">
                                        <img id="ctl00_cphRoblox_ShirtImage" disabled="disabled" src="/Thumbs/Asset.ashx?assetId=<?=$shirt['boughtid'];?>" style="height:40px;width:40px;border-width:0px;"></div>
<?php } ?>
                                
		</div>
                            </div>
                            <div style="position: absolute; left: 0px; top: 44px; cursor: pointer">
                                <div id="ctl00_cphRoblox_HotButtonLeftArm" onclick="toggle_visibility('ctl00_cphRoblox_PopupPanelLeftArm');" style="background-color:<?=$HtmlColors[2];?>;height:72px;width:32px;">
			
                                
		</div>
                            </div>
                            <div style="position: absolute; left: 58px; top: 0px; cursor: pointer">
                                <div id="ctl00_cphRoblox_HotButtonHead" onclick="toggle_visibility('ctl00_cphRoblox_PopupPanelHead');" style="background-color:<?=$HtmlColors[0];?>;height:36px;width:36px;">
			
                                    <a id="ctl00_cphRoblox_FaceImage" disabled="disabled" onclick="return false" style="display:inline-block;height:36px;width:36px;"><img src="/images/face_36x36.png" id="img" alt="" border="0"></a>
                                
		</div>
<?php if($hat){ ?>
                                <div style="position: absolute; left: 0px; top: -40px; cursor: default">
                                    <a id="ctl00_cphRoblox_HatImage" disabled="disabled" onclick="return false" style="display:inline-block;height:40px;width:40px;"><img src="/Thumbs/Asset.ashx?assetId=<?=$hat['boughtid'];?>" style="height:40px;width:40px;border-width:0px;" id="img" border="0"></a>
								</div>
<?php } ?>
                            </div>
                            <div style="position: absolute; left: 40px; top: 124px; cursor: pointer">
                                <div id="ctl00_cphRoblox_HotButtonLeftLeg" onclick="toggle_visibility('ctl00_cphRoblox_PopupPanelLeftLeg');" style="background-color:<?=$HtmlColors[4];?>;height:72px;width:32px;">
			
                                
		</div>
                            </div>
                            <div style="position: absolute; left: 80px; top: 124px; cursor: pointer">
                                <div id="ctl00_cphRoblox_HotButtonRightLeg" onclick="toggle_visibility('ctl00_cphRoblox_PopupPanelRightLeg');" style="background-color:<?=$HtmlColors[5];?>;height:72px;width:32px;">
			
                                
		</div>
                            </div>
                        </div>
                    </div>
                
	</div>
<?php if($shirt){ ?>
                <a id="ctl00_cphRoblox_LinkButtonTakeShirtOff" href="javascript:UnwearItem(<?=$shirt['boughtid'];?>)">Take Shirt Off</a>
<?php } if($hat){ ?>
                <a id="ctl00_cphRoblox_LinkButtonTakeOffHat" href="javascript:UnwearItem(<?=$hat['boughtid'];?>)">Take Accessory Off</a>
<?php } ?>
                <div id="ctl00_cphRoblox_PopupPanelRightLeg" class="popupControl" style="visibility: hidden;">
		
                    <table id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors" style="border-width:0px;border-collapse:collapse;" cellspacing="0" border="0">
			<tbody><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '1')" style="display:inline-block;background-color:#F2F3F2;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '208')" style="display:inline-block;background-color:#E5E4DE;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '194')" style="display:inline-block;background-color:#A3A2A4;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '199')" style="display:inline-block;background-color:#635F61;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '26')" style="display:inline-block;background-color:#1B2A34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '21')" style="display:inline-block;background-color:#C4281B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '24')" style="display:inline-block;background-color:#F5CD2F;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '226')" style="display:inline-block;background-color:#FDEA8C;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '23')" style="display:inline-block;background-color:#0D69AB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '107')" style="display:inline-block;background-color:#008F9B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '102')" style="display:inline-block;background-color:#6E99C9;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '11')" style="display:inline-block;background-color:#80BBDB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '45')" style="display:inline-block;background-color:#B4D2E3;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '135')" style="display:inline-block;background-color:#74869C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '106')" style="display:inline-block;background-color:#DA8540;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '105')" style="display:inline-block;background-color:#E29B3F;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '141')" style="display:inline-block;background-color:#27462C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '28')" style="display:inline-block;background-color:#287F46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '37')" style="display:inline-block;background-color:#4B974A;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '119')" style="display:inline-block;background-color:#A4BD46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '29')" style="display:inline-block;background-color:#A1C48B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '151')" style="display:inline-block;background-color:#789081;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '38')" style="display:inline-block;background-color:#A05F34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '192')" style="display:inline-block;background-color:#694027;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '104')" style="display:inline-block;background-color:#6B327B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '9')" style="display:inline-block;background-color:#E8BAC7;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '101')" style="display:inline-block;background-color:#DA8679;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '5')" style="display:inline-block;background-color:#D7C599;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '153')" style="display:inline-block;background-color:#957976;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '217')" style="display:inline-block;background-color:#7C5C45;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl30_LinkButton1" class="ColorPickerItem"onclick="ChangeColor('RightLeg', '18')" style="display:inline-block;background-color:#CC8E68;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightLeg_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightLeg', '125')" style="display:inline-block;background-color:#EAB891;height:32px;width:32px;">

				</div>
    </td>
			</tr>
		</tbody></table>

                
	</div>
                <div id="ctl00_cphRoblox_PopupPanelLeftLeg" class="popupControl" style="visibility: hidden;">
		
                    <table id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors" style="border-width:0px;border-collapse:collapse;" cellspacing="0" border="0">
			<tbody><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '1')" style="display:inline-block;background-color:#F2F3F2;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '208')" style="display:inline-block;background-color:#E5E4DE;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '194')" style="display:inline-block;background-color:#A3A2A4;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '199')" style="display:inline-block;background-color:#635F61;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '26')" style="display:inline-block;background-color:#1B2A34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '21')" style="display:inline-block;background-color:#C4281B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '24')" style="display:inline-block;background-color:#F5CD2F;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '226')" style="display:inline-block;background-color:#FDEA8C;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '23')" style="display:inline-block;background-color:#0D69AB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '107')" style="display:inline-block;background-color:#008F9B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '102')" style="display:inline-block;background-color:#6E99C9;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '11')" style="display:inline-block;background-color:#80BBDB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '45')" style="display:inline-block;background-color:#B4D2E3;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '135')" style="display:inline-block;background-color:#74869C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '106')" style="display:inline-block;background-color:#DA8540;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '105')" style="display:inline-block;background-color:#E29B3F;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '141')" style="display:inline-block;background-color:#27462C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '28')" style="display:inline-block;background-color:#287F46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '37')" style="display:inline-block;background-color:#4B974A;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '119')" style="display:inline-block;background-color:#A4BD46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '29')" style="display:inline-block;background-color:#A1C48B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '151')" style="display:inline-block;background-color:#789081;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '38')" style="display:inline-block;background-color:#A05F34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '192')" style="display:inline-block;background-color:#694027;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '104')" style="display:inline-block;background-color:#6B327B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '9')" style="display:inline-block;background-color:#E8BAC7;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '101')" style="display:inline-block;background-color:#DA8679;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '5')" style="display:inline-block;background-color:#D7C599;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '153')" style="display:inline-block;background-color:#957976;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '217')" style="display:inline-block;background-color:#7C5C45;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl30_LinkButton1" class="ColorPickerItem"onclick="ChangeColor('LeftLeg', '18')" style="display:inline-block;background-color:#CC8E68;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftLeg_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftLeg', '125')" style="display:inline-block;background-color:#EAB891;height:32px;width:32px;">

				</div>
    </td>
			</tr>
		</tbody></table>

                
	</div>
                <div id="ctl00_cphRoblox_PopupPanelHead" class="popupControl" style="visibility: hidden;">
		
                    <table id="ctl00_cphRoblox_ColorPickerHead_DataListColors" style="border-width:0px;border-collapse:collapse;" cellspacing="0" border="0">
			<tbody><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '1')" style="display:inline-block;background-color:#F2F3F2;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '208')" style="display:inline-block;background-color:#E5E4DE;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '194')" style="display:inline-block;background-color:#A3A2A4;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '199')" style="display:inline-block;background-color:#635F61;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '26')" style="display:inline-block;background-color:#1B2A34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '21')" style="display:inline-block;background-color:#C4281B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '24')" style="display:inline-block;background-color:#F5CD2F;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '226')" style="display:inline-block;background-color:#FDEA8C;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '23')" style="display:inline-block;background-color:#0D69AB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '107')" style="display:inline-block;background-color:#008F9B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '102')" style="display:inline-block;background-color:#6E99C9;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '11')" style="display:inline-block;background-color:#80BBDB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '45')" style="display:inline-block;background-color:#B4D2E3;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '135')" style="display:inline-block;background-color:#74869C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '106')" style="display:inline-block;background-color:#DA8540;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '105')" style="display:inline-block;background-color:#E29B3F;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '141')" style="display:inline-block;background-color:#27462C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '28')" style="display:inline-block;background-color:#287F46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '37')" style="display:inline-block;background-color:#4B974A;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '119')" style="display:inline-block;background-color:#A4BD46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '29')" style="display:inline-block;background-color:#A1C48B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '151')" style="display:inline-block;background-color:#789081;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '38')" style="display:inline-block;background-color:#A05F34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '192')" style="display:inline-block;background-color:#694027;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '104')" style="display:inline-block;background-color:#6B327B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '9')" style="display:inline-block;background-color:#E8BAC7;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '101')" style="display:inline-block;background-color:#DA8679;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '5')" style="display:inline-block;background-color:#D7C599;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '153')" style="display:inline-block;background-color:#957976;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '217')" style="display:inline-block;background-color:#7C5C45;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl30_LinkButton1" class="ColorPickerItem"onclick="ChangeColor('Head', '18')" style="display:inline-block;background-color:#CC8E68;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerHead_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Head', '125')" style="display:inline-block;background-color:#EAB891;height:32px;width:32px;">

				</div>
    </td>
			</tr>
		</tbody></table>

                
	</div>
                <div id="ctl00_cphRoblox_PopupPanelTorso" class="popupControl" style="visibility: hidden;">
		
                    <table id="ctl00_cphRoblox_ColorPickerTorso_DataListColors" style="border-width:0px;border-collapse:collapse;" cellspacing="0" border="0">
			<tbody><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '1')" style="display:inline-block;background-color:#F2F3F2;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '208')" style="display:inline-block;background-color:#E5E4DE;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '194')" style="display:inline-block;background-color:#A3A2A4;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '199')" style="display:inline-block;background-color:#635F61;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '26')" style="display:inline-block;background-color:#1B2A34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '21')" style="display:inline-block;background-color:#C4281B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '24')" style="display:inline-block;background-color:#F5CD2F;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '226')" style="display:inline-block;background-color:#FDEA8C;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '23')" style="display:inline-block;background-color:#0D69AB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '107')" style="display:inline-block;background-color:#008F9B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '102')" style="display:inline-block;background-color:#6E99C9;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '11')" style="display:inline-block;background-color:#80BBDB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '45')" style="display:inline-block;background-color:#B4D2E3;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '135')" style="display:inline-block;background-color:#74869C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '106')" style="display:inline-block;background-color:#DA8540;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '105')" style="display:inline-block;background-color:#E29B3F;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '141')" style="display:inline-block;background-color:#27462C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '28')" style="display:inline-block;background-color:#287F46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '37')" style="display:inline-block;background-color:#4B974A;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '119')" style="display:inline-block;background-color:#A4BD46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '29')" style="display:inline-block;background-color:#A1C48B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '151')" style="display:inline-block;background-color:#789081;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '38')" style="display:inline-block;background-color:#A05F34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '192')" style="display:inline-block;background-color:#694027;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '104')" style="display:inline-block;background-color:#6B327B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '9')" style="display:inline-block;background-color:#E8BAC7;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '101')" style="display:inline-block;background-color:#DA8679;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '5')" style="display:inline-block;background-color:#D7C599;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '153')" style="display:inline-block;background-color:#957976;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '217')" style="display:inline-block;background-color:#7C5C45;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl30_LinkButton1" class="ColorPickerItem"onclick="ChangeColor('Torso', '18')" style="display:inline-block;background-color:#CC8E68;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerTorso_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('Torso', '125')" style="display:inline-block;background-color:#EAB891;height:32px;width:32px;">

				</div>
    </td>
			</tr>
		</tbody></table>

                
	</div>
                <div id="ctl00_cphRoblox_PopupPanelLeftArm" class="popupControl" style="visibility: hidden;">
		
                    <table id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors" style="border-width:0px;border-collapse:collapse;" cellspacing="0" border="0">
			<tbody><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '1')" style="display:inline-block;background-color:#F2F3F2;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '208')" style="display:inline-block;background-color:#E5E4DE;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '194')" style="display:inline-block;background-color:#A3A2A4;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '199')" style="display:inline-block;background-color:#635F61;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '26')" style="display:inline-block;background-color:#1B2A34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '21')" style="display:inline-block;background-color:#C4281B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '24')" style="display:inline-block;background-color:#F5CD2F;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '226')" style="display:inline-block;background-color:#FDEA8C;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '23')" style="display:inline-block;background-color:#0D69AB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '107')" style="display:inline-block;background-color:#008F9B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '102')" style="display:inline-block;background-color:#6E99C9;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '11')" style="display:inline-block;background-color:#80BBDB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '45')" style="display:inline-block;background-color:#B4D2E3;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '135')" style="display:inline-block;background-color:#74869C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '106')" style="display:inline-block;background-color:#DA8540;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '105')" style="display:inline-block;background-color:#E29B3F;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '141')" style="display:inline-block;background-color:#27462C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '28')" style="display:inline-block;background-color:#287F46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '37')" style="display:inline-block;background-color:#4B974A;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '119')" style="display:inline-block;background-color:#A4BD46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '29')" style="display:inline-block;background-color:#A1C48B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '151')" style="display:inline-block;background-color:#789081;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '38')" style="display:inline-block;background-color:#A05F34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '192')" style="display:inline-block;background-color:#694027;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '104')" style="display:inline-block;background-color:#6B327B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '9')" style="display:inline-block;background-color:#E8BAC7;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '101')" style="display:inline-block;background-color:#DA8679;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '5')" style="display:inline-block;background-color:#D7C599;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '153')" style="display:inline-block;background-color:#957976;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '217')" style="display:inline-block;background-color:#7C5C45;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl30_LinkButton1" class="ColorPickerItem"onclick="ChangeColor('LeftArm', '18')" style="display:inline-block;background-color:#CC8E68;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerLeftArm_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('LeftArm', '125')" style="display:inline-block;background-color:#EAB891;height:32px;width:32px;">

				</div>
    </td>
			</tr>
		</tbody></table>

                
	</div>
                <div id="ctl00_cphRoblox_PopupPanelRightArm" class="popupControl" style="visibility: hidden;">
		
                    <table id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors" style="border-width:0px;border-collapse:collapse;" cellspacing="0" border="0">
			<tbody><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '1')" style="display:inline-block;background-color:#F2F3F2;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '208')" style="display:inline-block;background-color:#E5E4DE;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '194')" style="display:inline-block;background-color:#A3A2A4;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '199')" style="display:inline-block;background-color:#635F61;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '26')" style="display:inline-block;background-color:#1B2A34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '21')" style="display:inline-block;background-color:#C4281B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '24')" style="display:inline-block;background-color:#F5CD2F;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '226')" style="display:inline-block;background-color:#FDEA8C;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '23')" style="display:inline-block;background-color:#0D69AB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '107')" style="display:inline-block;background-color:#008F9B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '102')" style="display:inline-block;background-color:#6E99C9;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '11')" style="display:inline-block;background-color:#80BBDB;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '45')" style="display:inline-block;background-color:#B4D2E3;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '135')" style="display:inline-block;background-color:#74869C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '106')" style="display:inline-block;background-color:#DA8540;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '105')" style="display:inline-block;background-color:#E29B3F;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '141')" style="display:inline-block;background-color:#27462C;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '28')" style="display:inline-block;background-color:#287F46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '37')" style="display:inline-block;background-color:#4B974A;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '119')" style="display:inline-block;background-color:#A4BD46;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '29')" style="display:inline-block;background-color:#A1C48B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '151')" style="display:inline-block;background-color:#789081;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '38')" style="display:inline-block;background-color:#A05F34;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '192')" style="display:inline-block;background-color:#694027;height:32px;width:32px;">

				</div>
    </td>
			</tr><tr>
				<td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '104')" style="display:inline-block;background-color:#6B327B;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '9')" style="display:inline-block;background-color:#E8BAC7;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '101')" style="display:inline-block;background-color:#DA8679;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '5')" style="display:inline-block;background-color:#D7C599;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '153')" style="display:inline-block;background-color:#957976;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '217')" style="display:inline-block;background-color:#7C5C45;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl30_LinkButton1" class="ColorPickerItem"onclick="ChangeColor('RightArm', '18')" style="display:inline-block;background-color:#CC8E68;height:32px;width:32px;">

				</div>
    </td><td>
        <div id="ctl00_cphRoblox_ColorPickerRightArm_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="ChangeColor('RightArm', '125')" style="display:inline-block;background-color:#EAB891;height:32px;width:32px;">

				</div>
    </td>
			</tr>
		</tbody></table>

                
	</div>     
              
            
</div>
    </div>
    <div>
        <h3>
            Pick a Shirt</h3>
        <div id="ctl00_cphRoblox_UpdatePanel2">
	
                <span id="ctl00_cphRoblox_DataListShirts"><span>
                        <p>
                            Click one of your shirts to wear it</p>
                    </span><span>

<?php foreach($shirtResults as $info){ $asset = Assets::fetch($info['boughtid']); ?>
                     <span>
                        <div style="display: inline" class="ColorPickerItem">
                            <a id="ctl00_cphRoblox_DataListShirts_ctl29_ImageButtonPickShirt" href="javascript:WearItem(<?=$asset->id;?>)" title="<?=$asset->name;?>" style="display:inline-block;height:96px;width:96px;cursor:pointer;"><img src="/Thumbs/Asset.ashx?assetId=<?=$asset->id;?>" id="img" alt="<?=$asset->name;?>.png" style="display:inline-block;height:96px;width:96px;cursor:pointer;" border="0"></a>
                        </div>
                    </span>
<?php } if ($shirtResults == null) { ?>
                     <span>
                        <div style="display: inline">
                            <center style="height:96px;">You have no shirts!</center>
                        </div>
                    </span>
<?php } ?>
			  </span>
			</span>
        
		
</div>
        <h3>
            ... or Upload Your Shirt</h3>
        <p>
            Enter an image file in the box below and then click "Wear It!"</p>
        <p>
		

            <input type="file" name="shirtupload" id="shirtupload"></p>
        <p>
            <input type="submit" name="wearupload" value="Wear It!" id="wearupload"></p>
	</div>
     <div>
	
   <div>
        <h3>
            Pick a Hat</h3>
        <div id="ctl00_cphRoblox_UpdatePanel3">
	
                <span id="ctl00_cphRoblox_DataListHats"><span>
                        <p>
                            Click one of your hats to wear it or
                            <a id="ctl00_cphRoblox_DataListHats_ctl00_HyperLink1" href="../Catalog.aspx?m=ForSale&amp;c=3">buy a hat</a>!</p>
							<?php if($userAuth->rank == 1){ ?><a id="ctl00_cphRoblox_DataListHats_ctl00_HyperLink1" href="/My/ContentBuilder.aspx">or create an asset</a>!<?php } ?>
<?php if($userAuth->rank == 23){ ?><a id="ctl00_cphRoblox_DataListHats_ctl00_HyperLink1" href="/My/ContentBuilder.aspx">or create an asset</a>!<?php } // my bad for bad code. ?>
                    </span>
<?php foreach($hatResults as $info){ $asset = Assets::fetch($info['boughtid']); ?>
					<span>
                        <div style="display: inline" class="ColorPickerItem">
                            <a id="ctl00_cphRoblox_DataListHats_ctl01_ImageButtonPickHat" title="<?=$asset->name;?>" href="javascript:WearItem(<?=$asset->id;?>)" style="display:inline-block;height:96px;width:96px;cursor:pointer;"><img style="display:inline-block;height:96px;width:96px;cursor:pointer;" src="/Thumbs/Asset.ashx?assetId=<?=$asset->id;?>" id="img" alt="<?=$asset->name;?>" border="0"></a>
                        </div>
                    </span>
<?php } ?>
					</span>
            
</div>
    </div><div></div></div>

<script type="text/javascript">

                                // this took so longtofigure out
                                function toggle_visibility(id) {
                                   var e = document.getElementById(id);
                                       if(e.style.visibility == 'hidden')
                                             e.style.visibility = 'visible';
                                       else
                                             e.style.visibility = 'hidden';
                                }

								// ITEM WEARING
								WearItem = function(id) {
									$.post("/include/client/wear.php?id="+id+"&request=wear", function(data) {
                                      document.location.reload();
									}).fail(function(data) {
										alert("Couldn't wear item");
									});
								};
								
								UnwearItem = function(id) {
									$.post("/include/client/wear.php?id="+id+"&request=unwear", function(data) {
                                      document.location.reload();
									}).fail(function(data) {
										alert("Couldn't unwear item");
									});
								};
								
								
								// BODY COLORS
								ChangeColor = function(request, id) {
									$.post("/include/client/colors.php?id=" +id+ "&request="+request, function(data) {
                                      document.location.reload();
									}).fail(function(data) {
										alert("Error changing color");
									});
								};

</script>   
</div> 
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>
          
