<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <title>Sign in</title>
   <link rel="stylesheet" href="styles/main.css" type="text/css" />
</head>
<body>
<h1>
   <img class="seneca" src="images/seneca_logo.png" alt="myseneca.ca" />
</h1>
<p>Type your myseneca.ca email and password.</p>
<form action="SIS" method="post">
   <label class="pad_top">Email:</label>
   <input type="email" name="email" required placeholder="admin@myseneca.ca"><br>
   <label class="pad_top">Password:</label>
   <input type="password" name="password" required placeholder="admin"><br>
   <p>Trouble logging in? Click
      <a href="http://www.senecacollege.ca/" target="pwsWnd">here.</a>
   </p>
   <label>&nbsp;</label><input type="submit" value="Sign in" class="margin_left">
</form>
</body>
</html>