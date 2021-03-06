package org.cc11001100.jfinal.modle.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseCompany<M extends BaseCompany<M>> extends Model<M> implements IBean {

	public M setCreateTime(java.util.Date createTime) {
		set("create_time", createTime);
		return (M)this;
	}

	public java.util.Date getCreateTime() {
		return get("create_time");
	}

	public M setUpdateTime(java.util.Date updateTime) {
		set("update_time", updateTime);
		return (M)this;
	}

	public java.util.Date getUpdateTime() {
		return get("update_time");
	}

	public M setId(java.lang.String id) {
		set("id", id);
		return (M)this;
	}

	public java.lang.String getId() {
		return get("id");
	}

	public M setUserId(java.lang.String userId) {
		set("user_id", userId);
		return (M)this;
	}

	public java.lang.String getUserId() {
		return get("user_id");
	}

	public M setName(java.lang.String name) {
		set("name", name);
		return (M)this;
	}

	public java.lang.String getName() {
		return get("name");
	}

	public M setLogo(java.lang.String logo) {
		set("logo", logo);
		return (M)this;
	}

	public java.lang.String getLogo() {
		return get("logo");
	}

	public M setPersonScaleLow(java.lang.Integer personScaleLow) {
		set("person_scale_low", personScaleLow);
		return (M)this;
	}

	public java.lang.Integer getPersonScaleLow() {
		return get("person_scale_low");
	}

	public M setPersonScaleHigh(java.lang.Integer personScaleHigh) {
		set("person_scale_high", personScaleHigh);
		return (M)this;
	}

	public java.lang.Integer getPersonScaleHigh() {
		return get("person_scale_high");
	}

	public M setDescContent(java.lang.String descContent) {
		set("desc_content", descContent);
		return (M)this;
	}

	public java.lang.String getDescContent() {
		return get("desc_content");
	}

	public M setContact(java.lang.String contact) {
		set("contact", contact);
		return (M)this;
	}

	public java.lang.String getContact() {
		return get("contact");
	}

}
