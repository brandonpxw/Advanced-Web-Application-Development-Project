<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="awad.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Search</title>
        <link rel="stylesheet" type="text/css" href="assets/css/Search.css" />
    </head>
    <body>
        <div style="margin:50px;" class="text-center">
            <h1 class="display-6">Search Result</h1>
            <asp:TextBox ID="txtSearch" runat="server" Enabled="false"></asp:TextBox>
        </div>
        <div class="container">
            <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                <asp:Label ID="noResult" runat="server" Text="No Results Found." Visible="false"></asp:Label>
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
