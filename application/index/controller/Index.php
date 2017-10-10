<?php
namespace app\index\controller;
use app\index\model\Article;
use app\index\model\Cate;
class Index extends Common
{
    public function index()
    {
    	$Mart=new Article;
        $Mcate=new Cate;
        $siteMap=$Mcate->sort();
        $recArt=$Mart->getRec();
    	$newArt=$Mart->getNew();
    	$hotArt=$Mart->getHot();
        $link=db('link')->select();
    	$this->assign([
    		'newArt'=>$newArt,
    		'hotArt'=>$hotArt,
            'siteMap'=>$siteMap,
            'recArt'=>$recArt,
            'link'=>$link
    		]);
        return view();
    }
}
