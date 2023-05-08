<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MedicalStore.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title>Sign Up</title>

    <style>
        .glass {
            background: rgba(255, 255, 255, 0);
            border-radius: 16px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
    </style>

</head>
<body>
    <section class="vh-100" style="background-image: url(Images/register-background.jpg); background-size: cover">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-12 col-xl-11">
                    <div class="card text-black" style="border-radius: 25px;">
                        <div class="card-body p-md-5 glass-css">
                            <div class="row justify-content-center">
                                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign Up</p>

                                    <form id="registerForm" class="mx-1 mx-md-4" runat="server">

                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                                        </div>
                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <asp:Label ID="lblMsg" runat="server" CssClass="text-success"></asp:Label>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" ToolTip="Your Username"></asp:TextBox>
                                                <label class="form-label" for="txtName">Username</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">

                                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" ToolTip="Your Email" TextMode="Email"></asp:TextBox>
                                                <label class="form-label" for="txtEmail">Email</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" ToolTip="Your Password" TextMode="Password"></asp:TextBox>
                                                <label class="form-label" for="txtPassword">Password</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <asp:TextBox ID="txtRepeatPw" CssClass="form-control" runat="server" ToolTip="Your Repeat Password" TextMode="Password"></asp:TextBox>
                                                <label class="form-label" for="txtRepeatPw">Repeat your password</label>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <asp:TextBox ID="txtOTP" CssClass="form-control" runat="server" ToolTip="OTP" TextMode="Password"></asp:TextBox>
                                                <label class="form-label" for="txtOTP">OTP</label>
                                            </div>
                                        </div>

                                        <div class="form-check d-flex justify-content-center mb-3">
                                            <asp:CheckBox ID="formCheck" runat="server" />
                                            <label class="form-check-label" for="form2Example3">
                                                &nbsp;
                                                I agree all statements in <a href="#!">Terms of service</a>
                                            </label>
                                        </div>

                                        <div class="d-flex justify-content-center mx-4 mb-2 mb-lg-4">
                                            <label class="form-check-label" for="form2Example3">
                                                Already had an account? Login <a href="Login.aspx">Here</a>
                                            </label>
                                        </div>

                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <asp:Button ID="btnOtp" CssClass="btn btn-primary btn-lg" Text="Generate OTP" runat="server" OnClick="btnOtp_Click" />
                                        </div>

                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <asp:Button ID="btnRegister" CssClass="btn btn-primary btn-lg" Text="Register" runat="server" OnClick="btnRegister_Click" />
                                        </div>
                                    </form>

                                </div>
                                <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                        class="img-fluid" alt="Sample image" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</body>
<script src="Scripts/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/3bc98c6174.js" crossorigin="anonymous"></script>

</html>
