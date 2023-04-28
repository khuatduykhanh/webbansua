<!-- #include file="connect.asp" -->
<%
    If (isnull(Session("email")) OR TRIM(Session("email")) = "") Then
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
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>CRUD Example</title>
    </head>
    <body>
        <!-- #include file="header.asp"-->
        <div class="container">
            <form method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Ho va ten</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
                </div>
                <div class="mb-3">
                    <label for="hometown" class="form-label">Que Quan</label>
                    <input type="text" class="form-control" id="hometown" name="hometown" value="<%=hometown%>">
                </div> 
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
            </form>
        </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </body>
</html>