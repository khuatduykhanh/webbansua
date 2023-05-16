<!-- #include file="connect.asp" -->
<%
    On Error Resume Next
    id = Request.QueryString("id")

   

    Set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.CommandText = "DELETE FROM GiamGia WHERE IdMagiamgia=?"
    cmdPrep.parameters.Append cmdPrep.createParameter("IdMagiamgia",3,1, ,id)

    cmdPrep.execute
    connDB.Close()
    If Err.Number = 0 Then
    Session("Success") = "Deleted"    
    Else
        Session("Error") = Err.Description
    End If
    Response.Redirect("magiamgia.asp")
    On Error Goto 0    

    
%>