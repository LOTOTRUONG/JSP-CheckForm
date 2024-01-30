package loto.vn.exercise0502;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import loto.vn.exercise0502.SkillBean;

@WebServlet(name = "controllerServlet", value = "/controllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        process(request, response);
        String language = request.getParameter("lang");
        if (language != null && !language.isEmpty()) {
            request.getSession().setAttribute("javax.servlet.jsp.jstl.fmt.locale.session", language);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        process(request, response);
    }

    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String[] selectedSkills = request.getParameterValues("checkedSkill");
        String name = request.getParameter("name");

        SkillBean skillBean = new SkillBean();
        skillBean.setObtainingList((new ArrayList<>(Arrays.asList(selectedSkills))));
        request.setAttribute("skillBean", skillBean);
        skillBean.setName(name);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    public void destroy() {
    }
}