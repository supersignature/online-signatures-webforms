<%@ Page Title="Postback Handling Using Asp.Net Update Panel" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="UpdatePanel.aspx.cs" Inherits="Online.Signatures.Webforms.UpdatePanel" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
  (Sign and then change radio button)<br /><br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:RadioButtonList ID="rdoTest" runat="server" AutoPostBack="true" 
                onselectedindexchanged="rdoTest_SelectedIndexChanged">
                <asp:ListItem Value="1" Selected="True">Option 1</asp:ListItem>
                <asp:ListItem Value="2">Option 2</asp:ListItem>
            </asp:RadioButtonList>
            <cc1:MouseSignature ID="ctlSignature" runat="server" />

            <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function InitSign() {

            eval('obj' + '<%= ctlSignature.uID %>').Init();

            ClearSignature('<%= ctlSignature.uID %>');

        }

        function LoadSign(data) {

            LoadSignature('<%= ctlSignature.uID %>', data, '1');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
        <li>Signature with postback code from Update Panel</li>
    </ul>
</asp:Content>