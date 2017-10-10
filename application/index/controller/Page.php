<?php
namespace app\index\controller;

class Page extends Common
{
    public function index()
    {
    	$data=db('article')->where('cateid',input('cateid'))->find();
    	$this->assign('data',$data);
        return view('page');
    }
}
