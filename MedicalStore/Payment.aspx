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
                        <h5 class="text-primary">Total Payment Amount: RM<asp:Label ID="lblTotalPaymentAmount" runat="server"></asp:Label></h5>
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Delivery address</h4>

                        <div class="row g-3">
                            <div class="col-12">
                                <label for="deliveryname" class="form-label">Full Name</label>
                                <asp:TextBox ID="txtDeliveryName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-12">
                                <label for="deliveryphoneno" class="form-label">Phone number</label>
                                <asp:TextBox ID="txtDeliveryPhone" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-12">
                                <label for="deliveryaddress" class="form-label">Address</label>
                                <asp:TextBox ID="txtDeliveryAddress" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-12">
                                <label for="deliverygcity" class="form-label">City</label>
                                <asp:TextBox ID="txtDeliveryCity" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-12">
                                <label for="deliverypostcode" class="form-label">Post code</label>
                                <asp:TextBox ID="txtDeliveryPostCode" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <hr class="my-4" />


                            <div class="row">
                                <h4>Payment Method</h4>
                                <asp:RadioButtonList ID="paymentMethod" CssClass="form-control" runat="server" OnSelectedIndexChanged="paymentMethod_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="Credit Card" Text="&nbsp;Credit Card" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="FPX" Text="&nbsp;FPX"></asp:ListItem>
                                    <asp:ListItem Value="E-Wallet" Text="&nbsp;E-Wallet"></asp:ListItem>
                                    <asp:ListItem Value="COD" Text="&nbsp;Cash On Delivery"></asp:ListItem>
                                </asp:RadioButtonList>


                            </div>

                            <div class="row gy-3">

                                <asp:Panel ID="creditCardPanel" runat="server" Visible="true">
                                    <!-- Content for credit card payment method goes here -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="cc-number" class="form-label">Credit card number</label>
                                            <asp:TextBox ID="txtBillingCardNum" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="cc-expiration" class="form-label">Expiration</label>
                                            <asp:TextBox ID="txtBillingExpiry" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-2">
                                            <label for="cc-cvv" class="form-label">CVV</label>
                                            <asp:TextBox ID="txtBillingCvv" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br></br>
                                    <h5 class="mb-3">Billing address</h5>
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="billingname" class="form-label">Full Name</label>
                                            <asp:TextBox ID="txtBillingName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-12">
                                            <label for="billingphoneno" class="form-label">Phone number</label>
                                            <asp:TextBox ID="txtBillingPhoneNo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-12">
                                            <label for="billingaddress" class="form-label">Address</label>
                                            <asp:TextBox ID="txtBillingAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-12">
                                            <label for="billingcity" class="form-label">City</label>
                                            <asp:TextBox ID="txtBillingCity" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-12">
                                            <label for="billingpostcode" class="form-label">Post code</label>
                                            <asp:TextBox ID="txtBillingPostCode" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                </asp:Panel>

                                <asp:Panel ID="fpxPanel" runat="server" Visible="false">
                                    <div class="col-12">
                                        <label for="bankname" class="form-label">Choose a bank to proceed :</label>
                                        <asp:DropDownList ID="bankname" runat="server">
                                            <asp:ListItem Text="Maybank" Value="Maybank"></asp:ListItem>
                                            <asp:ListItem Text="CIMB Bank" Value="CIMB Bank"></asp:ListItem>
                                            <asp:ListItem Text="Public Bank" Value="Public Bank"></asp:ListItem>
                                            <asp:ListItem Text="RHB Bank" Value="RHB Bank"></asp:ListItem>
                                            <asp:ListItem Text="Hong Leong Bank" Value="Hong Leong Bank"></asp:ListItem>
                                            <asp:ListItem Text="Bank Islam" Value="Bank Islam"></asp:ListItem>
                                            <asp:ListItem Text="AmBank" Value="AmBank"></asp:ListItem>
                                            <asp:ListItem Text="Affin Bank" Value="Affin Bank"></asp:ListItem>
                                            <asp:ListItem Text="Standard Chartered Bank" Value="Standard Chartered Bank"></asp:ListItem>
                                            <asp:ListItem Text="Alliance Bank" Value="Alliance Bank"></asp:ListItem>
                                            <asp:ListItem Text="HSBC Bank" Value="HSBC Bank"></asp:ListItem>

                                        </asp:DropDownList>
                                    </div>


                                </asp:Panel>

                                <asp:Panel ID="eWalletPanel" runat="server" Visible="false">
                                    <!-- Content for E-Wallet payment method goes here -->
                                </asp:Panel>

                                <asp:Panel ID="cashOnDeliveryPanel" runat="server" Visible="false">
                                    <!-- Content for Cash payment method goes here -->
                                </asp:Panel>

                            </div>

                            <hr class="my-4" />
                            <asp:Button ID="btnCheckout" Text="Continue to Checkout" CssClass="btn btn-primary btn-lg w-100" runat="server" OnClick="btnCheckout_Click" />
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
