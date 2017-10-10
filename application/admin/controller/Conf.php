<?php
namespace app\admin\controller;
use app\admin\model\Conf as ConfModel;
class Conf extends Common
{
	function lst()
	{
		$conf=new ConfModel;
		if(request()->isPost()){
			$data=input('post.');
			foreach ($data as $k => $v) {
				$conf->update(['id'=>$k,'sort'=>$v]);
			}
			$this->success("排序成功");
		}
		$confres=$conf->order('sort desc')->paginate(5);
		$this->assign('confres',$confres);
		return view();
	}

	function add()
	{
		if(request()->isPost()){
			$data=input('post.');
			$conf=new ConfModel;
			if($conf->save($data)){
                $this->success('添加配置成功！',url('lst'));
            }else{
                $this->error('添加配置失败！');
            }
		}
		return view();
	}

	function edit()
	{
		if(request()->isPost()){
			$data=input('post.');
			if($data['values']){
				$data['values']=str_replace('，',',',$data['values']);		
			}
			$validate=validate('Conf');
			if(!$validate->check($data)){
				$this->error($validate->getError());
			}
			$conf=new ConfModel;
			$save=$conf->save($data,['id'=>input('id')]);
				 if($save!==false){
                $this->success('修改配置成功！',url('lst'));
            }else{
                $this->error('修改配置失败！');
            }

		}
		$confs=ConfModel::get(input('id'));
		$this->assign('confs',$confs);
		return view();
	}

	function del()
	{
		if(ConfModel::destroy(input('id'))){
                $this->success('删除配置成功！',url('lst'));
            }else{
                $this->error('删除配置失败！');
            }
	}

	function conf()
	{
		if(request()->isPost()){
			$data=input('post.');
			if($data){
				foreach($data as $k=>$v){
					ConfModel::where('enname',$k)->update(['value'=>$v]);
				}
				$this->success("修改配置成功！");
			}
			return;
		}
		$conf=new ConfModel;
		$confres=$conf->select();
		$this->assign('confres',$confres);
		return view();

	}
}