import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by OyDn on 2016/5/9.
 */
@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    List<String> keys = new ArrayList<>();
    public  void init() {
        keys.add("java");
        keys.add("jsp");
        keys.add("spring");
        keys.add("app");
        keys.add("html");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取客户端提交的key
        String key = request.getParameter("key");
        StringBuffer buffer = new StringBuffer();
        for(String s: keys) {
            if(s.contains(key)) {
                buffer.append(s + "-");
            }
        }
        String values = buffer.substring(0,buffer.length()-1);
        PrintWriter out = response.getWriter();
        out.print(values);
        out.close();
    }
}
