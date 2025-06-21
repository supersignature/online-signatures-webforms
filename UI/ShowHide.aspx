<%@ Page Title="Show Hide Signature Area Using Script" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="ShowHide.aspx.cs" Inherits="Online.Signatures.Webforms.ShowHide" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <div id="hideSign" style="display: none">
        <cc1:MouseSignature ID="ctlSignature" runat="server" SignRequired="false" />
        <asp:Button ID="btnSign" runat="server" Text="Sign" onclick="btnSign_Click" />
    </div>
    <a href="javascript:void(0);" style="font-size:14px;font-weight:bold;margin:20px;float:left" onclick="HideSign(false); this.style.display = 'none'; ">I want to sign</a>
    <img src="/img/spacer.gif" id="imgSign" runat="server" style="width:450px;height:300px;" />
    <script language="javascript" type="text/javascript">
        function HideSign(hide) {
            if (hide) {
                $("#hideSign").hide();
                $("#" + '<%= imgSign.ClientID %>').show();
            }
            else {
                $("#hideSign").show();
                $("#" + '<%= imgSign.ClientID %>').hide();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
        <li>Signature with code to show / hide</li>
    </ul>
</asp:Content>