<%@ Page Title="Dynamically Render Signature Instances At Runtime" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Dynamic.aspx.cs" Inherits="Online.Signatures.Webforms.Dynamic" %>
<asp:Content ID="ctMain" ContentPlaceHolderID="cphMain" runat="server">
 <asp:Panel ID="pnlSign" runat="server"></asp:Panel>
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Signature instances are added runtime</li>
    </ul>
</asp:Content>
