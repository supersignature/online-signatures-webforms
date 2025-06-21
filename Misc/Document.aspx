<%@ Page Title="Sign Documents Online In Asp.Net Using SuperSignature" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Document.aspx.cs" Inherits="Online.Signatures.Webforms.Document" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
 <asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
    <style type="text/css">
      body
      {
      	font-family:Verdana;
      	font-size:12px;
      }
      
       #overlay {
         visibility: hidden;
         position: relative;
         left: 0px;
         top: 0px;
         width:100%;
         margin-top:-250px;
    }
      
      .save
     {
       border:solid 1px #DCDCDC;
       padding:2px;
       background-color: Navy;
       font-size:14px;
       color: #FFFFFF;
       font-weight:bold;
     }   
     
     .cancel
     {
       border:solid 1px #DCDCDC;
       padding:2px;
       background-color: Navy;
       font-size:14px;
       color: #FFFFFF;
       font-weight:bold;
     }   
     
     #divSign
     {
       width:220px;
       height:120px;
       border: dotted 2px blue; 
       position:relative;
       margin-top:-160px;
       margin-left:20px;
       cursor:pointer;
       display:"";
     }
     
    </style>
   

   
        <center><img src="/img/Agreement.png" />
       
       <div onclick="ShowSignModal();" id="divSign">
         <img id="imgSign" runat="server" visible="false" />
         <br /><b>&nbsp;&nbsp;Click To Sign</b>
       </div>
       </center>
       <br />
       <table id="overlay">
        <tr>
          <td>
          <center>
        <cc1:MouseSignature ID="ctlSignature" runat="server" SignImageScaleFactor="0.50" SignTransparent="true" BorderStyle="Dotted"
            BorderWidth="2" BorderColor="#DDDDDD" SignRequired="false" SignRequiredPoints="20" SignHeight="250"
            SignWidth="380"  SignPenColor="blue" />
                </center>
              </td>
            </tr>
            <tr>
              <td><center><asp:Button ID="btnSave" runat="server" Text="Sign" CssClass="save" onclick="btnSave_Click" 
               CausesValidation="false" />
        &nbsp;
                <input type="button" id="btnCancel" class="cancel" onclick="ShowSignModal();" value="Cancel" /></center></td>
            </tr>
         </table>
       
    <script language="javascript" type="text/javascript">

        function ShowSignModal() {
            el = document.getElementById("overlay");
            el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
            
            el2 = document.getElementById("divSign");
            el2.style.display = (el2.style.display == "") ? "none" : "";

            if (el.style.visibility == "visible") {
                document.body.style.backgroundColor = "#DDDDDD";
            }
            else
            {
                document.body.style.backgroundColor = "#FFFFFF";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li><asp:Button ID="btnPDF" Text="Generate PDF" runat="server" Enabled="false" onclick="btnPDF_Click" /> </li>
      <li>Signature shown to sign a document</li>
      <li>You will need some 3rd party library to raster (pdf > jpg)</li>
      <li>To embed signature in the pdf, you may use PDFSharp or so, shown in code behind</li>
      <li>Shows use of SignImageScaleFactor property</li>
    </ul>
</asp:Content>