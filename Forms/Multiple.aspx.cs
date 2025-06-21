using System;
using System.Drawing;
using System.IO;
using System.Web.UI;


namespace Online.Signatures.Webforms
{
    public partial class Multiple : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Bitmap bm1 = ctlSignature.SaveSignature("");
            Bitmap bm2 = ctlSignature2.SaveSignature("");

            Bitmap bm = new Bitmap(bm1.Width, bm1.Height + bm2.Height);
            Graphics g = Graphics.FromImage(bm);
            g.DrawImage(bm1, 0, 0);
            g.DrawImage(bm2, 0, bm1.Height);

            MemoryStream ms = new MemoryStream();

            Response.ContentType = "image/png";

            bm.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            ms.WriteTo(Response.OutputStream);

            g.Dispose();
            bm.Dispose();
            bm1.Dispose();
            bm2.Dispose();

            Response.End();
        }
    }
}