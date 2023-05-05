<%@ Language=VBScript %>
<%Option Explicit%>
<!-- #include file="class_img.asp" -->
<%
    dim params,lngBLOB 
    set params=Request.QueryString("Imagenes")
    dim strPhysicalPath,objFSO,objFolder
    strPhysicalPath = Server.MapPath("\Images\")
    Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
    Set objFolder = objFSO.GetFolder(strPhysicalPath)
    DIM Obtener_Binarios , Buffer,FilePath
    Set Obtener_Binarios = New class_img
    FilePath = objFolder&"\"&params
    Buffer = Obtener_Binarios.ReadBinaryFile(FilePath) 

    With Response
	    .AddHeader "Content-Disposition", "attachment; filename="&params
	    .AddHeader "Content-Length", lngBLOB
	    .ContentType = "binary/octet-stream"
	    .BinaryWrite Buffer
	    .Flush
    End With

%>
