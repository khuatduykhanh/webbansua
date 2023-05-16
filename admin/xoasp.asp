<!-- #include file="connect.asp" -->
<%
    On Error Resume Next
    id = Request.QueryString("id")

   

    Set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.CommandText = "DELETE FROM SanPham WHERE Masp=?"
    cmdPrep.parameters.Append cmdPrep.createParameter("MaSp",3,1, ,id)

    cmdPrep.execute
    connDB.Close()
    If Err.Number = 0 Then
    Session("Success") = "Deleted"    
    Else
        Session("Error") = Err.Description
    End If
    Response.Redirect("sanpham.asp")
    On Error Goto 0    

    
%>