<%--
    author: Xiaowen Li
    Add a Car page: Add a car into database, and perform validation check
    --%>


<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="AddCar.aspx.cs" Inherits="AutoSalesAndServices.AddCar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderSidebar" runat="server">
    <br />
    <br />
    <div style="text-align: center; width: 200px; margin-top: 30px;" id="list">
        <asp:LinkButton ID="lbtnSaveCar" runat="server" OnClick="lbtnSaveCar_Click">Save</asp:LinkButton>
        <br />
        <br />
        <asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/Cars.aspx">Cancel</asp:HyperLink>
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h3>&nbsp;&nbsp; Add a Car</h3>
<p style="text-align: center"><em>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </em></p>
    
        <table style="width: 65%; height: 190px; margin:auto;">
            <tr>
                <td style="width: 146px">Serial Number:</td>
                <td>
                    <asp:Label ID="lblSerial" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Car Make:</td>
                <td>
                    <asp:TextBox ID="txtMake" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMake" ErrorMessage="Car make is Required" ForeColor="Red" SetFocusOnError="True">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Car Model:</td>
                <td>
                    <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtModel" ErrorMessage="Model is Required" ForeColor="Red" SetFocusOnError="True">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Year:</td>
                <td>
                    <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtYear" ErrorMessage="Year is Required" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Required</asp:RequiredFieldValidator>
                &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtYear" Display="Dynamic" ErrorMessage="Year is wrong" ForeColor="Red" MaximumValue="2017" MinimumValue="1990" SetFocusOnError="True" Type="Integer">Please entey year between 1990-2017</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Color:</td>
                <td>
                    <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtColor" ErrorMessage="Color is Required" ForeColor="Red" SetFocusOnError="True">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Purchase Date:</td>
                <td>
                    <asp:Label ID="lblPurchaseDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 146px; height: 26px;">Purchase From:</td>
                <td style="height: 26px">
                    <asp:TextBox ID="txtPurchasesName" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPurchasesName" ErrorMessage="Vendor is Required" ForeColor="Red" SetFocusOnError="True">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Purchase Cost:</td>
                <td>
                    <asp:TextBox ID="txtPurchaseCost" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPurchaseCost" ErrorMessage="Cost is Required" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Required</asp:RequiredFieldValidator>
                &nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPurchaseCost" Display="Dynamic" ErrorMessage="Cost is wrong" ForeColor="Red" MaximumValue="9999999" MinimumValue="0" SetFocusOnError="True" Type="Integer">Please entey a valid number</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">List Price:</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price is Required" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Required</asp:RequiredFieldValidator>
                &nbsp;<asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Price is wrong" ForeColor="Red" MaximumValue="9999999" MinimumValue="0" SetFocusOnError="True" Type="Integer">Please entey a valid number</asp:RangeValidator>
                </td>
            </tr>
        </table>
</asp:Content>
