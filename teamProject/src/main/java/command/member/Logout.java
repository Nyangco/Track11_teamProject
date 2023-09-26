package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dto.ModelDto;

public class Logout implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
		model.addAttribute("msg","로그아웃 되었습니다.");
		model.addAttribute("url","login");
	}

}
