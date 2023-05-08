<% @ Language="VBScript" %>  
<!--Step 1: Register Uploader to your page -->  
<!-- #include file="aspuploader/include_aspuploader.asp" --> 
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
            cmdPrep.CommandText = "SELECT TenSp,LoaiSp,ThuongHieu,MoTa,GiaGoc,Gia FROM SanPham WHERE MaSp=?"
            ' cmdPrep.parameters.Append cmdPrep.createParameter("MaNV",3,1, ,id)
            cmdPrep.Parameters(0)=id
            Set Result = cmdPrep.execute 

            If not Result.EOF then
                tensp = Result("TenSp")
                theloai = Result("LoaiSp")
                thuonghieu = Result("ThuongHieu")
                mota = Result("MoTa")
                giagoc = Result("GiaGoc")
                giaban = Result("Gia")
            End If

            ' Set Result = Nothing
            Result.Close()
        End If
    Else
        id = Request.QueryString("id")
        tensp = Request.form("tensp")
        theloai = Request.form("theloai")
        thuonghieu = Request.form("thuonghieu")
        mota = Request.form("mota")
        giagoc = Request.form("giagoc")
        giaban = Request.form("giaban")

        if (isnull (id) OR trim(id) = "") then id=0 end if
        
        if (cint(id)=0) then
            if (NOT isnull(tensp) and tensp<>"" and NOT isnull(theloai) and theloai<>"" and NOT isnull(thuonghieu) and thuonghieu<>"" and NOT isnull(mota) and mota<>"" and NOT isnull(giagoc) and giagoc > 0 and NOT isnull(giaban) and giaban > 0 and giaban < giagoc) then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "INSERT INTO SanPham(TenSp,LoaiSp,ThuongHieu,MoTa,Gia,GiaGoc) VALUES(?,?,?,?,?,?)"
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
        else
            if (NOT isnull(tensp) and tensp<>"" and NOT isnull(theloai) and theloai<>"" and NOT isnull(thuonghieu) and thuonghieu<>"" and NOT isnull(mota) and mota<>"" and NOT isnull(giagoc) and giagoc<>"" and NOT isnull(giaban) and giaban<>"" and giaban < giagoc) then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "UPDATE SanPham SET TenSp=?,LoaiSp=?,ThuongHieu=?,Mota=?,Gia=?,GiaGoc=? WHERE MaSp=?"
                cmdPrep.parameters.Append cmdPrep.createParameter("tensp",202,1,255,tensp)
                cmdPrep.parameters.Append cmdPrep.createParameter("theloai",202,1,255,theloai)
                cmdPrep.parameters.Append cmdPrep.createParameter("thuonghieu",202,1,255,thuonghieu)
                cmdPrep.parameters.Append cmdPrep.createParameter("mota",202,1,255,mota)
                cmdPrep.parameters.Append cmdPrep.createParameter("giaban",3,1, ,giaban)
                cmdPrep.parameters.Append cmdPrep.createParameter("giagoc",3,1, ,giagoc)
                cmdPrep.parameters.Append cmdPrep.createParameter("MaNV",3,1, ,id)

                cmdPrep.execute
                Session("Success") = "San pham da duoc sua"
                Response.redirect("sanpham.asp") 
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
    <%
    If (cint(id)=0) Then
    Dim sqlString, rs
    sqlString = "Select Max(MaSp) as Max from SanPham"
    connDB.Open()
    set rs = connDB.execute(sqlString) 
    If not rs.EOF Then
    %>   
    <h5> Ma San Pham Hien tai : <%=rs("Max")%></h5>
    <%
    End If
    End If
    %>
   <div class="mb-3">  
    <%
              'Step 2: Create Uploader object     
              Dim uploader   
              Set uploader=new AspUploader   
              'Step 3: Set a unique name to Uploader
              uploader.Name="anh1"
              uploader.SaveDirectory="Anh"  
              uploader.AllowedFileExtensions="*.jpg,*.png,*.gif"  
              'Step 4: Render Uploader
              uploader.Render()
              uploader.GetString()
    %>  
    </div>  
    <form method="post"  >
    <div class="mb-3">
    <label for="sanpham" class="form-label">Tên Sản Phẩm</label>
    <input type="text" class="form-control" name="tensp" id="sanpham" value="<%=tensp%>">
    </div>
    <div class="mb-3">
    <select class="form-select" name="theloai" aria-label="Default select example">
        <option selected>Thể Loại</option>
        <option value="Sua Hat">Sua hat</option>
        <option value="Sua trai cay">sua trai cay</option>
        <option value="Sua nguyen chat">Sua nguyen chat</option>
    </select>
    </div>
    <div class="mb-3">
    <select class="form-select" name="thuonghieu" aria-label="Default select example">
        <option selected>Thương Hiệu</option>
        <option value="vinamilk">vinamilk</option>
        <option value="TH">TH</option>
        <option value="Ba Vi">Ba Vi</option>
        <option value="Da Lat milk">Da Lat Milk</option>
    </select>
    </div>
    <div class="mb-3">
    <label for="mota" class="form-label">Mô Tả: </label>
    <textarea class="form-control" id="mota" name="mota" rows="3" value="<%=mota%>" ></textarea>
    </div>
    <div class="mb-3">
    <label for="giagoc" class="form-label">Giá Gốc: </label>
    <input type="number" class="form-control" name="giagoc" id="giagoc" value="<%=giagoc%>">
    </div>
    <div class="mb-3">
    <label for="giaban" class="form-label">Giá Bán </label>
    <input type="number" class="form-control" name="giaban" id="giaban" value="<%=giaban%>">
    </div> 
    <div> 
     
    <button type="submit" class="btn btn-primary">
        <%
            if (id=0) then
                Response.write("Add")
            else
                Response.write("Edit")
            end if
        %>
        </button>
        <a href="index.asp" class="btn btn-info">Cancel</a>  
        <div><%=tensp%></div>
        <div><%=theloai%></div> 
        <div><%=thuonghieu%></div> 
        <div><%=giaban%></div> 
        <div><%=mota%></div> 
        <div><%=giagoc%></div>        
    </form>
    <
    <div> 
</div>
</body>
</html>