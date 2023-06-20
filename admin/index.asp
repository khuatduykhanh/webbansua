<!-- #include file="..\connect.asp" -->
<%
    If (isnull(Session("TaiKhoan")) OR TRIM(Session("TaiKhoan")) <> "admin") Then
        Response.redirect("login.asp")
    End If
    connDB.Open()
    Dim tong,thongke,tong1,tong2
    Dim arraythang(11) 
    Dim arrayquy(3)  
    Dim arraynam(4) 
    Dim arraynhap(12)
    Dim arrayxuat(12)
    Dim sqlString, rs,sqlString1, rs1
    If (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN
        set thongke = Request.form("thongke")
        If(thongke = "thang") then
            For i = 0 To 11
                
                sqlString = "SELECT SUM(TongHD) AS TongThuThang FROM HoaDon WHERE MONTH(NgayBan) = "& i+1 & "and YEAR(NgayBan) = YEAR(GETDATE())"
                sqlString1 = "SELECT SUM(TongNhap) AS TongNhapThang FROM HDNhap WHERE MONTH(NgayNhap) = "& i+1 & "and YEAR(NgayNhap) = YEAR(GETDATE())"
                set rs = connDB.execute(sqlString)
                set rs1 = connDB.execute(sqlString1)
                if (not IsNull(rs("TongThuThang")))then
                    arrayxuat(i) = rs("TongThuThang")
                else 
                    arrayxuat(i) = 0
                end if
                if (not IsNull(rs1("TongNhapThang")))then
                    arraynhap(i) = rs1("TongNhapThang")
                else 
                    arraynhap(i) = 0
                end if
                if (not IsNull(rs("TongThuThang")) and not IsNull(rs1("TongNhapThang"))) then
                 tong = rs("TongThuThang") - rs1("TongNhapThang")

                 arraythang(i) = tong
                else 
                    arraythang(i)= 0
                end if
            Next  
        end if
        If(thongke = "quy") then
            For i = 0 To 3
                ' Dim sqlString, rs,sqlString1, rs1
                sqlString = "SELECT SUM(TongHD) AS TongThuQuy FROM HoaDon WHERE DATEPART(quarter, NgayBan) = "& i+1 & " and YEAR(NgayBan) = YEAR(GETDATE())"
                sqlString1 = "SELECT SUM(TongNhap) AS TongNhapQuy FROM HDNhap WHERE DATEPART(quarter, NgayNhap) = "& i+1 & "and YEAR(NgayNhap) = YEAR(GETDATE())"
                set rs = connDB.execute(sqlString)
                set rs1 = connDB.execute(sqlString1)
                if (not IsNull(rs("TongThuQuy")))then
                    arrayxuat(i) = rs("TongThuQuy")
                else 
                    arrayxuat(i) = 0
                end if
                if (not IsNull(rs1("TongNhapQuy")))then
                    arraynhap(i) = rs1("TongNhapQuy")
                else 
                    arraynhap(i) = 0
                end if
                if (not IsNull(rs("TongThuQuy")) and not IsNull(rs1("TongNhapQuy"))) then
                 tong = rs("TongThuQuy") - rs1("TongNhapQuy")
                  arrayquy(i) = tong  
                else 
                    arrayquy(i) = 0  
                end if
            Next     
        end if
        If(thongke = "nam") then
            For i = 0 To 3
                ' Dim sqlString, rs,sqlString1, rs1
                sqlString = "SELECT SUM(TongHD) AS TongThuNam FROM HoaDon WHERE YEAR(NgayBan) = "& i+2023 & ""
                sqlString1 = "SELECT SUM(TongNhap) AS TongNhapNam FROM HDNhap WHERE YEAR(NgayNhap) = "& i+2023 & ""
                set rs = connDB.execute(sqlString)
                set rs1 = connDB.execute(sqlString1)
                if (not IsNull(rs("TongThuNam")))then
                    arrayxuat(i) = rs("TongThuNam")
                else 
                    arrayxuat(i) = 0
                end if
                if (not IsNull(rs1("TongNhapNam")))then
                    arraynhap(i) = rs1("TongNhapNam")
                else 
                    arraynhap(i) = 0
                end if
                if (not IsNull(rs("TongThuNam")) and not IsNull(rs1("TongNhapNam"))) then
                tong = rs("TongThuNam") - rs1("TongNhapNam")
                arraynam(i) = tong
                else    
                    arraynam(i) = 0
                end if
            Next     
        end if
    End if 
    Dim arraySlnguoimua(30)
    Dim arraySldondathang(30)
    Dim sqlString2, rs2,sqlString3, rs3
    For i = 0 To  30
                sqlString2 = "SELECT COUNT(DISTINCT TaiKhoan) AS SLNguoiMua FROM HoaDon WHERE DATEPART(YEAR, NgayBan) = YEAR(GETDATE()) AND DATEPART(MONTH, NgayBan) = MONTH(GETDATE()) AND DATEPART(DAY, NgayBan) = " & i+1 & ""
                sqlString3 = "SELECT COUNT(IdHoaDon) AS SLDonDat FROM HoaDon WHERE DATEPART(YEAR, NgayBan) = YEAR(GETDATE()) AND DATEPART(MONTH, NgayBan) = MONTH(GETDATE()) AND DATEPART(DAY, NgayBan) = " & i+1 & ""
                set rs2 = connDB.execute(sqlString2)
                set rs3 = connDB.execute(sqlString3)
                if (not IsNull(rs2("SLNguoiMua")))then
                    arraySlnguoimua(i) = rs2("SLNguoiMua")
                else 
                    arraySlnguoimua(i) = 0
                end if
                if (not IsNull(rs3("SLDonDat")))then
                    arraySldondathang(i) = rs3("SLDonDat")
                else 
                    arraySldondathang(i) = 0
                end if
            Next   
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link rel='shortcut icon' href='./Anh/download.ico' />
    <title>Admin</title>
    
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>


<!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
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
.title{
    margin-left: 450px;
    width: 300px;
}
.chartheader{
    display: flex;
    width: 200px;
    margin: 20px auto;

}
.chart{
    width:80%;
    margin: 30px auto;
}
.header{
    display:flex;
    justify-content: center;
    margin-top: 30px;
    margin-bottom:30px;
}
</style>
<body>
<div class="wrapper">
 
    <!-- #include file="sidebar.asp" -->
    <div class="content">
    <!-- #include file="header.asp" -->
    <p class="title">Biểu đồ thống kê doanh thu</p>
    <div class="chartheader">
    <form method="post" id="myForm" >
    <select class="form-select" name="thongke" id="thongke" aria-label="Default select example">
    <option value="thang">Tháng</option>
    <option value="quy">Quý</option>
    <option value="nam">Năm</option>
    </select>
    <button type="submit" class="btn btn-primary">Thống kê</button>
    </form>
    </div>
    ' 
    <div class="chart">
    <canvas id="myChart"></canvas>
    </div>
    <div class="header">So Luong Nguoi mua trong thang hien tai</div>
    <div class="chart1">
    <canvas id="myChart1"></canvas>
    </div>
    <div> 
</div>
<!-- #include file="footer.asp" -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  const ctx = document.getElementById('myChart');
  const ctx1 = document.getElementById('myChart1');
   new Chart(ctx1, {
    type: 'scatter',
    data: {
      labels: ['1', '2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'],
      datasets: [{
        type: 'line',
        label: 'So Luong Nguoi Mua',
        data: [ <%=arraySlnguoimua(0)%>, <%=arraySlnguoimua(1)%>, <%=arraySlnguoimua(2)%>, <%=arraySlnguoimua(3)%>, <%=arraySlnguoimua(4)%>, <%=arraySlnguoimua(5)%>, <%=arraySlnguoimua(6)%>, <%=arraySlnguoimua(7)%>, <%=arraySlnguoimua(8)%>, <%=arraySlnguoimua(9)%>, <%=arraySlnguoimua(10)%>, <%=arraySlnguoimua(11)%>, <%=arraySlnguoimua(12)%>, <%=arraySlnguoimua(13)%>, <%=arraySlnguoimua(14)%>, <%=arraySlnguoimua(15)%>, <%=arraySlnguoimua(16)%>, <%=arraySlnguoimua(17)%>, <%=arraySlnguoimua(18)%>, <%=arraySlnguoimua(19)%>, <%=arraySlnguoimua(20)%>, <%=arraySlnguoimua(21)%>, <%=arraySlnguoimua(22)%>, <%=arraySlnguoimua(23)%>, <%=arraySlnguoimua(24)%>, <%=arraySlnguoimua(25)%>, <%=arraySlnguoimua(26)%>, <%=arraySlnguoimua(27)%>, <%=arraySlnguoimua(28)%>, <%=arraySlnguoimua(29)%>, <%=arraySlnguoimua(30)%>],
        borderWidth: 1
      },
      {
        type: 'line',
        label: 'So Luong Don Dat Hang',
        data: [ <%=arraySldondathang(0)%>, <%=arraySldondathang(1)%>, <%=arraySldondathang(2)%>, <%=arraySldondathang(3)%>, <%=arraySldondathang(4)%>, <%=arraySldondathang(5)%>, <%=arraySldondathang(6)%>, <%=arraySldondathang(7)%>, <%=arraySldondathang(8)%>, <%=arraySldondathang(9)%>, <%=arraySldondathang(10)%>, <%=arraySldondathang(11)%>, <%=arraySldondathang(12)%>, <%=arraySldondathang(13)%>, <%=arraySldondathang(14)%>, <%=arraySldondathang(15)%>, <%=arraySldondathang(16)%>, <%=arraySldondathang(17)%>, <%=arraySldondathang(18)%>, <%=arraySldondathang(19)%>, <%=arraySldondathang(20)%>, <%=arraySldondathang(21)%>, <%=arraySldondathang(22)%>, <%=arraySldondathang(23)%>, <%=arraySldondathang(24)%>, <%=arraySldondathang(25)%>, <%=arraySldondathang(26)%>, <%=arraySldondathang(27)%>, <%=arraySldondathang(28)%>, <%=arraySldondathang(29)%>, <%=arraySldondathang(30)%>],
        borderWidth: 1
      }
      ]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  
  if("<%=thongke%>" == "thang"){
    new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Thang 1', 'Thang 2','Thang 3','Thang 4','Thang 5','Thang 6','Thang 7','Thang 8','Thang 9','Thang 10','Thang 11','Thang 12'],
      datasets: [{
        type: 'line',
        label: 'Tong Doanh Thu',
        data: [ <%=arraythang(0)%>, <%=arraythang(1)%>, <%=arraythang(2)%>, <%=arraythang(3)%>, <%=arraythang(4)%>, <%=arraythang(5)%>, <%=arraythang(6)%>, <%=arraythang(7)%>, <%=arraythang(8)%>, <%=arraythang(9)%>, <%=arraythang(10)%>, <%=arraythang(11)%>],
        borderWidth: 1
      },
      {
        type: 'line',
        label: 'Tong Nhap',
        data: [ <%=arraynhap(0)%>, <%=arraynhap(1)%>, <%=arraynhap(2)%>, <%=arraynhap(3)%>, <%=arraynhap(4)%>, <%=arraynhap(5)%>, <%=arraynhap(6)%>, <%=arraynhap(7)%>, <%=arraynhap(8)%>, <%=arraynhap(9)%>, <%=arraynhap(10)%>, <%=arraynhap(11)%>],
        borderWidth: 1
      },
      {
        type: 'line',
        label: 'Tong Xuat',
        data: [ <%=arrayxuat(0)%>, <%=arrayxuat(1)%>, <%=arrayxuat(2)%>, <%=arrayxuat(3)%>, <%=arrayxuat(4)%>, <%=arrayxuat(5)%>, <%=arrayxuat(6)%>, <%=arrayxuat(7)%>, <%=arrayxuat(8)%>, <%=arrayxuat(9)%>, <%=arrayxuat(10)%>, <%=arrayxuat(11)%>],
        borderWidth: 1
      }
      ]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  }); 
  }
    if ( "<%=thongke%>" == "quy") {
        new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Quy 1', 'Quy 2','Quy 3','Quy 4'],
      datasets: [{
        type: 'bar',
        label: 'Tong Doanh Thu',
        data: [ <%=arrayquy(0)%>, <%=arrayquy(1)%>, <%=arrayquy(2)%>, <%=arrayquy(3)%>],
        borderWidth: 1
      },
      {
        type: 'bar',
        label: 'Tong Nhap',
        data: [ <%=arraynhap(0)%>, <%=arraynhap(1)%>, <%=arraynhap(2)%>, <%=arraynhap(3)%>],
        borderWidth: 1
      },{
        type: 'bar',
        label: 'Tong Xuat',
        data: [ <%=arrayxuat(0)%>, <%=arrayxuat(1)%>, <%=arrayxuat(2)%>, <%=arrayxuat(3)%>],
        borderWidth: 1
      }
      
      ]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  }); 
    } 
    if ( "<%=thongke%>" == "nam") {
        new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Nam 2023', 'Nam 2024','Nam 2025','Nam 2026'],
      datasets: [{
        type: 'bar',
        label: 'Tong Doanh Thu',
        data: [ <%=arraynam(0)%>, <%=arraynam(1)%>, <%=arraynam(2)%>, <%=arraynam(3)%>],
        borderWidth: 1
      },
      {
        type: 'bar',
        label: 'Tong Nhap',
        data: [ <%=arraynhap(0)%>, <%=arraynhap(1)%>, <%=arraynhap(2)%>, <%=arraynhap(3)%>],
        borderWidth: 1
      },
      {
        type: 'bar',
        label: 'Tong Xuat',
        data: [ <%=arrayxuat(0)%>, <%=arrayxuat(1)%>, <%=arrayxuat(2)%>, <%=arrayxuat(3)%>],
        borderWidth: 1
      }
      ]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  }); 
    } 
</script>
</body>
</html>