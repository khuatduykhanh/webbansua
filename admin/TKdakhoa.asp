<!-- #include file="..\connect.asp" -->
<%
    
    If (isnull(Session("TaiKhoan")) OR TRIM(Session("TaiKhoan")) <> "admin") Then
        Response.redirect("login.asp")
    End If
' khi moi san pham duoc add vao gio hang, tien hanh lay ra s_Carts, tang them 1 phan tu cua mang va luu lai trong sesssion
' ham lam tron so nguyen
    function Ceil(Number)
        Ceil = Int(Number)
        if Ceil<>Number Then
            Ceil = Ceil + 1
        end if
    end function

    function checkPage(cond, ret) 
        if cond=true then
            Response.write ret
        else
            Response.write ""
        end if
    end function
' trang hien tai
    page = Request.QueryString("page")
    limit = 10

    if (trim(page) = "") or (isnull(page)) then
        page = 1
    end if

    offset = (Clng(page) * Clng(limit)) - Clng(limit)

    strSQL = "SELECT COUNT(TaiKhoan) AS count FROM TKNguoiDung"
    connDB.Open()
    Set CountResult = connDB.execute(strSQL)

    totalRows = CLng(CountResult("count"))

    Set CountResult = Nothing
' lay ve tong so trang
    pages = Ceil(totalRows/limit)
    'gioi han tong so trang la 5
    Dim range
    If (pages<=5) Then
        range = pages
    Else
        range = 5
    End if
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
.table td.text-center{
    word-break: break-word;
    max-width:200px;
   
}
</style>
<body>
<div class="wrapper">
    <!-- #include file="sidebar.asp" -->
    <div class="content">
    <!-- #include file="header.asp" -->
    <div class="container">
     <%
        If (NOT isnull(Session("Success"))) AND (TRIM(Session("Success"))<>"") Then
    %>
            <div class="alert alert-success mt-2" role="alert">
                <%=Session("Success")%>
            </div>
    <%
            Session.Contents.Remove("Success")
        End If
    %>
        <div class="d-flex bd-highlight mb-3">
            <div class="me-auto p-2 bd-highlight"><h2>Danh sách tài khoản khách hàng đã khoá</h2></div>
               <div class="p-2 bd-highlight">
                    <a href="dskhachhang.asp" class="btn btn-danger">Quay lại</a>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-dark">
                    <thead>
                        <tr>
                           <th scope="col" class= "text-center">Tên Tài Khoản </th>
                            <th scope="col" class= "text-center">Họ Tên</th>
                            <th scope="col" class= "text-center">Địa Chỉ</th>
                            <th scope="col" class= "text-center">Số Điện Thoại</th>
                            <th scope="col" class= "text-center">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                            cmdPrep.ActiveConnection = connDB
                            cmdPrep.CommandType = 1
                            cmdPrep.Prepared = True
                            cmdPrep.CommandText = "SELECT TaiKhoan,HoTen,DiaChi,SoDT FROM TKNguoiDung where TrangThai='0' ORDER BY TaiKhoan OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"
                            cmdPrep.parameters.Append cmdPrep.createParameter("offset",3,1, ,offset)
                            cmdPrep.parameters.Append cmdPrep.createParameter("limit",3,1, , limit)
                             
                            Set Result = cmdPrep.execute
                            do while not Result.EOF
                        %>
                                <tr>
                                    <td class= "text-center"><%=Result("TaiKhoan")%></td>
                                    <td class= "text-center"><%=Result("HoTen")%></td>
                                    <td class= "text-center"><%=Result("DiaChi")%></td>
                                    <td class= "text-center"><%=Result("SoDT")%></td>  
                                    <td class= "text-center"> <a data-href="motk.asp?id=<%=Result("TaiKhoan")%>" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirm-delete" >Mở tài khoản</a> </td>
                                </tr>
                                
                        <%
                                Result.MoveNext
                            loop
                        %>
                    </tbody>
                </table>
            </div>

            <nav aria-label="Page Navigation">
                <ul class="pagination pagination-sm justify-content-center my-5">
                    <% if (pages>1) then
                    'kiem tra trang hien tai co >=2
                        if(Clng(page)>=2) then
                    %>
                        <li class="page-item"><a class="page-link" href="TKdakhoa.asp?page=<%=Clng(page)-1%>">Trước</a></li>
                    <%    
                        end if 
                        for i = 1 to range
                    %>
                            <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>"><a class="page-link" href="TKdakhoa.asp?page=<%=i%>"><%=i%></a></li>
                    <%
                        next
                        if (Clng(page)<pages) then

                    %>
                        <li class="page-item"><a class="page-link" href="TKdakhoa.asp?page=<%=Clng(page)+1%>">Sau</a></li>
                    <%
                        end if    
                    end if
                    %>
                </ul>
            </nav>
      <div class="modal" tabindex="-12" id="confirm-delete">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <hx5 class="modal-title">Xác nhận mở khoá tài khoản</hx5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn có chắc chắn muốn mở khoá tài khoản khách hàng này?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                            <a class="btn btn-danger btn-delete">Mở</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div> 
</div>
     <script>
            $(function()
            {
                $('#confirm-delete').on('show.bs.modal', function(e){
                    $(this).find('.btn-delete').attr('href', $(e.relatedTarget).data('href'));
                });
            });
        </script>
                <!-- #include file="footer.asp" -->
</body>
</html>