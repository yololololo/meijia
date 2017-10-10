<?php
namespace app\admin\model;
use think\Model;
class Meitu extends Model
{
	//自定义初始化
   protected static function init(){

    	//插入数据之前先检查是否有文件上传
        Meitu::event('before_insert', function ($meitu) {
           if($_FILES['dir']['tmp_name']){
           	// 获取表单上传文件 例如上传了001.jpg
		    $file = request()->file('dir');
		    // 移动到框架应用根目录/public/uploads/ 目录下
		    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		    if($info){
		    	$meitu['dir']='public' . DS . 'uploads'.'/'.$info->getSaveName();
		    }
           }
            
        });
         //在更新之前检查是否有文件上传
      Meitu::event('before_update',function($data){
    	if($_FILES['dir']['tmp_name']){
    		//判断原纪录是否有缩略图，有则删除
    		$datas=Meitu::find($data['id']);
    		if(is_file(ROOT_PATH.$datas['dir'])){
    			unlink(ROOT_PATH.$datas['dir']);
    		}
          //获取表单上传文件
          $file=request()->file('dir');
          //移动到框架应用根目录/public/uploads/
          $info=$file->move(ROOT_PATH.'public'.DS.'uploads');
          if($info){
          	$data['dir']='public'.DS.'uploads'.'/'.$info->getSaveName();
          }
          
           }
      });
      //在删除之前判断原纪录是否有缩略图，有则删除
      Meitu::event('before_delete',function($data){
        $data=Meitu::find($data['id']);
        if(is_file(ROOT_PATH.$data['dir'])){
          unlink(ROOT_PATH.$data['dir']);
        }
      });

     


   }

	
}