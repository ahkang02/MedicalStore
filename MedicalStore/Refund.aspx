
<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Refund.aspx.cs" Inherits="MedicalStore.Return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section style="background-color: #eee;">
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="https://www.linkpicture.com/q/Handle-product-returns.png" alt="avatar"
                                class="rounded-circle img-fluid" style="width: 200px;">
                            <br>
                            <h5 class="my-3">Refund</h5>
                              <br>  <br>  <br>
                      
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                             
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Customer ID</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="custID" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Product ID</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="returnID" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <hr>
  
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Refund Reason</p>
                                </div>
                                <div class="col-sm-9">
                                     <asp:DropDownList ID="ddlRefund" runat="server" CssClass="form-control" >
                                        <asp:ListItem Value="Product do not meet requirement">Product do not meet requirement</asp:ListItem>
                                        <asp:ListItem Value="Product are damaged">Product are damaged</asp:ListItem>
                                        <asp:ListItem Value="Delivered wrong product">Delivered wrong product</asp:ListItem>
                                        <asp:ListItem Value="Other Reason">Other Reason</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <hr>
                          
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Other Reason</p>
                                     <h9 class="my-3">(If any)</h9>
                                </div>
                                <div class="col-sm-9">
                                    
                                    <asp:TextBox ID="otherReason" runat="server" CssClass="form-control" PlaceHolder="-"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-end">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-lg btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

