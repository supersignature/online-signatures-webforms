<%@ Page Title="eSignatures Using Bootstrap Framework" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Bootstrap.aspx.cs" Inherits="Online.Signatures.Webforms.Bootstrap" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
        Bootstrap Modal</button>
    <br />
    <img src="/img/spacer.gif" id="imgSign" style="display: none" />
    <br />
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title">
                        Please Sign</h4>
                </div>
                <div class="modal-body">
                    <div id="signArea">
                        <cc1:MouseSignature ID="ctlSignature" runat="server" IeModalFix="true" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSave" class="btn btn-primary" onclick="SaveSignature();">
                        Save</button>
                    <button type="button" id="btnClose" class="btn btn-default" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript">


        $(document).ready(function () {


          $('#myModal').on('shown.bs.modal', function () {
                  setTimeout(function() {  doResize(); }, 200);
            });


            /* TO HIDE THE MENU */

            setTimeout(function() {
                   $("<%= ctlSignature.uID %>_Container").css('margin', '0px');
                   $('body').css('margin', '0px');
                   $('body').css('height', '100%');
                   $('body').css('width', '100%');
                   $('#divRight').css('float', 'left');
                   $('#divRight').css('margin', '0px');
                   $('#divLeft').hide();
                   $('#divBottom').delay(3000).fadeOut(500);
               }, 2000);

            /* NOT REQUIRED IN YOU CODE */

        });

          window.addEventListener("resize", function () {
              setTimeout(function() {  doResize(); }, 200);
          });


        function doResize() {
                var objMB = $(".modal-body");
                obj<%= ctlSignature.uID %>.ResizeSignature(parseInt(objMB.width() - 20), parseInt(objMB.height() - 20), '1');
            
        }

        function SaveSignature()
        {
            var tp = SignatureTotalPoints('<%= ctlSignature.uID %>'); 
            if(tp > 20)
            {
                 $.ajax({
                    type: "POST",
                    cache: false,
                    url: "Bootstrap.aspx",
                    data: {
                        signData: $("#<%= ctlSignature.uID %>_data").val(),
                        signDataSmooth: $("#<%= ctlSignature.uID %>_data_smooth").val()
                    },
                    success: function (data) {
                         $("#btnClose").click();
                         $('#imgSign').attr("src","/session-image.ashx?c=" + new Date().toTimeString()).show("slow");
                    },
                    error: function (textStatus, errorThrown) {
                        alert("Unable to save signature. Fatal error." + errorThrown);
                    }
                });
            }
        }

    </script>
    <ul>
        <li>Use Bootstrap Modal</li>
        <li>Auto Resize</li>
    </ul>
</asp:Content>