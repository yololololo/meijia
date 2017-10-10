<?php
namespace app\admin\model;
use think\Model;
class Admin extends Model
{
    public function addadmin($data)
    {
        if(empty($data)||!is_array($data)){
            return false;
        }
        //管理员密码md5加密
        if($data['password']){
            $data['password']=md5($data['password']);
        }
        $adminData=array();
        $adminData['name']=$data['name'];
        $adminData['password']=$data['password'];
        if($this->save($adminData)){
            $groupAccess['uid']=$this->id;
            $groupAccess['group_id']=$data['group_id'];
            db('auth_group_access')->insert($groupAccess);
            return true;
        }else{
            return false;
        }
    }

    function getadmin()
    {
        return $this::paginate(5);
    }

    function saveadmin($data,$admin)
    {
        //密码为空则保持原密码不变,不为空则进行md5加密
        if(!$data['password']){
            $data['password']=$admin['password'];
        }else{
            $data['password']=md5($data['password']);
        }
        db('auth_group_access')->where(array('uid'=>$data['id']))->update(['group_id'=>$data['group_id']]);
        return $this::update(['name'=>$data['name'],'password'=>$data['password']],['id'=>$data['id']]);
    }

    function deladmin($id)
    {
        if($this::destroy($id)){
            return true;
        }else{
            return false;
        }
    }

    function login($data)
    {
        $admins=Admin::getByName($data['name']);
        if(!$admins) return 1;//用户不存在
        if($admins['password']!=md5($data['password'])) return 2;//密码错误
        session('id',$admins['id']);
        session('name',$admins['name']);
        return 0;//正确

    }
   
}
