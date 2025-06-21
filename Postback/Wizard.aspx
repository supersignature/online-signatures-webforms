<%@ Page Title="User Signature Control Inside Asp.Net Wizard" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Wizard.aspx.cs" Inherits="Online.Signatures.Webforms.Wizard" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <script src="https://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src='<%= ctlSignature.GetScriptLink()  %>' type="text/javascript"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>
            <asp:Wizard ID="screeningChecklistWizard" OnFinishButtonClick="screeningChecklistWizard_FinishButtonClick" runat="server" ActiveStepIndex="0" DisplaySideBar="True"
                Width="850px" OnNextButtonClick="screeningChecklistWizard_NextButtonClick">
                <SideBarButtonStyle ForeColor="#3366CC" Width="200px" CssClass="sidebutton" />
                <SideBarStyle BorderStyle="None" VerticalAlign="Top" Width="200px" CssClass="sidebar" />
                <HeaderTemplate>
                    <div style="float: left;">
                        <h2>
                            Wizard</h2>
                    </div>
                </HeaderTemplate>
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Information (Step 1)">
                        <div class="outerContent">
                            <div class="innerContent">
                                Please Click Next..
                            </div>
                        </div>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" Title="Signature (Step 2)" runat="server" OnActivate="WizardStep2_Activate">
                        <div class="outerContent">
                            <div class="outerContentHeader">
                                Please Sign</div>
                            <div class="innerContent">
                                <cc1:MouseSignature IeModalFix="true" BorderStyle="Dashed" SignPenColor="blue" SignTransparent="false"
                                    SignRequiredPoints="15" BorderWidth="2" SignPenSize="4" SignShowImageBorder="false"
                                    BorderColor="#DCDCDC" SignRequired="true" ID="ctlSignature" runat="server" SignHeight="275"
                                    SignWidth="435" IncludeJquery="false" />
                                <div>
                                    <asp:Button ID="btnCapture" CausesValidation="false" CssClass="save" runat="server"
                                        Text="Capture" OnClick="btnCapture_Click" />
                                </div>
                            </div>
                        </div>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">

        function InitSign() {

            eval('obj' + '<%= ctlSignature.uID %>').Init();

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
        <li>Signature with Asp.net Wizard (2nd Step) and Update Panel</li>
    </ul>
</asp:Content>
