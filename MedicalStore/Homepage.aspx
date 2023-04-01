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
                    <i class="fas fa-cubes fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">5000+</h5>
                    <h6 class="fw-normal mb-0">Components</h6>
                    <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
                </div>

                <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
                    <i class="fas fa-layer-group fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">490+</h5>
                    <h6 class="fw-normal mb-0">Design blocks</h6>
                    <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
                </div>

                <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
                    <i class="fas fa-image fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">100+</h5>
                    <h6 class="fw-normal mb-0">Templates</h6>
                    <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
                </div>

                <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
                    <i class="fas fa-plug fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">28</h5>
                    <h6 class="fw-normal mb-0">Plugins</h6>
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
                    <p class="mb-4 pb-2 mb-md-5 pb-md-0">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet
        numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum
        quisquam eum porro a pariatur veniam.
                    </p>
                </div>
            </div>

            <div class="row text-center">
                <div class="col-md-4 mb-5 mb-md-0">
                    <div class="d-flex justify-content-center mb-4">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(1).webp"
                            class="rounded-circle shadow-1-strong" width="150" height="150" />
                    </div>
                    <h5 class="mb-3">Maria Smantha</h5>
                    <h6 class="text-primary mb-3">Web Developer</h6>
                    <p class="px-xl-3">
                        <i class="fas fa-quote-left pe-2"></i>Lorem ipsum dolor sit amet, consectetur
        adipisicing elit. Quod eos id officiis hic tenetur quae quaerat ad velit ab hic
        tenetur.
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
                    <h5 class="mb-3">Lisa Cudrow</h5>
                    <h6 class="text-primary mb-3">Graphic Designer</h6>
                    <p class="px-xl-3">
                        <i class="fas fa-quote-left pe-2"></i>Ut enim ad minima veniam, quis nostrum
        exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid commodi.
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
                    <h5 class="mb-3">John Smith</h5>
                    <h6 class="text-primary mb-3">Marketing Specialist</h6>
                    <p class="px-xl-3">
                        <i class="fas fa-quote-left pe-2"></i>At vero eos et accusamus et iusto odio
        dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.
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
