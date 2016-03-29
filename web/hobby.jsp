<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Hobby</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h2>Hobby</h2>
<form name="hobby" action="HOBBY" method="get">

    <label class="pad_top">First Name:</label>
    <input type="text" name="firstName"><br>
    <label class="pad_top">Last Name:</label>
    <input type="text" name="lastName"><br>

    <label class="pad_top">Hobbies:</label>
    <input type="checkbox" name="hobby1" value="Swimming"/> Swimming
    <input type="checkbox" name="hobby2" value="Biking" checked="checked"/> Biking
    <input type="checkbox" name="hobby3" value="Flying"/> Flying <br>

    <label class="pad_top">Favorite Color:</label>
    <input type="radio" name="color" value="RED" checked="checked"/> Red
    <input type="radio" name="color" value="GREEN" /> Green
    <input type="radio" name="color" value="BLUE" /> Blue

    <br></br>
    <input type="submit" name="Submit" value="Click Your Hobby"/>
</form>
</body>
</html>