using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class PostBack : System.Web.UI.Page
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
                if (ctlSignature.SignData.Length > 10)
                {
                    ctlSignature.SaveSignature("");
                    SignData = ctlSignature.SignData;
                    LoadSign();
                }
            }
        }

        protected void btnPostBack_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim().Length == 0)
            {
                lblError.Text = "Please enter name. We have loaded your signature back!";
            }
            else if (ctlSignature.SignData.Length > 0)
            {
                lblError.Text = "Thanks for signing! Now your signature got saved! Hit clear button.";
            }
            else
            {
                lblError.Text = "Sign is missing!";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearSign();
        }

        private void ClearSign()
        {
            SignData = "";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "clear", "$(window).on('load', function() {  setTimeout(function() { ClearSignature('" + ctlSignature.uID + "'); },1000); }); ", true);
        }

        private void LoadSign()
        {
            if (ctlSignature.SignData.Length > 0)
            {
                ctlSignature.LoadSignature(SignData, "1");
            }
        }
    }
}