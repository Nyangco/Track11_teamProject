package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class DBjoin implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		int k = dao.insertDB(mdto);
		String msg="회원 가입에 실패했습니다.";
		String url="join";
		if(k==1) {
			msg="입력하신 이메일로 인증 메일을 발송했습니다.";
			url="login";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}
}
