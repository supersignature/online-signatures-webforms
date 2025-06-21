using SuperSignature;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Dynamic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 6; i++)
            {
                MouseSignature ctlSignature = new MouseSignature();
                ctlSignature.ID = "ctlSignature" + i.ToString();
                pnlSign.Controls.Add(ctlSignature);

                // call any methods for ctlSignature after this

            }
        }
    }
}