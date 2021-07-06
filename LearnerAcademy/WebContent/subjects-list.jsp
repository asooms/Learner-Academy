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
	
	<div id="page">
		
		<div style="text-align:center;">
<h1 style=" background-color: #EFCDCD; height: 2px; text-align:center; align-items: center;  line-height: 0;">
<mark style="background: #fff ; padding:0 15px;">Subject</mark>
</h1>
<img src="" style="padding:0; margin:0;" height="2px" />
</div>

		<div id="container">

			<div id="content">

				<table>

					<tr>

						<th>Name</th>
						<th>Shortcut</th>
						

					</tr>

					<c:forEach var="tempSubject" items="${SUBJECTS_LIST }">
						<tr>

							<td>${tempSubject.name}</td>
							<td>${tempSubject.shortcut}</td>
							

						</tr>


					</c:forEach>

				</table>
			</div>
		</div>
	</div>

</body>
</html>