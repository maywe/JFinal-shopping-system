package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.mi2.model.GoodsColor;
import com.mi2.model.GoodsSmallType;
import com.mi2.model.PhoneGoodsView;
import com.mi2.model.PhoneModel;

import java.math.BigDecimal;
import java.util.List;

/**
 * 手机商品购买业务控制器
 *
 */
@RouteBind(path="/phonePurchaseCtrl")
public class PhonePurchaseCtrl extends BaseViewFrontController {

	public void getPhoneSetmealDetailList(){

	}

	public void getPhoneSetmealList(){

	}

	public void getPhoneColorList(){
		this.renderJson(GoodsColor.dao.getAllData(this.getModel(GoodsColor.class)));
	}

	public void getPhoneVersionList(){
		this.renderJson(PhoneGoodsView.dao.getAllData(this.getModel(PhoneGoodsView.class)));
	}

	public void initPhonePurchase(){
		GoodsSmallType phoneSmallType = getModel(GoodsSmallType.class);
		if(null==phoneSmallType||null==phoneSmallType.getGoodsSmallTypeId()){
			this.setAttr("errorMessage","你没有设置手机类型!");
		}else{
			//手机类型
			phoneSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
			phoneSmallType.put("isUse",true);
			this.setAttr("phoneSmallTypeList",GoodsSmallType.dao.getAllData(phoneSmallType));
			//手机型号
			PhoneModel phoneModel = new PhoneModel();
			phoneModel.setGoodsSmallTypeId(phoneSmallType.getGoodsSmallTypeId());
			List<PhoneModel> phoneModelList = PhoneModel.dao.getAllData(phoneModel);
			this.setAttr("phoneModelList",phoneModelList);
			//手机版本
			PhoneGoodsView pgv = new PhoneGoodsView();
			pgv.setGoodsSmallTypeId(phoneSmallType.getGoodsSmallTypeId());
			List<PhoneGoodsView> phoneVersionList = PhoneGoodsView.dao.getAllData(pgv);
			if(phoneVersionList.size()>0){
				BigDecimal phoneLowPrice = phoneVersionList.get(0).getPhoneNowPrice();
				for(PhoneGoodsView phoneGoodsView : phoneVersionList){
					if(phoneLowPrice.compareTo(phoneGoodsView.getPhoneNowPrice())>0){
						phoneLowPrice = phoneGoodsView.getPhoneNowPrice();
					}
				}
				phoneSmallType.put("phone_low_price",phoneLowPrice);
				phoneSmallType.put("phone_preview_image",phoneVersionList.get(0).getPhonePreviewImage());
			}

			this.setAttr("phoneSmallType",phoneSmallType);
		}
		this.renderJsp(VIEW_FRONT_PATH+"/phonePurchase.jsp");
	}
}
