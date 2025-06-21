<%@ WebHandler Language="C#" Class="Online.Signatures.Webforms.session_image" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.SessionState;
using System.IO;

namespace Online.Signatures.Webforms
{
    public class session_image : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            if (null != context.Session["sign"])
            {
                Bitmap bm2 = context.Session["sign"] as Bitmap;

                MemoryStream ms = new MemoryStream();

                context.Response.ContentType = "image/png";

                bm2.Save(ms, System.Drawing.Imaging.ImageFormat.Png);

                ms.WriteTo(context.Response.OutputStream);

                bm2.Dispose();

                context.Response.End();

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