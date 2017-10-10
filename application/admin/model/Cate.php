<?php
namespace app\admin\model;
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

	//根据当前栏目id得到该栏目的所有上级id
	function getPids($cateid){
		static $pids=array();
		$pid=db('cate')->field('pid')->find($cateid);
		$pid=$pid['pid'];
		if($pid!=0){
			$pids[]=$pid;
			$this->getPids($pid);
		}
		$str=implode(',',$pids);
		return $pids;
	}

	
}