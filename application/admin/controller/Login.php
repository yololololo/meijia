<?php
namespace app\admin\controller;
use app\admin\model\Admin as Madmin;
use think\Controller;
class Login extends Controller
{
	function login(){
		if(request()->isPost()){
			//验证失败
			if(!captcha_check(input('code'))){
			 $this->error("验证码错误！");
		}else{
			$Madmin=new Madmin;
			$num=$Madmin->login(input('post.'));
			if($num==1||$num==2){
				$this->error("用户不存在或密码错误！");
			}
			$this->success('登录成功！',url('index/index'));
		}

		}
		return view();
	}

}