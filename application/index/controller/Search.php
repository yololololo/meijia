<?php
namespace app\index\controller;
use app\index\model\Article;
class Search extends Common
{
    public function index()
    {
    	$Mart=new Article();
        $keyword=input('keyword');
        $searHot=$Mart->getSearHot($keyword);
        $search=$Mart->getSearch($keyword);
        // $serRes=db('article')->order('id desc')->where('title','like','%'.$keywords.'%')->paginate(2,false,$config = ['query'=>array('keywords'=>$keywords)]);
        $this->assign(array(
            'search'=>$search,
            'keyword'=>$keyword,
            'searHot'=>$searHot,
            ));
        return view('search');
    }
}
