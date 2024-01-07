<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ownedDetails.aspx.cs" Inherits="awad.WebForm14" %>
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
                    <asp:Image ID="Image" runat="server" style="width: 150px; height:auto;"></asp:Image>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><asp:Label ID="Name" runat="server" Text='Label'></asp:Label></h5>
                </div>
                <div class="card-body">
                    <asp:Button ID="DownloadButton" runat="server" Text="Download" OnClick="DownloadButton_Click" />
                </div>
                <asp:Label ID="ID" runat="server" Text='Label' Visible="False"></asp:Label> 
            </div>
        </body>
    </html>
</asp:Content>
