<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CabRequestUserControl.ascx.cs" Inherits="LTI.CabsManagement.CabRequest.CabRequestUserControl" %>



<style type="text/css">
    .auto-style2 {
        width: 14%;
    }
    .auto-style3 {
        margin-left: 0px;
       
    }
    .yourclass {
        font-weight: bold;
        margin-left: 0px;
    }
    .sty {
        font-weight: bold;
    }
</style>



<table style="width: 100%; padding: 3px; border: 3px solid black;">
    <tr style="text-align: left;">
        <td class="auto-style2" >&nbsp;</td>
        <td style="text-align: left;font-size: 30px" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CAB REQUEST</td>
    </tr>
    <tr style="text-align: left;">
        <td class="auto-style2" >&nbsp;</td>
        <td style="text-align: left;">
            &nbsp;</td>
        <td style="width: 20%" >
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr style="text-align: left;">
        <td class="auto-style2">

&nbsp;&nbsp;&nbsp;

<asp:Label ID="Label1" runat="server" CssClass="yourclass" Text="Requested By"></asp:Label>

            :</td>
        <td style="text-align: left;">
            <asp:TextBox ID="txtName" runat="server" Width="302px" CssClass="auto-style3" Height="16px"></asp:TextBox>
<asp:RequiredFieldValidator ID="valName" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br />
            <br />
        </td>
        <td style="font-weight: bold">
            Trip Type : 
        </td>
        <td>
            <asp:DropDownList ID="ddlTripType"  runat="server" AutoPostBack="True" Height="20px" Width="311px" OnSelectedIndexChanged="ddlTripType_SelectedIndexChanged"  >
                <asp:ListItem>Office to Home</asp:ListItem>
                <asp:ListItem>Home to Office</asp:ListItem>
            </asp:DropDownList>
<asp:RequiredFieldValidator ID="valTripType" runat="server" ControlToValidate="ddlTripType" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbPhone" runat="server"  CssClass="yourclass" Text="Phone Number:"></asp:Label>
        </td>
        <td colspan="3">
    <asp:TextBox ID="txtConNNum"   runat="server" Height="16px" Width="302px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConNNum" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtConNNum" ErrorMessage="Please enter 10 digit  number" ValidationExpression="(?&lt;!\d)\d{10}(?!\d)"></asp:RegularExpressionValidator>
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbPickUpLoc"  CssClass="yourclass" runat="server" Text="Pick Up Location"></asp:Label>
            :</td>
        <td>
    <asp:DropDownList ID="ddlPickUpLoc"   runat="server" style="margin-left: 2px" Height="19px" Width="311px">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="valddlPickUpLoc" runat="server" ControlToValidate="ddlPickUpLoc" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br />
            <br />
        </td>
        <td>
    <asp:Label ID="txtDropLoc" CssClass="yourclass"  runat="server" Text="Drop Location"></asp:Label>
            :</td>
        <td>
    <asp:DropDownList ID="ddlDropLoc"  runat="server" Height="20px" Width="311px">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="valddlDropLoc" runat="server" ControlToValidate="ddlDropLoc" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbPickUpTime"  CssClass="yourclass" runat="server" Text="Pick Up Time"></asp:Label>
            :</td>
        <td>
<SharePoint:DateTimeControl ID="PickUpTime" runat="server" AutoPostBack="True" IsRequiredField="True" OnDataBinding="PickUpTime_DataBinding" />
            <br />
        </td>
        <td colspan="2">
    <asp:Label ID="lbError" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbHomeAdd"  CssClass="yourclass" runat="server" Text="Drop Address"></asp:Label>
            :</td>
        <td colspan="2">
    <asp:TextBox ID="txtHomeAdd" runat="server" Height="59px" style="margin-top: 4px" TextMode="MultiLine" Width="452px" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />
        </td>
        <td></td>
    </tr>

    <tr>
        <td class="auto-style2">
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbManName" runat="server"  CssClass="yourclass" Text="Manager:"></asp:Label>
        </td>
        <td>
    <asp:TextBox ID="txtManName" runat="server" style="margin-left: 0px" Width="300px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valManName" runat="server" ControlToValidate="txtManName" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
    <asp:Label ID="lbman" runat="server"></asp:Label>
            <br />
            <br />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td class="auto-style2">
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbNotes" CssClass="yourclass" runat="server" Text="Notes"></asp:Label>
            :</td>
        <td colspan="2">
    <asp:TextBox ID="txtNotes"  runat="server" TextMode="MultiLine" Width="446px" Height="124px"></asp:TextBox>
            <br />
            <br />
        </td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td colspan="2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnRequest"  runat="server" OnClick="btnRequest_Click" Text="SAVE"  CssClass="yourclass" Width="47px" />
        </td>
        <td>&nbsp;</td>
    </tr>

</table>

