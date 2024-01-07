<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="awad.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    </head>
    <body>
        <h1 class="display-3 text-center" style="margin-top:50px">Latest Artworks</h1> 
        <h1 class="lead text-center" style="margin-top:-10px;margin-bottom:50px;font-family:Autography;">by Artasy</h1>
        <hr />
        <h1 class="display-6 text-center" style="margin-top:50px">Collection: Nature</h1> 
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
        <hr />
        <h1 class="display-6 text-center" style="margin-top:50px">Collection: Food</h1> 
                    <div class="container">
                <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                    <asp:Repeater ID="Repeater2" runat="server">
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
        <hr />
        <h1 class="display-6 text-center" style="margin-top:50px">Collection: Fashion</h1> 
                    <div class="container">
                <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                    <asp:Repeater ID="Repeater3" runat="server">
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
        <hr />
    </body>
    </html>
</asp:Content>
                    
