package Factorial;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/factorial")   // URL mapping
public class FactorialServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Get input
            int num = Integer.parseInt(request.getParameter("num"));

            // Factorial logic
            long fact = 1;
            for (int i = 1; i <= num; i++) {
                fact *= i;
            }

            // Output result
            out.println("<html><body>");
            out.println("<h2>Factorial of " + num + " is: " + fact + "</h2>");
            out.println("</body></html>");

        } catch (Exception e) {
            out.println("<h2>Invalid input!</h2>");
        }
    }
}