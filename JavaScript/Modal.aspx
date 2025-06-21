<%@ Page Title="A Simple Modal Dialog To Capture Signatures" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Modal.aspx.cs" Inherits="Online.Signatures.Webforms.Modal" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
   <style type="text/css">
    
     #overlay {
     visibility: hidden;
     position: absolute;
     left: 0px;
     top: 0px;
     width:100%;
     height:100%;
     z-index: 1000;
     text-align:center;
    }
    
     .save
     {
       border:solid 1px #DCDCDC;
       padding:2px;
       margin-left: 20px;
       background-color: #79B933;
       font-size:14px;
       color: #FFFFFF;
       font-weight:bold;

     }   
     
     .cancel
     {
       border:solid 1px #DCDCDC;
       padding:2px;
       background-color: #79B933;
       font-size:14px;
       color: #FFFFFF;
       font-weight:bold;

     }   
     
     #tool
     {
     	position:relative;
     }

   </style>

    <a id="aSign" href="javascript:void(0);" onclick="overlay();"><h1>Click Here To Sign</h1></a>
    <div id="overlay">
      <center>
        <cc1:MouseSignature ID="ctlSignature" runat="server" SignTransparent="false" BorderStyle="Dashed"
            BorderWidth="1" BorderColor="#FFFFFF" SignRequiredPoints="15" SignHeight="300"
            SignWidth="450" SignRequired="false" />
            
        <div id="tool">
        <asp:Button ID="btnSave" CssClass="save" runat="server" Text="Save" onclick="btnSave_Click" CausesValidation="false" />
        &nbsp;
        <input type="button" id="btnCancel" class="cancel" onclick="overlay();" value="Cancel" />
        </div>     
        </center>
    </div>
     <br />
     <img src="/img/spacer.gif" id="imgSign" runat="server" style="width:450px;height:300px;"  />
     <br />
        
    <script type="text/javascript">


        function overlay() {
            el = document.getElementById("overlay");
            img = document.getElementById("<%= imgSign.ClientID %>");
            el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";

            if (el.style.visibility == "visible") {
                document.body.style.backgroundColor = "#DDDDDD";
                img.style.visibility = "hidden";
            }
            else {
                document.body.style.backgroundColor = "#FFFFFF";
                img.style.visibility = "visible";
            }
        }
            
        
    </script>
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Signature shown in a simple modal-div without using jQuery</li>
      <li>IeModalFix Property not required here</li>
    </ul>
</asp:Content>
