using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class UpdatePanel : System.Web.UI.Page
    {
        private string SignData
        {
            get
            {
                if (null == ViewState["SignData"])
                {
                    return "";
                }

                return (string)ViewState["SignData"];
            }
            set
            {
                ViewState["SignData"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "sign_init", "InitSign();", true);
            }
        }

        protected void rdoTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            ctlSignature.SaveSignature("");

            if (ctlSignature.TotalSignPoints > 10)
            {
                SignData = ctlSignature.SignData;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "sign_load", "LoadSign('" + SignData + "');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ctlSignature.SaveSignature(Server.MapPath("~/Update-Panel-Sign.png"));
            SignData = "";
        }
    }
}