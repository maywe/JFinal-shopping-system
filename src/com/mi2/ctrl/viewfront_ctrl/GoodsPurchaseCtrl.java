package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.model.GoodsColor;
import com.mi2.model.GoodsSmallType;
import com.mi2.model.OtherGoodsView;

import java.math.BigDecimal;
import java.util.List;

/**
 * 商品购买业务控制器
 *
 */
@RouteBind(path="/goodsPurchaseCtrl")
public class GoodsPurchaseCtrl extends BaseViewFrontController {

	public void initGoodsPurchase(){
		this.setAttr("command","initGoodsPurchase");
		//手机类别
		GoodsSmallType gst = new GoodsSmallType();
		gst.put("isUse",true);
		gst.setGoodsBigTypeId(BigDecimal.valueOf(1));
		this.setAttr("phoneTypeList",GoodsSmallType.dao.getAllData(gst));
		//手机配件类别
		gst.setGoodsBigTypeId(BigDecimal.valueOf(2));
		gst.put("isUse",false);
		this.setAttr("phoneAccessoryTypeList",GoodsSmallType.dao.getAllData(gst));
		//小米生活类别
		gst.setGoodsBigTypeId(BigDecimal.valueOf(3));
		this.setAttr("miLifeTypeList",GoodsSmallType.dao.getAllData(gst));

		//商品列表
		OtherGoodsView otherGoodsView = new OtherGoodsView();

		//全局搜索 filterOverallKeys
		otherGoodsView.put("filterOverallKeys",this.getPara("filterOverallKeys"));

		otherGoodsView.put("filterGoodsBigTypeId",this.getParaToBigDecimal("filterGoodsBigTypeId"));
		otherGoodsView.put("filterGoodsSmallTypeId",this.getParaToBigDecimal("filterGoodsSmallTypeId"));
		otherGoodsView.put("filterGoodsSmallTypeIds",this.getPara("filterGoodsSmallTypeIds"));
		otherGoodsView.put("filterAdaptPhoneSmallTypeId",this.getParaToBigDecimal("filterAdaptPhoneSmallTypeId"));
		otherGoodsView.put("filterGoodsDiscountPrice",this.getParaToBoolean("filterGoodsDiscountPrice",false));
		otherGoodsView.put("filterGoodsExistSource",this.getParaToBoolean("filterGoodsExistSource",false));
		otherGoodsView.put("orderBy",this.getPara("orderBy",""));
		this.setAttr("otherGoodsView",otherGoodsView);

		Page<OtherGoodsView> pageUtil = OtherGoodsView.dao.getAllDataByPageExistGoodsColor(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),otherGoodsView);
		this.setAttr(PAGE_UTIL,pageUtil);
		this.renderJsp(VIEW_FRONT_PATH+"/goodsPurchase.jsp");
	}

	public void showGoodsDetailPurchase(){
		this.setAttr("command","showGoodsDetailPurchase");
		//获取商品信息
		BigDecimal goods_id = this.getParaToBigDecimal("goods_id");
		if(null==goods_id){
			this.renderJsp(VIEW_FRONT_PATH+"/goodsPurchase.jsp");
			return;
		}
		OtherGoodsView ogv = new OtherGoodsView();
		ogv.setGoodsId(goods_id);
		ogv.setAdaptPhoneTypeId(this.getParaToBigDecimal("adapt_phone_type_id"));
		List<OtherGoodsView> otherGoodsViewList = OtherGoodsView.dao.getAllData(ogv);
		if(otherGoodsViewList.size()>0){
			ogv = otherGoodsViewList.get(0);
			ogv.put("goods_color_id",this.getParaToBigDecimal("goods_color_id"));
			//获取商品颜色信息
			GoodsColor gc = new GoodsColor();
			gc.setGoodsId(goods_id);
			ogv.put("goodsColorList",GoodsColor.dao.getAllData(gc));
			this.setAttr("otherGoodsView",ogv);
		}
		this.renderJsp(VIEW_FRONT_PATH+"/goodsPurchase.jsp");
	}
}
