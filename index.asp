<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link rel='shortcut icon' href='./img/milk-store-logo-symbol-template-design-your-company-community-whatever-needs-200975497.ico' />
    <title>Milk Store</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
</head>
<style>
.featured_product{
    width:100%;
    height:120px;
    text-align: center;
    padding-top:30px;
}
.featured_product p {
    font-size:40px;
}
.features_item{
    display:flex;
    flex-direction: row;
    justify-content:space-around;
    background-color:blue; 
    padding:20px
}
.features_item1{
    width:400px;
}
<body>
<!-- #include file="header.asp" -->
<!-- #include file="carousel.asp" -->
<div clas="row g-2">
  <div class='featured_product'><p>Sản Phẩm Nổi Bật</p></div>
    <div class='features_item'>
        <div class='features_item1'>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                <div class="col-md-4">
                    <img src="..." class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <button type="button" class="btn btn-outline-primary">Mua Ngay</button>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <div class='features_item1'>
            <div class="card mb-3" style="max-width: 540px;">
            <div class="row g-0">
                <div class="col-md-4">
                <img src="..." class="img-fluid rounded-start" alt="...">
                </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                                <button type="button" class="btn btn-outline-primary">Mua Ngay</button>
                </div>
            </div>
            </div>
            </div>
        </div>
        <div class='features_item1'>
            <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="..." class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <button type="button" class="btn btn-outline-primary">Mua Ngay</button>
      </div>
    </div>
  </div>
</div>
        </div>
    </div>
</div>
<!-- #include file="footer.asp" -->
</body>

</html>