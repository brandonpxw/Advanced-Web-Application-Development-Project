<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="awad.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<form action="action_page.php" style="border:1px solid #ccc">
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="txt_RegEmail" class="col-sm-2 col-form-label">Email</label>
    <asp:TextBox ID="txt_RegEmail" CssClass="inputtxt" PlaceHolder="Email Address" runat="server" TextMode="Email"></asp:TextBox>

    <label for="txt_FirstName" class="col-sm-2 col-form-label">First Name</label>
    <asp:TextBox ID="txt_FirstName" CssClass="inputtxt" PlaceHolder="First Name" runat="server"></asp:TextBox>

    <label for="txt_LastName" class="col-sm-2 col-form-label">Last Name</label>
    <asp:TextBox ID="txt_LastName" CssClass="inputtxt" PlaceHolder="Last Name" runat="server"></asp:TextBox>

    <label for="txt_RegPassword" class="col-sm-2 col-form-label">Password</label>
    <asp:TextBox ID="txt_RegPassword" CssClass="inputtxt" PlaceHolder="Password" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RegularExpressionValidator ID="rev_Password" runat="server" ControlToValidate="txt_RegPassword"
                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
                    ErrorMessage="Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character (@$!%*?&)." Display="Dynamic" />

    <label for="txt_ConfirmPW" class="col-sm-2 col-form-label">Confirm Password</label>
    <asp:TextBox ID="txt_ConfirmPW" CssClass="inputtxt" PlaceHolder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidatorPW" runat="server" ErrorMessage="Passwords do not match." ControlToValidate="txt_ConfirmPW" ControlToCompare="txt_RegPassword" Operator="Equal" Type="String" ForeColor="Red"> </asp:CompareValidator>
    <div class="form-check">
    <input class="form-check-input" type="checkbox" id="gridCheck1" onclick="showDiv()">
    <label class="form-check-label" for="gridCheck1">
        Administrative Sign-Up
    </label>
    <div class="row mb-3" id="hiddenDiv" style="display:none;" >
        <div class="col-sm-10">
            <asp:TextBox ID="txt_isAdmin" CssClass="inputtxt" PlaceHolder="Admin Code" runat="server"></asp:TextBox>
        </div>
    </div>
</div>

        <div class="clearfix">
            <a href="login.aspx" >Back to Login</a>
            <asp:Button ID="btnRegister" class="signupbtn" runat="server" Text="Create Account" OnClick="btnRegister_Click" UseSubmitBehavior="false" />
        </div>
    </div>
</form>



    <script>
        function showDiv() {
            // Get the checkbox
            var checkBox = document.getElementById("gridCheck1");
            // Get the output text
            var text = document.getElementById("hiddenDiv");

            // If the checkbox is checked, display the output text
            if (checkBox.checked == true) {
                text.style.display = "block";
            } else {
                text.style.display = "none";
            }
        }  
    </script>
    <style>
        * {box-sizing: border-box}

        /* Full-width input fields */
          input[type=text], input[type=password], input[type=email] {
          width: 100%;
          padding: 15px;
          margin: 5px 0 22px 0;
          display: inline-block;
          border: none;
          background: #f1f1f1;
        }

        input[type=text]:focus, input[type=password]:focus, input[type=email]:focus {
          background-color: #ddd;
          outline: none;
        }

        hr {
          border: 1px solid #f1f1f1;
          margin-bottom: 25px;
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
          opacity: 0.9;
        }

        button:hover {
          opacity:1;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
          padding: 14px 20px;
          background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn, .signupbtn {
          float: left;
          width: 50%;
        }

        /* Add padding to container elements */
        .container {
          padding: 16px;
        }

        /* Clear floats */
        .clearfix::after {
          content: "";
          clear: both;
          display: table;
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
          .cancelbtn, .signupbtn {
            width: 100%;
          }

        }
    </style>
</body>
</html>
</asp:Content>
