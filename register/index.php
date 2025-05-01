<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/sqldbcon.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/functions.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/include/login.php');

use Website\Couscous\Users;

Users::RequireLoggedOut();

$errorList = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register'])) {
    // Collect user inputs
    $username = $_POST['username'];
    $password = $_POST['password'];
    $passwordcheck = $_POST['passwordcheck'];
    $email = $_POST['email'];
    $invitekey = $_POST['invitekey'];

    // Check if invite key is valid using the correct connection variable (assumed $conn here)
	$stmt = $conn->prepare("SELECT * FROM invitekeys WHERE `key` = :invitekey");
	$stmt->bindParam(':invitekey', $invitekey);
	$stmt->execute();

    if ($stmt->rowCount() == 0) {
        $errorList[] = "Invalid invite key. Please check and try again.";
    } else {
        if ($password === $passwordcheck) {
            // Proceed with registration (Add registration logic here)
            // Example: Users::register($username, $email, $password);
        } else {
            $errorList[] = "Passwords do not match.";
        }
    }
}
?>

<!doctype html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ROBLOX: A FREE Virtual World-Building Game with Avatar Chat, 3D Environments, and Physics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: none;
            height: 100vh;
        }

        .area {
            background: #4e54c8;
            background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);
            width: 100%;
            height: 100%;
            position: absolute;
        }

        .circles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .circles li {
            position: absolute;
            display: block;
            list-style: none;
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.2);
            animation: animate 25s linear infinite;
            bottom: -150px;
        }

        .circles li:nth-child(1) {
            left: 25%;
            width: 80px;
            height: 80px;
            animation-delay: 0s;
        }

        .circles li:nth-child(2) {
            left: 10%;
            width: 20px;
            height: 20px;
            animation-delay: 2s;
            animation-duration: 12s;
        }

        @keyframes animate {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
                border-radius: 0;
            }

            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
                border-radius: 50%;
            }
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .card {
            width: 100%;
            max-width: 500px;
            border: none;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .logo {
            max-width: 250px;
            margin: auto;
            display: block;
        }

        .btn-primary {
            background: #121212;
            border: none;
        }

        .btn-primary:hover {
            background: #0a0a0a;
        }

        .form-control {
            background: #333;
            color: white;
            border-radius: 5px;
        }

        .alert {
            background-color: #ff0000;
            color: white;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="area">
        <ul class="circles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>

    <div class="container">
        <div class="card">
            <?php
            foreach ($errorList as $info) {
                echo '<div class="alert">' . $info . '</div>';
            }
            ?>
            <img src="https://media.discordapp.net/attachments/1304924743572520983/1304931479700242453/acerev_2015_purple.png?ex=67843e25&is=6782eca5&hm=c681ddbcb98677737abf5b6f247d54378260b22025ecde6be94122b3128461b8&=&format=webp&quality=lossless" class="logo" alt="ROBLOX Logo">
            <form action="" method="post" id="aspnetForm">
                <h3 class="text-white">Sign Up</h3>

                <div class="form-group">
                    <label for="username" class="text-white">Character Name</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                </div>

                <div class="form-group">
                    <label for="password" class="text-white">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                </div>

                <div class="form-group">
                    <label for="passwordcheck" class="text-white">Confirm Password</label>
                    <input type="password" id="passwordcheck" name="passwordcheck" class="form-control" placeholder="Confirm Password">
                </div>

                <div class="form-group">
                    <label for="email" class="text-white">email </label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Email Address">
                </div>
                
                <div class="form-group">
                    <label for="invitekey" class="text-white">Invite Key</label>
                    <input type="text" id="invitekey" name="invitekey" class="form-control" placeholder="Enter your invite key">
                </div>

                <input type="submit" class="btn btn-primary d-block w-100" name="register" value="Register">
            </form>

            <div class="mt-3 text-white">
                <p>Already registered? <a href="https://acerev.xyz/login" class="text-light">Log in here</a></p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
