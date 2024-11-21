<?php
    session_start();
?>

<!DOCTYPE HTML>

<html lang="en">
    <head>
        <title>Profile: <?php echo $_SESSION['Username']; ?></title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="bootstrap\css\bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="bootstrap\js\bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/css/main.css" />
    </head>

    <body class="subpage">

        <?php
            require 'menu.php';
        ?>

        <section id="post" class="wrapper bg-img" data-bg="banner2.jpg">
            <div class="inner">
                <div class="box">
                <header>
                    <span class="image left"><img src="<?php echo 'images/profileImages/'.$_SESSION['picName'].'?'.mt_rand(); ?>" class="img-circle" class="img-responsive" height="200px"></span>
                    <br>
                    <h2><?php echo $_SESSION['Name'];?></h2>
                    <h4><?php echo $_SESSION['Username'];?></h4>
                    <br>
                    <form method="post" action="Profile/updatePic.php" enctype="multipart/form-data">
                        <input type="file" name="profilePic" id="profilePic">
                        <br>
                        <div class="12u$">
                            <input type="submit" class="button special small" name="upload" value="Upload" />
                            <input type="submit" class="button special small" name="remove" value="Remove" />
                        </div>
                    </form>
                </header>
                <form method="post" action="Profile/updateProfile.php" color="black">
                    <div class="row uniform">
                        <div class="8u 12u$(xsmall)">
                            <input type="text" name="name" id="name" value="<?php echo $_SESSION['Name'];?>" placeholder="Full Name" required />
                        </div>
                        <div class="4u 12u$(xsmall)">
                            <input type="text" name="mobile" id="mobile" placeholder="Mobile No" required/>
                        </div>
                        <div class="6u 12u$(xsmall)">
                            <input type="text" name="uname" id="uname" value="<?php echo $_SESSION['Username'];?>" placeholder="Username" required/>
                        </div>
                        <div class="6u 12u$(xsmall)">
                            <input type="email" name="email" id="email" value="<?php echo $_SESSION['Email'];?>" placeholder="Email" required/>
                        </div>
                        <div class="6u 12u$(xsmall)">
                            <div class="select-wrapper">
                              <select name="section" id="section">
                                    <option>Select</option>
                                    <option value="Band">Band</option>
                                    <option value="Drama">Drama</option>
                                    <option value="Dance">Dance</option>
                                    <option value="Decoration">Decoration</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="12u$">
                        <center>
                            <input type="submit" class = "button special" value="Update Profile" />
                        </center>
                        </div>
                    </div>
                </form>
                </div>
            </div>
        </section>

        <!-- Scripts -->
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/jquery.scrolly.min.js"></script>
            <script src="assets/js/jquery.scrollex.min.js"></script>
            <script src="assets/js/skel.min.js"></script>
            <script src="assets/js/util.js"></script>
            <script src="assets/js/main.js"></script>

            <style>
    
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e6e6e6;
            margin: 0;
            padding: 0;
        }

        * {
            color: black;
        }

        .wrapper {
            text-align: center;
            padding: 4em 0;
        }

        .box {
            background: #ffffff;
            padding: 2em;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }

        h2,
        h4 {
            margin: 0;
            color: #333;
        }

        form {
            margin-top: 1em;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="file"],
        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="text"]::placeholder,
        input[type="email"]::placeholder {
            color: #999;
        }

        input[type="submit"] {
            width: auto;
            padding: 12px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .row.uniform {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -10px;
        }

        .row.uniform>div {
            padding: 0 10px;
            box-sizing: border-box;
        }

        .select-wrapper {
            width: 100%;
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .image.left img {
            border-radius: 50%;
            max-width: 150px;
            border: 4px solid #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        section.bg-img {
            background-size: cover;
            background-position: center;
            color: #fff;
            background-color: #333;
        }
    </style>
    </body>
</html>
