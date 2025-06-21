<%@ Page Title="Show Status Of Signature Back" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="Online.Signatures.Webforms.Status" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
    <cc1:mousesignature id="ctlSignature" runat="server" signtransparent="false" borderstyle="Dashed"
        borderwidth="2" bordercolor="#DCDCDC" signrequiredpoints="100" signheight="300"
        signwidth="450" signrequired="true" />
    <script type="text/javascript">
        function obj<%= ctlSignature.ClientID %>_status(success, points) {
            $("#liStatus").html("<strong>Signature done? : " + success + ", with " + points + " points.</strong>");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="Server">
    <ul>
        <li id="liStatus" style="color: Red"></li>
        <li>Use current signature capture status to hide / show something</li>
        <li>Match the "_status" function signature with your signature object on page</li>
    </ul>
</asp:Content>