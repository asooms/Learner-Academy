package com.learner_academy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.learner_academy.admin.AdminControllerServlet;
import com.learner_academy.admin.DbRetrieve;
import com.learner_academy.models.Class;
import com.learner_academy.models.Subject;
import com.learner_academy.models.Teacher;

/**
 * Servlet implementation class AddClassesServlet
 */
@WebServlet("/AddClassesServlet")
public class AddClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Override
	public void init() throws ServletException {

		super.init();

		// create instance of db util, to pass in conn pool object


	}
    public AddClassesServlet() {
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
		String className = request.getParameter("class_Name");
		String time = request.getParameter("Time");
		
		
		String act="";
		System.out.println("Attribute action = "+ act);
		
		      
		if (className.isEmpty()) {
			out.println("<div align = 'center' style = \"margin:10px; color:red ;\">Class Name is Empty..!! </div>");
			className = null;
		}
		
		if (time.isEmpty()) {
			out.println("<div align = 'center' style = \"margin:10px; color:red ;\">Time is Empty..!! </div>");
		}
		
		int teachID=0,subjID=0,sectionID=0;
		try {
			sectionID = Integer.parseInt(request.getParameter("sectionID"));
			teachID = Integer.parseInt(request.getParameter("teachers_Class"));
			subjID = Integer.parseInt(request.getParameter("subjects_Class"));
			act="save";
		} catch (Exception e) {
			System.out.println("Class Id not read in the expected format");
		}
		
		System.out.println("\nclassName:\t"+className+"\nsectionID:\t"+sectionID+"\nteachID:\t"+teachID+"\nsubjID:\t"+subjID+"\ntime:\t"+time);
		 
		
		String message = null;
		int temp=0;
		
		if (act.equals("save")) {	
				if (AdminControllerServlet.dbRetrieve.addClass(className, sectionID, teachID, subjID, time))
					{
					message = "Student Added successfuly..!!";
				temp=1;
					}
				else
					message = "Student Addition Failed..!!";
			
		} 
		
		
        // get subjects from db util
		List<Class> classes = AdminControllerServlet.dbRetrieve.getClasses();
		// add subjects to the request
		request.setAttribute("CLASSES_LIST", classes);
		// get students from db util
		List<Teacher> teachers = AdminControllerServlet.dbRetrieve.getTeachers();
		// add students to the request
		request.setAttribute("TEACHERS_LIST", teachers);
		// get subjects from db util
		List<Subject> subjects = AdminControllerServlet.dbRetrieve.getSubjects();
		// add subjects to the request
		request.setAttribute("SUBJECTS_LIST", subjects);
		
		RequestDispatcher rd = request.getRequestDispatcher("/classes-list.jsp");
	
		
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
