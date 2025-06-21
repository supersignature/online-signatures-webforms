using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Resize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            System.Drawing.Bitmap bm2 = ctlSignature.SaveSignature("");

            if (null != bm2)
            {
                MemoryStream ms = new MemoryStream();

                Response.ContentType = "image/png";

                bm2.Save(ms, System.Drawing.Imaging.ImageFormat.Png);

                ms.WriteTo(Response.OutputStream);

                bm2.Dispose();

                Response.End();
            }
        }
    }
}