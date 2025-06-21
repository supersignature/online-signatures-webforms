using SuperSignature;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Repeater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindRepeater();
            }
        }

        private void BindRepeater()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("FullName");

            DataRow dr = dt.NewRow();
            dr["FullName"] = "John";
            dt.Rows.Add(dr);

            DataRow dr1 = dt.NewRow();
            dr1["FullName"] = "Marie";
            dt.Rows.Add(dr1);

            DataRow dr2 = dt.NewRow();
            dr2["FullName"] = "James";
            dt.Rows.Add(dr2);

            dt.AcceptChanges();
            rptSign.DataSource = dt;
            rptSign.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Bitmap bm = new Bitmap(250, 500);
            Graphics g = Graphics.FromImage(bm);

            int y = 0;

            foreach (RepeaterItem rptItem in rptSign.Items)
            {
                MouseSignature ctlSignature;
                ctlSignature = (rptItem.Controls[1] as MouseSignature);
                Bitmap bmInner = ctlSignature.SaveSignature("");
                g.DrawImage(bmInner, 0, y);
                y = y + 160;
            }

            MemoryStream ms = new MemoryStream();

            Response.ContentType = "image/png";

            bm.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            ms.WriteTo(Response.OutputStream);

            g.Dispose();
            bm.Dispose();
            Response.End();
        }

        string validateJS = " (true ";

        protected void rptSign_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string uID = (e.Item.FindControl("ctlSignature") as MouseSignature).uID;
                (e.Item.FindControl("btnDisable") as HtmlInputButton).Attributes.Add("onclick", "SignatureEnabled('" + uID + "', false);");
                (e.Item.FindControl("btnEnable") as HtmlInputButton).Attributes.Add("onclick", "SignatureEnabled('" + uID + "', true);");

                validateJS += " && ValidateSignature('" + uID + "')";
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            btnSave.Attributes["onclick"] = "javascript:return " + validateJS + ");";
        }
    }
}