<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Teachers</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<header><jsp:include page="left-list.jsp" /></header>
	<div id="page" >
	
	<div style="text-align:center;">
<h1 style=" background-color: #EFCDCD; height: 2px; text-align:center; align-items: center;  line-height: 0;">
<mark style="background: #fff ; padding:0 15px;">Teacher</mark>
</h1>
<img src="" style="padding:0; margin:0;" height="2px" />
</div>
<div id="wrapper">
		<div class="add-class">
            <h4>Add New Teacher</h4>
		<form action="AddTeacherServlet" method="post">
		     <label> Frist Name :</label> 
		     <div style="margin-bottom: 20px;">
				<span><input type="text"
					name="Frist_Name" placeholder="Ali" /></span>
			</div>
			<label> Last Name :</label> 
		     <div style="margin-bottom: 20px;">
				<span><input type="text"
					name="Last_Name" placeholder="Ahmed" /></span>
			</div>
				<label>Age :</label> 
				<div style="margin-bottom: 20px;"><span>
				<div style="margin-bottom: 20px;"><input type="text"
					name="age"  placeholder="20 year" /></span>
			</div>	
		<div style="margin-bottom: 20px;">
			<button type="submit" name = "action" value="save">Save</button>

		</div>
		
		</form>
		</div>
</div>
		<div id="container" >

			<div id="content">

				<table>

					<tr>

						<th>First Name</th>
						<th>Last Name</th>
						<th>age</th>

					</tr>

					<c:forEach var="tempStudent" items="${TEACHERS_LIST }">
						<tr>

							<td>${tempStudent.fname}</td>
							<td>${tempStudent.lname}</td>
							<td>${tempStudent.age}</td>



						</tr>


					</c:forEach>

				</table>
			</div>
		</div>
	</div>

</body>
</html>