<?php
namespace app\admin\controller;
use app\admin\model\AuthRule as AuthRuleModel;
class AuthRule extends Common
{
	function lst(){
		$authRule=new AuthRuleModel();
		if(request()->isPost()){
			$data=input('post.');
			foreach($data as $k=>$v){
				$authRule->update(['id'=>$k,'sort'=>$v]);
			}
			$this->success("更新排序成功！");
		}
	
		$authRuleRes=$authRule->authRuleTree();
		$this->assign('authRuleRes',$authRuleRes);
		return view();
	}

	function add(){
		if(request()->isPost()){
			$data=input('post.');
			$plevel=db('auth_rule')->where('id',$data['pid'])->field('level')->find();
			if($plevel){
				$data['level']=$plevel['level']+1;
			}else{
				$data['level']=0;
			}
			
			$insert=db('auth_rule')->insert($data);
			if($insert){
				$this->success("添加权限成功！",url('lst'));
			}else{
				$this->error("添加权限失败！");
			}
		}
		$authRuleRes=db('auth_rule')->select();
		$this->assign('authRuleRes',$authRuleRes);
		return view();
	}

	function edit(){
		if(request()->isPost()){
			$data=input('post.');
			$plevel=db('auth_rule')->where('id',$data['pid'])->field('level')->find();
			if($plevel){
				$data['level']=$plevel['level']+1;
			}else{
				$data['level']=0;
			}
			 $save=db('auth_rule')->update($data);
            if($save!==false){
                $this->success('修改权限成功！',url('lst'));
            }else{
                $this->error('修改权限失败！');
            }
		}
		$authRules=db('auth_rule')->where('id',input('id'))->find();
		$authRule=new AuthRuleModel();
		$authRuleRes=$authRule->authRuleTree();
		$this->assign(array('authRules'=>$authRules,'authRuleRes'=>$authRuleRes));
		return view();
	}

	function del(){
		$authRule=new AuthRuleModel();
		$authRuleIds=$authRule->getchildid(input('id'));
		$authRuleIds[]=input('id');
		$del=AuthRuleModel::destroy($authRuleIds);
		if($del){
			$this->success("删除权限成功！",url('lst'));
		}else{
			$this->error("删除权限失败！");
		}
	}
}