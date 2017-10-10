<?php
namespace app\admin\controller;
use app\admin\model\Meitu as Mmeitu;
class Meitu extends Common
{
    function lst(){
    	$datas=db('meitu')->paginate(8);
    	$this->assign('datas',$datas);
        return view();
    }
    function add(){
    	$Mmeitu=new Mmeitu;
    	if(request()->isPost()){
    		$data=input('post.');
    		$data['time']=time();
    		$Mmeitu->data($data);
    		if($Mmeitu->save()){
    			$this->success('图片添加成功！',url('lst'));
    		}else{
    			$this->success('图片添加失败！');
    		}
    	}
        return view();
    }

    function edit(){
    	$Mmeitu=new Mmeitu;
    	$data=$Mmeitu->find(input('id'));
    	if(request()->isPost()){
    		$data=input('post.');
    		$data['time']=time();
    		if($Mmeitu->update($data)){
    			$this->success('图片修改成功！',url('lst'));
    		}else{
    			$this->success('图片修改失败！');
    		}
    	}
    	$this->assign('data',$data);
        return view();
    }
    function del(){
    	$Mmeitu=new Mmeitu;
        if($Mmeitu->destroy(input('id'))){
    			$this->success('图片删除成功！',url('lst'));
    		}else{
    			$this->success('图片删除失败！');
    		}
    }

   
}
