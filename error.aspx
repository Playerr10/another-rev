<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/header.php'); 
?>
				<div id="Body">
		<div id="Error">
		    <center>
                    <h2>An error occurred!</h2>
                    <h3>Oh noes! Sorry about that! Just rewind time by going back.</h3>
                    <img src="/images/errorPage.jpg">
                    <br>
                    <input name="GoBack" value="Rewind Time!" onclick="javascript:window.history.back()" id="GoBack" tabindex="5" class="BigButton" type="submit" style="margin-top: 20px; background-color: #3B88C3">
		    </center>
		</div>

</div>

<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/public/footer.php'); ?>