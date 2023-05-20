<!-- #include file="connect.asp" -->
<%
    If (isnull(Session("TaiKhoan")) OR TRIM(Session("TaiKhoan")) = "") Then
        Response.redirect("login.asp")
    End If
    ' code here to retrive the data from product table
    Dim sqlString1, rs1
    sqlString1 = "Select TenSp from SanPham"
    connDB.Open()
    set rs1 = connDB.execute(sqlString1)    
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link rel='shortcut icon' href='./img/milk-store-logo-symbol-template-design-your-company-community-whatever-needs-200975497.ico' />
    <title>Admin</title>
    
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>


<!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</head>
<style>
.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
}
.content {
    width: 100%;
    padding: 20px;
    min-height: 100vh;
    transition: all 0.3s;
}
</style>

<body>
<div class="wrapper">
    <!-- #include file="sidebar.asp" -->
    <div class="content">
    <!-- #include file="header.asp" -->
        <div style="display:flex">
            <p style="margin-right: 20px">Nhap so luong san pham nhap :</p>
            <form method='get' name="myForm">
                <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                      <input min="0" name="quantity"  type="number"
                        class="col-form-label " />

                      <button type="submit" class="btn btn-primary">Gui</button>
                </div>
            </form>
        </div>
        
        <form>

        </form>
        <%
       
            id = Request.QueryString("quantity")
            For i=1 To id Step 1
        %>
            <div style="display: flex;flex-direction: column; margin-top:10px" >
                <div style="display: flex;flex-direction: row" >
                    <form method="post" style="display: flex">
                    <div style="margin-right:20px" ><%=i%></div>
                    <div style="margin-right:20px">
                        <label for="masp" class="form-label">Ma San Pham</label>
                        <input type="number" class="form-control" name="masp" id="masp" >
                    </div>
                    <select class="form-select" aria-label="Default select example">
                        <%
                            do while not rs1.EOF
                        %>
                        <option value="<%=rs1("TenSp")%>"><%=rs1("TenSp")%></option>
                        <%
                            rs1.MoveNext
                            loop
                            rs1.Close()
                            connDB.Close()
                        %>
                    </select>
                    <div style="margin-right:20px">
                        <label for="soluong" class="form-label">So Luong</label>
                        <input type="number" class="form-control" name="soluong" class="sl" id="soluong" >
                    </div>
                    <div style="margin-right:20px">
                        <label for="dongia" class="form-label">Don Gia</label>
                        <input type="number" class="form-control" name="dongia" class="dg" id="dongia" >
                    </div>
                    <div style="margin-right:20px">
                        <label for="thanhtien" class="form-label">Thanh Tien</label>
                        <input type="number" class="form-control" name="thanhtien" clas="tt" id="thanhtien" >
                    </div>
                    <button type="submit" class="btn btn-primary">Nhap</button>
                    </form>
                    <%
                        if (NOT isnull(masp) and masp<>"" and NOT isnull(soluong) and soluong<>"" and NOT isnull(thuonghieu) and thuonghieu<>"" and NOT isnull(mota) and mota<>"" and NOT isnull(giagoc) and giagoc > 0 and NOT isnull(giaban) and giaban > 0 and giaban < giagoc) then
                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                            connDB.Open()
                            cmdPrep.ActiveConnection = connDB
                            cmdPrep.CommandType = 1
                            cmdPrep.Prepared = True
                            cmdPrep.CommandText = "INSERT INTO SanPham(TenSp,LoaiSp,ThuongHieu,MoTa,Gia,GiaGoc,SoLuong) VALUES(?,?,?,?,?,?,0)"
                            ' cmdPrep.parameters.Append cmdPrep.createParameter("tensp",202,1,255,tensp)
                            ' cmdPrep.parameters.Append cmdPrep.createParameter("theloai",202,1,255,theloai)
                            ' cmdPrep.parameters.Append cmdPrep.createParameter("thuonghieu",202,1,255,thuonghieu)
                            ' cmdPrep.parameters.Append cmdPrep.createParameter("giaban",3,1, ,giaban)
                            ' cmdPrep.parameters.Append cmdPrep.createParameter("mota",202,1,255,mota)
                            ' cmdPrep.parameters.Append cmdPrep.createParameter("giagoc",3,1, ,giagoc)
                            cmdPrep.Parameters(0)=tensp
                            cmdPrep.Parameters(1)=theloai
                            cmdPrep.Parameters(2)=thuonghieu
                            cmdPrep.Parameters(3)=mota
                            cmdPrep.Parameters(4)=giaban
                            cmdPrep.Parameters(5)=giagoc
                            cmdPrep.execute    
                            Session("Success") = "da them 1 san pham"
                            Response.redirect("sanpham.asp")
                        else
                            Session("Error") = "You have to input enough info"                
                        end if
                    %>
                </div>
            <div>
        <%
            Next
        %>
        </div>
    <div> 
</div>
    
</body>
<script>
    let x = document.forms["myForm"]["quantity"].value;
    for (let i = 0; i < x; i++) {
        let soluong = document.getElementsByClassName(“sl”).[i].value
        let dongia = document.getElementsByClassName(“dg”).[i].value
        console.log(soluong)
        
    }
    
</script>
</html>