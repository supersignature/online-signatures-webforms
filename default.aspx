<%@ Page Title="SuperSignature Asp.Net Webforms Samples" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Online.Signatures.Webforms._default" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ID="ctMain" ContentPlaceHolderID="cphMain" runat="server">
    <cc1:MouseSignature ID="ctlSignature" runat="server" SignRequired="false" />
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
        <li>Control will all default options</li>
    </ul>
</asp:Content>
