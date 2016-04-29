package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.mi2.model.OtherGoodsView;

import java.math.BigDecimal;

@RouteBind(path="/")
public class IndexCtrl extends BaseViewFrontController {

	public void index(){
		//1、智能硬件----------------------
		OtherGoodsView otherGoodsView = new OtherGoodsView();
		otherGoodsView.put("filterGoodsSmallTypeIds", "128");
		this.setAttr("ZNYJ_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));

		//2、搭配系列----------------------
		otherGoodsView.put("filterGoodsBigTypeId", BigDecimal.valueOf(2));
		//(1)热门
		otherGoodsView.put("filterGoodsSmallTypeIds",null);
		otherGoodsView.put("adaptPhoneTypeIdIsNull",true);
		otherGoodsView.put("orderBy","salesNum");
		this.setAttr("DP_Hot_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(2)耳机
		otherGoodsView.put("filterGoodsSmallTypeIds","8,124");
		otherGoodsView.put("adaptPhoneTypeIdIsNull",false);
		otherGoodsView.put("orderBy",null);
		this.setAttr("DP_EJ_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(3)移动电源
		otherGoodsView.put("filterGoodsSmallTypeIds","61");
		this.setAttr("DP_YDDY_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(4)电池存储卡
		otherGoodsView.put("filterGoodsSmallTypeIds","102,103");
		this.setAttr("DP_DCCCK_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));

		//3、配件系列-----------------------
		otherGoodsView.put("filterGoodsBigTypeId", BigDecimal.valueOf(2));
		otherGoodsView.put("adaptPhoneTypeIdIsNull",false);
		//(1)热门
		otherGoodsView.put("filterGoodsSmallTypeIds",null);
		otherGoodsView.put("adaptPhoneTypeIdIsNotNull",true);
		otherGoodsView.put("orderBy","salesNum");
		this.setAttr("PJ_Hot_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(2)保护套/后盖
		otherGoodsView.put("filterGoodsSmallTypeIds","9,105");
		otherGoodsView.put("adaptPhoneTypeIdIsNotNull",false);
		otherGoodsView.put("orderBy",null);
		this.setAttr("PJ_BHTHG_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(3)贴膜
		otherGoodsView.put("filterGoodsSmallTypeIds","101");
		this.setAttr("PJ_TM_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(4)个性配件
		otherGoodsView.put("filterGoodsSmallTypeIds","104");
		this.setAttr("PJ_GXPJ_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));

		//4、周边系列
		otherGoodsView.put("filterGoodsBigTypeId", BigDecimal.valueOf(3));
		//(1)热门
		otherGoodsView.put("filterGoodsSmallTypeIds","10,108,109,110,111,124");
		otherGoodsView.put("orderBy","salesNum");
		this.setAttr("ZB_Hot_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(2)音响
		otherGoodsView.put("filterGoodsSmallTypeIds","124");
		otherGoodsView.put("orderBy",null);
		this.setAttr("ZB_YX_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(3)服装
		otherGoodsView.put("filterGoodsSmallTypeIds","10");
		otherGoodsView.put("orderBy",null);
		this.setAttr("ZB_FZ_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(4)米兔
		otherGoodsView.put("filterGoodsSmallTypeIds","108");
		otherGoodsView.put("orderBy",null);
		this.setAttr("ZB_MT_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(5)生活周边
		otherGoodsView.put("filterGoodsSmallTypeIds","111");
		otherGoodsView.put("orderBy",null);
		this.setAttr("ZB_SHZB_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));
		//(6)箱包
		otherGoodsView.put("filterGoodsSmallTypeIds","109");
		otherGoodsView.put("orderBy",null);
		this.setAttr("ZB_XB_PageUtil",OtherGoodsView.dao.getAllDataByPageExistGoodsColor(1,8,otherGoodsView));

		this.render(VIEW_FRONT_PATH+"/index.jsp");
	}

}
