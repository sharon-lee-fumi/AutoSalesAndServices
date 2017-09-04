<%--
    author: Xiaowen Li
    Add a Sales Invoice page: Add a Sales Invoice into database, and perform validation check
    --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="AddSalesInvoice.aspx.cs" Inherits="AutoSalesAndServices.AddSalesInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderSidebar" runat="server">
    <br />
    <br />
    <div style="text-align: center; width: 200px; margin-top: 30px;" id="list">
        <asp:LinkButton ID="lbtnSaveSalesInvoice" runat="server" OnClick="lbtnSaveSalesInvoice_Click" >Save</asp:LinkButton>
        <br />
        <br />
        <asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/SalesInvoices.aspx">Cancel</asp:HyperLink>
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h3>&nbsp;&nbsp; Add a Sales Invoice</h3>
    <p style="text-align: center"><em>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </em></p>
    
        <table style="width: 65%; height: 190px; margin:auto;">
            <tr>
                <td style="width: 151px">Sales Invoice Id:</td>
                <td style="width: 252px">
                    <asp:Label ID="lblSalesInvoiceId" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 151px">Customer Name:</td>
                <td style="width: 252px">
                    <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerName" ErrorMessage="Customer name is Required" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 151px">Serial Number:</td>
                <td style="width: 252px">
                    <asp:TextBox ID="txtSerial" runat="server" AutoPostBack="True" OnTextChanged="txtSerial_TextChanged" ></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSerial" ErrorMessage="Serial Number is Required" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 151px">Sales Date:</td>
                <td style="width: 252px">
                    <asp:Label ID="lblSalesDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 151px">Salesman:</td>
                <td style="width: 252px">
                    <asp:TextBox ID="txtSalesman" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSalesman" ErrorMessage="Salesman is Required" ForeColor="Red" SetFocusOnError="True">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 151px">Net Price:</td>
                <td style="width: 252px">
                    <asp:Label ID="lblNetPrice" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 151px; height: 26px;">Tax:</td>
                <td style="height: 26px; width: 252px;">
                    <asp:Label ID="lblTax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 151px">Total Price:</td>
                <td style="width: 252px">
                    <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                </td>
            </tr>
            </table>
</asp:Content>
