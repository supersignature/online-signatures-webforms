using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Image = System.Drawing.Image;


namespace Online.Signatures.Webforms
{
    public partial class Background : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // The orignal sign of user
            Bitmap bmSign = ctlSignature.SaveSignature("");

            // The signature image, ******* make sure the path is correct for your project!!
            Image bGround = Image.FromFile(Server.MapPath(Page.ResolveUrl("~/" + ctlSignature.SignBackGroundImage)));

            Graphics g = Graphics.FromImage(bGround);

            g.DrawImage(bmSign, 0, 0);
            g.Dispose();

            MemoryStream ms = new MemoryStream();
            Response.ContentType = "image/png";
            bGround.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            ms.WriteTo(Response.OutputStream);

            bGround.Dispose();
            Response.End();
        }

    }
}