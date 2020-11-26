package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.JoinService;
import vo.ActionForward;
import vo.Member;

public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Member member = new Member();

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		String gender = request.getParameter("gender");
		String nation = request.getParameter("nation");
		String email = request.getParameter("email");
		JoinService joinService = new JoinService();

		member.setId(id);
		member.setPasswd(passwd);
		member.setName(name);
		member.setAge(age);
		member.setAddr(addr);
		member.setGender(gender);
		member.setNation(nation);
		member.setEmail(email);
		int joinMember = joinService.insertMember(member);

		if (joinMember > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("join.do");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 실패');history.back();</script>");
		}
		return forward;
	}

}
