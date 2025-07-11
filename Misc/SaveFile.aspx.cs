﻿using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class SaveFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Bitmap bmp = ctlSignature.SaveSignature("");

            if (null != bmp)
            {
                string filePath = Server.MapPath("~/") + Guid.NewGuid() + "-sign.jpg";
                bmp.Save(filePath, ImageFormat.Jpeg);


                Response.ContentType = "image/jpg";

                Response.WriteFile(filePath);

                Response.End();
            }
        }
    }
}