package controller;

import model.Question;
import model.QuestionDao;
import model.Answer;
import model.AnswerDao;

import org.json.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/QuestionHandler")
public class QuestionHandler extends HttpServlet {
    private static String add = "/admin/add-question.jsp";
    private static String edit = "/admin/edit-question.jsp";
    private static String list = "/admin/home.jsp";

    private QuestionDao dao;
    private AnswerDao answerDao;
    public QuestionHandler() {
        super();
        dao = new QuestionDao();
        answerDao = new AnswerDao();
    }

    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{

        String redirect = "";

        String action = request.getParameter("action");

        if(action.equalsIgnoreCase("add")){

            Question question = new Question();
            String[] answers;

            question.setQuestion(request.getParameter("question"));
            question.setExplanation(request.getParameter("explanation"));
            String difficulty = request.getParameter("difficulty");
            question.setDifficulty(Integer.parseInt(request.getParameter("difficulty")));
            question.setType(Integer.parseInt(request.getParameter("type")));
            //JSONObject answersJSON = new JSONObject(request.getParameter("answers"));

            answers = request.getParameterValues("answers[]");


            int id = dao.addQuestion(question);

            for(int i = 0; i < answers.length; i++){
                JSONObject answerJSON = new JSONObject(answers[i]);
                Answer newAnswer = new Answer();

                question.setId(id);
                newAnswer.setQuestion(question);
                newAnswer.setIs_correct(answerJSON.getBoolean("checked"));
                newAnswer.setText(answerJSON.getString("answer"));

                answerDao.addAnswer(newAnswer);
            }

            redirect = list;
            request.setAttribute("questions",dao.getAllQuestions());
            response.sendRedirect(redirect);
        }

        else if(action.equalsIgnoreCase("delete")){
            String questionId = request.getParameter("ID");
            
            int uid = Integer.parseInt(questionId);
            dao.removeQuestion(uid);
            answerDao.removeAnswerByQuestionID(uid);

            redirect = list;
            request.setAttribute("questions",dao.getAllQuestions());

            response.sendRedirect(redirect);
        }

        else if(action.equalsIgnoreCase("editForm")){
            request.setAttribute("id", request.getParameter("ID"));
            redirect = edit;

            RequestDispatcher rd = request.getRequestDispatcher(redirect);
            rd.forward(request, response);
        }

        else if(action.equalsIgnoreCase("edit")){

            Question question = new Question();
//            List<Answer> =
            question.setId(Integer.parseInt(request.getParameter("id")));
            question.setQuestion(request.getParameter("question"));
            question.setExplanation(request.getParameter("explanation"));
            question.setDifficulty(Integer.parseInt(request.getParameter("difficulty")));
            question.setType(Integer.parseInt(request.getParameter("type")));
            System.out.println(question.getQuestion() + " " + question.getExplanation());

            dao.editQuestion(question);
            request.setAttribute("question", question);
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
