using System;
using System.Web.UI;

namespace Online.Signatures.Webforms.JavaScript
{
    public partial class jQuery : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Session["sign"] = ctlSignature.SaveSignature("");
            imgSign.Visible = true;
            imgSign.Src = "/session-image.ashx?rnd=" + System.Guid.NewGuid().ToString();
        }
    }
}