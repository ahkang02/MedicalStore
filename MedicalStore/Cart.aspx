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
                      <div class="col-md-1 col-lg-1 col-xl-1 text-end">
    <asp:LinkButton runat="server" CssClass="text-muted" CommandArgument='<%# Eval("ProductID") %>' OnCommand="addNewOrderButton_Click"><i class="fas fa-times"></i></asp:LinkButton>
</div>
                  </div>
                  <hr class="my-4">
<form>
  <!-- Other form elements here -->
<input type="hidden" id="hdnTotal" name="hdnTotal" value="" />
<input type="hidden" id="hdnDelivery" name="hdnDelivery" value="" />
<input type="hidden" id="hdnSubtotal" name="hdnSubtotal" value="" />
<input type="hidden" id="hdnQuantity" name="hdnQuantity" value="" />
<input type="hidden" id="hdnProductID" name="hdnProductID" value="" />
<input type="hidden" id="hdnPrice" name="hdnPrice" value="" />
<input type="hidden" id="hdnDeli" name="hdnDeli" value="" />
  <!-- Other form elements here -->
</form>

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

   

<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
  <h6 class="mb-0 subtotal" id="subtotal_<%# Eval("ProductID") %>"><%# String.Format("{0:F2}", Eval("SubTotal")) %></h6>
</div>


<script>
    var currentQuantity = {}; 
   
    function updateSubtotal(productID)
    {

        var quantity = document.getElementById('quantity_' + productID).value;
        var price = <%# Eval("Price") %>;
        var subtotal = quantity * price;

        document.getElementById('subtotal_' + productID).innerHTML = subtotal.toFixed(2);
        updateTotal();

        
        const hdnQuantity = document.getElementById('hdnQuantity');
        hdnQuantity.value = document.getElementById('quantity_' + productID).value;

        const hdnSubtotal = document.getElementById('hdnSubtotal');
        hdnSubtotal.value = subtotal;

        const hdnProductID = document.getElementById('hdnProductID');
        hdnProductID.value = productID;
    }


</script>
                    <script>
                        let deliveryCharge = 0;

                        function deliveryOptions() {
                            const deliverySelect = document.querySelector('#delivery-select');
                            const selectedOption = deliverySelect.value;
                            if (selectedOption === '1') {
                                deliveryCharge = 5.00;
                                const hdnDelivery = document.getElementById('hdnDelivery');
                                hdnDelivery.value = "Standard Delivery";

                                const hdnDeli = document.getElementById('hdnDeli');
                                hdnDeli.value = 1;

                            } else if (selectedOption === '2') {
                                deliveryCharge = 10.00;
                                const hdnDelivery = document.getElementById('hdnDelivery');
                                hdnDelivery.value = "Express Delivery";

                                const hdnDeli = document.getElementById('hdnDeli');
                                hdnDeli.value = 2;
                                
                            } else {
                                const hdnDelivery = document.getElementById('hdnDelivery');
                                hdnDelivery.value = "Pick Up";

                                const hdnDeli = document.getElementById('hdnDeli');
                                hdnDeli.value = 0;
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
                            hdnTotal.value = total2.toFixed(2);


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
  <h5>Total: RM<span id="total-price"><%=total.ToString("0.00")%></span></h5>
</div>



                  <h5 class="text-uppercase mb-3">Shipping</h5>

<div class="mb-4 pb-2">
  <select id="delivery-select" class="select" onchange="deliveryOptions()">
    <option value="0">Pick Up</option>
    <option value="1">Standard Delivery - RM 5.00</option>
    <option value="2">Express Delivery - RM 10.00</option>
  </select>
</div>





                  



                  <hr class="my-4">

   <div class="d-flex justify-content-between mb-5">
  <h5 class="text-uppercase">Total price</h5>
  <h5>RM <span id="total-price2"><%=total.ToString("0.00")%></span></h5>
</div>
                    <asp:Button ID="btnCheckout" CssClass="btn btn-dark btn-block btn-lg" Text="Checkout" runat="server" OnClick="btnCheckout_Click" CommandArgument='<%# Eval("OrderID") %>' />


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
