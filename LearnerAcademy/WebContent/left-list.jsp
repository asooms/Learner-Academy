<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="sidenav">
	<c:url var="classesLink" value="AdminControllerServlet">
		<c:param name="command" value="CLASSES" />
	</c:url>

	<c:url var="subjectsLink" value="AdminControllerServlet">
		<c:param name="command" value="SUBJECTS" />
	</c:url>

	<c:url var="teachersLink" value="AdminControllerServlet">
		<c:param name="command" value="TEACHERS" />
	</c:url>

	<c:url var="studentsLink" value="AdminControllerServlet">
		<c:param name="command" value="STUDENTS" />
	</c:url>
	<div class="menu">
 
 <ul>
    <li ><a style="font-size: 20px; font-weight: bold;" href="">Learner's Academy</a></li>
    <li ><a id="item" href="${classesLink}">Classes</a> </li>
     <li><a id="item" href="${subjectsLink}">Subjects</a></li>
    <li><a  id="item" href="${teachersLink}">Teachers</a></li>
    <li><a id="item" href="${studentsLink}">Students</a></li>
    </ul>

</div>
<div id="logout"> <a style="" href="login.jsp">Log out</a>
</div>

