package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cuscouponupdateok.do")
public class CusCouponUpdateOk extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cusseq = req.getParameter("cusseq");
		String couponseq = req.getParameter("couponseq");
		String cuscouponseq = req.getParameter("cuscouponseq");
		
		CustomerDAO dao = new CustomerDAO();
		CusCouponDTO2 dto = new CusCouponDTO2();
		
		dto.setCouponseq(couponseq);
		dto.setCusseq(cusseq);
		dto.setSeq(cuscouponseq);
		
		int result = dao.couponupdate(dto);
		
		PrintWriter writer = resp.getWriter();
		
		if(result == 1) {

			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("opener.location.reload();");
			writer.print("window.close();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		} else {
			//글쓰기 실패 
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed');history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
		
	}
}
