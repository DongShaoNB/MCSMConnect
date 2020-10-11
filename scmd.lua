require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "scmds"
import "android.content.*"


activity.setTheme(R.AndLua1)
activity.ActionBar.hide();
activity.setContentView(loadlayout(scmds))

mbhttp=io.open("/sdcard/DMBOX/mbhttp.txt"):read("*a")
mbkey=io.open("/sdcard/DMBOX/mbkey.txt"):read("*a")

sendcmd.onClick=function()

  Http.post(mbhttp.."api/execute/?apikey="..mbkey,"name="..sern.Text.."&command="..sendc.Text,function(a,b)

    if sern.Text=="" then

      print("请填写服务器名称")

     else

      if b=='{"status":200}' then
        print("命令执行成功")
       else
        print("发生错误，请检查服务器名称是否正确，服务器是否打开等问题")

      end

    end
  end)

end