<?php
namespace app\index\controller;
use app\index\model\Article as Mart;
class Article extends Common
{
    public function index()
    {
    	$Mart=new Mart;
    	$id=input('artid');
    	if(input('zan')){
    		db('article')->where('id',$id)->setInc('zan');
    	}
    	$data=db('article')->field('cateid')->find($id);
    	$hotArt=$Mart->getHot($data['cateid']);
    	$art=db('article')->find($id);
    	$this->assign([
    		'art'=>$art,
    		'hotArt'=>$hotArt,
    		]);
        return view('article');
    }

    
}
