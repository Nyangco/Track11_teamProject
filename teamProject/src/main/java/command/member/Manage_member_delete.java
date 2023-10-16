package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class Manage_member_delete implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		String id = mdto.getT_id();
		int k = dao.Manage_member_delete(id);
		String msg = "탈퇴처리에 성공했습니다";
		String url = "manage_member_list";
		if(k!=1) {
			msg = "탈퇴처리에 실패했습니다. 다시 시도해주세요";
			url = "manage_member_view";
			model.addAttribute("t_id",id);
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
