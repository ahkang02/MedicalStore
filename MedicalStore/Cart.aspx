<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MedicalStore.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="h-100 h-custom" style="background-color: #d2c9ff;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-8">
                <div class="p-5">
                  <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                    <h6 class="mb-0 text-muted">3 items</h6>
                  </div>
                  <hr class="my-4">

                     <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                         
                            <ItemTemplate>
 
                                <tr style="">
                                    <td>

                  <div class="row mb-4 d-flex justify-content-between align-items-center">

                    <div class="col-md-2 col-lg-2 col-xl-2">
                      <img
                        src="Images/ProductImg/<%# Eval("ImageName") %>"
                        class="img-fluid rounded-3"  alt="product.title" >
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                     <%-- <h6 class="text-muted"><%# Eval("Name") %></h6>--%>
                      <h6 class="text-black mb-0"><%# Eval("Name") %></h6>
                    </div>


<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
  <button class="btn btn-link px-2"
      onclick="event.preventDefault(); document.getElementById('quantity_<%# Eval("ProductID") %>').stepDown(); updateSubtotal('<%# Eval("ProductID") %>')"
      >
      <i class="fas fa-minus"></i>
  </button>
  <input id="quantity_<%# Eval("ProductID") %>" min="0" name="quantity_<%# Eval("ProductID") %>" value="<%# Eval("Quantity") %>" type="number"
      class="form-control form-control-sm" onchange="updateSubtotal('<%# Eval("ProductID") %>')"  />
  <button class="btn btn-link px-2"
      onclick="event.preventDefault(); document.getElementById('quantity_<%# Eval("ProductID") %>').stepUp(); updateSubtotal('<%# Eval("ProductID") %>')">
      <i class="fas fa-plus"></i>
  </button>
   
</div>

<%--<asp:Button ID="addToCartButton" runat="server" Text="Add to Cart" OnClick="UpdateProduct" CommandArgument='<%# Eval("ProductID") + "|" + quantity.toString() + "|" + Eval("Price") %>' OnCommand="UpdateProduct" />--%>
   
<%--  <div class="col-md-1 col-lg-1 col-xl-1 text-end">
    <asp:LinkButton runat="server" CssClass="text-muted" CommandArgument='<%# Eval("ProductID") %>' OnCommand="RemoveProduct"><i class="fas fa-times"></i></asp:LinkButton>
</div>--%>

<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
  <h6 class="mb-0 subtotal" id="subtotal_<%# Eval("ProductID") %>"><%# String.Format("{0:F2}", Eval("SubTotal")) %></h6>
</div>

<script>
 
    function updateSubtotal(productID) {
        var quantity = document.getElementById('quantity_' + productID).value;
        var price = <%# Eval("Price") %>;
        var subtotal = quantity * price;
      
        document.getElementById('subtotal_' + productID).innerHTML = subtotal.toFixed(2);

        updateTotal();

    }


</script>
                    <script>
                        let deliveryCharge = 0;
                        let deliveryCheck = "Pick Up";
                        function deliveryOptions() {
                            const deliverySelect = document.querySelector('#delivery-select');
                            const selectedOption = deliverySelect.value;
                            if (selectedOption === '1') {
                                deliveryCharge = 5.00;
                                deliveryCheck = "Delivery";
                            } else if (selectedOption === '2') {
                                deliveryCharge = 10.00;
                                deliveryCheck = "Delivery";
                            } else {
                                deliveryCheck = "Pick Up";
                            }
                            updateTotal();
                        }

                        deliverySelect.addEventListener('change', deliveryOptions);

                        function updateTotal() {
                            const subtotalElems = document.querySelectorAll('.subtotal');
                            let total = 0;
                            let itemCount = 0;
                            let total2 = 0;
                            const subtotalMap = new Map();
                            subtotalElems.forEach((elem) => {
                                const productID = elem.id.split('_')[1];
                                const subtotal = parseFloat(elem.innerText);
                                if (!isNaN(subtotal)) {
                                    total += subtotal;
                                    total2 = total + deliveryCharge;
                                    itemCount++;
                                    if (!subtotalMap.has(productID)) {
                                        subtotalMap.set(productID, 0);
                                    }
                                    subtotalMap.set(productID, subtotalMap.get(productID) + subtotal);
                                }
                            });
                            document.getElementById('item-count').innerText = itemCount;
                            document.getElementById('total-price').innerText = total.toFixed(2);
                            document.getElementById('total-price2').innerText = total2.toFixed(2);
                            subtotalMap.forEach((subtotal, productID) => {
                                document.getElementById('subtotal_' + productID).innerText = subtotal.toFixed(2);
                            });

                            const hdnTotal = document.getElementById('hdnTotal');
                            hdnTotal.value = total.toFixed(2);
                            const hdnDelivery = document.getElementById('hdnDelivery');
                            hdnDelivery.value = deliveryCheck;

                        }


                        const quantityInputs = document.querySelectorAll('input[name="quantity"]');
                        quantityInputs.forEach((elem) => {
                            elem.addEventListener('change', () => {
                                updateTotal();
                            });
                        });

                        updateTotal();
</script>


                       
  <div class="col-md-1 col-lg-1 col-xl-1 text-end">
    <asp:LinkButton runat="server" CssClass="text-muted" CommandArgument='<%# Eval("ProductID") %>' OnCommand="RemoveProduct"><i class="fas fa-times"></i></asp:LinkButton>
</div>
<%--<div class="col-md-1 col-lg-1 col-xl-1 text-end">
    <asp:LinkButton runat="server" CssClass="text-muted" CommandArgument='<%# Eval("ProductID") + "|" + quantity + "|" + Eval("Price") %>' OnCommand="UpdateProduct"><i class="fas fa-times"></i></asp:LinkButton>
</div>--%>
                  </div>

                    </tr>
                            </ItemTemplate>
                 
                     </asp:ListView>

                

                  <hr class="my-4">

                  <div class="pt-5">
                    <h6 class="mb-0"><a href="/Product.aspx" class="text-body"><i
                          class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                  <hr class="my-4">
<%
int itemCount = 0; // Declare and initialize the itemCount variable
float total = 0; // Declare and initialize the total variable
%>

<!-- Code to display the item count and total price -->
<div class="d-flex justify-content-between mb-4">
  <h5 class="text-uppercase">items <span id="item-count"><%=itemCount%></span></h5>
  <h5>Total: €<span id="total-price"><%=total.ToString("0.00")%></span></h5>
</div>



                  <h5 class="text-uppercase mb-3">Shipping</h5>

<div class="mb-4 pb-2">
  <select id="delivery-select" class="select" onchange="deliveryOptions()">
    <option value="0">Pick Up</option>
    <option value="1">Standard Delivery - €5.00</option>
    <option value="2">Express Delivery - €10.00</option>
  </select>
</div>





                  <h5 class="text-uppercase mb-3">Give code</h5>



                  <hr class="my-4">

   <div class="d-flex justify-content-between mb-5">
  <h5 class="text-uppercase">Total price</h5>
  <h5>€<span id="total-price2"><%=total.ToString("0.00")%></span></h5>
</div>
                    <asp:Button ID="btnCheckout" CssClass="btn btn-dark btn-block btn-lg" Text="Checkout" runat="server" OnClick="btnCheckout_Click" CommandArgument='<%# Eval("OrderID") %>' />
<input type="hidden" id="hdnTotal" runat="server" />
<input type="hidden" id="hdnDelivery" runat="server" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        <asp:Repeater ID="Repeater1" runat="server">
        </asp:Repeater>
    </div>
  </div>
</section>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OD.*,P.Price,P.ImageName,P.Name
FROM Products P ,Order_Details OD
WHERE OD.ProductID=P.ProductID"></asp:SqlDataSource>
</asp:Content>
