package com.base.model;

import com.jfinal.plugin.activerecord.IBean;

/**
 * MyGenerated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUsersBackstage<M extends BaseUsersBackstage<M>> extends BaseModel<M> implements IBean {

	public final static String TABLE_NAME = "USERS_BACKSTAGE";

	public final static String SQL = "SELECT * FROM USERS_BACKSTAGE WHERE 1=1 ";

	public void setUsersBackstageId(java.math.BigDecimal usersBackstageId) {
		set("USERS_BACKSTAGE_ID", usersBackstageId);
	}

	public java.math.BigDecimal getUsersBackstageId() {
		return get("USERS_BACKSTAGE_ID");
	}

	public void setRoleGroupId(java.math.BigDecimal roleGroupId) {
		set("ROLE_GROUP_ID", roleGroupId);
	}

	public java.math.BigDecimal getRoleGroupId() {
		return get("ROLE_GROUP_ID");
	}

	public void setSysUserName(java.lang.String sysUserName) {
		set("SYS_USER_NAME", sysUserName);
	}

	public java.lang.String getSysUserName() {
		return get("SYS_USER_NAME");
	}

	public void setSysUserPassword(java.lang.String sysUserPassword) {
		set("SYS_USER_PASSWORD", sysUserPassword);
	}

	public java.lang.String getSysUserPassword() {
		return get("SYS_USER_PASSWORD");
	}

	public void setName(java.lang.String name) {
		set("NAME", name);
	}

	public java.lang.String getName() {
		return get("NAME");
	}

	public void setSex(java.lang.String sex) {
		set("SEX", sex);
	}

	public java.lang.String getSex() {
		return get("SEX");
	}

	public void setTelephone(java.lang.String telephone) {
		set("TELEPHONE", telephone);
	}

	public java.lang.String getTelephone() {
		return get("TELEPHONE");
	}

	public void setEmail(java.lang.String email) {
		set("EMAIL", email);
	}

	public java.lang.String getEmail() {
		return get("EMAIL");
	}

	public void setBirthday(java.util.Date birthday) {
		set("BIRTHDAY", birthday);
	}

	public java.util.Date getBirthday() {
		return get("BIRTHDAY");
	}

	public void setNickname(java.lang.String nickname) {
		set("NICKNAME", nickname);
	}

	public java.lang.String getNickname() {
		return get("NICKNAME");
	}

	public void setStatus(java.lang.String status) {
		set("STATUS", status);
	}

	public java.lang.String getStatus() {
		return get("STATUS");
	}

	public void setImg(java.lang.String img) {
		set("IMG", img);
	}

	public java.lang.String getImg() {
		return get("IMG");
	}

}
