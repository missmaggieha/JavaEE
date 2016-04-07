package controller;

/**
 * Created by david on 24/03/16.
 */

import model.*;

import javax.print.DocFlavor;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet("/TestHandler")
public class TestHandler extends HttpServlet {
    private static String edit = "/admin/edit-test.jsp";
    private static String list = "/admin/home.jsp";
    private static String studentView = "/student/view-test.jsp";
    private static String studentHome = "/student/home.jsp";

    private TestDao dao;
    public TestHandler() {
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

        else if(action.equalsIgnoreCase("studentView")){

            request.setAttribute("id", request.getParameter("ID"));
            redirect = studentView;

            RequestDispatcher rd = request.getRequestDispatcher(redirect);
            rd.forward(request, response);
        }

        else if(action.equalsIgnoreCase("submit")){
            int correctAnsCounter = 0;
            int userId = 102;

            QuestionDao questionDao = new QuestionDao();
            List<Question> questionList = questionDao.getQuestionsByTestId(Integer.parseInt(request.getParameter("id")));
            Iterator<Question> itr = questionList.iterator();
            Question question = null;

            while(itr.hasNext()) {
                question = itr.next();
                AnswerDao answerDao = new AnswerDao();
                List<Answer> answerList = answerDao.getAnswerByQuestionId(question.getId());
                Iterator<Answer> itr2 = answerList.iterator();
                Answer answer = null;

                if (answerList.size() > 0) {
                    int possibleAnswers = 0;
                    int currentAnswer = 0;

                    while(itr2.hasNext()) {
                        answer = itr2.next();

                        try {
                            if(question.getType() == 1) {

                                if(answer.getIs_correct()) {
                                    possibleAnswers++;

                                    int chosenAnswerId = Integer.parseInt(request.getParameter(String.valueOf(question.getId() + currentAnswer)));

                                    if(chosenAnswerId == answer.getId()) {
                                        possibleAnswers--;
                                    }
                                }

                                else {
                                    int chosenAnswerId = Integer.parseInt(request.getParameter(String.valueOf(question.getId() + currentAnswer)));

                                    if(chosenAnswerId == answer.getId()) {
                                        possibleAnswers = answerList.size();
                                    }
                                }
                            }

                            else if (question.getType() == 4 || question.getType() == 5) {
                                String chosenAnswer = request.getParameter(String.valueOf(question.getId()));

                                if (chosenAnswer.equalsIgnoreCase(answer.getText())) {
                                    correctAnsCounter++;
                                }
                            } else {
                                int chosenAnswerId = Integer.parseInt(request.getParameter(String.valueOf(question.getId())));

                                if (answer.getIs_correct() && chosenAnswerId == answer.getId()) {
                                    correctAnsCounter++;
                                }
                            }
                        } catch (Exception e) {}

                        currentAnswer++;
                    }

                    if(question.getType() == 1 && possibleAnswers == 0) {
                        correctAnsCounter++;
                    }
                }
            }

            //saving student score in the database
            new TestDao().saveTestResult(Integer.parseInt(request.getParameter("id")),userId,correctAnsCounter);

            redirect = studentHome;
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
