package command.member;


import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class DBlogin implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		int k = dao.login(mdto,session);
		String msg = "로그인에 실패했습니다";
		String url = "login";
		if(k==1) {
			msg = "로그인 되었습니다";
			url = "index";
		}else if(k==-1) {
			msg = "탈퇴한 회원입니다";
		}else if(k==3) {
			msg = "이메일 인증을 완료해주세요";
			url = "index";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
