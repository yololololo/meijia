<?php
namespace app\admin\controller;
use app\admin\model\Admin as Madmin;
class Admin extends Common
{

    public function lst()
    {
        $auth=new Auth();
        $Madmin=new Madmin();
        $adminres=$Madmin->getadmin();
        foreach($adminres as $v){
             $_groupTitle=$auth->getGroups($v['id']);
             $groupTitle=$_groupTitle[0]['title'];
             $v['groupTitle']=$groupTitle;
        }
        $this->assign('adminres',$adminres);
        return view();
        
    }

    public function add()
    {
        // var_dump($_POST);die();
        if(request()->isPost()){
            $data=input('post.');
            $admin=new Madmin();
            $res=$admin->addadmin($data);
            // $res=Db::name('admin')->insert($data);
            if($res){
                $this->success('添加管理员成功！',url('lst'));
            }else{
                $this->error("添加管理员失败！");
            }
        }
        $authGroupRes=db('auth_group')->select();
        $this->assign('authGroupRes',$authGroupRes);
    	return view();
    }

    public function edit($id)
    {
        $admins=db('admin')->find($id);
         if(!$admins){
            $this->error("该管理员不存在");
        }
        $this->assign('admins',$admins);
        if(request()->isPost()){
            $data=input('post.');
            $admin=new Madmin();
            $res=$admin->saveadmin($data,$admins);
        if($res!=false){
            $this->success("管理员修改成功！",url('lst'));
        }else{
            $this->error("管理员修改失败！");
        }
        }
        $authGroupAccess=db('auth_group_access')->where(array('uid'=>$id))->find();
        $authGroupRes=db('auth_group')->select();
        $this->assign('authGroupRes',$authGroupRes);
        $this->assign('groupId',$authGroupAccess['group_id']);
    	return view();
    }

    public function del($id)
    {
        $admin=new Madmin();
        if($admin->deladmin($id)){
            $this->success('管理员删除成功！');
        }else{
            $this->error('管理员删除失败！');
        }
    }

    public function logout()
    {
        session(null);
        $this->success("退出成功！",url('login/login'));
    }
}
