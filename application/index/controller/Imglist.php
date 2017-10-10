<?php
namespace app\index\controller;

class Imglist extends Common
{
    public function index()
    {
    	$datas=db('meitu')->paginate(12);
    	$this->assign('datas',$datas);
        return view('imglist');
    }
}
