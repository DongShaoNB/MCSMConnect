require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "servers"
import "android.content.*"

activity.setTheme(R.AndLua1)
activity.ActionBar.hide();
activity.setContentView(loadlayout(servers))

mbhttp=io.open("/sdcard/DMBOX/mbhttp.txt"):read("*a")
mbkey=io.open("/sdcard/DMBOX/mbkey.txt"):read("*a")

cser.onClick=function()
  Http.post(mbhttp.."api/create_server/?apikey="..mbkey,"serverName="..servername.Text.."&java="..java.Text.."&jarName="..jarname.Text.."&Xmx="..Xmx.Text.."&Xms="..Xms.Text.."&ie="..ie.Text.."&oe="..oe.Text.."&timeLimitDate="..timeLimitDate.Text.."&cwd="..cwd.Text.."&highCommande="..highCommande.Text.."&addCmd="..addCmd.Text,function(a,b)

    if b==[[{"status":200}]] then
      print("服务器创建成功")
    end

    if b==[[{"status":500,"error":"名字格式不正确"}]] then
      print("服务器名称格式不正确;错误码:500")
    end

    if b==[[{"status":500,"error":"同名的服务器已存在"}]] then
      print("已经有一个相同名称的服务器;错误码:500")
    end
  end)
end
