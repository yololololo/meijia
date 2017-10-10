<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Conf;
class Common extends Controller{
	function _initialize(){
		if(!session('id')||!session('name')){
			$this->error('您尚未登录系统！',url('login/login'));
		}
		$_confs=db('conf')->select();
		$confs=array();
		foreach($_confs as $v){
			$confs[$v['enname']]=$v['value'];
		}
		$this->assign('confs',$confs);

		
	}

}