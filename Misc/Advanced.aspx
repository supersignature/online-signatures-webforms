<%@ Page Title="Advance Use Of Web Signature Control" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Advanced.aspx.cs" Inherits="Online.Signatures.Webforms.Advanced" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ID="ctMain" ContentPlaceHolderID="cphMain" runat="server">
 <script src="https://code.jquery.com/jquery-3.1.0.js" type="text/javascript"></script>
 <cc1:MouseSignature ID="ctlSignature" SignPenCursor="/img/pencil.cur" IncludeJquery="false" SmoothSign="true" SignStartMessage="Please ENABLE signature AREA before signing!" runat="server" SignRequired="false" />
 <br />
 <b>Part-1</b><hr />
 <br /><br />
 <asp:Button ID="btnSaveData" runat="server" Text="Save Data" 
        onclick="btnSaveData_Click" />
 <br />Click above button, the signature data will be saved to session (no file/disk or db), after the page post-backs the signature area will get clear<br />
 <br />
 <asp:Button ID="btnGenerateData" runat="server" Text="Generate Signature" 
        Enabled="false" onclick="btnGenerateData_Click" />
 <br />Click above button, the signature data will be converted to image and shown below:<br />
 <br />
 <img src="/img/spacer.gif" id="imgSign" runat="server" style="width: 450px; height: 300px;border:1px dashed #ccc" />
 <br /> <br />
 <b>Part-2</b><hr />
 Click below button, to see a previous signature get loaded to the signature area (from server / database). You can continue signing over it.<br /><br />
 <asp:Button ID="btnServerSignLoad" runat="server" Text="Load Signature" 
        onclick="btnServerSignLoad_Click" /><br /><br />
 <input type="button" id="btnEnDis" value="Enable / Disable Signature Area" onclick="EnDis();" /><br />
 When the signature area is disabled, you can not draw over it. The button toggles it.
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Signature is disabled by default on first load</li>
      <li>IncludejQuery property is false, so jQuery is used from external link, Control does not render its internal jQuery</li>
      <li>Save signature data to database</li>
      <li>Regenerate signature image at a later time</li>
      <li>Load signature back to signature area from server</li>
      <li>Enable / disable signature area from client script</li>
      <li>Change message style</li>
    </ul>
    <script language="javascript" type="text/javascript">
        var isEn = false;
        function EnDis() {
            isEn = !isEn;
            SignatureEnabled('<%= ctlSignature.uID %>', isEn);
        }

        $(window).load(function () { SignatureEnabled('<%= ctlSignature.uID %>', isEn); $("#" + "<%= ctlSignature.uID %>" + "_status").css("color", "green").css("font-size", "14px").css("background-color", "yellow") });
        
    </script>
</asp:Content>