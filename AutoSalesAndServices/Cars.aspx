<%--
    author: Xiaowen Li
    Car page: shows all cars, or selected cars from database
    --%>


<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="AutoSalesAndServices.Cars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderSidebar" runat="server">
    <div style="text-align: center; width: 200px; margin-top: 30px;" id="list">
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddCar.aspx">Add a Car</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Report.aspx">View Report </asp:HyperLink>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h3>&nbsp;Cars&nbsp;</h3>
         <table style="width:88%; text-align: center; margin:auto">
            <tr>
                <td style="text-align: left; width: 353px">Serial Number: <asp:TextBox ID="txtSerialNum" runat="server" Width="50px"></asp:TextBox>
                &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtSerialNum" Display="Dynamic" ErrorMessage="Number is wrong" ForeColor="Red" MaximumValue="9999" MinimumValue="1" SetFocusOnError="True" Type="Integer">Entey a number</asp:RangeValidator>
                </td>
                <td style="text-align: left; width: 290px;">Make: 
                    <asp:TextBox ID="txtMake" runat="server"></asp:TextBox>
                </td>
                <td style="text-align: left; ">Model: 
                    <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; width: 353px">&nbsp;Year: <asp:TextBox ID="txtYear" runat="server" Width="96px"></asp:TextBox>
                &nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtYear" Display="Dynamic" ErrorMessage="Year is wrong" ForeColor="Red" MaximumValue="2017" MinimumValue="1990" SetFocusOnError="True" Type="Integer">Year between 1990-2017</asp:RangeValidator>
                </td>
                <td style="text-align: left; width: 290px">Color: <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                </td>
                <td style="width: 240px;">&nbsp; <asp:Button ID="btnSearchCar" runat="server" Text="Search" OnClick="btnSearchCar_Click" Height="33px" Width="75px"  />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; height: 33px;" colspan="3">
                    <em><strong>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </strong></em>&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
        </table>
   
    <br />
   
    <asp:GridView ID="grdCars" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="Black" GridLines="Vertical" PageSize="7" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" ReadOnly="True" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" ReadOnly="True" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
            <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
            <asp:BoundField DataField="PurchaseFrom" HeaderText="PurchaseFrom" SortExpression="PurchaseFrom" />
            <asp:BoundField DataField="PurchaseCost" HeaderText="PurchaseCost" SortExpression="PurchaseCost" />
            <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="AutoSalesAndServices.CarsBLL" SelectMethod="GetAllCars" TypeName="AutoSalesAndServices.CarsBLL" UpdateMethod="UpdateCar" OldValuesParameterFormatString="original_{0}">
    </asp:ObjectDataSource>
    <br />
    <asp:GridView ID="grdCarOptions" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" PageSize="7" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" ReadOnly="True" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" ReadOnly="True" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
            <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
            <asp:BoundField DataField="PurchaseFrom" HeaderText="PurchaseFrom" SortExpression="PurchaseFrom" />
            <asp:BoundField DataField="PurchaseCost" HeaderText="PurchaseCost" SortExpression="PurchaseCost" />
            <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="AutoSalesAndServices.CarsBLL" SelectMethod="GetCarByOptions" TypeName="AutoSalesAndServices.CarsBLL" UpdateMethod="UpdateCar">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSerialNum" DefaultValue="0" Name="serial" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="txtMake" DefaultValue="null" Name="make" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtModel" DefaultValue="null" Name="model" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtYear" DefaultValue="null" Name="year" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtColor" DefaultValue="null" Name="color" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
   
    <br />
</asp:Content>
