
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
            cmdPrep.CommandText = "SELECT ThongTin,NgayBD,NgayKT FROM GiamGia WHERE IdMagiamgia=?"
            ' cmdPrep.parameters.Append cmdPrep.createParameter("MaNV",3,1, ,id)
            cmdPrep.Parameters(0)=id
            Set Result = cmdPrep.execute 

            If not Result.EOF then
                ThongTin = Result("ThongTin")
                NgayBD = Result("NgayBD")
                NgayKT = Result("NgayKT")
            End If

            ' Set Result = Nothing
            Result.Close()
        End If
    Else
        id = Request.QueryString("id")
        ThongTin = Request.form("ThongTin")
        NgayBD = Request.form("NgayBD")
        NgayKT = Request.form("NgayKT")
        Giatri = Request.form("Giatri")
        if (isnull (id) OR trim(id) = "") then id=0 end if
        
        if (cint(id)=0) then
            if (NOT isnull(ThongTin) and ThongTin<>"" and NOT isnull(NgayBD) and NgayBD<>"" and NOT isnull(NgayKT) and NgayKT<>""and NOT isnull(Giatri) and Giatri<>""  ) then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "INSERT INTO GiamGia(ThongTin,NgayBD,NgayKT,Giatri) VALUES(?,?,?,?)"
                ' cmdPrep.parameters.Append cmdPrep.createParameter("ThongTin",202,1,255,ThongTin)
                ' cmdPrep.parameters.Append cmdPrep.createParameter("NgayBD",202,1,255,NgayBD)
                ' cmdPrep.parameters.Append cmdPrep.createParameter("NgayKT",202,1,255,NgayKT)
                ' cmdPrep.parameters.Append cmdPrep.createParameter("giaban",3,1, ,giaban)
                ' cmdPrep.parameters.Append cmdPrep.createParameter("mota",202,1,255,mota)
                ' cmdPrep.parameters.Append cmdPrep.createParameter("giagoc",3,1, ,giagoc)
                cmdPrep.Parameters(0)=ThongTin
                cmdPrep.Parameters(1)=NgayBD
                cmdPrep.Parameters(2)=NgayKT
                cmdPrep.Parameters(3)=Giatri
                

                cmdPrep.execute    
                Session("Success") = "da them 1 ma giam gia"
                Response.redirect("magiamgia.asp")
            else
                Session("Error") = "You have to input enough info"                
            end if
        else
            if (NOT isnull(ThongTin) and ThongTin<>"" and NOT isnull(NgayBD) and NgayBD<>"" and NOT isnull(NgayKT) and NgayKT<>""and NOT isnull(Giatri) and Giatri<>""  ) then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "UPDATE GiamGia SET ThongTin=?,NgayBD=?,NgayKT=?,Giatri=? WHERE IdMagiamgia=?"
                cmdPrep.parameters.Append cmdPrep.createParameter("ThongTin",202,1,255,ThongTin)
                cmdPrep.parameters.Append cmdPrep.createParameter("NgayBD",202,1,255,NgayBD)
                cmdPrep.parameters.Append cmdPrep.createParameter("NgayKT",202,1,255,NgayKT)         
                cmdPrep.parameters.Append cmdPrep.createParameter("Giatri",202,1,255,Giatri)
                cmdPrep.parameters.Append cmdPrep.createParameter("IdMagiamgia",3,1, ,id)
               cmdPrep.execute
               
                Session("Success") = "Ma giam gia da duoc sua"
                Response.redirect("magiamgia.asp") 
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
    sqlString = "Select Max(IdMagiamgia) as Max from GiamGia"
    connDB.Open()
    set rs = connDB.execute(sqlString) 
    If not rs.EOF Then
    %>   
    <h5> Mã mã giảm giá hiện tại: <%=rs("Max")%></h5>
    <%
    End If
    End If
    %>
    
    <form method="post"  >
    <div class="mb-3">
    <label for="thongtin" class="form-label">Thông tin mã giảm giá</label>
    <input type="text" class="form-control" name="ThongTin" id="thongtin" value="<%=ThongTin%>">
    </div>
    <div class="mb-3">
    <label for="ngaybd" class="form-label">Ngày bắt đầu</label>
    <input type="date" class="form-control" name="ngaybd" id="ngaybd" value="<%=NgayBD%>">


    </div>
    <div class="mb-3">
    <label for="ngaykt" class="form-label">Ngày kết thúc</label>
    <input type="date" class="form-control" name="ngaykt" id="ngaykt" value="<%=NgayKT%>">
    </div>
    <div class="mb-3">
    <label for="giatri" class="form-label">Giá trị mã giảm giá</label>
    <input type="text" class="form-control" name="giatri" id="giatri" value="<%=Giatri%>">
    </div>
     
    <button type="submit" class="btn btn-primary">
        <%
            if (id=0) then
                Response.write("Thêm")

            else
                Response.write("Sửa")
            end if
        %>
        </button>
        <a href="magiamgia.asp" class="btn btn-info">Quay lại</a>       
    </form>
    <div> 
</div>
</body>
</html>