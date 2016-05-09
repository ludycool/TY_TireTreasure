using e3net.BLL.Base;
using e3net.Mode.Base;
using e3net.Mode.HttpView;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using TZHSWEET.Common;
using Zephyr.Utils;

namespace ESUI.httpHandle
{
    /// <summary>
    /// Sys_FilesHandler 的摘要说明
    /// </summary>
    public class Sys_FilesHandler : IHttpHandler
    {

        public Sys_FilesBiz OPBiz = new Sys_FilesBiz();
        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string action = context.Request["action"];


            HttpReSultMode jmsg = new HttpReSultMode();
            switch (action)
            {

                case "addImgList"://上传图片集 返回 Id集 

                    jmsg = addImgList(context);
                    context.Response.Write(JsonHelper.ToJson(jmsg));
                    context.Response.End();

                    break;
                case "addImg"://上传单图片 返回全路径地址

                    jmsg = addImg(context);
                    context.Response.Write(JsonHelper.ToJson(jmsg));
                    context.Response.End();
                    break;
                case "GetFileList"://根据id集获取文件列表

                    #region
                    string id = context.Request["ToId"];
                    if (!string.IsNullOrEmpty(id))
                    {
                        var mql = Sys_FilesSet.SelectAll().Where(Sys_FilesSet.ToId.Equal(id));
                        List<Sys_Files> list = OPBiz.GetOwnList(mql);
                        context.Response.Write(JsonHelper.ToJson(list, true));
                    }
                    else
                    {
                        context.Response.Write("[]");
                    }
                    context.Response.End();
                    #endregion
                    break;
                case "SaveToid"://保存更改ToID

                    #region

                    string Tid = context.Request["ToId"];
                    string IdSet = context.Request["IdSet"];
                    if (!string.IsNullOrEmpty(context.Request["ToId"]) && !string.IsNullOrEmpty(context.Request["IdSet"]))
                    {
                        string sql = " update Sys_Files set ToId='" + Tid + "'  where Id in (" + IdSet + ")";
                        int i = OPBiz.ExecuteSqlWithNonQuery(sql);
                        if (i > 0)
                        {
                            jmsg.Code = 11;
                            jmsg.Data = i.ToString();
                            jmsg.Msg = "上传成功";
                        }
                        else
                        {
                            jmsg.Code = -11;
                            jmsg.Data = "0";
                            jmsg.Msg = "上传失败";
                        }
                    }
                    else
                    {

                        jmsg.Code = -11;
                        jmsg.Data = "0";
                        jmsg.Msg = "数据为空";
                    }
                    context.Response.Write(JsonHelper.ToJson(jmsg, true));
                    context.Response.End();

                    #endregion
                    break;
                case "Delfile"://删除文件

                    #region


                    if (!string.IsNullOrEmpty(context.Request["IdSet"]))
                    {
                        string sql = " delete from  Sys_Files   where Id in (" + context.Request["IdSet"] + ")";
                        int i = OPBiz.ExecuteSqlWithNonQuery(sql);
                        if (i > 0)
                        {
                            jmsg.Code = 11;
                            jmsg.Data = i.ToString();
                            jmsg.Msg = "删除成功";
                        }
                        else
                        {
                            jmsg.Code = -11;
                            jmsg.Data = "0";
                            jmsg.Msg = "删除失败";
                        }
                    }
                    else
                    {

                        jmsg.Code = -11;
                        jmsg.Data = "0";
                        jmsg.Msg = "数据为空";
                    }
                    context.Response.Write(JsonHelper.ToJson(jmsg, true));
                    context.Response.End();

                    #endregion
                    break;

                case "Download":
                    #region
                    if (!string.IsNullOrEmpty(context.Request["Url"]))
                    {
                        // 检查请求下载文件的有效性
                        string filePath = System.Web.HttpContext.Current.Server.MapPath(context.Request["Url"]);
                        if (!System.IO.File.Exists(filePath))
                        {
                            throw new ArgumentException("无效文件，文件不存在!");
                        }

                        //WriteFile实现下载
                        string fileName = context.Request["fileName"];//客户端保存的文件名
                        FileInfo fileInfo = new FileInfo(filePath);
                        context.Response.Clear();
                        context.Response.ClearContent();
                        context.Response.ClearHeaders();
                        context.Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                        context.Response.AddHeader("Content-Length", fileInfo.Length.ToString());
                        context.Response.AddHeader("Content-Transfer-Encoding", "binary");
                        context.Response.ContentType = "application/octet-stream";
                        context.Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
                        context.Response.WriteFile(fileInfo.FullName);
                        context.Response.Flush();
                        context.Response.End();


                    }
                    #endregion

                    break;
            }
        }
        /// <summary>
        /// 上传列表，返回Id集
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public HttpReSultMode addImgList(HttpContext context)
        {
            string SourceTable = "";
            if (context.Request["SourceTable"] != null)
            {
                SourceTable = context.Request["SourceTable"];
            }
            string ToId = "";

            if (context.Request["ToId"] != null)
            {
                ToId = context.Request["ToId"];
            }
            string ShowName = "";
            if (context.Request["ShowName"] != null)
            {
                ShowName = context.Request["ShowName"];
            }


            HttpReSultMode jmsg = new HttpReSultMode();
            string FileIdSet = "";//返回Id集
            int res = 0;//成功统计
            //string[] Types = { ".jpg", ".jpeg", ".gif", ".bmp", ".png", ".ico" };
            int lenth = 500;//kb
            try
            {
                #region
                if (context.Request.Files.Count > 0)
                {
                    for (int i = 0; i < context.Request.Files.Count; i++)
                    {
                        HttpPostedFile hpFile = context.Request.Files[i];
                        Sys_Files file = AddImgOne(out jmsg, hpFile, lenth, SourceTable, ToId, ShowName);
                        if (file != null)
                        {
                            FileIdSet += file.FileId + ",";
                            res += 1;
                        }
                    }
                }
                #endregion
                jmsg.Code = res;
                jmsg.Data = FileIdSet;
                jmsg.Msg = "成功：" + context.Request.Files.Count + " 个文件，成功：" + res + "个";
            }
            catch (Exception ex)
            {
                jmsg.Code = -11;
                jmsg.Data = ex.Message;
                jmsg.Msg = "上传出错:" + ex.Message;
            }

            return jmsg;

        }

        /// <summary>
        /// 上传单图片 返回全路径地址
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public HttpReSultMode addImg(HttpContext context)
        {
            string SourceTable = "";
            if (context.Request["SourceTable"] != null)
            {
                SourceTable = context.Request["SourceTable"];
            }
            string ToId = "";

            if (context.Request["ToId"] != null)
            {
                ToId = context.Request["ToId"];
            }
            string ShowName = "";
            if (context.Request["ShowName"] != null)
            {
                ShowName = context.Request["ShowName"];
            }
            HttpReSultMode jmsg = new HttpReSultMode();
            //string[] Types = { ".jpg", ".jpeg", ".gif", ".bmp", ".png", ".ico" };
            int lenth = 500;//kb

            #region
            if (context.Request.Files.Count > 0)
            {
                HttpPostedFile hpFile = context.Request.Files[0];
                Sys_Files file = AddImgOne(out jmsg, hpFile, lenth, SourceTable, ToId, ShowName);
                if (file != null)
                {
                    jmsg.Data = file.Route + file.RelativePath;
                }
            }
            else
            {

                jmsg.Code = -11;
                jmsg.Data = "";
                jmsg.Msg = "请选择文件";
            }
            #endregion


            return jmsg;
        }

        /// <summary>
        /// 上传图片，并添加到数据库
        /// </summary>
        /// <param name="rsm">通知参数类</param>
        /// <param name="hpFile">http文件</param>
        /// <param name="lenth">最大长度，kb</param>
        /// <param name="SourceTable">来源表</param>
        /// <param name="ToId">主体Id</param>
        /// <param name="ShowName">显示名</param>
        /// <returns></returns>
        private Sys_Files AddImgOne(out  HttpReSultMode rsm, HttpPostedFile hpFile, int lenth, string SourceTable, string ToId, string ShowName)
        {

            try
            {
                string FileName = hpFile.FileName;
                string ext = System.IO.Path.GetExtension(FileName);// 后缀名
                if (!String.IsNullOrEmpty(FileName))
                {
                    FileName = FileName.Substring(FileName.LastIndexOf("\\") + 1);
                    Sys_Files file = new Sys_Files();
                    file.ToId = ToId;
                    file.AddTime = DateTime.Now;
                    file.SourceTable = SourceTable;

                    if (!string.IsNullOrEmpty(ShowName))
                    {
                        file.ShowName = ShowName + ext;
                    }
                    else
                    {
                        file.ShowName = FileName;

                    }
                    file.Suffix = ext;
                    file.FileType = "图片";
                    file.isValid = true;
                    file.isDeleted = false;

                    string HttpFileWeb = ConfigurationManager.AppSettings["HttpFileWeb"].ToString();//文件 http站点
                    string HttpFileRoute = ConfigurationManager.AppSettings["HttpFileRoute"].ToString();//文件保存本地路径根目录
                    string FileRelativeRoute = ConfigurationManager.AppSettings["FileRelativeRoute"].ToString();//文件保存相对目录
                    //给文件取随及名 
                    Guid Pguid = Guid.NewGuid();
                    FileName = DateTime.Now.ToString("yyyyMMddhhmmss") + "_" + Pguid + "_" + FileName;


                    file.Route = HttpFileWeb;
                    file.RelativePath = FileRelativeRoute + FileName;
                    file.FileName = FileName;


                    //保存文件路径 
                    string path = HttpFileRoute + FileRelativeRoute;

                    rsm = ZFiles.ImageUpload(hpFile, lenth, path, FileName);

                    if (rsm.Code > 0)
                    {
                        /*添加一条信息;*/
                        object resId = OPBiz.Add(file);
                        if (resId != null)
                        {
                            file.FileId = long.Parse(resId.ToString());
                            return file;
                        }
                        else
                        {
                            return null;
                        }
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    rsm = new HttpReSultMode()
                    {
                        Code = -11,
                        Data = "",
                        Msg = "文件名为空"

                    };
                    return null;
                }
            }
            catch (Exception ex)
            {

                rsm = new HttpReSultMode()
                {
                    Code = -13,
                    Data = ex.Message,
                    Msg = "系统出错:" + ex.Message
                };

                return null;
            }

        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}