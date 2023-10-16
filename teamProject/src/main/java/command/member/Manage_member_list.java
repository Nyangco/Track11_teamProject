package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dto.ModelDto;

public class Manage_member_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		String select = mdto.getT_select();
		String search = mdto.getT_search();
		if(select==null) {
			select="id";
			search="";
		}
		model.addAttribute("select",select);
		model.addAttribute("search",search);
		model.addAttribute("arr",dao.Manage_member_list(select,search));
	}

}
