<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProcessRefund.aspx.cs" Inherits="MedicalStore.Admin.ProcessRefund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="ms-3">
        <h2>Refund Management</h2>
    </div>
    <!-- Repeater -->
    <div class="container-fluid">
        <asp:Repeater ID="repeatUser" runat="server" OnItemCommand="repeatUser_ItemCommand">
            <HeaderTemplate>
                <table class="table table-hover table-responsive table-bordered">
                    <tr>
                        <th>Refund ID</th>
                        <th>Refund Status</th>
                        <th>Refund Reason</th>
                        <th>Actions</th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%#DataBinder.Eval(Container.DataItem,"RefundID")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem,"Status")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Reason") %></td>
                    <td>
                        <asp:Button ID="btnEdit" CssClass="btn btn-sm btn-primary ms-2" Text="Approve" runat="server" CommandName="Approve" CommandArgument='<%#Eval ("RefundID") %>' UseSubmitBehavior="false" CausesValidation="false" />
                        <asp:Button ID="btnDelete" CssClass="btn btn-sm btn-danger ms-2" Text="Reject" runat="server" CommandName="Reject" CommandArgument='<%#Eval ("RefundID") %>' UseSubmitBehavior="false" OnClientClick="if (!confirm('Are you sure you want reject?')) return false;" CausesValidation="false"/>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Refund]"></asp:SqlDataSource>
    </div>
</asp:Content>
