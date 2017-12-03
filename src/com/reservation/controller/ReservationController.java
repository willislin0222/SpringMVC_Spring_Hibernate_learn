package com.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;

import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Map;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	/*
	 * This method will serve as addEmp.jsp handler.
	 */
	@RequestMapping(method = RequestMethod.GET, value = "addReservation")
	public String addReservation(ModelMap model) {
		ReservationVO reservationVO = new ReservationVO();
		model.addAttribute("reservationVO", reservationVO);
		return "reservation/addReservation";
	}

	
	/*
	 * This method will be called on addEmp.jsp form submission, handling POST
	 * request It also validates the user input
	 */
	@RequestMapping(method = RequestMethod.POST, value = "insert")
	public String insert(@Valid ReservationVO reservationVO, BindingResult result, ModelMap model) {

		/***************************1.接收請求參數 - 輸入格式的錯誤處理******************/
		if (result.hasErrors()) {
			return "reservation/addReservation";
		}
		/***************************2.開始新增資料***************************************/
		ReservationService reservationSvc = new ReservationService();
		reservationSvc.addReservation(reservationVO);

		/***************************3.新增完成,準備轉交(Send the Success view)***********/
		model.addAttribute("success", "- (新增成功)");
		return "reservation/listAllReservation"; // 新增成功後轉交listAllReservation.jsp
	}

	
	/*
	 * This method will be called on listAllEmp.jsp form submission, handling POST
	 * request It also validates the user input
	 */
	@RequestMapping(method = RequestMethod.POST, value = "getOne_For_Update")
	public String getOne_For_Update(@RequestParam("res_no") String res_no, ModelMap model) {
		/***************************1.接收請求參數 - 輸入格式的錯誤處理******************/
		/***************************2.開始查詢資料***************************************/
		ReservationService reservationSvc = new ReservationService();
		ReservationVO reservationVO = reservationSvc.getOneReservation(new String(res_no));
		
		/***************************3.查詢完成,準備轉交(Send the Success view)***********/
		model.addAttribute("reservationVO", reservationVO);
		return "reservation/update_reservation_input"; // 查詢完成後轉交update_reservation_input.jsp
	}
	
	
	/*
	 * This method will be called on update_reservation_input.jsp form submission, handling POST
	 * request It also validates the user input
	 */
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public String update(@Valid ReservationVO reservationVO, BindingResult result, ModelMap model, @RequestParam("requestURL") String requestURL) {
		System.out.println("requestURL="+requestURL); // 送出修改的來源網頁路徑: 可能為【/reservation/listAllReservation.jsp】 或  【/member/listReservations_ByDeptno.jsp】 或 【 /member/listAllMember.jsp】

		/***************************1.接收請求參數 - 輸入格式的錯誤處理******************/
		if (result.hasErrors()) {
			return "reservation/update_reservation_input";
		}
		/***************************2.開始修改資料***************************************/
		ReservationService reservationSvc = new ReservationService();
		reservationSvc.updateReservation(reservationVO);
		System.out.println("資料庫 update 成功");

		/***************************3.修改完成,準備轉交(Send the Success view)***********/
		if(requestURL.equals("/reservation/listAllReservation.jsp"))
			requestURL = "reservation/listAllReservation";
		else if(requestURL.equals("/member/listReservations_ByMemno.jsp")){
			MemberService memberSvc = new MemberService();
			model.addAttribute("listReservations_ByMemno",memberSvc.getReservarionsByMemno(reservationVO.getMemberVO().getMem_no())); // 資料庫取出的list物件,存入request
			requestURL = "member/listReservations_ByMemno";
		}else if(requestURL.equals("/member/listAllMember.jsp")){
			MemberService memberSvc = new MemberService();
			model.addAttribute("listReservations_ByMemno",memberSvc.getReservarionsByMemno(reservationVO.getMemberVO().getMem_no())); // 資料庫取出的list物件,存入request
			requestURL = "member/listAllMember";
		}
		model.addAttribute("success", "- (修改成功)");
		System.out.println("requestURL="+requestURL);
		return requestURL; // 修改成功後,轉交回送出修改的來源網頁
	}
	
	
	/*
	 * This method will be called on listAllReservation.jsp form submission, handling POST
	 * request It also validates the user input
	 */
	@RequestMapping(method = RequestMethod.POST, value = "delete")
	public String delete(@RequestParam("res_no") String res_no, ModelMap model, @RequestParam("requestURL") String requestURL) {
		System.out.println("requestURL="+requestURL); // 送出刪除的來源網頁路徑: 可能為【/reservation/listAllReservation.jsp】 或  【/member/listReservations_ByMemno.jsp】 或 【 /member/listAllMember.jsp】
		
		/***************************1.接收請求參數 - 輸入格式的錯誤處理*******************/
		/***************************2.開始刪除資料***************************************/
		ReservationService reservationSvc = new ReservationService();
		ReservationVO reservationVO = reservationSvc.getOneReservation(res_no);
		reservationSvc.deletet(new String(res_no));
		System.out.println("資料庫 delete 成功");
		
		/***************************3.刪除完成,準備轉交(Send the Success view)***********/
		if(requestURL.equals("/reservation/listAllReservation.jsp"))
			requestURL = "reservation/listAllReservation";
		else if(requestURL.equals("/member/listReservations_ByMemno.jsp")){
			MemberService memberSvc = new MemberService();
			model.addAttribute("listReservations_ByMemno",memberSvc.getReservarionsByMemno(reservationVO.getMemberVO().getMem_no())); // 資料庫取出的list物件,存入request
		}else if(requestURL.equals("/member/listAllMember.jsp")){
			MemberService memberSvc = new MemberService();
			model.addAttribute("listReservations_ByMemno",memberSvc.getReservarionsByMemno(reservationVO.getMemberVO().getMem_no())); // 資料庫取出的list物件,存入request
			requestURL = "member/listAllMember";
		}
		System.out.println("requestURL="+requestURL);
		return requestURL; // 刪除成功後,轉交回送出刪除的來源網頁
	}
	
	
	
	
	/*
	 * 【 第二種作法 】 Method used to populate the Map Data in view.
	 *  如 : <form:select path="deptVO.deptno" id="deptVO.deptno" items="${mapData}" />
	 */
	@ModelAttribute("mapData") //
	protected Map<Integer, String> referenceMapData() {
		Map<Integer, String> mapData = new LinkedHashMap<Integer, String>();
		mapData.put(10, "財務部");
		mapData.put(20, "研發部");
		mapData.put(30, "業務部");
		mapData.put(40, "生管部");
		return mapData;
	}

	
	/*
	 * 第三種作法 Method used to populate the List Data in view.
	 *  如 : <form:select path="deptVO.deptno" id="deptVO.deptno" items="${listData}" itemValue="deptno" itemLabel="dname" />
	 */
	@ModelAttribute("listData")
	protected List<MemberVO> referenceListData() {
		MemberService memberSvc = new MemberService();
		List<MemberVO> listData = memberSvc.getAll();
		return listData;
	}

}