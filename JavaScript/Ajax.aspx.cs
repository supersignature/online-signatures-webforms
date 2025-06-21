using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Ajax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AddHeader("Pragma", "no-cache");

            Response.CacheControl = "no-cache";

            Response.Cache.SetAllowResponseInBrowserHistory(false);

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetNoStore();

            Response.Expires = -1;

            btnSave.Attributes["onclick"] = "javascript: if(ValidateSignature('" + ctlSignature.uID + "')) { document.getElementById('" + btnSave.ClientID + "').value = 'Wait..';} else {return false;}";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Session["sign"] = ctlSignature.SaveSignature("");
            string scriptJs = "CloseSignModal();";

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ajaxSign", scriptJs, true);
        }
    }
}