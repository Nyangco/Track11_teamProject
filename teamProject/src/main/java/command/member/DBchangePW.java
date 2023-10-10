package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class DBchangePW implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		
		String msg = "비밀번호 변경에 실패했습니다";
		String url = "changePW";
		if(dao.confirmPW(mdto)) {
			dao.changePW(mdto.getT_id(), mdto.getT_pw());
			msg = "비밀번호 변경에 성공했습니다";
			url = "mypage";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
