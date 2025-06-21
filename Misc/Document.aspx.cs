using PdfSharp.Drawing;
using PdfSharp.Pdf;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Document : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSave.Attributes["onclick"] = "javascript:return ValidateSignature('" + ctlSignature.uID + "');";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Bitmap bmpSign = ctlSignature.SaveSignature("");
            Session["sign"] = bmpSign;

            Bitmap newbmp = (Bitmap)bmpSign.Clone();
            Session["bitmap"] = newbmp;

            Session["signpoints"] = ctlSignature.TotalSignPoints;

            imgSign.Visible = true;
            imgSign.Src = "/session-image.ashx?rnd=" + System.Guid.NewGuid().ToString();

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "enBtn", "alert('You can generate a PDF now!'); $(document).ready(function() {$('#" + btnPDF.ClientID + "').removeAttr('disabled').focus();}); ", true);
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            PdfDocument s_document = new PdfDocument();
            s_document.Info.Title = "PDF Sample";
            s_document.Info.Author = "SuperSignature";
            s_document.Info.Subject = "https://supersignature.com";
            s_document.Info.Keywords = "Web and Online Signatures in Asp.net,Java, CF and Php";

            s_document.AddPage();

            XGraphics gfx = XGraphics.FromPdfPage(s_document.Pages[0]);

            Bitmap imTmp = (Bitmap)Session["bitmap"];
            XImage image = XImage.FromGdiPlusImage(imTmp);

            // remove if you don't need background color
            gfx.DrawRectangle(new XSolidBrush(Color.LightGoldenrodYellow), new Rectangle(0, 0, Convert.ToInt32(s_document.Pages[0].Width.Value), Convert.ToInt32(s_document.Pages[0].Height.Value)));

            gfx.DrawString("SuperSignature PDF! Signature has total " + Convert.ToString(Session["signpoints"]) + " points!", new XFont("Verdana", 12), new SolidBrush(System.Drawing.Color.Black), new PointF(50, 50));
            gfx.DrawImage(image, 50, 100);

            image.Dispose();
            Session["bitmap"] = null;

            MemoryStream ms = new MemoryStream();

            string fName = Server.MapPath("~/") + System.Guid.NewGuid().ToString() + ".pdf";
            s_document.Save(fName);

            Response.ContentType = System.Net.Mime.MediaTypeNames.Application.Pdf;
            Response.WriteFile(fName, true);

            gfx.Dispose();
            s_document.Dispose();

            File.Delete(fName);
            ms.Dispose();

            Response.End();

        }
    }
}