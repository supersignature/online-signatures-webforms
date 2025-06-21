<%@ Page Title="Use Asp.Net AjaxToolkit To Sign Online" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Toolkit.aspx.cs" Inherits="Online.Signatures.Webforms.Toolkit" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
  <style type="text/css">
    
     #overlay {
     visibility: hidden;
     position: absolute;
     left: 0px;
     top: 0px;
     width:100%;
     height:100%;
     z-index: 9999;
     text-align: center;
    }
    
     .save
     {
       border:solid 1px #DCDCDC;
       padding:2px;
       margin-left: 20px;
       background-color: #AA9933;
       font-size:14px;
       color: #FFFFFF;
       font-weight:bold;
     }   
     
     .cancel
     {
       border:solid 1px #DCDCDC;
       padding:2px;
       background-color: #AA9933;
       font-size:14px;
       color: #FFFFFF;
       font-weight:bold;
     }   
     
     #panel
     {
     
     }

   </style>


    
   <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
   

    <a id="aSign" href="javascript:void(0);" onclick="ShowSignModal();">
        <h1><u>AJAX Toolkit- Click Here To Sign</u></h1>
    </a>
   
    <div id="overlay">
        <asp:UpdatePanel ID="upd1" runat="server">
            <ContentTemplate>
            <div >
                <cc1:MouseSignature ID="ctlSignature" runat="server" SignTransparent="false" BorderStyle="Dashed"
                    BorderWidth="2" BorderColor="#DDDDDD" SignRequiredPoints="15" SignHeight="300"
                    SignWidth="450" SignRequired="false" />
                    
             <div id="panel">
                <asp:Button ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" CausesValidation="false" />
                &nbsp;
                <input type="button" id="btnCancel" class="cancel" onclick="ShowSignModal();" value="Cancel" />
             </div>       
             </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
   
    <br />
    <img id="imgSign" style="width: 450px; height: 300px; visibility: hidden;" />
    <br />  <script type="text/javascript">


                function ShowSignModal() {
                    el = document.getElementById("overlay");
                    el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";

                    if (el.style.visibility == "visible") {
                        document.getElementById('imgSign').style.visibility = "hidden";
                        document.body.style.backgroundColor = "#DDDDDD";

                         ClearSignature('<%= ctlSignature.uID %>');
                        eval('obj' + '<%= ctlSignature.uID %>').Init();

                    }
                    else
                        document.body.style.backgroundColor = "#FFFFFF";
                }

                function CloseSignModal() {
                    ShowSignModal();

                    document.getElementById('imgSign').style.visibility = "visible";
                    var date = new Date();
                    var ticks = date.getTime();
                    document.getElementById('imgSign').src = '/session-image.ashx?rnd=' + ticks;
                }   
        
    </script>
</asp:Content>
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Signature using Ajax Toolkit</li>
    </ul>
</asp:Content>
