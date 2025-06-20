<%@ Page Title="Asp.Net Signature Contact Form Sign Online C# .NET" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Online.Signatures.Webforms.Contact" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
    <table>
        <tr>
            <td>
                Name:
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqName" ControlToValidate="txtName" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                City:
            </td>
            <td>
                 <asp:TextBox ID="City" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                State:
            </td>
            <td>
                <asp:DropDownList ID="drpState" runat="server" AutoPostBack="true"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Comments:
            </td>
            <td>
                <asp:TextBox ID="txtComments" TextMode="MultiLine" style="width:300px;height:150px" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Your Sign
            </td>
            <td>
                <img id="imgSign" runat="server" style="width: 550px; height: 180px;" visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <cc1:MouseSignature ID="ctlSignature" runat="server" SignTransparent="false" 
                    BorderWidth="1" BorderStyle="Solid" SignPenCursor="/img/pencil.cur" BorderColor="blue" IeModalFix="true" BackColor="Yellow" SignZIndex="9999" SignRequiredPoints="50"
                    SignHeight="180" SignWidth="550" SignPenColor="#000000" SignRefreshImage="/img/spacer.gif" SignStartMessage=" " SignErrorMessage="Required points are still not reached" SignRequired="true" />
                    <asp:CustomValidator ID="custVal" runat="server"  ClientValidationFunction="ValSign"></asp:CustomValidator>
            </td>
        </tr>
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr id="trButton">
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"
                    CausesValidation="true" />
                <input type="button" id="btnClear" onclick="ClearSignature('<%= ctlSignature.uID %>'); $('#<%= ctlSignature.uID %>').css('border', '1px solid black');" value="Clear" />
                <input type="button" id="btnPointCount" onclick="var tp = SignatureTotalPoints('<%= ctlSignature.uID %>'); alert(tp);" value="How many points?" />
                <input type="button" onclick="StatusBar();" value="Status Bar" />  
            </td>
        </tr>
         <tr><td colspan="2">
           <asp:ValidationSummary ID="valSummary" runat="server" DisplayMode="BulletList" />
         </td></tr>
    </table>
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <script language="javascript" type="text/javascript">
        var statV = false;

        function StatusBar() {
            SignatureStatusBar('<%= ctlSignature.uID %>', statV);
            statV = !statV;
        }

        // change status bar look

        if (typeof (jQuery) != 'undefined') {
            $('#cphMain_ctlSignature_status').css("color", "red");
            $('#cphMain_ctlSignature_status').css("font-size", "10px");
            $('#cphMain_ctlSignature_status').css("float", "left");
        }

        function ValSign() {
            var isvalid = ValidateSignature('<%= ctlSignature.uID %>');

            if (!isvalid) {
                $('#<%= ctlSignature.uID %>').css("border", "4px dashed red");
            }

            return isvalid;
        }

    </script>
    <ul>
      <li>External "Clear" button, default image hidden with spacer.gif</li>
      <li>No welcome message on status bar</li>
      <li>Solid border, blue color</li>
      <li>Black pen color</li>
      <li>Yellow background and custom pen cursor</li>
      <li>Higher value in Required points, click button to know actual point count reached</li>
      <li>Signature is required, Save does not post before the required point count is met</li>
      <li>Show/Hide status bar</li>
      <li>Change status bar color and font size</li>
      <li>Get Drop down data after postback, sign also maintains its value</li>
      <li>Shows use of Asp.net Validation controls</li>
    </ul>
</asp:Content>
