<?php
namespace app\index\model;
use think\Model;
use app\index\model\Cate;
class Article extends Model
{
	//获取首页上的最新文章
	function getNew(){
		$newArt=$this->order('time desc')->limit(5)->select();
		return $newArt;
	}


	//查询某栏目及其子栏目下的文章
	function getArt($cateid){
		$Mcate=new Cate;
		$childs=$Mcate->getChilds($cateid);
		$artRes=$this->where('cateid','in',$childs)->paginate(4,false,['query'=>['cateid'=>$cateid]]);

		return $artRes;
	}

	//查询热点文章
	//若未指定栏目id，则根据全部栏目查询热点文章，否则查询指定栏目下的热点文章
	function getHot($cateid=0){
		if($cateid==0){
			$hotArt=$this->order('click desc')->limit(5)->select();
		}else{
			$Mcate=new Cate;
			$childs=$Mcate->getChilds($cateid);
			$hotArt=$this->where('cateid','in',$childs)->order('click desc')->limit(5)->select();
		}
		return $hotArt;
	}

	//获取搜索关键词文章
	function getSearch($keyword){
		$search=$this->where('content','like','%'.$keyword.'%')->paginate(5,false,['query'=>['keyword'=>$keyword]]);
		return $search;
	}

	//获取搜索关键词热点文章
	function getSearHot($keyword){
		$searHot=$this->where('content','like','%'.$keyword.'%')->limit(5)->select();
		return $searHot;
	}

	//获取四篇推荐文章
	function getRec(){
		$recArt=$this->where('rec',1)->limit(4)->select();
		return $recArt;
	}


	
	
}