<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="awad.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <style>

            .leftcontainer {
                width: 60%;
                height: auto;
                float: left;
                margin-top: 30px;
                margin-left:50px;
            }

            .ordersummary {
                width: 35%;
                height: 500px;
                float: right;
                border: 0.7px solid gray;
                margin-top: 43px;
                margin-bottom: 40px;
                padding: 20px;
            }

            table, th, td {
                border: none;
            }

            table {
                width: 100%;
                display: table;
                border-collapse: collapse;
                border-spacing: 0;
            }
        </style>
    </head>
        <body>
        <div class="leftcontainer">
            <div class="display-5" style="margin:30px;">My Shopping Cart</div>
            <asp:GridView ID="gv_CartView" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" GridLines="None" ShowHeader="False" OnRowCommand="gv_CartView_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table style="border: 0.9px solid gray;">
                                <tr style="border: none;">
                                    <td style="border: none; width: 130px; padding: 20px; ">
                                        <asp:Image ID="imgPoster" ImageUrl='<%#Eval("Product_Image") %>' runat="server" Style="height: 220px; width: 140px;" />
                                    </td>

                                    <td style="border: none">
                                        <table>
                                            <tr style="border: none">
                                                <td style="border: none">
                                                    <asp:Label ID="pdName" runat="server" Text='<%#Eval("Product_Name") %>'></asp:Label>
                                                    <br></br>
                                                    by
                                                    <asp:Label ID="pdOwner" runat="server" Text='<%#Eval ("Product_Owner") %>'></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="border: none">
                                                <td>$
                                                    <asp:Label ID="pdPrice" runat="server" Text='<%#Eval("Product_Price") %>'></asp:Label>
                                                    <asp:Label runat="server" Text="per item"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="border: none;">
                                                <td style="font-size: 12px;">
                                                    <asp:LinkButton ID="linkRemove" runat="server" Text="Remove" CommandArgument='<%#Eval("ItemID") %>' CommandName="Remove"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="ordersummary" >
            <div class="display-5" style="text-align: center;margin-bottom:20px;">
                Order Summary                                                                
            </div>

            <div style="font-size: 20px; float: left;">
                <p>Subtotal</p>
                <p>Estimated Shipping</p>
            </div>

            <div class="pricescript" style=" font-size: 20px; float: right;">
                <p>
                    <asp:Label ID="TotalPrice" runat="server" Text="$0.00"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="ShippingPrice" runat="server" Text="$0.00"></asp:Label>
                </p>
            </div>

            <div class="checkout" style="width: 100%; float: left; border-top: 0.5px solid black; border-bottom: 0.5px solid black;">
                <div class="ordertotal" style="font-size: 20px; font-weight: bold; padding-top:30px; padding-bottom:30px;">
                    <p style="float: left;">Order Total:</p>
                    <p style="float: right">
                        <asp:Label ID="TotalPrice2" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
            <div class="altpayment">
                <asp:Button ID="btnCheckOut" type="button" runat="server" Text="Checkout" class="checkoutbtn" OnClick="btnCheckOut_Click" style="width: 100%; float: left; padding-top:30px; padding-bottom:30px; margin-top:30px;"/>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
