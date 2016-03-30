<!DOCTYPE html>
<head>
   <title>{{title}}</title>
   <meta charset="UTF-8" />
   <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
   <link rel="stylesheet" href="/assets/styles/style.css"/>
</head>
<body>
<IMG class="seneca" src="images/seneca_logo.png" alt="Seneca Logo" style="display: block; margin-left: auto; margin-right: auto;"/>

<div class="container">

   <form class="form-signin" method="POST" action="/UserHandler" name="insert">
      <input type="hidden" name="action" value="createStudent" />
   <%--<form class="form-signin" action="SIS" method="POST">--%>
      <h2 class="form-signin-heading">Please sign in</h2>
      <label for="email" class="sr-only">Email address</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required="" autofocus="">

      <label for="name" class="sr-only">Full name</label>
      <input type="text" id="name" name="name" class="form-control" placeholder="Full name" required="" autofocus="">

      <label for="password" class="sr-only">Password</label>
      <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="">

      <button class="btn btn-lg btn-primary btn-block" type="submit">Create account</button>
   </form>

</div>

<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/js/ui-bootstrap-tpls-0.13.0.min.js"></script>

</body>
</html>