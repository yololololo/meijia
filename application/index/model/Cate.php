<?php
namespace app\index\model;
use think\Model;
class Cate extends Model
{
	//无限极分类
	function sort(){
		$data=$this->order('sort desc')->select();
		return $this->_sort($data);
	}

	function _sort($data,$pid=0,$level=0){
		static $arr=array();
		foreach($data as $k=>$v){
			if($v['pid']==$pid){
				$v['level']=$level;
				$arr[]=$v;
				$this->_sort($data,$v['id'],$level+1);
			}
			
		}
		return $arr;
	}
	//获取栏目的直接后代id
	function getChild(){
		$data=db('cate')->select();
		foreach($data as $k1=>$v1){
			$data[$k1]['child']='';
			foreach($data as $k2=>$v2){
				if($v2['pid']==$v1['id']){
					$data[$k1]['child'].=$v2['id'].',';
				}
			}
		 $data[$k1]['child']=rtrim($data[$k1]['child'],',');
		}
		return $data;
	}

	//根据当前栏目id获取该栏目的子孙id
	function getChilds($id){
		$data=$this->select();
		$childs=$this->_getChilds($data,$id);
		$childs[]=(int)$id;
		return $childs;
	}

	function _getChilds($data,$id){
		static $childs=array();
		foreach($data as $k=>$v){
			if($v['pid']==$id){
				$childs[]=$v['id'];
				$this->_getChilds($data,$v['id']);
			}
		}
		
		return $childs;
	}


	//根据当前栏目id获取该栏目的祖先id
	function getParents($id){
		$cates=$this->find($id);
		$pid=$cates['pid'];
		static $pids=array();
		if($pid!=0){
			$pids[]=$pid;
			$this->getParents($pid);
		}
		return $pids;
	}
	
}