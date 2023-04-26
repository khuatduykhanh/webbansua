<%
'code here
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection
strConnection = "Provider=SQLOLEDB.1;Data Source=DESKTOP-IN6A4LG\SQLEXPRESS;Database=WebBanSua;User Id=sa;Password=123123"
connDB.ConnectionString = strConnection
%>