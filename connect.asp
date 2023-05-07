<%
'code here
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection
strConnection = "Provider=SQLOLEDB.1;Data Source=LAPTOP-BFJL2SD5;Database=WebBanSua;User Id=sa;Password=20112002"
connDB.ConnectionString = strConnection
%>
