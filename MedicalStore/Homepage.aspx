<%@ Page Title="Home" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="MedicalStore.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container-fluid">
        <div class="container-fluid d-flex align-items-center justify-content-center img-fluid">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner mt-5">
                    <div class="carousel-item active">
                        <img src="Images/banner-1.png" class="d-block img-fluid" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/banner-2.png" class="d-block img-fluid" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/banner-3.png" class="d-block img-fluid" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <section class="text-center container mt-5">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
                    <i class="fas fa-tag fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">Products</h5>
                    <h6 class="fw-normal mb-0">Over 999</h6>
                    <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
                </div>

                <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
                    <i class="fas fa-truck-fast fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">Fast Delivery</h5>
                    <h6 class="fw-normal mb-0">Same Day Delivery</h6>
                    <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
                </div>

                <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
                    <i class="fas fa-certificate fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">Certified Products</h5>
                    <h6 class="fw-normal mb-0">Authentic</h6>
                    <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
                </div>

                <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
                    <i class="fas fa-star fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">High Return Rate</h5>
                    <h6 class="fw-normal mb-0">5 Stars Service!</h6>
                </div>
            </div>
        </section>

        <div class="container text-center mt-5">
            <h2>Featured Products</h2>
            <div class="row row-cols-1 row-cols-md-3 g-3">
                <div class="col">
                    <div class="card">
                        <a href="Product.aspx" class="text-decoration-none pt-3">
                            <img src="Images/pill-bottles.jpg" class="card-img-top" alt="..." style="width: 100px;">
                            <div class="card-body">
                                <h5 class="card-title">Health Supplements</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <a href="Product.aspx" class="text-decoration-none pt-3">
                            <img src="Images/stethoscope.jpg" class="card-img-top" alt="..." style="width: 100px;">
                            <div class="card-body">
                                <h5 class="card-title">Diagnosing Tools</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <a href="Product.aspx" class="text-decoration-none pt-3">
                            <img src="Images/boxes.png" class="card-img-top" alt="..." style="width: 100px;">
                            <div class="card-body">
                                <h5 class="card-title">General Products</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <section class="container mt-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-10 col-xl-8 text-center">
                    <h3 class="mb-4">Testimonials</h3>

                </div>
            </div>

            <div class="row text-center">
                <div class="col-md-4 mb-5 mb-md-0">
                    <div class="d-flex justify-content-center mb-4">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(1).webp"
                            class="rounded-circle shadow-1-strong" width="150" height="150" />
                    </div>
                    <h5 class="mb-3">Sarah Johnson</h5>
                    <p class="px-xl-3">
                        <i class="fas fa-quote-left pe-2"></i>I have been using this online pharmacy store for over a year now, and I have to say I'm thoroughly impressed with their service. The prices are very competitive, the delivery is prompt, and the customer support team is always there to help. Thank you, John, for making my life easier!
                    </p>
                    <ul class="list-unstyled d-flex justify-content-center mb-0">
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star-half-alt fa-sm text-warning"></i>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 mb-5 mb-md-0">
                    <div class="d-flex justify-content-center mb-4">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(2).webp"
                            class="rounded-circle shadow-1-strong" width="150" height="150" />
                    </div>
                    <h5 class="mb-3">Mark Davis</h5>
                    <p class="px-xl-3">
                        <i class="fas fa-quote-left pe-2"></i>I recently placed my first order with this online pharmacy store, and I have to say I'm blown away by their professionalism. The website is easy to use, the checkout process is straightforward, and the medication arrived on time. I will definitely be a repeat customer. Thank you, Emily, for your excellent service!
                    </p>
                    <ul class="list-unstyled d-flex justify-content-center mb-0">
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 mb-0">
                    <div class="d-flex justify-content-center mb-4">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(9).webp"
                            class="rounded-circle shadow-1-strong" width="150" height="150" />
                    </div>
                    <h5 class="mb-3">Lisa Wilson</h5>
                    <p class="px-xl-3">
                        <i class="fas fa-quote-left pe-2"></i>I've been a customer of this online pharmacy store for years, and they have never let me down. Their vast selection, unbeatable prices, and reliable delivery make them my go-to source for medication. I highly recommend this store to anyone looking for a trustworthy online pharmacy.
                    </p>
                    <ul class="list-unstyled d-flex justify-content-center mb-0">
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="fas fa-star fa-sm text-warning"></i>
                        </li>
                        <li>
                            <i class="far fa-star fa-sm text-warning"></i>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
