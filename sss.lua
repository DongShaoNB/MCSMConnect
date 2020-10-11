require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "ssss"
import "android.content.*"

activity.setTheme(R.AndLua1)
activity.ActionBar.hide();
activity.setContentView(loadlayout(ssss))

mbhttp=io.open("/sdcard/DMBOX/mbhttp.txt"):read("*a")
mbkey=io.open("/sdcard/DMBOX/mbkey.txt"):read("*a")

starts.onClick=function()
  Http.get(mbhttp.."api/start_server/"..startst.Text.."?apikey="..mbkey,function(a,b)

    if startst.Text=="" then

      print("请填写服务器名称")

     else

      if b=='{"status":500,"error":"服务器已经运行,无法再继续运行"}' then
        print("服务器已经运行，无法再继续运行;错误码:500")
      end

      if b=='{"status":500,"error":"您选择的服务器 [S] 似乎不存在，请重新创建或检查数据是否完整。"}' then
        print("服务器不存在;错误码:500")
      end

      if b=='{"status":200}' then
        print("服务器启动成功")
      end

      if b=='{"status":503,"error":"请求频繁，拒绝服务 | Service Unavailable"}' then
        print("服务器操作繁忙，请稍后再试;错误码:503")
      end

      if b=='{"status":403,"error":"权限不足 | Forbidden"}' then
        print("服务器权限不足，请查看mcsm网页是否能正常启动服务器")
      end
    end
  end)
end

stops.onClick=function()
  Http.get(mbhttp.."api/stop_server/"..stopst.Text.."?apikey="..mbkey,function(a,b)

    if stopst.Text=="" then

      print("请填写服务器名称")

     else

      if b=='{"status":500,"error":"服务器已经运行,无法再继续运行"}' then
        print("服务器已经运行，无法再继续运行;错误码:500")
      end

      if b=='{"status":500,"error":"null"}' then
        print("服务器不存在;错误码:500")
      end

      if b=='{"status":200}' then
        print("服务器关闭成功")
      end

      if b=='{"status":503,"error":"请求频繁，拒绝服务 | Service Unavailable"}' then
        print("服务器操作繁忙，请稍后再试;错误码:503")
      end

      if b=='{"status":403,"error":"权限不足 | Forbidden"}' then
        print("服务器权限不足，请查看mcsm网页是否能正常启动服务器")
      end
    end
  end)
end

restarts.onClick=function()
  Http.get(mbhttp.."api/restart_server/"..restartst.Text.."?apikey="..mbkey,function(a,b)

    if restartst.Text=="" then

      print("请填写服务器名称")

     else

      if b=='{"status":500,"error":"null"}' then
        print("服务器不存在;错误码:500")
      end

      if b=='{"status":200}' then
        print("服务器重启成功")
      end

      if b=='{"status":503,"error":"请求频繁，拒绝服务 | Service Unavailable"}' then
        print("服务器操作繁忙，请稍后再试;错误码:503")
      end

      if b=='{"status":403,"error":"权限不足 | Forbidden"}' then
        print("服务器权限不足，请查看mcsm网页是否能正常启动服务器")
      end
    end
  end)
end