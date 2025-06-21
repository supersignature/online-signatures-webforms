<%@ Page Title="Adjust Width and Height Of Signature Pad Area" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="Width.aspx.cs" Inherits="Online.Signatures.Webforms.Width" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td style="width: 50%">
                <asp:Table ID="Table5" runat="server" Width="100%" Caption="Client Acceptance">
                    <asp:TableRow ID="TableRow7" runat="server">
                        <asp:TableCell>Name</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtClientName" Width="90%" runat="server"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow8" runat="server">
                        <asp:TableCell>Signature</asp:TableCell>
                        <asp:TableCell Width="100%">
                            <div id="wrapper2">
                                <cc1:mousesignature id="sigClient" runat="server" signheight="150" signrequiredpoints="10">
                                </cc1:mousesignature>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow15" runat="server">
                        <asp:TableCell>Email Address</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtClientEmailAddress" Width="100%" runat="server"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </td>
            <td style="width: 50%">
                <asp:Table ID="Table6" runat="server" Width="100%" Caption="Employee Details">
                    <asp:TableRow ID="TableRow9" runat="server">
                        <asp:TableCell>Name</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEmployeeName" runat="server" Width="90%"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow10" runat="server">
                        <asp:TableCell>Signature</asp:TableCell>
                        <asp:TableCell>
                            <div id="wrapper2">
                                <cc1:mousesignature id="sigEmployee" runat="server" signheight="150" signrequiredpoints="10">
                                </cc1:mousesignature>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow14" runat="server">
                        <asp:TableCell>Email Address</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEmployeeEmailAddress" runat="server" Width="100%"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(window).load(function () { var w = $('#wrapper2').width() - 20; var h = $('#wrapper2').height() - 20; ResizeSignature("<%= sigEmployee.uID %>", w, h); ResizeSignature("<%= sigClient.uID %>", w, h); });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="Server">
    <ul>
        <li>Adjust width and height for signature area</li>
    </ul>
</asp:Content>