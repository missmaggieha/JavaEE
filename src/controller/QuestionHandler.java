package controller;

import model.Test;
import model.TestDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/QuestionHandler")
public class QuestionHandler extends HttpServlet {
    private static String add = "/admin/add-test.jsp";
    private static String edit = "/admin/edit-test.jsp";
    private static String list = "/admin/home.jsp";

    private TestDao dao;
    public QuestionHandler() {
        super();
        dao = new TestDao();
    }

    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{

        String redirect = "";

        String action = request.getParameter("action");

        if(action.equalsIgnoreCase("add")){

            Test test = new Test();

            test.setName(request.getParameter("name"));
            test.setDescription(request.getParameter("description"));

            dao.addTest(test);
            redirect = list;
            request.setAttribute("tests",dao.getAllTests());

            response.sendRedirect(redirect);
        }

        else if(action.equalsIgnoreCase("delete")){
            String testId = request.getParameter("ID");
            
            int uid = Integer.parseInt(testId);
            dao.removeTest(uid);
            redirect = list;
            request.setAttribute("tests",dao.getAllTests());

            response.sendRedirect(redirect);
        }

        else if(action.equalsIgnoreCase("editForm")){
            request.setAttribute("id", request.getParameter("ID"));
            redirect = edit;

            RequestDispatcher rd = request.getRequestDispatcher(redirect);
            rd.forward(request, response);
        }

        else if(action.equalsIgnoreCase("edit")){

            Test test = new Test();

            test.setId(Integer.parseInt(request.getParameter("id")));
            test.setName(request.getParameter("name"));
            test.setDescription(request.getParameter("description"));
            System.out.println(test.getName() + " " + test.getDescription());

            dao.editTest(test);
            request.setAttribute("test", test);
            redirect = list;

            response.sendRedirect(redirect);
        }

        else {
            redirect = list;

            response.sendRedirect(redirect);
        }
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        doGet(request,response);
    }
}
