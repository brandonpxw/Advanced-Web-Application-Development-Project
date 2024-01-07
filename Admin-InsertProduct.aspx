<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin-InsertProduct.aspx.cs" Inherits="awad.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <body>
        <div class="display-5 text-center" style="margin-bottom:30px;">
            Insert Product
        </div>
        <div style="text-align:center">
            <div class="mb-3">
                <asp:Label ID="productID" runat="server" Text="Product ID" ></asp:Label>
                <asp:TextBox ID="txtProductID" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label2" runat="server" Text="Product Description"></asp:Label>
                <asp:TextBox ID="txtProductDesc" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label3" runat="server" Text="Product Price"></asp:Label>
                <asp:TextBox ID="txtProductPrice" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label4" runat="server" Text="Product Image"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label ID="Label5" runat="server" Text="Product Colour"></asp:Label>
                <asp:TextBox ID="txtProductColour" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label6" runat="server" Text="Product Collection"></asp:Label>
                <asp:TextBox ID="txtProductCollection" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label7" runat="server" Text="Product Owner"></asp:Label>
                <asp:TextBox ID="txtProductOwner" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button CssClass="btns" ID="btnInsertItems" runat="server" Text="Insert" OnClick="btnInsertItems_Click" />
                <asp:Button CssClass="btns" ID="btnBack" runat="server" Text="Back" BackColor="#2196F3" OnClick="btnBack_Click" />
            </div>
        </div>
    </body>
    </html>
</asp:Content>
