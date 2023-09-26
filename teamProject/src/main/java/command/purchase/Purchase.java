package command.purchase;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.MemberDao;
import dao.PurchaseDao;
import dto.ModelDto;
import dto.PurchaseDto;

public class Purchase implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao mdao = new MemberDao();
		String id = (String)session.getAttribute("sId");
		model.addAttribute("m_dto",mdao.purchase(id));
		PurchaseDao pdao = new PurchaseDao();
		ArrayList<PurchaseDto> p_arr = new ArrayList<PurchaseDto>();
		int count = 1;
		if(mdto.getT_bd()!=null) {
			p_arr = pdao.purchase(mdto);
			model.addAttribute("t_bd","detail");
		}else {
			p_arr = pdao.purchase(id);
			count = pdao.count(id);
			model.addAttribute("t_bd","basket");
		}
		model.addAttribute("p_arr",p_arr);
		model.addAttribute("t_count",count);
	}

}
