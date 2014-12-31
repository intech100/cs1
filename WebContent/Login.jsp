<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<!-- General meta information -->
<title>Login Form by Oussama Afellad</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="robots" content="index, follow" />
<meta charset="utf-8" />
<!-- // General meta information -->


<!-- Load Javascript -->
<script type="text/javascript" src="ljs/jquery.js"></script>
<script type="text/javascript" src="ljs/jquery.query-2.1.7.js"></script>
<script type="text/javascript" src="ljs/rainbows.js"></script>
<!-- // Load Javascipt -->

<!-- Load stylesheets -->
<link type="text/css" rel="stylesheet" href="lcss/style.css"
	media="screen" />
<!-- // Load stylesheets -->

<script>
	$(document).ready(function() {

		$("#submit1").hover(function() {
			$(this).animate({
				"opacity" : "0"
			}, "slow");
		}, function() {
			$(this).animate({
				"opacity" : "1"
			}, "slow");
		});
	});
</script>
<style>
body {
	background-color: black;
}
</style>
</head>

<body>

	<div id="wrapper">
		<div id="wrappertop"></div>

		<div id="wrappermiddle">

			<h2>Login</h2>

			<div id="username_input">

				<div id="username_inputleft"></div>

				<div id="username_inputmiddle">
					<form action="m1" method="post">
						<input type="text" name="uName" id="url" value="E-mail Address"
							onclick="this.value = ''"> <img id="url_user"
							src="li/mailicon.png" alt="">
				</div>

				<div id="username_inputright"></div>

			</div>

			<div id="password_input">

				<div id="password_inputleft"></div>

				<div id="password_inputmiddle">

					<input type="password" name="password" id="url" value="Password"
						onclick="this.value = ''"> <img id="url_password"
						src="li/passicon.png" alt="">

				</div>

				<div id="password_inputright"></div>

			</div>

			<div id="submit">

				<input type="image" src="li/submit_hover.png" id="submit1"
					value="Sign In"> <input type="image" src="li/submit.png"
					id="submit2" value="Sign In">
				</form>
			</div>
			<div style="background-color: black; color: red; margin-left: 40px">

				<%
					 if (request.getAttribute("Invalid") != null) {
						out.print("<b>" + request.getAttribute("Invalid") + "</b>");
					}
					
				%>
			</div>
			<div id="links_left">

				<a href="#">Forgot your Password?</a>

			</div>

			<div id="links_right">
				<a href="#">Not a Member Yet?</a>
			</div>

		</div>

		<div id="wrapperbottom"></div>

		<div id="powered">
			<p>
				Powered by <a href="http://www.premiumfreebies.eu">Premiumfreebies
					Control Panel</a>
			</p>
		</div>
	</div>

</body>
</html>