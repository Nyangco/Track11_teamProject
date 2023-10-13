package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class Mypage implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		String id = (String)session.getAttribute("sId");
		MemberDao dao = new MemberDao();
		model.addAttribute("t_dto",dao.mypage(id));
	}
}
