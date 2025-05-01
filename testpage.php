<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/rcc.php');

// check if it was pressed by someone
if (isset($_POST['render_user'])) {
    RenderUser(3); // changeid
    $showImage = true; // flag basically true if the image has been showen or not
} else {
    $showImage = false;
}
?>
<!DOCTYPE html>
<html lang="en">
 <link rel='stylesheet' href='https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.css'>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Soapui but inside of a page fake </title>
  <style>
    #user-image {
      margin-top: 20px;
      max-width: 300px;
      border: 1px solid #ccc;
      box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
      display: none;
  </style>
</head>
<body>
  <h1>Render User</h1>
  <form method="POST">
    <button type="submit" name="render_user">Render the gray man </button>
  </form>

  <div id="image-container">
    <img id="user-image" src="https://acerev.xyz/renders/users/1.png" alt="User Render">
  </div>

  <script>
    // If the render has been triggered, delay showing the image so that it doesnt shows the old one y'k
    <?php if ($showImage): ?>
      setTimeout(() => {
        const img = document.getElementById('user-image');
        img.style.display = 'block'; // Show the image after 4 seconds (you can change this if you wanna)
      }, 4000);
    <?php endif; ?>
  </script>
</body>
</html>
