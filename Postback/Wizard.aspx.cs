using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online.Signatures.Webforms
{
    public partial class Wizard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void WizardStep2_Activate(object sender, EventArgs e)
        {
            CreateSign();

            InitSign();
        }

        protected void btnCapture_Click(object sender, EventArgs e)
        {
            ctlSignature.SaveSignature(Server.MapPath("~/") + Guid.NewGuid() + "-Wizard-Sign.png");

            InitSign();
        }

        protected void screeningChecklistWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (e.NextStepIndex == 1)
            {
                CreateSign();
                InitSign();
            }
        }

        protected void screeningChecklistWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            InitSign();
        }

        private void InitSign()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "sign", "InitSign();", true);
        }

        private void CreateSign()
        {
            string ss_script = ctlSignature.GetScriptDeclaration();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ss_sign", ss_script, true);
        }

    }
}