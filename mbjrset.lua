require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "mbjrsets"
import "AndLua"

activity.setTheme(R.AndLua1)
activity.ActionBar.hide();
activity.setContentView(loadlayout(mbjrsets))

file,zt=io.open("/sdcard/DMBOX/mbhttp.txt")
file,ztk=io.open("/sdcard/DMBOX/mbkey.txt")

if zt==nil then
  if ztk==nil then
    mbhttp.setText(io.open("/sdcard/DMBOX/mbhttp.txt"):read("*a"))
    mbkey.setText(io.open("/sdcard/DMBOX/mbkey.txt"):read("*a"))
  end
end

save.onClick=function()
  if mbhttp.Text=="" then
    print("保存失败，信息不完整")
   else
    if mbkey.Text=="" then
      print("保存失败，信息不完整")
     else
      写入文件("/sdcard/DMBOX/mbhttp.txt",mbhttp.Text)
      写入文件("/sdcard/DMBOX/mbkey.txt",mbkey.Text)
      print("保存成功")
      activity.finish()
    end
  end
end

function onKeyDown(e)
  if e == 4 then
    print("请不要使用返回键来卡存储bug，如果你需要退出请按保存按钮或者直接")
    return true

  end
end
