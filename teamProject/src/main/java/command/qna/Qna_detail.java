package command.qna;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.QnaDao;
import dto.ModelDto;

public class Qna_detail implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		QnaDao dao = new QnaDao();
		model.addAttribute("t_dto",dao.detail(mdto));

	}

}
