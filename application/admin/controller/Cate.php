<?php
namespace app\admin\controller;
use app\admin\model\Cate as Mcate;
class Cate extends Common
{
	function lst(){
		$Mcate=new Mcate;
		if(request()->isPost()){
			$data=input('post.');
			foreach($data as $k=>$v){
				$Mcate->update(['id'=>$k,'sort'=>$v]);
			}
			$this->success("排序成功！",url('lst'));
		}
		$cateres=$Mcate->sort();
		$this->assign(['cateres'=>$cateres]);
		return view();
	}

	function add(){
		$Mcate=new Mcate;
		if(request()->isPost()){
			$Mcate->data(input('post.'));
			if($Mcate->save()){
				$this->success("添加栏目成功！",url('lst'));
			}else{
				$this->success("添加栏目失败！");
			}
		}
		$cateres=$Mcate->sort();
		$this->assign(['cateres'=>$cateres]);
		return view();
	}

	function edit(){
		$Mcate=new Mcate;
			if(request()->isPost()){
			$data=input('post.');
			$res=db('cate')->update($data);
			if($res!=0){
				$this->success("修改栏目成功！",url('lst'));
			}else{
				$this->success("修改栏目失败！");
			}
		}
		$cateres=$Mcate->sort();
		$cates=db('cate')->find(input('id'));
		$this->assign([
			'cateres'=>$cateres,
			'cates'=>$cates,
			]);
		return view();
	}

	function del(){
		$Mcate=new Mcate;
		$pids=$Mcate->getPids(input('id'));
		$pids[]=input('id');
		$str=implode(',',$pids);
		$res=db('cate')->delete($str);
		if($res!=0){
				$this->success("删除栏目成功！",url('lst'));
			}else{
				$this->success("删除栏目失败！");
			}
		
	}
}