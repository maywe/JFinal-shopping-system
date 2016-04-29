package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.base.util.DateUtils;
import com.base.util.ImageUtils;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.StrKit;
import com.mi2.interceptor.LoginFrontInterceptor;
import com.mi2.model.UsersDeliveryAddress;
import com.mi2.model.UsersFront;
import com.mi2.model.UsersOrders;
import com.mi2.model.UsersShoppingcar;

import java.io.File;

@RouteBind(path="/userCenterCtrl")
@Before(LoginFrontInterceptor.class)
public class UserCenterCtrl extends BaseViewFrontController {

	public void initUserCenter(){
		String command = this.getAttr("command");
		this.setAttr("command",command==null?this.getPara("command"):command);
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userCenter.jsp");
	}

	//我的订单
	public void getMyOrdersPage(){
		UsersOrders uo = new UsersOrders();
		uo.setUserFrontId(this.getLoginUserFront().getUserFrontId());
		uo.setOrdersStatus(this.getParaToBigDecimal("orders_status"));
		String orders_search_keys = this.getPara("orders_search_keys");
		uo.put("orders_search_keys",orders_search_keys);
		this.setAttr("usersOrders",uo);

		if(StrKit.notBlank(orders_search_keys)){
			if(orders_search_keys.startsWith("DD")){
				uo.setUserOrdersId(orders_search_keys);
			}else{
				uo.put("orders_search_keys",orders_search_keys);
			}
		}
		this.setAttr(PAGE_UTIL,UsersOrders.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),5,uo));
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userPersonOrders.jsp");
	}

	public void getGoodsAccessPage(){

	}

	//我的个人中心
	public void getMyPersonCenterPage(){
		this.setAttr("gregorianCalendarStr",DateUtils.getGregorianCalendarStr());
		this.setAttr("userCartSumGoodsNum", UsersShoppingcar.dao.getCartSumGoodsNum(this.getLoginUserFront().getUserFrontId()));
		this.setAttr("userSumNotReceivedOrderNum", UsersOrders.dao.getUserSumNotReceivedOrderNum(this.getLoginUserFront().getUserFrontId()));
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userPersonCenter.jsp");
	}

	public void getMyCollectPage(){

	}

	//收货地址
	public void getReceiptAddressPage(){
		UsersDeliveryAddress uda = new UsersDeliveryAddress();
		uda.setUserFrontId(this.getLoginUserFront().getUserFrontId());
		this.setAttr("usersDeliveryAddressList",UsersDeliveryAddress.dao.getAllData(uda));
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userReceiptAddress.jsp");
	}

	//个人信息
	public void getPersonInfoPage(){
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userPersonInfo.jsp");
	}


	//增加收货地址请求
	public void addUserAddressRequest(){
		this.setAttr("command","addUserAddressRequest_userCenter");
		this.render(VIEW_FRONT_PATH+"/userCenter/userAddressDialog.jsp");
	}

	//增加收货地址
	public Boolean addUserAddressData(){
		UsersDeliveryAddress uda = this.getModel(UsersDeliveryAddress.class);
		uda.setUserFrontId(this.getLoginUserFront().getUserFrontId());
		uda.save();
		this.setAttr("command","getReceiptAddressPage");
		this.initUserCenter();
		return true;
	}

	//更新收货地址请求
	public void updateUserAddressRequest(){
		this.setAttr("command","updateUserAddressRequest_userCenter");
		this.setAttr("usersDeliveryAddress",UsersDeliveryAddress.dao.findById(this.getModel(UsersDeliveryAddress.class).getUsersDeliveryAddressId()));
		this.render(VIEW_FRONT_PATH+"/userCenter/userAddressDialog.jsp");
	}

	//更新收货地址
	public Boolean updateUserAddressData(){
		this.getModel(UsersDeliveryAddress.class).update();
		this.setAttr("command","getReceiptAddressPage");
		this.initUserCenter();
		return true;
	}

	//删除收货地址
	public Boolean deleteUserAddressData(){
		this.getModel(UsersDeliveryAddress.class).delete();
		this.setAttr("command","getPersonInfoPage");
		this.initUserCenter();
		return true;
	}

	//更新个人信息请求
	public void updatePersonInfoRequest(){
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userPersonInfoDialog.jsp");
	}

	//更新个人信息
	public Boolean updatePersonInfoData(){
		this.getModel(UsersFront.class).update();
		this.setSessionAttr(LOGIN_FRONT_USER,UsersFront.dao.findById(this.getLoginUserFront().getUserFrontId()));
		this.setAttr("command","getPersonInfoPage");
		this.initUserCenter();
		return true;
	}

	//更新个人头像信息请求
	public void updatePersonImgRequest(){
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userPersonImgDialog.jsp");
	}

	//更新个人头像信息请求
	public Boolean updatePersonImgData(){
		String userFrontImageData = this.getPara("userFrontImageData");
		String imgPath = PathKit.getWebRootPath()+UPLOAD_PATH+UPLOAD_IMAGES_USERS_FRONT_PATH;
		String imgName = "user_front_"+ DateUtils.thisTime().getTime()+".png";
		File imgFile = ImageUtils.saveToImgByBase64Str(userFrontImageData,imgPath,imgName);
		if(null==imgFile){
			this.renderJson(new ErrorVo(1,"更新头像失败!"));
			return false;
		}
		UsersFront usersFront = this.getLoginUserFront();
		usersFront.setImg(UPLOAD_PATH+UPLOAD_IMAGES_USERS_FRONT_PATH+"/"+imgFile.getName());
		usersFront.update();
		this.renderJson(new ErrorVo(0,"更新头像成功!"));
		return true;
	}

	//更新个人用户密码请求
	public void updatePersonPasswordRequest(){
		this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userPersonPasswordDialog.jsp");
	}

	//更新个人用户密码
	public Boolean updatePersonPasswordData(){
		UsersFront uf = getModel(UsersFront.class);
		UsersFront oldUf = this.getLoginUserFront();
		if(oldUf.getPassword().equals(uf.getPassword())){
			oldUf.setPassword(this.getPara("password_new1"));
			oldUf.update();
			this.getSession().invalidate();
			this.renderJson(new ErrorVo(0,"更新密码成功!"));
		}else{
			this.renderJson(new ErrorVo(1,"更新密码失败，您的原始密码不正确!"));
		}
		return true;
	}
}
