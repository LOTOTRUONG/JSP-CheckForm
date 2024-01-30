package loto.vn.exercise0502;

import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import netscape.javascript.JSException;

import java.io.IOException;
import java.util.ArrayList;

public class ArrayTag extends SimpleTagSupport {
    private ArrayList<String> list = new ArrayList<>();
    public ArrayList<String> getList(){
        return list;
    }
    public void setList(ArrayList<String> list){
        this.list = list;
    }

    @Override
    public void doTag() throws JSException, IOException{
        JspWriter out = getJspContext().getOut();
        for (String element : getList()){
            out.println("<li>" + element + "</li>");
        }
    }
}
