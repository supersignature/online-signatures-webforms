<%@ Page Title="jQuery Signature Capture Example" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="jQuery.aspx.cs" Inherits="Online.Signatures.Webforms.jQuery" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>

<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">

 <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" type="text/css" />

  <style type="text/css">
    
    .save
    {
       border:solid 1px #DCDCDC;
       padding:2px;
       margin-left: 20px;
       background-color: #79B933;
       font-size:14px;
       color: #FFFFFF;
       font-weight:bold;
       position:absolute;
    }
    

  </style>


    
    <a id="aSign" href="javascript:void(0);" onclick="ShowSignModal();"><h1><u>Open Sign Modal Pop-Up</u></h1></a>
    <br/>
    <cc1:MouseSignature ID="ctlSignature" IeModalFix="true" runat="server" SignTransparent="false" BorderStyle="Dashed"
            BorderWidth="2" BorderColor="#DDDDDD" SignRequiredPoints="15" SignHeight="300"
            SignWidth="450" SignRequired="true" /><br/>
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="save" onclick="btnSave_Click" CausesValidation="false" />
     <br />
     <img src="/img/spacer.gif" id="imgSign" runat="server" style="width:450px;height:300px;" visible="false" />
     <br />
   

    <script type="text/javascript" src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
        
    <script type="text/javascript">


        function ShowSignModal() {
            $("#<%= ctlSignature.uID %>_Container").dialog("open");
        }

             $(document).ready(function() {

                 $("#<%= ctlSignature.uID %>_Container").dialog({
                        height: 410,
                        width: 500,
                        modal: false,
                        autoOpen: false,
                        minHeight: 410,
                        minWidth: 500
                    });

                    $("#<%= ctlSignature.uID %>_toolbar").appendTo("#<%= ctlSignature.uID %>_Container");
                    $("#<%= btnSave.ClientID %>").appendTo("#<%= ctlSignature.uID %>_Container");
                    $("#<%= ctlSignature.uID %>_Container").parent().appendTo($("form:first"));

                    if (!isIE) {
                        $("#<%= ctlSignature.uID %>_toolbar").css("margin-top", "300px");
                        $("#btnSave").css("margin-top", "10px");
                    }
                });
        
    </script>
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Signature shown in modal-popup using jQuery</li>
      <li>Use IeModalFix Property for cross browser compatibility</li>
    </ul>
</asp:Content>