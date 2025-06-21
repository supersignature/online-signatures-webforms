using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Modal : System.Web.UI.Page
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