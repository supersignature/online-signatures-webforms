<%@ Page Title="Work With Signatures and Page Postback Event" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="PostBack.aspx.cs" Inherits="Online.Signatures.Webforms.PostBack" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label><br /><br />
    Your Name:&nbsp;<asp:TextBox ID="txtName"  runat="server"></asp:TextBox>&nbsp;(Skip this input, just sign and hit the Save button)&nbsp;<br />
    <cc1:MouseSignature ID="ctlSignature" runat="server" SignRequired="false" SignRequiredPoints="10" />
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnPostBack_Click" />&nbsp;<asp:Button
        ID="btnClear" Text="Clear" runat="server" OnClick="btnClear_Click" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
        <li>Signature with postback code</li>
    </ul>
</asp:Content>
