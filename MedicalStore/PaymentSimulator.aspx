<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSimulator.aspx.cs" Inherits="MedicalStore.PaymentSimulator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Simulator</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .btn-success {
            background-color: green;
            color: white;
        }

        .btn-danger {
            background-color: red;
            color: white;
        }

        .center-content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Additional CSS for auto resizing layout */
        html, body {
            height: 100%;
        }

        .container {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
    <div class="container">
        <div class="row center-content">
            <div class="col">
                <h1 class="text-center">Payment Simulator</h1>
                <asp:Button ID="btnSuccess" runat="server" Text="Success" CssClass="btn btn-success" OnClick="btnSuccess_Click" Height="85px" Width="350px" />
                <asp:Button ID="btnFailed" runat="server" Text="Failed" CssClass="btn btn-danger" OnClick="btnFailed_Click" Height="85px" Width="350px" />
                <br></br>
                <div class="text-center">
                    <h3>Payment Details</h3>
                    <p>
                        Payment ID: <asp:Label ID="lblPaymentID" runat="server"></asp:Label>
                    </p>
                    <p>
                        Payment Method: <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
                    </p>
                    <p>
                        Payment Amount: <asp:Label ID="lblPaymentAmount" runat="server"></asp:Label>
                    </p>
                    <p>
                        Payment Date and Time: <asp:Label ID="lblPaymentDateTime" runat="server"></asp:Label>
                    </p>

                </div>
            </div>
        </div>
    </div>
</form>

</body>
</html>
