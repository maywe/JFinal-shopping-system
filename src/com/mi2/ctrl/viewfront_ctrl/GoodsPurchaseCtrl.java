package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.model.GoodsColor;
import com.mi2.model.GoodsSmallType;
import com.mi2.model.OtherGoodsView;

import java.math.BigDecimal;

/**
 * 商品购买业务控制器
 *
 */
@RouteBind(path="/goodsPurchaseCtrl")
public class GoodsPurchaseCtrl extends BaseViewFrontController {

	public void initGoodsPurchase(){
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
		OtherGoodsView ogv = new OtherGoodsView();
		Page<OtherGoodsView> pageUtil = OtherGoodsView.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),ogv);
		//查询商品颜色图片
		for(int i=0,size=pageUtil.getList().size();i<size;i++){
			GoodsColor gc = new GoodsColor();
			gc.setGoodsId(pageUtil.getList().get(i).getGoodsId());
			pageUtil.getList().get(i).put("goodsColorList",GoodsColor.dao.getAllData(gc));
		}
		this.setAttr(PAGE_UTIL,pageUtil);
		this.renderJsp(VIEW_FRONT_PATH+"/goodsPurchase.jsp");
	}
}
