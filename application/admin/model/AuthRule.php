<?php
namespace app\admin\model;
use think\Model;
class AuthRule extends Model{
	public function authRuleTree(){
		$authRuleRes=$this->order('sort desc')->select();
		return $this->sort($authRuleRes);
	}

	public function sort($data,$pid=0){
		static $arr=array();
		foreach($data as $v){
			if($v['pid']==$pid){
				$v['dataid']=$this->getparentid($v['id']);
				$arr[]=$v;
				$this->sort($data,$v['id']);
			}
		}
		return $arr;

	}

	public function _getchildid($AuthRuleRes,$authRuleId)
	{
		static $arr=array();
		foreach($AuthRuleRes as $k=>$v){
			if($v['pid']==$authRuleId){
				$arr[]=$v['id'];
				$this->_getchildid($AuthRuleRes,$v['id']);
			}
					}
		return $arr;
	}

	public function getchildid($authRuleId)
	{
		$AuthRuleRes=$this->select();
		return $this->_getchildid($AuthRuleRes,$authRuleId);
	}

	public function _getparentid($AuthRuleRes,$authRuleId,$clear=false){
		static $arr=array();
		if($clear){
			$arr=array();
		}
		foreach($AuthRuleRes as $k=>$v){
			if($v['id']==$authRuleId){
				$arr[]=$v['id'];
				$this->_getparentid($AuthRuleRes,$v['pid'],false);
			}
		}
		asort($arr);
		$arrStr=implode('-',$arr);
		return $arrStr;
	}

	public function getparentid($authRuleId){
		$AuthRuleRes=$this->select();
		return $this->_getparentid($AuthRuleRes,$authRuleId,true);
	}
	
}