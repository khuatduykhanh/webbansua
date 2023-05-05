<%
'code here
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection
strConnection = "Provider=SQLOLEDB.1;Data Source=LAPTOP-BFJL2SD5;Database=WebBanSua1;User Id=sa;Password=123123"
connDB.ConnectionString = strConnection
%>