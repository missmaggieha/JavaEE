<!DOCTYPE html>
<head>
   <title>{{title}}</title>
   <meta charset="UTF-8" />
   <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
   <link rel="stylesheet" href="/assets/styles/style.css"/>
</head>
<body>


<nav class="navbar navbar-default">
   <div class="container">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="#/">Quiz App - DPS936</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse navbar-right">
         <ul class="nav navbar-nav">
            <li><a href="#/">Home</a></li>
            <li><a href="#/about">About</a></li>
         </ul>
      </div><!--/.nav-collapse -->
   </div>
</nav>
<h1>
   <img class="seneca" src="images/seneca_logo.png" alt="myseneca.ca" />
</h1>
<%--<p>Type your myseneca.ca email and password.</p>--%>
<%--<form action="SIS" method="post">--%>
   <%--<label class="pad_top">Email:</label>--%>
   <%--<input type="email" name="email" required placeholder="admin@myseneca.ca"><br>--%>
   <%--<label class="pad_top">Password:</label>--%>
   <%--<input type="password" name="password" required placeholder="admin"><br>--%>
   <%--<p>Trouble logging in? Click--%>
      <%--<a href="http://www.senecacollege.ca/" target="pwsWnd">here.</a>--%>
   <%--</p>--%>
   <%--<label>&nbsp;</label><input type="submit" value="Sign in" class="margin_left">--%>
<%--</form>--%>

<div class="container">

   <form class="form-signin" action="SIS" method="POST">
      <h2 class="form-signin-heading">Please sign in</h2>
      <label for="email" class="sr-only">Email address</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required="" autofocus="">
      <label for="password" class="sr-only">Password</label>
      <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="">
      <div class="checkbox">
         <label>
            <input type="checkbox" value="remember-me"> Remember me
         </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p>Trouble logging in? Click
         <a href="http://www.senecacollege.ca/" target="pwsWnd">here.</a>
      </p>
   </form>

</div>

<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/js/ui-bootstrap-tpls-0.13.0.min.js"></script>

</body>
</html>