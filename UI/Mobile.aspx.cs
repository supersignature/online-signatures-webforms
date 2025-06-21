using SuperSignature;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Mobile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlMeta metaTag = new HtmlMeta();
            metaTag.Name = "viewport";
            metaTag.Content = "width=device-width, user-scalable=yes";

            Page.Header.Controls.Add(metaTag);


            if (!Page.IsPostBack && Request.Form.Keys.Count == 2)
            {
                string signData = Request["signData"];
                string signDataSmooth = Request["signDataSmooth"];

                MouseSignature ctlSignature = new MouseSignature();

                byte[] arrayOfBytes = Convert.FromBase64String(signData);
                signData = Encoding.UTF8.GetString(arrayOfBytes);

                byte[] arrayOfBytesSmooth = Convert.FromBase64String(signDataSmooth);
                signDataSmooth = Encoding.UTF8.GetString(arrayOfBytesSmooth);

                ctlSignature.SignDataSmooth = signDataSmooth;

                Bitmap bmpSign = ctlSignature.GenerateSignature(signData, "");

                // Process bmpSign as required in your application
                Session["sign"] = bmpSign;

                Response.StatusCode = 200;
                Response.End();
            }
        }
    }
}