package controller;

/**
 * Created by david on 24/03/16.
 */

import model.User;
import model.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserHandler")
public class UserHandler extends HttpServlet {
    private static final String UserRecord = null;
    private static String INSERT = "/user-crud/insert.jsp";
    private static String edit = "/user-crud/edit.jsp";
    private static String delete = "/user-crud/delete.jsp";
    private static String list = "/user-crud/list.jsp";

    private UserDao dao;
    public UserHandler() {
        super();
        dao = new UserDao();
    }

    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{

        String redirect = "";

        String uId = request.getParameter("id");

        String action = request.getParameter("action");

        if(action.equalsIgnoreCase("insert")){

            User user = new User();

            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));
            user.setRole(Integer.parseInt(request.getParameter("role")));

            dao.addUser(user);
            redirect = list;
            request.setAttribute("users",dao.getAllUsers());

            response.sendRedirect(redirect);
        }

        else if(action.equalsIgnoreCase("delete")){
            String userId = request.getParameter("ID");
            
            int uid = Integer.parseInt(userId);
            dao.removeUser(uid);
            redirect = list;
            request.setAttribute("users",dao.getAllUsers());

            response.sendRedirect(redirect);
        }

        else if(action.equalsIgnoreCase("editForm")){
            request.setAttribute("id", request.getParameter("ID"));
            redirect = edit;

            RequestDispatcher rd = request.getRequestDispatcher(redirect);
            rd.forward(request, response);
        }

        else if(action.equalsIgnoreCase("edit")){

            User user = new User();

            user.setId(Integer.parseInt(request.getParameter("id")));
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setRole(Integer.parseInt(request.getParameter("role")));

            dao.editUser(user);
            request.setAttribute("user", user);
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
