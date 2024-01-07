<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="awad.WebForm8" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
        <head>
            <title>Product Details</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        </head>
        <body>
            <div class="card text-center" style="width: 25rem; margin-left:auto; margin-right:auto; margin-top:40px;">
                <div class="card-header">Artasy</div>
                <div style="display:flex; justify-content:center;">
                    <asp:Image ID="pdImg" runat="server" style="width: 150px; height:auto;"></asp:Image>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><asp:Label ID="pdName" runat="server" Text='Label'></asp:Label></h5>
                    <p class="card-text"><asp:Label ID="pdDesc" runat="server" Text='Label'></asp:Label></p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Colour: <asp:Label ID="pdColour" runat="server" Text='Label'></asp:Label></li>
                    <li class="list-group-item">Collection: <asp:Label ID="pdCollection" runat="server" Text='Label'></asp:Label></li>
                    <li class="list-group-item">Owner: <asp:Label ID="pdOwner" runat="server" Text='Label'></asp:Label></li>
                    <li class="list-group-item">Price: <asp:Label ID="pdPrice" runat="server" Text='Label'></asp:Label></li>
                </ul>
                <asp:Label ID="pdID" runat="server" Text='Label' Visible="False"></asp:Label> 
                <div class="card-body">
                    <asp:Button ID="btnAddCart" runat="server" Text="Add To Cart" class="btn btn-success" OnClick="btnAddCart_Click" />
                </div>
            </div>
        </body>
    </html>
</asp:Content>
