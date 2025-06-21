<%@ Page Title="Databind Signature Instances Inside A Repeater" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Repeater.aspx.cs" Inherits="Online.Signatures.Webforms.Repeater" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
 <asp:Repeater ID="rptSign" runat="server" onitemdatabound="rptSign_ItemDataBound">
 <HeaderTemplate>
   <table style="border:solid 1px #DCDCDC">
    <tr style="background:#DCDCDC"> 
      <td style="width:200px">Full Name</td>
      <td>Sign</td>
    </tr>
 </HeaderTemplate>
 <ItemTemplate>
    <tr>
     <td><h3><%#Eval("FullName")%></h3></td>
     <td><cc1:MouseSignature ID="ctlSignature" SignWidth="250" SignHeight="150" runat="server" Enabled="true" SignRequired="true" />   </td>
     <td><input type="button" id="btnDisable" runat="server" value="Disable" /></td>
               <td><input type="button" id="btnEnable" runat="server" value="Enable" /></td>
    </tr>
    <tr><td colspan="2" style="border:solid 1px #DCDCDC"></td></tr>
 </ItemTemplate>
 <FooterTemplate>
  </table>
 </FooterTemplate>
 </asp:Repeater>
 <br />
 <asp:Button ID="btnSave" runat="server" Text="Save All" onclick="btnSave_Click" />
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
  <ul>
      <li>Multiple signature instances inside a repeater</li>
      <li>Get signature for each control server side, by looping the repeater items</li>
    </ul>
</asp:Content>