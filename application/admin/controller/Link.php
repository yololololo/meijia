<?php
namespace app\admin\controller;
use app\admin\model\Link as Mlink;
class Link extends Common
{
	function lst(){
		if(request()->isPost()){
			$data=input('post.');
			foreach($data as $k=>$v){
				db('link')->where('id',$k)->update(['sort'=>$v]);
			}
			$this->success("排序成功！",url('lst'));
		}
		$linkres=db('link')->order('sort desc')->paginate(6);
		$this->assign([
			"linkres"=>$linkres,
			]);
		return view();
	}

	function add(){
		if(request()->isPost()){
			$data=input('post.');
			if(db('link')->insert($data)){
				$this->success("添加链接成功！",url('lst'));
			}else{
				$this->error("添加链接失败！");
			}
		}
		return view();
	}

	function edit(){
		if(request()->isPost()){
			$data=input('post.');
			if(db('link')->update($data)){
				$this->success("修改链接成功！",url('lst'));
			}else{
				$this->error("修改链接失败！");
			}
		}
		$links=db('link')->find(input('id'));
		$this->assign([
			'links'=>$links,
			]);
		return view();
	}

	function del(){
		if(db('link')->delete(input('id'))){
				$this->success("删除链接成功！",url('lst'));
			}else{
				$this->error("删除链接失败！");
			}
	}
}