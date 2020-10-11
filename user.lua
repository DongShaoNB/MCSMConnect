require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "users"
import "android.content.*"

activity.setTheme(R.AndLua1)
activity.ActionBar.hide();
activity.setContentView(loadlayout(users))

mbhttp=io.open("/sdcard/DMBOX/mbhttp.txt"):read("*a")
mbkey=io.open("/sdcard/DMBOX/mbkey.txt"):read("*a")


createuser.onClick=function()

  Http.post(mbhttp.."api/create_user/?apikey="..mbkey,"username="..username.Text.."&password="..userpass.Text.."&serverlist="..userserver.Text,function(a,b)

    if b=='{"status":500,"error":"用户名或密码格式不正确"}' then
      print("用户名或密码格式不正确;错误码:500")

    end

    if b=='{"status":200}' then
      print("用户创建成功")
    end

    if b=='{"status":403,"error":"权限不足 | Forbidden"}' then
      print("用户权限不足，普通用户不可对用户和服务器进行修改")
    end

  end)

end

deluser.onClick=function()
  Http.get(mbhttp.."api/delete_user/"..dusername.Text.."?apikey="..mbkey,function(a,b)

    if b=='{"status":200}' then
      print("用户删除成功")
    end

    if b=='{"status":403,"error":"权限不足 | Forbidden"}' then
      print("用户权限不足，普通用户不可对用户和服务器进行修改")
    end

  end)
end