<%@ Page Title="Resize Signature Area At Runtime jQuery UI" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Resize.aspx.cs" Inherits="Online.Signatures.Webforms.Resize" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" type="text/css" />
    <div id="resize" style="width:310px;height:200px">
                <cc1:MouseSignature BorderStyle="Dashed" BorderWidth="2" BorderColor="#DCDCDC" SignRequired="false"
                    ID="ctlSignature" runat="server" SignHeight="200" SignWidth="300" SignZIndex="0" />
            </div>
            <div style="position:relative;margin-top:10px"><br />
                <asp:Button ID="btnTest" Text="Go" runat="server" OnClick="btnTest_Click" />
                </div>
            
     <script type="text/javascript" src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

    <script language="javascript" type="text/javascript">

        $(document).ready(function () {

            $("#resize").resizable();

            $("#resize").bind("resizestart", function (event, ui) {
                ClearSignature("<%= ctlSignature.uID %>");
            });

            $("#resize").bind("resize", function (event, ui) {
                ClearSignature("<%= ctlSignature.uID %>");
            });

            $("#resize").bind("resizestop", function (event, ui) {
                ResizeSignature("<%= ctlSignature.uID %>", ui.size.width, ui.size.height);
            });

        });

        /* uncomment this if you want to have the signature fill-up the whole page on load

        $(window).load(function() {
        updateOrientation();
        });

        */

        function updateOrientation() {
            ResizeSignature("<%= ctlSignature.uID %>", $(document).width(), $(document).height());
        }
       
    </script>

</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Resize using anchor located at bottom right</li>
      <li>Use &lt;body onorientationchange="updateOrientation();"&gt; in certain mobile devices, to auto size</li>
    </ul>
</asp:Content>