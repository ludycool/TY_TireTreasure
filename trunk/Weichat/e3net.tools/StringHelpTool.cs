using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TZHSWEET.Common;

namespace e3net.tools
{
    public class StringHelpTool
    {


        /// <summary>
        /// 生成经度纬度的排序句子
        /// </summary>
        /// <param name="request"></param>
        /// <param name="Count"></param>
        /// <returns></returns>
        public static string OrderBylanglatString(string longitude, string latitude)
        {

            string commandText = " SQRT((" + longitude + "-Longitude)*(" + longitude + "-Longitude)+(" + latitude + "-Latitude)*(" + latitude + "-Latitude)) asc ";

            return commandText;
        }
        ///计算两点GPS坐标的距离 （千米）
        /// </summary>
        /// <param name="latitude1">第一点的纬度坐标</param>
        /// <param name="longitude1">第一点的经度坐标</param>
        /// <param name="latitude2">第二点的纬度坐标</param>
        /// <param name="longitude2">第二点的经度坐标</param>
        /// <returns></returns>
        public static double Distance(double latitude1, double longitude1, double latitude2, double longitude2)
        {
            double jl_jd = 102834.74258026089786013677476285;
            double jl_wd = 111712.69150641055729984301412873;
            double b = Math.Abs((longitude1 - longitude2) * jl_jd);
            double a = Math.Abs((latitude1 - latitude2) * jl_wd);
            return Math.Round( Math.Sqrt((a * a + b * b))/1000,2);
        }
    }
}
