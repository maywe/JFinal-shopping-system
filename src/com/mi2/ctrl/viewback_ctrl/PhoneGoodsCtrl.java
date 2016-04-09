package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 手机商品管理
 *
 * @author ChenMW 2016-03-14 22:52
 */
@RouteBind(path="/phoneGoodsCtrl")
@Before(LoginBackInterceptor.class)
public class PhoneGoodsCtrl extends BaseViewBackController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        this.commonRequest();

        PhoneGoodsView phoneGoodsView = this.getModel(PhoneGoodsView.class);
        this.setAttr("phoneGoodsView",PhoneGoodsView.dao.findById(phoneGoodsView.getPhoneGoodsId()));

        //查询属于该一版本的颜色图片
        GoodsColor goodsColor = new GoodsColor();
        goodsColor.setPhoneGoodsId(phoneGoodsView.getPhoneGoodsId());
        this.setAttr("privatePhoneColorList",GoodsColor.dao.getAllData(goodsColor));
        this.render(VIEW_BACK_PATH+"/goodsManage/phoneGoodsDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.commonRequest();
        this.render(VIEW_BACK_PATH+"/goodsManage/phoneGoodsDialog.jsp");
    }

    @Override
    public Boolean addData() {
        //1、拿到上传的文件列表、手机型号/手机版本
        List<UploadFile> uploadFileList = getFiles(UPLOAD_IMAGES_PHONE_PATH);
        PhoneModel phoneModel = getModel(PhoneModel.class);
        PhoneVersion phoneVersion = getModel(PhoneVersion.class);

        //2、验证该类型、型号、版本的手机是否已经存在
        if(this.validatePhoneGoodsIsExist(phoneModel,phoneVersion)){
            this.renderJson(new ErrorVo(1,"您填写的手机类型，型号，版本所对应的手机信息已经存在!您不需要再添加了"));
            return false;
        }

        //3、获取手机型号，先判断该型号是否存在,如果存在就用原来的，如果不存在就需要新增
        PhoneModel phoneModelNew = phoneModel.getPhoneModel(phoneModel);

        //4、解析上传的文件，获取上传的颜色的图片信息
        List<Record> phoneColorList = getGoodsColorList(phoneVersion,uploadFileList);

        //5、手机版本保存
        phoneVersion.setModelId(phoneModelNew.getModelId());
        phoneVersion._setAttrs(phoneVersion).save();

        //6、批量保存手机颜色图片信息
        for(int i=0,size=phoneColorList.size();i<size;i++){
            phoneColorList.get(i).set("PHONE_GOODS_ID",phoneVersion.getPhoneGoodsId());
        }
        if(phoneColorList.size()>0){
            Db.batchSave(GoodsColor.TABLE_NAME,phoneColorList,phoneColorList.size());
        }
        this.renderJson(new ErrorVo(0,"新增手机商品成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.commonRequest();
        this.setAttr("command","updateRequest");
        PhoneGoodsView phoneGoodsView = this.getModel(PhoneGoodsView.class);
        this.setAttr("phoneGoodsView",PhoneGoodsView.dao.findById(phoneGoodsView.getPhoneGoodsId()));
        //查询属于该手机版本的颜色图片
        GoodsColor goodsColor = new GoodsColor();
        goodsColor.setPhoneGoodsId(phoneGoodsView.getPhoneGoodsId());
        this.setAttr("privatePhoneColorList",GoodsColor.dao.getAllData(goodsColor));
        this.render(VIEW_BACK_PATH+"/goodsManage/phoneGoodsDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        //1、获取手机型号/手机版本
        PhoneModel phoneModel = getModel(PhoneModel.class);
        PhoneVersion phoneVersion = getModel(PhoneVersion.class);

        //2、验证该类型、型号、版本的手机是否已经存在
        if(this.validatePhoneGoodsIsExist(phoneModel,phoneVersion)){
            this.renderJson(new ErrorVo(1,"您填写的手机类型，型号，版本所对应的手机信息已经存在!"));
            return false;
        }

        //3、获取手机型号，先判断该型号是否存在,如果存在就用原来的，如果不存在就需要新增
        PhoneModel phoneModelNew = phoneModel.getPhoneModel(phoneModel);

        //4、保存手机版本信息
        phoneVersion.setModelId(phoneModelNew.getModelId());
        phoneVersion._setAttrs(phoneVersion).update();

        this.renderJson(new ErrorVo(0,"修改手机商品成功!"));
        return true;
    }

    /**
     * 存在文件时更新手机商品
     */
    public Boolean updateFilesData() {
        //1、获取上传的文件列表、手机型号/手机版本
        List<UploadFile> uploadFileList = getFiles(UPLOAD_IMAGES_PHONE_PATH);
        PhoneModel phoneModel = getModel(PhoneModel.class);
        PhoneVersion phoneVersion = getModel(PhoneVersion.class);

        //2、验证该类型、型号、版本的手机是否已经存在
        if(this.validatePhoneGoodsIsExist(phoneModel,phoneVersion)){
            this.renderJson(new ErrorVo(1,"您填写的手机类型，型号，版本所对应的手机信息已经存在!"));
            return false;
        }

        //3、获取手机型号，先判断该型号是否存在,如果存在就用原来的，如果不存在就需要新增
        PhoneModel phoneModelNew = phoneModel.getPhoneModel(phoneModel);

        //4、解析上传的文件，获取上传的颜色的图片信息
        List<Record> phoneColorList = this.getGoodsColorList(phoneVersion,uploadFileList);

        //5、手机版本更新
        phoneVersion.setModelId(phoneModelNew.getModelId());
        phoneVersion._setAttrs(phoneVersion).update();

        //6、批量保存手机颜色图片信息
        for(int i=0,size=phoneColorList.size();i<size;i++){
            phoneColorList.get(i).set("PHONE_GOODS_ID",phoneVersion.getPhoneGoodsId());
        }
        if(phoneColorList.size()>0){
            new GoodsColor().batchUpdateGoodsColor(phoneColorList,true);
        }

        this.renderJson(new ErrorVo(0,"修改手机商品成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        PhoneGoodsView phoneGoodsView = this.getModel(PhoneGoodsView.class);
        boolean isDelete = new PhoneGoodsView().deletePhoneGoods(phoneGoodsView);
        this.renderJson(new ErrorVo(0,"删除手机商品成功!"));
        return isDelete;
    }

    @Override
    public void getDataByPage() {
        PhoneGoodsView phoneGoodsView = this.getModel(PhoneGoodsView.class);
        this.setAttr("phoneGoodsView",phoneGoodsView);

        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));
        //手机型号
        GoodsAddributeVal goodsAddributeVal = new GoodsAddributeVal();
        goodsAddributeVal.setGoodsAddributeId(BigDecimal.valueOf(2));
        this.setAttr("phoneModelList", GoodsAddributeVal.dao.getAllData(goodsAddributeVal));
        //手机版本
        goodsAddributeVal.setGoodsAddributeId(BigDecimal.valueOf(3));
        this.setAttr("phoneVersionList", GoodsAddributeVal.dao.getAllData(goodsAddributeVal));

        Page pageUtil = PhoneGoodsView.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),phoneGoodsView);
        this.setAttr(PAGE_UTIL,pageUtil);

        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/phoneGoodsList.jsp");
    }

    @Override
    public void getAllData() {

    }

    /**
     * 请求公共的信息
     */
    private void commonRequest(){
        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));
        //手机型号
        GoodsAddributeVal goodsAddributeVal = new GoodsAddributeVal();
        goodsAddributeVal.setGoodsAddributeId(BigDecimal.valueOf(2));
        this.setAttr("phoneModelList", GoodsAddributeVal.dao.getAllData(goodsAddributeVal));
        //手机版本
        goodsAddributeVal.setGoodsAddributeId(BigDecimal.valueOf(3));
        this.setAttr("phoneVersionList", GoodsAddributeVal.dao.getAllData(goodsAddributeVal));
        //手机颜色
        goodsAddributeVal.setGoodsAddributeId(BigDecimal.valueOf(21));
        this.setAttr("phoneColorList", GoodsAddributeVal.dao.getAllData(goodsAddributeVal));
    }

    /**
     * 批量上传时，解析上传文件获取商品图片信息列表
     */
    private List<Record> getGoodsColorList(PhoneVersion phoneVersion,List<UploadFile> uploadFileList){
        List<Record> phoneColorList = new ArrayList<>();
        for(UploadFile f: uploadFileList){
            String parameterName = f.getParameterName();
            String imageUrl = UPLOAD_PATH + UPLOAD_IMAGES_PHONE_PATH + "/" + f.getFileName();
            //手机预览图
            if("phone_preview_image".equals(parameterName)){
                //对象的引用传递
                phoneVersion.setPhonePreviewImage(imageUrl);
            }else{
                //手机颜色图片
                GoodsColor gc = new GoodsColor();
                gc.setGoodsAddributeValId(BigDecimal.valueOf(Long.valueOf(parameterName.replace("goods_color_img_url",""))));
                gc.setGoodsColorImgUrl(imageUrl);

                Record gcRecord = new Record();
                gcRecord.setColumns(gc);
                phoneColorList.add(gcRecord);
            }
        }
        return phoneColorList;
    }

    /**
     * 验证该类型、型号、版本的手机是否已经存在
     * @param phoneModel    型号
     * @param phoneVersion  版本
     * @return              返回
     */
    private boolean validatePhoneGoodsIsExist(PhoneModel phoneModel,PhoneVersion phoneVersion){
        //验证该类型、型号、版本的手机是否已经存在
        PhoneGoodsView pgv = new PhoneGoodsView();
        pgv.setGoodsSmallTypeId(phoneModel.getGoodsSmallTypeId());
        pgv.setPhoneModelId(phoneModel.getGoodsAddributeValId());
        pgv.setPhoneVersionId(phoneVersion.getGoodsAddributeValId());
        PhoneGoodsView phoneGoodsView = PhoneGoodsView.dao.findById(phoneVersion.getPhoneGoodsId());
        if(null==phoneGoodsView){
            return false;
        }
        if(phoneGoodsView.getGoodsSmallTypeId().compareTo(pgv.getGoodsSmallTypeId())==0 && phoneGoodsView.getPhoneModelId().compareTo(pgv.getPhoneModelId())==0 && phoneGoodsView.getPhoneVersionId().compareTo(pgv.getPhoneVersionId())==0){
            return false;
        }else {
            return PhoneGoodsView.dao.getAllData(pgv).size() > 0;
        }
    }

}
