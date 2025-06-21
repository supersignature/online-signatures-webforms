<%@ Page Title="Signing On A Mobile Device Orientation Resize Sample" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Mobile.aspx.cs" Inherits="Online.Signatures.Webforms.Mobile" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <div id="mainDiv" style="padding:20px">
        <div class="row">
            <cc1:MouseSignature ID="ctlSignature" SignRequiredPoints="10" runat="server" SignWidth="0" SignHeight="0"
                SignRequired="false" />
        </div>
        <div class="row">
            <input type="button" class="btn btn-primary" onclick="SaveSignature();" value="Save" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
        <li>Use viewport meta</li>
        <li>Change size on browser orientation change</li>
    </ul>

    <script type="text/javascript" src="/js/base64.js"></script>

    <script language="javascript" type="text/javascript">

        var signW = 0;
        var signH = 0;
        var resizing = false;
        var isMobile = false;

        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            isMobile = true;
        }

        function Resize() {
            if (resizing) { return; }
            resizing = true;


            var signData = Base64.decode($('#<%= ctlSignature.uID %>_data').val());

            var tmpW = signW;
            var tmpH = signH;


            var ppi = dpi.get(false);

            signW = parseInt(window.innerWidth) - parseInt((80 * ppi / 100));
            signH = parseInt(window.innerHeight) - parseInt((160 * ppi / 100));

            ResizeSignature("<%= ctlSignature.uID %>", signW, signH);

            setTimeout(function () { ClearSignature("<%= ctlSignature.uID %>"); }, 100);

            if (signData.length > 0) {

                signData = signData.replace(tmpW + ',' + tmpH, signW + ',' + signH);

                var ratio = 1; // change ratio as required

                setTimeout(function () { LoadSignature("<%= ctlSignature.uID %>", signData, ratio.toString()); }, 500);
            }

            resizing = false;
        }

        var dpi = {
            v: 0,
            get: function (noCache) {
                if (noCache || dpi.v == 0) {
                    e = document.body.appendChild(document.createElement('DIV'));
                    e.style.width = '1in';
                    e.style.padding = '0';
                    dpi.v = e.offsetWidth;
                    e.parentNode.removeChild(e);
                }
                return dpi.v;
            }
        }

        $(document).ready(function () {

            $("<%= ctlSignature.uID %>_Container").css('margin', '0px');
            $('body').css('margin', '0px');
            $('body').css('height', '100%');
            $('body').css('width', '100%');
            $('#divRight').css('float', 'left');
            $('#divRight').css('margin', '0px');
            $('#divLeft').hide();
            $('#divBottom').delay(3000).fadeOut(500);

        });

        // attach events

        if (isMobile) {

            $(window).on("load orientationchange",
           function (e) {
               setTimeout(function () { Resize(); }, 500);
           });


        }
        else {

            $(window).on("load resize",
           function () {
               setTimeout(function () { Resize(); }, 500);
           });
        }


       function SaveSignature() {
           var tp = SignatureTotalPoints('<%= ctlSignature.uID %>');
           if (tp >= 10) {
               $.ajax({
                   type: "POST",
                   cache: false,
                   url: "/UI/Mobile.aspx",
                   data: {
                       signData: $("#<%= ctlSignature.uID %>_data").val(),
                       signDataSmooth: $("#<%= ctlSignature.uID %>_data_smooth").val()
                   },
                   success: function (data) {
                       alert("Signature saved");
                       window.open("/session-image.ashx?c=" + new Date());
                   },
                   error: function (textStatus, errorThrown) {
                       alert("Unable to save signature. Fatal error." + errorThrown);
                   }
               });
           }
       }

    </script>
</asp:Content>
