<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ESUI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <%-- <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>
    <script src="Content/JqueryEasyUI/jquery1.9.min.js"></script>
      <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=a3wNd0COKjujWVCggydwQUIR"></script>
   <link href="Content/umditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="Content/umditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="Content/umditor/umeditor.min.js"></script>
    <script type="text/javascript" src="Content/umditor/lang/zh-cn/zh-cn.js"></script>

       <script src="Content/JqueryEasyUI/jquery1.9.min.js"></script>
    <script src="Content/js/CommonFunction.js"></script>

    <link href="Content/JqueryEasyUI/themes/icon.css" rel="stylesheet" />
    <link href="~/Content/JqueryEasyUI/themes/default/easyui.css" rel="stylesheet" />
    <script src="Content/JqueryEasyUI/jquery.easyui133.min.js"></script>
    <script src="Content/JqueryEasyUI/locale/easyui-lang-zh_CN.js"></script>

    <link href="~/Content/jQueryload/fakeloader.css" rel="stylesheet" />
    <script src="Content/jQueryload/fakeloader.js"></script>

    <link href="~/Content/Style.css" rel="stylesheet" />
    <script src="Content/Style.js"></script>

      <script/ type="text/javascript">
          var BaseUrl = "/PatServer/AppUser.ashx";
          var json = '?json={"jsonEntity":{"":""},"action":"appreg"}';
          function go() {


              var postData = $("#form1").serializeArray();
              //发送异步请求到后台保存数据
              $.post(BaseUrl + json, postData, function (result) {
                  var data = eval('(' + result + ')');
                  alert(data.Msg);
              });
          }
          function UPimg() {
              var json = '?json={"jsonEntity":{"":""},"action":"HttpUploadImg"}';
              //----上传头像
              $("#form1").form('submit', {
                  url: "/httpSever/File_ImageHandler.ashx" + json,
                  onSubmit: function () {

                  },
                  success: function (data) {
                      var d = eval('(' + data + ')');
                      alerts(d.Data, 5);
                  }
              })

          }

          jQuery(document).ready(function () {
               UM.getEditor('Details').setContent("", false); 
               var map = new BMap.Map("Mapcontainer");          // 创建地图实例  
               var opts = { type: BMAP_NAVIGATION_CONTROL_LARGE }
               map.addControl(new BMap.NavigationControl(opts));
               var point = new BMap.Point(108.321465, 22.832497);  // 创建点坐标 默认
               map.centerAndZoom(point, 12);                 // 初始化地图，设置中心点坐标和地图级别 
               var marker = new BMap.Marker(point);
               map.addOverlay(marker);                     // 将标注添加到地图中
               marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画  
          }
              );
         </script>
</head>

<body>
    <form runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="aebtn" runat="server" Text="加密 " OnClick="aebtn_Click" /><asp:Button ID="debtn" runat="server" Text="解密" OnClick="debtn_Click" /><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
         <!--style给定宽度可以影响编辑器的最终宽度-->

        <table>

            <tr><td><script type="text/plain" id="Details" name="Details" style="width: 900px; height: 200px;">
  
                        </script>

                 <div id="Mapcontainer" style="height: 460px; width: 100%"></div>

                </td></tr>

        </table>
                        
        </form>
</body>
</html>
