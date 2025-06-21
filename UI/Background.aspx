<%@ Page Title="Signature Pad With An Image Background" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Background.aspx.cs" Inherits="Online.Signatures.Webforms.Background" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
  <cc1:MouseSignature BorderStyle="Solid" SignPenColor="#79B933" 
      SignStartMessage="Sign above the black line" SignTransparent="true" 
      SignBackGroundImage="/img/sign-here.jpg" BorderWidth="2" SignPenSize="4" SignShowImageBorder="true"  BorderColor="#DCDCDC" SignRequired="true" ID="ctlSignature" runat="server" SignHeight="157" SignWidth="300" /><br />
  <asp:Button ID="btnSave" runat="server" Text="Save With Background" onclick="btnSave_Click" />
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Signature with a background image</li>
      <li>Server side code, saves the image with the background image if required</li>
      <li>You can change the start-up message</li>
      <li>You can change the pen color</li>
      <li>You can change the pen size</li>
    </ul>
</asp:Content>