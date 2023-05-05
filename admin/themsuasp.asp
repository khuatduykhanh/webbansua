
<!-- #include file="connect.asp" -->
<%
    If (isnull(Session("TaiKhoan")) OR TRIM(Session("TaiKhoan")) = "") Then
        Response.redirect("login.asp")
    End If
    If (Request.ServerVariables("REQUEST_METHOD") = "GET") THEN        
        id = Request.QueryString("id")
        If (isnull(id) OR trim(id) = "") then 
            id=0 
        End if
        If (cint(id)<>0) Then
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            connDB.Open()
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.CommandText = "SELECT * FROM NHANVIEN WHERE MANV=?"
            ' cmdPrep.parameters.Append cmdPrep.createParameter("MaNV",3,1, ,id)
            cmdPrep.Parameters(0)=id
            Set Result = cmdPrep.execute 

            If not Result.EOF then
                name = Result("HoTenNV")
                hometown =  ("QueQuan")
            End If

            ' Set Result = Nothing
            Result.Close()
        End If
    Else
        id = Request.QueryString("id")
        name = Request.form("name")
        hometown = Request.form("hometown")

        if (isnull (id) OR trim(id) = "") then id=0 end if

        if (cint(id)=0) then
            if (NOT isnull(name) and name<>"" and NOT isnull(hometown) and hometown<>"") then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "INSERT INTO NHANVIEN(HoTenNV,QueQuan) VALUES(?,?)"
                cmdPrep.parameters.Append cmdPrep.createParameter("name",202,1,255,name)
                cmdPrep.parameters.Append cmdPrep.createParameter("hometown",202,1,255,hometown)

                cmdPrep.execute
                Session("Success") = "New employee added!"
                Response.redirect("index.asp")
            else
                Session("Error") = "You have to input enough info"                
            end if
        else
            if (NOT isnull(name) and name<>"" and NOT isnull(hometown) and hometown<>"") then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "UPDATE NHANVIEN SET HoTenNV=?,QueQuan=? WHERE MaNV=?"
                cmdPrep.parameters.Append cmdPrep.createParameter("name",202,1,255,name)
                cmdPrep.parameters.Append cmdPrep.createParameter("hometown",202,1,255,hometown)
                cmdPrep.parameters.Append cmdPrep.createParameter("MaNV",3,1, ,id)

                cmdPrep.execute
                Session("Success") = "The employee was edited!"
                Response.redirect("index.asp") 
            else
                Session("Error") = "You have to input enough info"
            end if
        end if
    End If    
%><!DOCTYPE html>
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
    <form method="post" enctype="multipart/form-data" >
    <div class="mb-3">
    <label for="sanpham" class="form-label">Tên Sản Phẩm</label>
    <input type="text" class="form-control" name="tensp" id="sanpham">
    </div>
    
    <select class="form-select" name="theloai" aria-label="Default select example">
        <option selected>Thể Loại</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
    </select>
    <select class="form-select" name="thuonghieu" aria-label="Default select example">
        <option selected>Thương Hiệu</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
    </select>
    <div class="mb-3">
    <label for="mota" class="form-label">Mô Tả: </label>
    <textarea class="form-control" id="mota" rows="3"></textarea>
    </div>
    <div class="mb-3">
    <label for="giagoc" class="form-label">Giá Gốc: </label>
    <input type="number" class="form-control" name="giagoc" id="giagoc">
    </div>
    <div class="mb-3">
    <label for="giaban" class="form-label">Giá Bán </label>
    <input type="number" class="form-control" name="giaban" id="giaban">
    </div> 
    <div> 
    <div class="mb-3">
    <label for="anh" class="form-label">Ảnh</label>
    <input type="file" class="form-control" name="anh" id="anh" accept="image/*">
    </div> 
    </form>
    <div> 
</div>
</body>
</html>