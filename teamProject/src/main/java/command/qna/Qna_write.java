package command.qna;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import common.CommonUtil;
import dto.ModelDto;

public class Qna_write implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		model.addAttribute("time",CommonUtil.getToday());

	}

}
