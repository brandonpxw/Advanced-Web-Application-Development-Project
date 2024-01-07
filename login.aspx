<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="awad.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <form>
      <div class="imgcontainer">
        <img src="\assets\people-fill.svg" alt="Avatar" class="avatar">
      </div>

      <div class="container">
        <label for="uname"><b>Email</b></label>
        <asp:TextBox ID="txt_Email" CssClass="inputtxt" PlaceHolder="Email" runat="server" TextMode="Email"></asp:TextBox>
          <hr />
        <label for="psw"><b>Password</b></label>
        <asp:TextBox ID="txt_Password" CssClass="inputtxt" PlaceHolder="Password" runat="server" TextMode="Password"></asp:TextBox>
      </div>

      <div class="container" style="background-color:#f1f1f1">
        <asp:Button ID="btnSignIn" class="btnsignin" runat="server" Text="Sign In" OnClick="btnSignIn_Click" />
        <span class="psw"><a href="register.aspx">Create an Account</a></span>
      </div>
    </form>
    <style>
        /* Bordered form */
        form {
          border: 3px solid #f1f1f1;
        }

        /* Full-width inputs */
        input[type=text], input[type=password], input[type=Email] {
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          box-sizing: border-box;
        }

        /* Set a style for all buttons */
        button {
          background-color: #04AA6D;
          color: white;
          padding: 14px 20px;
          margin: 8px 0;
          border: none;
          cursor: pointer;
          width: 100%;
        }

        /* Add a hover effect for buttons */
        button:hover {
          opacity: 0.8;
        }

        /* Extra style for the cancel button (red) */
        .cancelbtn {
          width: auto;
          padding: 10px 18px;
          background-color: #f44336;
        }

        /* Center the avatar image inside this container */
        .imgcontainer {
          text-align: center;
          margin: 24px 0 12px 0;
        }

        /* Avatar image */
        img.avatar {
          width: 20%;
          border-radius: 50%;
        }

        /* Add padding to containers */
        .container {
          padding: 16px;
        }

        /* The "Forgot password" text */
        span.psw {
          float: right;
          padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
          span.psw {
            display: block;
            float: none;
          }
          .cancelbtn {
            width: 100%;
          }
        }
    </style>
</body>
</html>
</asp:Content>
