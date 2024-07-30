package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.TODO;
import com.helper.FactoryProvider;


@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int todoId=Integer.parseInt(request.getParameter("todo_Id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			TODO todo=s.get(TODO.class, todoId);
			todo.setTitle(title);
			todo.setContent(content);
			todo.setAddedDate(new Date());
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
