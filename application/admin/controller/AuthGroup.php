<?php
namespace app\admin\controller;
use app\admin\model\AuthGroup as AuthGroupModel;
class AuthGroup extends Common
{
	
	public function lst(){
		$groupres=AuthGroupModel::paginate(5);
		$this->assign('groupres',$groupres);
		return view();
	}

	public function add(){
		if(request()->isPost()){
			$data=input('post.');
			if($data['rules']){
				$data['rules']=implode(',',$data['rules']);
			}
			$add=db('auth_group')->insert($data);
			if($add){
				$this->success("添加用户组成功！",url('lst'));
			}else{
				$this->error("添加用户组失败！");
				}
			return;
		}
		$authRule=new \app\admin\model\AuthRule();
		$authRuleRes=$authRule->authRuleTree();
		$this->assign('authRuleRes',$authRuleRes);
		return view();
	}

	public function edit(){
		if(request()->isPost()){
			$data=input('post.');
			if($data['rules']){
				$data['rules']=implode(',',$data['rules']);
			}
			if(!array_key_exists('status',$data)){
				$data['status']=0;
			}
			$update=db('auth_group')->update($data);
			if($update){
				$this->success("编辑用户组成功！",url('lst'));
			}else{
				$this->error('编辑用户组失败！');
			}
			return;
		}
		$authRule=new \app\admin\model\AuthRule();
		$authRuleRes=$authRule->authRuleTree();
		$authgroups=db('auth_group')->find(input('id'));
		$this->assign(['authRuleRes'=>$authRuleRes,'authgroups'=>$authgroups]);
		return view();
	}

	public function del(){
		
		$del=db('auth_group')->delete(input('id'));
		if($del){
			$this->success("删除用户组成功！",url('lst'));
		}else{
			$this->error("删除用户组失败！");
		}
	}

}