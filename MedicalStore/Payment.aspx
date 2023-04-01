<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="MedicalStore.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="container">
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Your cart</span>
                            <span class="badge bg-primary rounded-pill">3</span>
                        </h4>
                        <ul class="list-group mb-3">
                            <asp:Repeater ID="cartRepeater" runat="server">
                                <ItemTemplate>
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h6 class="my-0">Product name</h6>
                                            <small class="text-muted">Brief description</small>
                                        </div>
                                        <span class="text-muted">$12</span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Promo code">
                            <button type="submit" class="btn btn-secondary">Redeem</button>
                        </div>
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Billing address</h4>

                        <div class="row g-3">
                            <div class="col-12">
                                <label for="firstName" class="form-label">Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-12">
                                <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <hr class="my-4" />


                            <div class="row">
                                <h4>Payment</h4>
                                <asp:RadioButtonList ID="paymentMethod" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="Credit" Text="&nbsp;Credit Card" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="FPX" Text="&nbsp;FPX"></asp:ListItem>
                                    <asp:ListItem Value="E-Wallet" Text="&nbsp;E-Wallet"></asp:ListItem>
                                    <asp:ListItem Value="Cash" Text="&nbsp;Cash"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                            <div class="row gy-3">
                                <div class="col-md-6">
                                    <label for="cc-name" class="form-label">Name on card</label>
                                    <asp:TextBox ID="txtCardName" CssClass="form-control" runat="server"></asp:TextBox>
                                    <small class="text-muted">Full name as displayed on card</small>
                                </div>

                                <div class="col-md-6">
                                    <label for="cc-number" class="form-label">Credit card number</label>
                                    <asp:TextBox ID="txtCardNum" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="col-md-3">
                                    <label for="cc-expiration" class="form-label">Expiration</label>
                                    <asp:TextBox ID="txtExpiry" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="col-md-3">
                                    <label for="cc-cvv" class="form-label">CVV</label>
                                    <asp:TextBox ID="txtCvv" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                            <hr class="my-4" />
                            <asp:Button ID="btnCheckout" Text="Continue to Checkout" CssClass="btn btn-primary btn-lg w-100" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script src="Scripts/bootstrap.bundle.min.js"></script>
<script src="Scripts/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/3bc98c6174.js" crossorigin="anonymous"></script>

</html>
