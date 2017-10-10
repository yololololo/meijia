<?php
namespace app\admin\model;
use think\Model;
class Article extends Model
{
	//自定义初始化
   protected static function init(){

    	//插入数据之前先检查是否有文件上传
        Article::event('before_insert', function ($art) {
           if($_FILES['thumb']['tmp_name']){
           	// 获取表单上传文件 例如上传了001.jpg
		    $file = request()->file('thumb');
		    // 移动到框架应用根目录/public/uploads/ 目录下
		    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		    if($info){
		    	$art['thumb']='public' . DS . 'uploads'.'/'.$info->getSaveName();
		    }
           }
            
        });
         //在更新之前检查是否有文件上传
      Article::event('before_update',function($art){
    	if($_FILES['thumb']['tmp_name']){
    		//判断原纪录是否有缩略图，有则删除
    		$arts=Article::find($art['id']);
    		if(is_file(ROOT_PATH.$arts['thumb'])){
    			unlink(ROOT_PATH.$arts['thumb']);
    		}
          //获取表单上传文件
          $file=request()->file('thumb');
          //移动到框架应用根目录/public/uploads/
          $info=$file->move(ROOT_PATH.'public'.DS.'uploads');
          if($info){
          	$art['thumb']='public'.DS.'uploads'.'/'.$info->getSaveName();
          }
          
           }
      });
      //在删除之前判断原纪录是否有缩略图，有则删除
      Article::event('before_delete',function($art){
        $arts=Article::find($art['id']);
        if(is_file(ROOT_PATH.$arts['thumb'])){
          unlink(ROOT_PATH.$arts['thumb']);
        }
      });

     


   }

	
}