<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
  </head>
  <body>
    <h1>Welcome User, you are on your dashboard!!!</h1>

    <form action="recieve.jsp" method="post">
      Book name	:<input type="text" name="name"/><br/><br/>
      Author :<input type="text" name="author"/><br/><br/>
      Title :<input type="text" name="title"/><br/><br/>
      Price	:<input type="number" name="price"/><br/><br/>
      Language	:<input type="text" name="language"/><br/><br/>
      <input type="submit" value="Submit"/>
    </form>
  </body>
</html>
