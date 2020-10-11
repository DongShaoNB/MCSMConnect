require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "mbjrs"
import "AndLua"
import "android.content.Intent"
import "android.net.Uri"
activity.setTheme(R.AndLua1)
activity.ActionBar.hide();
activity.setContentView(loadlayout(mbjrs))

file,zt=io.open("/sdcard/DMBOX/mbhttp.txt")
file,ztk=io.open("/sdcard/DMBOX/mbkey.txt")

if zt ==nil then
  if ztk ==nil then
    if io.open("/sdcard/DMBOX/mbhttp.txt"):read("*a")=="" then
      activity.newActivity("mbjrset")
      print("检测到面板信息未完整，自动为您跳转到设置界面")
     else
      if
        io.open("/sdcard/DMBOX/mbkey.txt"):read("*a")=="" then
        activity.newActivity("mbjrset")
        print("检测到面板信息未完整，自动为您跳转到设置界面")
      end
    end
   else
    activity.newActivity("mbjrset")
    print("检测到面板信息未完整，自动为您跳转到设置界面")
  end
 else
  activity.newActivity("mbjrset")
  print("检测到面板信息未完整，自动为您跳转到设置界面")
end



Http.get("http://www.iyuji.cn/iyuji/s/cUQ3WW12eERLdHpUNVhTZEhrUTFJZz09/1595385995820300",function(a,b)
  版本=b:match("¥(.-)¥")
  下载连接=b:match("|(.-)|")
  更新内容=b:match("@(.-)@")

  if 版本 > "1.0.1" then

    dialog=AlertDialog.Builder(this)
    .setTitle("有新版本可以更新!")
    .setMessage(更新内容)
    .setPositiveButton("",{onClick=function(v) end})
    .setNeutralButton("关闭",{onClick=function(v) end})
    .setNegativeButton("更新",{onClick=function(v)
        viewIntent = Intent("android.intent.action.VIEW",Uri.parse(下载连接))
        activity.startActivity(viewIntent)
      end})
    .show()
    dialog.create()

  end
end)

clearinfo.onClick=function()
  os.remove("/sdcard/DMBOX/mbhttp.txt")
  os.remove("/sdcard/DMBOX/mbkey.txt")
  print("已清空，请重新打开APP")
  activity.finish()
end

sss.onClick=function()
  activity.newActivity("sss")
end

scmd.onClick=function()
  activity.newActivity("scmd")
end

users.onClick=function()
  activity.newActivity("user")
end

cs.onClick=function()
  activity.newActivity("server")
end

ds.onClick=function()
  activity.newActivity("dserver")
end