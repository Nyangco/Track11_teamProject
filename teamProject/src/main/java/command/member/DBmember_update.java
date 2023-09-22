package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class DBmember_update implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		int k = dao.member_update(mdto);
		String msg = "개인 정보 변경에 실패하였습니다";
		String url = "member_update";
		if(k==1) {
			msg = "개인 정보 변경에 성공하였습니다";
			url = "mypage";
		}else if(k==-1) {
			msg = "비밀번호가 일치하지 않습니다";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
