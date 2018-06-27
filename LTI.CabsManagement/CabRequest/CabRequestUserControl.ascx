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
        width: 20%;
    }
    .auto-style3 {
        margin-left: 0px;
    }
    .auto-style4 {
        margin-left: 218px;
    }
</style>



<table style="width: 100%; padding: 5px; border: 1px solid lightgray;">
    <tr style="text-align: left;">
        <td class="auto-style2" >&nbsp;</td>
        <td style="text-align: left;" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CAB REQUEST</td>
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

<asp:Label ID="Label1" runat="server" Text="Requested By"></asp:Label>

        </td>
        <td style="text-align: left;">
            <asp:TextBox ID="txtName" runat="server" Width="250px" CssClass="auto-style3"></asp:TextBox>
<asp:RequiredFieldValidator ID="valName" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        </td>
        <td>
            Trip Type : 
        </td>
        <td>
            <asp:DropDownList ID="ddlTripType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTripType_SelectedIndexChanged" CssClass="auto-style3">
                <asp:ListItem>Office to Home</asp:ListItem>
                <asp:ListItem>Home to Office</asp:ListItem>
            </asp:DropDownList>
<asp:RequiredFieldValidator ID="valTripType" runat="server" ControlToValidate="ddlTripType" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
    <asp:Label ID="lbPhone" runat="server" Text="Phone Number:"></asp:Label>
        </td>
        <td>
    <asp:TextBox ID="txtConNNum" runat="server" Height="19px" Width="137px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConNNum" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtConNNum" ErrorMessage="Please enter 10 digit  number" ValidationExpression="(?&lt;!\d)\d{10}(?!\d)"></asp:RegularExpressionValidator>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">
    <asp:Label ID="lbPickUpLoc" runat="server" Text="Pick Up Location"></asp:Label>
        </td>
        <td>
    <asp:DropDownList ID="ddlPickUpLoc" runat="server" style="margin-left: 2px">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="valddlPickUpLoc" runat="server" ControlToValidate="ddlPickUpLoc" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        </td>
        <td>
    <asp:Label ID="txtDropLoc" runat="server" Text="Drop Location"></asp:Label>
        </td>
        <td>
    <asp:DropDownList ID="ddlDropLoc" runat="server">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="valddlDropLoc" runat="server" ControlToValidate="ddlDropLoc" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
    <asp:Label ID="lbPickUpTime" runat="server" Text="Pick Up Time"></asp:Label>
        </td>
        <td colspan="2">
<SharePoint:DateTimeControl ID="PickUpTime" runat="server" AutoPostBack="True" IsRequiredField="True" OnDataBinding="PickUpTime_DataBinding" />
        </td>
        <td>
    <asp:Label ID="lbError" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
    <asp:Label ID="lbHomeAdd" runat="server" Text="Drop Address"></asp:Label>
        </td>
        <td colspan="2">
    <asp:TextBox ID="txtHomeAdd" runat="server" Height="59px" style="margin-top: 4px" TextMode="MultiLine" Width="414px" CssClass="auto-style3"></asp:TextBox>
        </td>
        <td></td>
    </tr>

    <tr>
        <td class="auto-style2">
    <asp:Label ID="lbManName" runat="server" Text="Manager:"></asp:Label>
        </td>
        <td>
    <asp:TextBox ID="txtManName" runat="server" style="margin-left: 0px" Width="267px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valManName" runat="server" ControlToValidate="txtManName" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
    <asp:Label ID="lbman" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td class="auto-style2">
    <asp:Label ID="lbNotes" runat="server" Text="Notes"></asp:Label>
        </td>
        <td colspan="2">
    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Width="435px" Height="124px"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td colspan="2">
    <asp:Button ID="btnRequest" runat="server" OnClick="btnRequest_Click" Text="SAVE" CssClass="auto-style4" />
        </td>
        <td>&nbsp;</td>
    </tr>

</table>

