package com.base.model;

import com.jfinal.plugin.activerecord.IBean;

/**
 * MyGenerated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseGoodsSmallType<M extends BaseGoodsSmallType<M>> extends BaseModel<M> implements IBean {

	public final static String TABLE_NAME = "GOODS_SMALL_TYPE";

	public final static String SQL = "SELECT * FROM GOODS_SMALL_TYPE WHERE 1=1 ";

	public void setGoodsSmallTypeId(java.math.BigDecimal goodsSmallTypeId) {
		set("GOODS_SMALL_TYPE_ID", goodsSmallTypeId);
	}

	public java.math.BigDecimal getGoodsSmallTypeId() {
		return get("GOODS_SMALL_TYPE_ID");
	}

	public void setGoodsBigTypeId(java.math.BigDecimal goodsBigTypeId) {
		set("GOODS_BIG_TYPE_ID", goodsBigTypeId);
	}

	public java.math.BigDecimal getGoodsBigTypeId() {
		return get("GOODS_BIG_TYPE_ID");
	}

	public void setGoodsSmallTypeName(java.lang.String goodsSmallTypeName) {
		set("GOODS_SMALL_TYPE_NAME", goodsSmallTypeName);
	}

	public java.lang.String getGoodsSmallTypeName() {
		return get("GOODS_SMALL_TYPE_NAME");
	}

	public void setGoodsSmallTypeRemark(java.lang.String goodsSmallTypeRemark) {
		set("GOODS_SMALL_TYPE_REMARK", goodsSmallTypeRemark);
	}

	public java.lang.String getGoodsSmallTypeRemark() {
		return get("GOODS_SMALL_TYPE_REMARK");
	}

	public void setGoodsSmallTypeImage(java.lang.String goodsSmallTypeImage) {
		set("GOODS_SMALL_TYPE_IMAGE", goodsSmallTypeImage);
	}

	public java.lang.String getGoodsSmallTypeImage() {
		return get("GOODS_SMALL_TYPE_IMAGE");
	}

}
