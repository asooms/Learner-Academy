package com.learner_academy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learner_academy.admin.AdminControllerServlet;
import com.learner_academy.models.Class;
import com.learner_academy.models.Student;
import com.learner_academy.models.Teacher;

/**
 * Servlet implementation class AddTeacherServlet
 */
@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String fristName = request.getParameter("Frist_Name");
		String lastName = request.getParameter("Last_Name");
		
		
		String act="";
		      
		if (fristName.isEmpty()) {
			out.println("<div align = 'center' style = \"margin:10px; color:red ;\">frist Name is Empty..!! </div>");
			fristName = null;
		}
		
		if (lastName.isEmpty()) {
			out.println("<div align = 'center' style = \"margin:10px; color:red ;\">lastName is Empty..!! </div>");
		}
		
		int age=0;
		try {
			age = Integer.parseInt(request.getParameter("age"));
			act="save";
		} catch (Exception e) {
			System.out.println("Class Id not read in the expected format");
		}
	
		String message = null;
		int temp=0;
		
		if (act.equals("save")) {	
				if (AdminControllerServlet.dbRetrieve.addTecher(fristName, lastName, age))
					{
					message = "Student Added successfuly..!!";
				temp=1;
					}
				else
					message = "Student Addition Failed..!!";
			
		} 
		
		// get students from db util
		List<Teacher> teachers = AdminControllerServlet.dbRetrieve.getTeachers();

		// add students to the request
		request.setAttribute("TEACHERS_LIST", teachers);

		// send it to the jSP view page
	   RequestDispatcher rd = request.getRequestDispatcher("/teachers-list.jsp");
		if (temp==1) {
			out.println("<div align = 'center' style = \"padding:10px; color:green;\">" + message + " </div>");
			rd.include(request, response);

		} else {
			out.println("<div align = 'center' style = \"margin:10px; color:red;\">" + message + "</div>");
			rd.include(request, response);
		}
		
		out.close();
	}

}
