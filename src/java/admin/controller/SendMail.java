
package admin.controller;


import java.io.IOException;
import java.util.Properties;
import jakarta.mail.Message;
import jakarta.mail.*;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
/**
 *
 * @author GMT
 */
@WebServlet(name = "SendMailServlet", urlPatterns = {"/sendMail"})
public class SendMail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Your email details
        
        //Bill detail:
//        String invoiceDetails = "<p>Invoice Number: 12345</p>" +
//                        "<p>Invoice Date: May 24th, 2024</p>" +
//                        "<p>Total Amount: $65.07</p>";

        String to = "vutientrinh.0357@gmail.com";
        String from = "vutientrinh.0357@gmail.com";
        String host = "smtp.gmail.com";
        String password = "vhic eqtb cvgu xebf";
        String subject = "Thank You for Your Purchase";
        //Mail body
        String htmlFilePath = getServletContext().getRealPath("/view/HTMLbody.html");
        String body = readHtmlFile(htmlFilePath);
//        String body = "<html>" +
//              "<head>...</head>" +
//              "<body>" +
//                  "<div class=\"container\">" +
//                      "<div class=\"header\">" +
//                          "<h2>Thank You for Your Purchase!</h2>" +
//                      "</div>" +
//                      "<div class=\"message\">" +
//                          "<p>We appreciate your business. Your invoice details are provided below:</p>" +
//                      "</div>" +
//                      "<div class=\"invoice-placeholder\">" +
//                          invoiceDetails +
//                      "</div>" +
//                      "<div class=\"footer\">" +
//                          "<p>If you have any questions, please contact our support team.</p>" +
//                      "</div>" +
//                  "</div>" +
//              "</body>" +
//              "</html>";

        try {
            // Send email
            sendMail(to, from, host, password, subject, body, true);

            // Forward to thanks.jsp or any other page
            response.sendRedirect(request.getContextPath() + "/view/thanks.jsp");
        } catch (MessagingException e) {
            e.printStackTrace(); // Handle the exception appropriately (log it, show an error page, etc.)
            // Optionally redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    // Method to send email
    private void sendMail(String to, String from, String host, String password, String subject, String body, boolean bodyIsHTML)
            throws MessagingException {
        // 1 - get a mail session
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtps.quitwait", "false");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // 2 - create a message
        Message message = new MimeMessage(session);
        message.setSubject(subject);
        if (bodyIsHTML) {
            message.setContent(body, "text/html");
        } else {
            message.setText(body);
        }

        // 3 - address the message
        Address toAddress = new InternetAddress(to);
        message.setRecipient(Message.RecipientType.TO, toAddress);

        // 4 - send the message
        Transport.send(message);
    }
    private String readHtmlFile(String filePath) throws IOException {
    StringBuilder content = new StringBuilder();
    try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
        String line;
        while ((line = reader.readLine()) != null) {
            content.append(line).append("\n");
        }
    }
    return content.toString();
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/thanks.jsp").forward(request, response);

    }

}
