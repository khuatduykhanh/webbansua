<!-- #include file="connect.asp" -->
<%
    On Error Resume Next
    id = Request.QueryString("id")

    If (isnull(Session("TaiKhoan")) OR TRIM(Session("TaiKhoan")) <> "admin") Then
        Response.redirect("login.asp")
    End If
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.CommandText = "DELETE FROM GiamGia WHERE IdMagiamgia=?"
    cmdPrep.parameters.Append cmdPrep.createParameter("id",3,1, ,id)

    cmdPrep.execute
    connDB.Close()
    If Err.Number = 0 Then
    Session("Success") = "Đã xoá."    
    Else
        Session("Error") = Err.Description
    End If
    Response.Redirect("magiamgia.asp")
    On Error Goto 0    

    
%>