using System;
using System.Data;
using System.Web.UI;

namespace Online.Signatures.Webforms
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("StateName");
                dt.Columns.Add("StateCode");

                DataRow dr = dt.NewRow();
                dr["StateName"] = "California";
                dr["StateCode"] = "CA";

                DataRow dr1 = dt.NewRow();
                dr1["StateName"] = "New York";
                dr1["StateCode"] = "NY";

                DataRow dr2 = dt.NewRow();
                dr2["StateName"] = "Select";
                dr2["StateCode"] = "";

                dt.Rows.Add(dr);
                dt.Rows.Add(dr1);
                dt.Rows.Add(dr2);

                dt.AcceptChanges();

                drpState.DataTextField = "StateName";
                drpState.DataValueField = "StateCode";
                drpState.DataSource = dt;


                drpState.DataBind();
            }
            else
            {
                // This is to maintain state of signature when the dropdown auto postbacks.
                ctlSignature.SaveSignature("");
                ctlSignature.LoadSignature(ctlSignature.SignData, "1");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim().Length == 0)
            {
                ctlSignature.SaveSignature("");
                ctlSignature.LoadSignature(ctlSignature.SignData, "1");
            }
            else
            {
                Session["sign"] = ctlSignature.SaveSignature("");
                imgSign.Visible = true;
                imgSign.Src = "session-image.ashx?rnd=" + System.Guid.NewGuid().ToString();

                txtComments.Text = "Your name is " + txtName.Text + " and you live in " + drpState.SelectedItem.Text;
                ctlSignature.Visible = false;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hidebutton", "document.getElementById('trButton').style.display = 'none';", true);

                // Save to disk
                ctlSignature.SaveSignature(Server.MapPath("~/") + txtName.Text.Trim() + "-" + Guid.NewGuid() + ".png");
            }
        }

    }
}