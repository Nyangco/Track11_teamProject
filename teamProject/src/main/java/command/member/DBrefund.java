package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class DBrefund implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		int k = dao.refund(mdto);
		String msg = "반품/교환 처리가 성공적으로 완료되었습니다";
		String url = "purchase_detail";
		if(k!=1) {
			msg = "반품/교환 처리에 실패했습니다";
			url = "refund";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("t_purchase_no",mdto.getT_purchase_no());
	}

}
