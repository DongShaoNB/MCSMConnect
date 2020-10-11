require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "dservers"
import "android.content.*"

activity.setTheme(R.AndLua1)
activity.ActionBar.hide();
activity.setContentView(loadlayout(dservers))

mbhttp=io.open("/sdcard/DMBOX/mbhttp.txt"):read("*a")
mbkey=io.open("/sdcard/DMBOX/mbkey.txt"):read("*a")



dels.onClick=function()

  Http.get(mbhttp.."api/delete_server/"..sername.Text.."?apikey="..mbkey,function(a,b)

    if b=='{"status":200}' then
      print("服务器删除成功")
    end

    if b=='{"status":403,"error":"权限不足 | Forbidden"}' then
      print("用户权限不足，普通用户不可对用户和服务器进行修改")
    end

    if b==[[{"status":500,"error":"删除服务器出现错误，删除失败并且服务器可能已经损坏:Error: ENOENT: no such file or directory, unlink './server/B.json'"}]] then
      print("服务器出现错误，有可能是本服务器不存在或者损坏;错误码:500")
    end
  end)

end