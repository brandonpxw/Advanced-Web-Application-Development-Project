<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin-Product.aspx.cs" Inherits="awad.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
        <head>
            <title>Admin - Product</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        </head>
    </html>
    <body>
        <div class="container-fluid"><h1 class="display-3 text-center">Products</h1></div>
        <div class="d-flex justify-content-center" style="margin-bottom:30px;">
            <asp:Button ID="btnAddItem" runat="server" Text="INSERT" OnClick="btnAddItem_Click" type="button" class="btn btn-dark"/>
        </div>
        <div class="Products">
            <div class="container">
                <div class="row g-2">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="col" style="text-align:center;">
                                <div class="p-3 border bg-light">
                                    <asp:ImageButton ID="Product_Image" style="width: 150px; height:auto;" ImageUrl='<%#Eval("Product_Image") %>' runat="server" />
                                    <asp:TextBox ID="txtImage" Text='<%#Eval("Product_Image")%>' runat="server" Visible="False"></asp:TextBox>
                                    <br />
                                        
                                    Title: <asp:Label ID="Product_Name" runat="server" Text='<%#Eval("Product_Name")%>'></asp:Label>
                                    <asp:TextBox ID="txtTitle" Text='<%#Eval("Product_Name")%>' runat="server" Visible="False"></asp:TextBox>
                                    <hr />
                                    Owner: <asp:Label ID="Product_Owner" runat="server" Text='<%#Eval("Product_Owner")%>'></asp:Label>
                                    <asp:TextBox ID="txtOwner" Text='<%#Eval("Product_Owner")%>' runat="server" Visible="False"></asp:TextBox>
                                    <br />
                                    Description: <asp:Label ID="Product_Desc" runat="server" Text='<%#Eval("Product_Desc") %>'></asp:Label>
                                    <asp:TextBox ID="txtDesc" Text='<%#Eval("Product_Desc") %>' runat="server" Visible="False"></asp:TextBox>
                                    <br />
                                    Price: $<asp:Label ID="Product_Price" runat="server" Text='<%#Eval("Product_Price") %>'></asp:Label>
                                    <asp:TextBox ID="txtPrice" Text='<%#Eval("Product_Price") %>' runat="server" Visible="False"></asp:TextBox>
                                    <br />
                                    Colour: <asp:Label ID="Product_Colour" runat="server" Text='<%#Eval("Product_Colour") %>'></asp:Label>
                                    <asp:TextBox ID="txtColour" Text='<%#Eval("Product_Colour") %>' runat="server" Visible="False"></asp:TextBox>
                                    <br />
                                    Collection: <asp:Label ID="Product_Collection" runat="server" Text='<%#Eval("Product_Collection") %>'></asp:Label>
                                    <asp:TextBox ID="txtCollection" Text='<%#Eval("Product_Collection") %>' runat="server" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:Label ID="Product_ID" runat="server" Text='<%# Eval("Product_ID") %>' Visible="False"></asp:Label>
                                    <br />

                                    
                                    <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="OnEdit" Font-Size="X-Small" />
                                    <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdate" Font-Size="X-Small" />
                                    <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                                    <asp:LinkButton
                                        ID="lnkDelete"
                                        Text="Delete"
                                        runat="server"
                                        OnClick="OnDelete"
                                        OnClientClick="return confirm('Are you sure you want to delete this?');"
                                        Font-Size="X-Small" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </body>




</asp:Content>
