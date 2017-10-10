<?php 
namespace app\index\controller;
use think\Controller;
use app\index\model\Cate;
class Common extends Controller
{
	function _initialize(){
		$Mcate=new Cate;
		if($artid=input('artid')){
			$art=db('article')->field('cateid')->find($artid);
			$id=$art['cateid'];
			$pids=$Mcate->getParents($id);
			$pids[]=(int)$id;
			$cateInfo=$Mcate->where('id','in',$pids)->field('id,name,type')->select();
			$this->assign('cateInfo',$cateInfo);
		}elseif($id=input('cateid')){
			$pids=$Mcate->getParents($id);
			$pids[]=(int)$id;
			$cateInfo=$Mcate->where('id','in',$pids)->field('id,name,type')->select();
			$this->assign('cateInfo',$cateInfo);
		}
		$cateRes=$Mcate->getChild();
		$_confs=db('conf')->select();
		$confs=array();
		foreach($_confs as $v){
			$confs[$v['enname']]=$v['value'];
		}
		$this->assign('confs',$confs);
		$this->assign('cateRes',$cateRes);
	}


}