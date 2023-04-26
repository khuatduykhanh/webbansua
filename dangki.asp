<!-- #include file="connect.asp" -->
<%
        id = Request.QueryString("id")
        taikhoan = Request.form("taikhoan")
        name = Request.form("name")
        matkhau = Request.form("matkhau")
        sdt = Request.form("sdt")
        diachi = Request.form("diachi")
        if (isnull (id) OR trim(id) = "") then id=0 end if
         if (NOT isnull(taikhoan) and taikhoan<>"" and NOT isnull(matkhau) and matkhau<>""and NOT isnull(name) and name<>""and NOT isnull(sdt) and sdt<>""and NOT isnull(diachi) and diachi<>"") then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()                
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "INSERT INTO TKNguoiDung(TaiKhoan,MatKhau,HoTen,SoDT,DiaChi,TrangThai) VALUES(?,?,?,?,?,1)"
                cmdPrep.parameters.Append cmdPrep.createParameter("taikhoan",202,1,255,taikhoan)
                cmdPrep.parameters.Append cmdPrep.createParameter("matkhau",202,1,255,matkhau)
                cmdPrep.parameters.Append cmdPrep.createParameter("name",202,1,255,name)
                cmdPrep.parameters.Append cmdPrep.createParameter("sdt",202,1,255,sdt)
                cmdPrep.parameters.Append cmdPrep.createParameter("diachi",202,1,255,diachi)

                cmdPrep.execute               
                
                If Err.Number = 0 Then 
                ' Set rs = connDB.execute("SELECT @@IDENTITY AS NewID")
                '     Response.write(rs("NewID"))  
                    Session("Success") = "New employee added!"                    
                    Response.redirect("index.asp")  
                Else  
                    handleError(Err.Description)
                End If
                On Error GoTo 0
            else
                Session("Error") = "You have to input enough info"                
            end if
%>



<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link rel='shortcut icon' href='./img/milk-store-logo-symbol-template-design-your-company-community-whatever-needs-200975497.ico' />
    <title>Khách hàng đăng kí</title>
</head>
<body>

<section class="vh-100" style="background-color: #508bfc;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-6 text-center">

            <h3 class="mb-5">Đăng ký</h3>
            <form method="post" action="dangki.asp">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="taikhoan" name="taikhoan" value="<%=taikhoan%>" placeholder="text">
              <label for="taikhoan">Tên đăng nhập</label>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control" id="matkhau" name="matkhau"value="<%=matkhau%>" placeholder="Password">
              <label for="matkhau">Mật khẩu</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="name" name="name" value="<%=name%>" placeholder="text">
              <label for="name">Họ và tên</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="sdt" name="sdt" value="<%=sdt%>" placeholder="text">
              <label for="sdt">Số điện thoại</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="diachi" name="diachi" value="<%=diachi%>" placeholder="text">
              <label for="diachi">Địa chỉ</label>
            </div>

            <!-- Checkbox -->
            <div class="form-check d-flex justify-content-start mb-4">
              <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
              <label class="form-check-label" for="form1Example3"> Tôi đồng ý với các điều khoản sử dụng và chính sách bảo mật của Store </label>
            </div>

            <a href="\login.asp" class="btn btn-light btn-lg btn-outline-primary" role="button">Đăng nhập</a>
            <button class="btn btn-primary btn-lg btn-block " type="submit">Đăng Ký</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>