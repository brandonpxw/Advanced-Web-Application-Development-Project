<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="awad.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
        <head>
            <title>Shop</title> 
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        </head>
        <body>
            <div>
                <h1 class="display-4 text-center" style="margin:30px;">All Products</h1>
            </div>
            <div class="container">
                <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="p-3 border bg-light">
                                    <div style="display:flex; justify-content:center;margin:20px;">
                                        <asp:ImageButton PostBackUrl='<%# ResolveClientUrl("ProductDetails.aspx?pdID=" + Eval("Product_ID"))%>' ID="Product_Image" style="width: 150px; height:auto;" ImageUrl='<%#Eval("Product_Image") %>' runat="server"/>
                                        <asp:TextBox ID="txtImage" Text='<%#Eval("Product_Image")%>' runat="server" Visible="False"></asp:TextBox>
                                        <br />
                                    </div>
                                    <div style="margin-left:27px;">
                                        Title: <asp:Label ID="Product_Name" runat="server" Text='<%#Eval("Product_Name")%>'></asp:Label>
                                        <asp:TextBox ID="txtTitle" Text='<%#Eval("Product_Name")%>' runat="server" Visible="False"></asp:TextBox>
                                        <br />
                                    </div>
                                    <div style="margin-left:27px;">
                                        Colour: <asp:Label ID="Product_Colour" runat="server" Text='<%#Eval("Product_Colour") %>'></asp:Label>
                                        <asp:TextBox ID="txtColour" Text='<%#Eval("Product_Colour") %>' runat="server" Visible="False"></asp:TextBox>
                                        <br />
                                    </div>
                                    <div style="margin-left:27px;">
                                        Collection: <asp:Label ID="Product_Collection" runat="server" Text='<%#Eval("Product_Collection") %>'></asp:Label>
                                        <asp:TextBox ID="txtCollection" Text='<%#Eval("Product_Collection") %>' runat="server" Visible="False"></asp:TextBox>
                                        <br />
                                    </div>
                                <asp:Label ID="Product_ID" runat="server" Text='<%# Eval("Product_ID") %>' Visible="False"></asp:Label>
                                <br />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </body>
    </html>
</asp:Content>
