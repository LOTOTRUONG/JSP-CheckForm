package loto.vn.exercise0502;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.ArrayList;

public class CheckBoxTag extends SimpleTagSupport {
    private ArrayList<String> list = new ArrayList<>();
    private String name;
    public ArrayList<String> getList() {
        return list;
    }

    public void setList(ArrayList<String> list) {
        this.list = list;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    @Override
    public void doTag() throws IOException, JspException {
        JspWriter out = getJspContext().getOut();
        out.println("<ul>");
            for (String element : getList()){
                out.println(String.format("<td><input type=checkbox name=%s value='%s'> <label>%s</label> </td>", name,element, element));
                out.println("<br>");
            }
            out.println("</ul>");
    }
}
