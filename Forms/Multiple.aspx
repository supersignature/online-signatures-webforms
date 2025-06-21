<%@ Page Title="Multiple Signature Instances On A Single Page" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Multiple.aspx.cs" Inherits="Online.Signatures.Webforms.Multiple" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="cphMain" ID="ctlMain" runat="server">
<style type="text/css">
div.color_picker {
  height: 16px;
  width: 16px;
  padding: 0 !important;
  border: 1px solid #ccc;
  background: url(/img/arrow.gif) no-repeat top right;
  cursor: pointer;
  line-height: 16px;
  float:right;
}

div#color_selector {
  width: 110px;
  position: absolute;
  border: 1px solid #598FEF;
  background-color: #EFEFEF;
  padding: 2px;
}
  div#color_custom {width: 100%; float:left }
  div#color_custom label {font-size: 95%; color: #2F2F2F; margin: 5px 2px; width: 25%}
  div#color_custom input {margin: 5px 2px; padding: 0; font-size: 95%; border: 1px solid #000; width: 65%; }

div.color_swatch {
  height: 12px;
  width: 12px;
  border: 1px solid #000;
  margin: 2px;
  float: left;
  cursor: pointer;
  line-height: 12px;
}

div.controlset {display: block; padding: 0.25em 0;}

</style>

    <script src="/js/jquery.colorPicker.js"></script>

      <div style="float:left;margin:20px">
       <p>Please sign</p>
       <cc1:MouseSignature BorderStyle="Solid" SignPenColor="#79B933" BackColor="Yellow" SignTransparent="false" SignRequiredPoints="10" SignPenCursor="/img/pencil.cur"  SignRefreshImage="/img/refresh.png" BorderWidth="2" SignPenSize="5" SignShowImageBorder="true"  BorderColor="#DCDCDC" SignRequired="false" ID="ctlSignature" runat="server" SignHeight="200" SignWidth="300" />
       <br />
       Sign again
       <cc1:MouseSignature BorderStyle="Dashed" SignPenColor="blue" SignBackGroundImage="/img/background.gif" SignTransparent="false" SignRequiredPoints="10"  BorderWidth="1" SignPenSize="5" SignShowImageBorder="false"  BorderColor="#000000" SignRequired="false" ID="ctlSignature2" runat="server" SignHeight="200" SignWidth="300" />
       <br /><br />
       <asp:Button ID="btnSave" OnClientClick="return CheckValidity();" runat="server" Text="Save" onclick="btnSave_Click" />&nbsp;<input type="button" onclick="ClearSign();" value="Clear All" />&nbsp;<input type="button" onclick="UndoSignature(selectedControlID);" value="Undo Sign" />&nbsp;<input type="button" onclick="ShowPoints();" value="How many points?" />
       </div>
       <div style="float:left;margin:20px">
        <b>Work on the following sign instance:</b><br /><br />
         <input type="radio" onclick="SetControl('<%= ctlSignature.uID %>');" name="signcontrol" value="sign1" checked="checked" /> Sign 1<br />
         <input type="radio" onclick="SetControl('<%= ctlSignature2.uID %>');" name="signcontrol" value="sign2" /> Sign 2
         <hr />
         <br /> <br />
         <div class="controlset">Change Pen Color:<input id="color1" type="text" name="color1" value="#333399" /></div>
	     <br /><br />
         Change Pen Width:&nbsp;<select onchange="SetPenWidth();" style="float:right" id="selPenW"><option value="1">1</option><option value="2">2</option><option value="4" selected="selected">4</option><option value="6">6</option></select><br /> <br />
         <br />
         <div class="controlset">Change Back Color:<input id="color2" type="text" name="color2" value="#FF0000" /></div>
         <br /><br />
       </div>
</asp:Content>   
<asp:Content ID="ctFooter" ContentPlaceHolderID="cphFooter" runat="server">
    <ul>
      <li>Multiple signature instances on same page</li>
      <li>Change pen color from JS</li>
      <li>Change pen width from JS</li>
      <li>Change background color from JS</li>
      <li>Undo Signature Stroke</li>
      <li>Custom validation using "ValidateSignature();"</li>
    </ul>
    <script language="javascript" type="text/javascript">

        var selectedControlID = "<%= ctlSignature.uID %>";

        function SetPenWidth() {
            SignaturePen(selectedControlID, document.getElementById('selPenW').value);
        }

        function CheckValidity() {
            return ValidateSignature('<%= ctlSignature.uID %>') && ValidateSignature('<%= ctlSignature2.uID %>');
        }

        function ClearSign() {
            ClearSignature('<%= ctlSignature.uID %>');
            ClearSignature('<%= ctlSignature2.uID %>');
        }

        function ShowPoints() {
            var x = SignatureTotalPoints(selectedControlID);
            alert(x);
        }

        function SetControl(c) {
            selectedControlID = c;
        }

        $(document).ready(function() {


            $("#color1").val("#79B933");
            $("#color2").val("yellow"); 
        
            $('#color1').colorPicker(); $('#color2').colorPicker(); });

            $('#color1').change(function () {
                var c = $('#color1').val();
                ClearSignature(selectedControlID);
                SignatureColor(selectedControlID, c);
            })

            $('#color2').change(function() {
                var c = $('#color2').val();
                ClearSignature(selectedControlID);
                SignatureBackColor(selectedControlID, c);
            }
           
        );
    </script>
    
</asp:Content>
