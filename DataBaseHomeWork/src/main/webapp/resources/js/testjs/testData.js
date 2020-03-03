/**
 * 赵大众
 * 建立时间：2018-8-23
 * 更新时间：2018-8-23
 */

//login页面
//账号格式:5-12位数字
var accountPattern = /^[a-zA-Z0-9]{5,12}$/;
//密码空
var reg = /\S/;
//密码格式:6-22位字母数字
var passwordPattern = /^[a-zA-Z0-9]{6,22}$/;
//验证码格式:4位字母数字
var codePattern = /^[a-zA-Z0-9]{4}$/;

//signup页面
//schoolName格式:1到30位英文字母，允许有空格
var schoolNamePattern = /^[a-zA-Z_ ]{1,30}$/;
//website格式
var websitePattern = /^[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?$/;
//middleName格式
var middleNamePattern = /(^$)|(^[a-zA-Z]{1,20}$)/;
//firstName,lastName格式
var NamePattern = /^[a-zA-Z]{1,20}$/;
//e-main格式
var emailPattern = /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
//邮箱验证码格式
var emailCodePattern = /^[0-9]{6}$/;
//图片地址格式
var imagePattern = /\.(jpg|gif|bmp)$/;
//检测图片地址格式
function testImage(image){
	if(imagePattern.test(image)){
		return true;
	}else{
		return false;
	}
}
//检测账号格式
function testAccount(account){
	if(accountPattern.test(account)){
		return true;
	}else{
		return false;
	}
}


//检查密码
function testPassword(password){
	if(reg.test(password)){
		return true;
	}else{
		return false;
	}
}
//检查是否为空
function testIsNull(isnull){
    if(reg.test(isnull)){
        return true;
    }else{
        return false;
    }
}


//检查验证码
function testCode(code){
	if(codePattern.test(code)){
		return true;
	}else{
		return false;
	}
}
//检查schoolName格式
function testSchoolName(SchoolName){
	if(schoolNamePattern.test(SchoolName)){
		return true;
	}else{
		return false;
	}
}
//检查website格式
function testWebsite(website){
	if(websitePattern.test(website)){
		return true;
	}else{
		return false;
	}
}
//检查middleName格式
function testMiddleName(middleName){
	if(middleNamePattern.test(middleName)){
		return true;
	}else{
		return false;
	}
}
//firstName,lastName
function testfirLaName(name){
	if(NamePattern.test(name)){
		return true;
	}else{
		return false;
	}
}
//邮箱
function testEmail(email){
	if(emailPattern.test(email)){
		return true;
	}else{
		return false;
	}
}
//邮箱验证码
function testEmailCode(code){
	if(emailCodePattern.test(code)){
		return true;
	}else{
		return false;
	}
}
