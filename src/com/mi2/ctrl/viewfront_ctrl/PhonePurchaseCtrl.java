package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.mi2.model.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * 手机商品购买业务控制器
 *
 */
@RouteBind(path="/phonePurchaseCtrl")
public class PhonePurchaseCtrl extends BaseViewFrontController {

	public void getPhoneSetmealDetailList(){
		PhoneSetmealDetail phoneSetmealDetail = this.getModel(PhoneSetmealDetail.class);
		List<PhoneSetmealDetail> PhoneSetmealDetailList = PhoneSetmealDetail.dao.getAllData(phoneSetmealDetail);
		GoodsColor goodsColor = new GoodsColor();
		for(int i=0,size=PhoneSetmealDetailList.size();i<size;i++){
			goodsColor.setGoodsId(PhoneSetmealDetailList.get(i).getGoodsId());
			PhoneSetmealDetailList.get(i).put("goodsColorList",GoodsColor.dao.getAllData(goodsColor));
		}
		this.renderJson(PhoneSetmealDetailList);
	}

	public void getPhoneSetmealList(){
		PhoneSetmeal phoneSetmeal = getModel(PhoneSetmeal.class);
		phoneSetmeal.put("isUse",true);
		this.renderJson(PhoneSetmeal.dao.getAllData(phoneSetmeal));
	}

	public void getPhoneColorList(){
		this.renderJson(GoodsColor.dao.getAllData(this.getModel(GoodsColor.class)));
	}

	public void getPhoneVersionList(){
		this.renderJson(PhoneGoodsView.dao.getAllData(this.getModel(PhoneGoodsView.class)));
	}

	public void initPhonePurchase(){
		GoodsSmallType phoneSmallType = getModel(GoodsSmallType.class);
		phoneSmallType = GoodsSmallType.dao.findById(phoneSmallType.getGoodsSmallTypeId());
		if(null==phoneSmallType){
			phoneSmallType = new GoodsSmallType();
		}
		//手机类型
		phoneSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
		phoneSmallType.put("isUse",true);
		this.setAttr("phoneSmallTypeList",GoodsSmallType.dao.getAllData(phoneSmallType));

		if(null==phoneSmallType.getGoodsSmallTypeId()){
			List<GoodsSmallType> phoneGoodsList = GoodsSmallType.dao.getPhoneTypeCarryLowPriceAllData(null);
			this.setAttr("phoneGoodsList",phoneGoodsList);
		}else{
			//手机型号
			PhoneModel phoneModel = new PhoneModel();
			phoneModel.setGoodsSmallTypeId(phoneSmallType.getGoodsSmallTypeId());
			List<PhoneModel> phoneModelList = PhoneModel.dao.getAllData(phoneModel);
			this.setAttr("phoneModelList",phoneModelList);

			//查找该类型手机的最低价格
			List<GoodsSmallType> phoneSmallTypeList = GoodsSmallType.dao.getPhoneTypeCarryLowPriceAllData(phoneSmallType);
			if(phoneSmallTypeList.size()>0){
				phoneSmallType.put("phone_type_small_low_price",phoneSmallTypeList.get(0).get("phone_type_small_low_price"));
			}
			this.setAttr("phoneSmallType",phoneSmallType);
		}
		this.renderJsp(VIEW_FRONT_PATH+"/phonePurchase.jsp");
	}
}
