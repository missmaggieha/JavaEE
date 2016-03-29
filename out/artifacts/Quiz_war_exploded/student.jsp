<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>
<br>
    <h1>${user.name}'s Home Page</h1>

    <p>
        <label>Email:</label>
        <span>${user.email}</span><br>
        <label>Password:</label>
        <span>${user.password}</span><br>
        <label>Role:</label>
        <span>${user.role}</span><br>
    </p>
    </br>
    <form action="SOS" method="get">
        <input type="submit" value="Sign Out">
    </form>

</body>
</html>