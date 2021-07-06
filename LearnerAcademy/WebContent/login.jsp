<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css">
a{
  justify-content: center;
  text-decoration: none;
  font-weight: bold;
}
</style>
 <link type="text/css" rel="stylesheet" href="css/login.css"> 
</head>
<body>

  <center style="margin:50px 0;"> <h1>Login to <a style="color: #e2472f;" href="">Learner's Academy </a></h1> </center>   
    <form action="AdminControllerServlet" method="POST">  
        <div class="container">   
        	<input type="hidden" name="command" value="LOGIN" />
            <label>Username : </label>   
            <br/>
            <input type="text" placeholder="Enter Username" name="username" required>  
            <br/>
            <label>Password : </label>   
            <br/>
            <input type="password" placeholder="Enter Password" name="password" required>  
            <br/>
            <button type="submit">Login</button>   
            <br/>
            <input type="checkbox" checked="checked"> Remember me   
             
        </div> 
        <p style="text-align: center;">
        Designed & Developed <strong >Fares Al sharaan</strong>
      </p>  
    </form>   
      


</body>
</html>