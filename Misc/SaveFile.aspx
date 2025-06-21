<%@ Page Title="Save Signature To Physical File On Server" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="SaveFile.aspx.cs" Inherits="Online.Signatures.Webforms.SaveFile" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
       <cc1:MouseSignature BorderStyle="Solid" SignPenColor="#79B933" BackColor="Yellow" SignTransparent="false"  BorderWidth="2" SignPenSize="5" SignShowImageBorder="true"  BorderColor="#DCDCDC" SignRequired="true" ID="ctlSignature" runat="server" SignHeight="200" SignWidth="500" />
       <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Save to physical file with different format</li>
    </ul>
    </asp:Content>