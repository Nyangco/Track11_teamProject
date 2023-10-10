package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class DBconfirmEmail implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		String msg = "인증에 실패하였습니다. 다시 확인해주세요";
		String url = "confirmEmail";
		if(dao.confirmEmail(mdto)) {
			msg = "인증에 성공하였습니다";
			url = "mypage";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
