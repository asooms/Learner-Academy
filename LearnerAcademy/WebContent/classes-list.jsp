<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Classes</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body >
<header><jsp:include page="left-list.jsp" /></header>
	
	<div id="page" style="text-align:center;">
	
	<div style="text-align:center;">
<h1 style=" background-color: #EFCDCD; height: 2px; text-align:center; align-items: center;  line-height: 0;">
<mark style="background: #fff ; padding:0 15px;">Classes</mark>
</h1>
<img src="" style="padding:0; margin:0;" height="2px" />
</div>
		<div id="wrapper">
		<div class="add-class">
            <h4>Add New class</h4>
		<form action="AddClassesServlet" method="post">
		     <label> Class Name :</label> 
		     <div style="margin-bottom: 20px;">
				<span><input type="text"
					name="class_Name" placeholder="class Name" /></span>
			</div>
				<label>Section ID :</label> 
				<div style="margin-bottom: 20px;"><span>
				<div style="margin-bottom: 20px;"><input type="text"
					name="sectionID"  placeholder="22" /></span>
			</div>
			
				<label>Teachers Name :</label>  
				<div style="margin-bottom: 20px;">
				<select name="teachers_Class" ">
					<option value="">Select Teachers</option>
					<c:forEach items="${TEACHERS_LIST}" var="teachers">
						<option value="${teachers.id}"
							<c:if test="${teachers.id eq cid}">selected="selected"</c:if>>
							${teachers.fname}</option>
					</c:forEach>
				</select>
			</div>
				<label>Subjects Name :</label> 
				<div style="margin-bottom: 20px;">
				<select name="subjects_Class">
					<option value="">Select subjects</option>
					<c:forEach items="${SUBJECTS_LIST}" var="subjects">
						<option value="${subjects.id}"
							<c:if test="${subjects.id eq cid}">selected="selected"</c:if>>
							${subjects.name}</option>
					</c:forEach>
				</select>
			</div><label>Time :		</label> 
			<div style="margin-bottom: 20px;">
				<input type="text" name="Time" placeholder="1:00" />
			</div>
			
		<div style="margin-bottom: 20px;">
			<button type="submit" name = "action" value="save">Save</button>

		</div>
		
		</form>
		</div>
</div>
<div id="container">
				<table>
					<tr>
						<th>Section</th>
						<th>Class Name</th>
						<th>Subject</th>
						<th>Teacher</th>
						<th>Time</th>
						<th>List of Students</th>

					</tr>

					<c:forEach var="tempClass" items="${CLASSES_LIST }">
						<tr>

							<c:url var="tempLink" value="AdminControllerServlet">
								<c:param name="command" value="ST_LIST" />
								<c:param name="classId" value="${tempClass.id }" />
								<c:param name="section" value="${tempClass.section }" />
								<c:param name="className" value="${tempClass.name }" />
								<c:param name="subject" value="${tempClass.subject }" />
								<c:param name="teacher" value="${tempClass.teacher }" />
								<c:param name="time" value="${tempClass.time }" />
							</c:url>

							<td>${tempClass.section}</td>
							<td>${tempClass.name}</td>
							<td>${tempClass.subject}</td>
							<td>${tempClass.teacher}</td>
							<td>${tempClass.time}</td>
							<td><a id="listview" href="${tempLink }">List</a></td>

						</tr>


					</c:forEach>

				</table>
			
		</div>
		</div>
		
		
		</div>

</body>
</html>