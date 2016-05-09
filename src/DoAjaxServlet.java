import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by OyDn on 2016/5/9.
 */
public class DoAjaxServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        PrintWriter out = response.getWriter();
        int num = (int) (Math.random()*10000);
        out.print(num);
        out.close();
    }
}
