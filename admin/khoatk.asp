<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- #include file="..\connect.asp" -->
<%
    If (isnull(Session("TaiKhoan")) OR TRIM(Session("TaiKhoan")) <> "admin") Then
        Response.redirect("login.asp")
    End If
    On Error Resume Next
    id = Request.QueryString("id")

   

    Set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.CommandText = "UPDATE TKNguoiDung SET TrangThai = '0' WHERE TaiKhoan='lviet13zx@gmail.com"
    cmdPrep.parameters.Append cmdPrep.createParameter("TaiKhoan",3,1, ,id)

    cmdPrep.execute
    connDB.Close()
    If Err.Number = 0 Then
    Session("Success") = "Đã xoá."    
    Else
        Session("Error") = Err.Description
    End If
    Response.Redirect("dskhachhang.asp")
    On Error Goto 0    

    
%>