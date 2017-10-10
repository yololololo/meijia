<?php
namespace app\index\controller;
use app\index\model\Article;
class Artlist extends Common
{
    public function index()
    {
    	$id=input('cateid');
    	$Mart=new Article;
        $hotArt=$Mart->getHot($id);
        $artRes=$Mart->getArt($id);    	
    	$this->assign([
    		'artRes'=>$artRes,
    		'hotArt'=>$hotArt,
    		]);
        return view('artlist');
    }
}
