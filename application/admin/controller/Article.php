<?php
namespace app\admin\controller;
use app\admin\model\Cate;
use app\admin\model\Article as Marticle;
class Article extends Common
{
	function lst(){
		$artRes=db('article')->alias('a')->join('mj_cate c','a.cateid=c.id')->field('a.*,c.name')->order('id desc')->paginate(6);
		$this->assign([
			'artRes'=>$artRes,
			]);
		return view();
	}

	function add(){
		$Mcate=new Cate;
		$Marticle=new Marticle;
		if(request()->isPost()){
			$data=input('post.');
			$data['time']=time();
			$Marticle->data($data);
			$res=$Marticle->save();
			if($res){
				$this->success("添加文章成功！",url('lst'));
			}else{
				$this->success("添加文章失败！");
			}
		}
		$cateRes=$Mcate->sort();
		$this->assign([
			'cateRes'=>$cateRes,
			]);
		return view();
	}

	function edit(){
		$Mcate=new Cate;
		$Marticle=new Marticle;
		if(request()->isPost()){
			$data=input('post.');
			$data['time']=time();
			if($Marticle->update($data)){
				$this->success("修改文章成功！",url('lst'));
			}else{
				$this->success("修改文章失败！");
			}
		}
		$id=input('id');
		$arts=db('article')->find($id);
		$cateRes=$Mcate->sort();
		$this->assign([
			'arts'=>$arts,
			'cateRes'=>$cateRes,
			]);
		return view();
	}

	function del(){
		$Mcate=new Cate;
		$Marticle=new Marticle;
		if($Marticle->destroy(input('id'))){
			$this->success("删除文章成功！",url('lst'));
			}else{
				$this->success("删除文章失败！");
			}


	}
}


