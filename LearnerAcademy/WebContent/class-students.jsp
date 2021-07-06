<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students of a Class</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body >
<header><jsp:include page="left-list.jsp" /></header>

<div id="page" >
<div style="text-align:center;">
<h1 style=" background-color: #EFCDCD; height: 2px; text-align:center; align-items: center;  line-height: 0;">
<mark style="background: #fff ; padding:0 15px;">Students of ${SUBJECT} class section ${SECTION}</mark>
</h1>
<img src="" style="padding:0; margin:0;" height="2px" />
</div>

		<div id="container">

			<div id="content">

				<table>

					<tr>
					   <th>Section  ID</th>
					   <th>Teacher Name</th>
						<th>Student Name</th>
						<th>age</th>

					</tr>

					<c:forEach var="tempStudent" items="${STUDENTS_LIST}">
						<tr>
						<td>${SECTION}</td>
						<td>${TEACHER}</td>
						<td>${tempStudent.fname} ${tempStudent.lname}</td>
						<td>${tempStudent.age}</td>

						</tr>


					</c:forEach>

				</table>
			</div>
		</div>
	</div>

</body>
</html>