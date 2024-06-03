<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./style.css" />
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- Your head content goes here -->
</head>
<body>
 <style>
.form-container {
    margin: auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
}
label {
    display: block;
}
input[type="text"], select {
    width: 50%;
    padding: 8px;
    margin: 6px 0 0px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
.form-buttons {
    display: flex;
    justify-items: flex-start;
    align-items: center;
}
button {
    padding: 10px 20px;
    margin: 10px;
    cursor: pointer;
}
.btn-blue {
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
}
.btn-red {
    display: flex;
    align-items: center;
    gap: 5px;
    border-radius: 5px;
    background-color: #dc3545;
    color: white;
    border: none;
}
    </style>
</head>
<body>
    <section>
    <div class="dasboard">
        <nav class="header">
          <h1>Dashboard</h1>
        </nav>
        <div class="main">
          <!-- Menu Dasboard -->
         <div class="menu_dasboard">
                    <div class="menu_profile">
                        <img class="menu_logo" src="./logo.png" alt="Logo Profile">
                        <div class="menu_name">
                            <span class="text_name">Codebyku</span>
                            <div class="admin">
                                <div class="rounded"></div>
                                <span >Admin</span>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="menu">
                            <i class="fa-solid fa-gauge"></i>
                        <span class="text">Dashboard</span>
                    </a>
                    <a href="./barang.jsp" class="menu_barang">
                        <i class="fa-solid fa-list"></i>
                        <span>Barang</span>
                    </a>
                    <a href="" class="menu_pembelian">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <span>Pembelian</span>
                    </a>
                    <a href="" class="menu_penjualan">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>Penjualan</span>
                    </a>
                    <a href="" class="menu_po">
                        <i class="fa-solid fa-bolt"></i>
                        <span>Pengeluaran Operasional</span>
                    </a>
                    <a href="" class="menu_stok">
                        <i class="fa-solid fa-inbox"></i>
                        <span>Stok Persediaan</span>
                    </a>
                    <a href="" class="menu_laporan">
                        <i class="fa-solid fa-chart-simple"></i>
                        <span>Laporan</span>
                    </a>
                    <a href="" class="menu_customer">
                        <i class="fa-solid fa-folder-closed"></i>
                        <span>Supplier & Customer</span>
                    </a>
                    <a href="" class="menu_km">
                        <div class="menu_km_n">
                            <i class="fa-solid fa-tag"></i>
                            <span>Kategori & Merk</span>
                        </div>
                        <i class="fa-solid fa-chevron-left"></i>
                    </a>
                    <!-- isi menu Kategori dan Merek -->
                    <div id="wrapper_isi_menu_km">
                        <div class="isi_menu_km" style="color: white;">
                            <a href="./kategori.html">Kategori</a>
                            <a href="./merek.html">merek</a>
                        </div>
                    </div>
                    <!-- Akhir isi Kategori dan Merek -->
                    <a href="" class="setting">
                        <i class="fa-solid fa-gear"></i>
                        <span>Setting</span>
                    </a>
                </div>
<%
String kdbarang = request.getParameter("kdbarang");

if(request.getMethod().equalsIgnoreCase("POST")) {
    String nmbarang = request.getParameter("nmbarang");
    int hrgjual = Integer.parseInt(request.getParameter("hrgjual"));
    int hrgbeli = Integer.parseInt(request.getParameter("hrgbeli"));
    String stkbarang = request.getParameter("stkbarang");
    String ktrbarang = request.getParameter("ktbarang");
    String kategoribrg = request.getParameter("kategoribrg");
    String merekbrg = request.getParameter("merekbrg");

    Connection conn = null;
    PreparedStatement pst = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/uts_kelompok3","root","");
        String sql = "UPDATE barang SET nmbarang=?, hrgjual=?,hrgbeli=?,nmkategori=?,nmmerek=?,stkbarang=?,ktrbarang=? WHERE kdbarang=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, nmbarang);
        pst.setInt(2, hrgjual);
        pst.setInt(3, hrgbeli);
        pst.setString(4, kategoribrg);
        pst.setString(5, merekbrg);
        pst.setString(6, stkbarang);
        pst.setString(7, ktrbarang);
        pst.setString(8, kdbarang);
        int rowsUpdated = pst.executeUpdate();
        if(rowsUpdated > 0) {
            out.println("<h1>Barang Berhasil DiUpdate</h1>");
            out.println("<a href='barang.jsp'>Back to barang</a>");
        } else {
            out.println("<h1>Barang Gagal Diupdate</h1>");
            out.println("<a href='barang.jsp'>Back to barang</a>");
        }
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
} else {
    // Display the form for editing
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/uts_kelompok3","root","");
        Statement st = conn.createStatement();
        String sql = "SELECT * FROM barang WHERE kdbarang='" + kdbarang + "'";
        ResultSet rs = st.executeQuery(sql);

        if (rs.next()) {
            String nmbarang = rs.getString("nmbarang");
            String nmkategori = rs.getString("nmkategori");
            String nmmerek = rs.getString("nmmerek");
            String ktrbarang = rs.getString("ktrbarang");
            int hrgbeli = rs.getInt("hrgbeli");
            int hrgjual = rs.getInt("hrgjual");
            String stkbarang = rs.getString("stkbarang");
%>
    <!-- Your edit form goes here -->
    <div class="content">
        <div class="form-container">
    <form action="" method="POST">
                <h2>Data Barang</h2>
                <div class="form-group">
                    <label for="sku">SKU:</label>
                    <input type="text" name="kdbarang" value="<%= kdbarang %>" readonly>
                </div>
                <div class="form-group">
                    <label for="nama">Nama Barang:</label>
                    <input type="text" name="nmbarang" value="<%= nmbarang %>">
                </div>
                <div class="form-group">
                    <label for="harga_jual">Harga Jual:</label>
                    <input type="text" name="hrgjual" value="<%= hrgjual %>">
                </div>
                <div class="form-group">
                    <label for="harga_beli">Harga Beli:</label>
                    <input type="text" id="harga_beli" name="hrgbeli" value="<%= hrgbeli %>">
                </div>
                <div class="form-group">
                    <label for="kategori">Kategori:</label>
                    <select id="kategori" name="kategoribrg">
                         <%
                        String sql7 = "Select * from kategori";
                        rs = st.executeQuery(sql7);
                        while(rs.next()){
                          String namkat = rs.getString("nmkategori");
                            
                        %>
                       
                        <option value="<%= namkat%>"><%= namkat%></option>
                        <%
                            }
                        %>
                    </select>
                <div class="form-group">
                    <label for="merek">Merek:</label>
                    <select id="merek" name="merekbrg">
                        <%
                        String sql8 = "select * from merek";
                        rs = st.executeQuery(sql8);
                        while(rs.next()){
                            String namaMerek = rs.getString("nmmerek");
                            
                        %>
                        <option value="<%=namaMerek%>"><%=namaMerek%></option>
                        <%
                            }
                        %>
                        
                        <!-- Tambahkan opsi merek di sini -->
                    </select>
                <div class="form-group">
                    <label for="stok_minimal">Stok Minimal:</label>
                    <input type="text" id="stok_minimal" name="stkbarang" value="<%= stkbarang %>">
                </div>
                <div class="form-group">
                    <label for="keterangan">Keterangan:</label>
                    <input type="text" id="keterangan" name="ktbarang" value="<%= ktrbarang %>">
                </div>
        <button type="submit" name="btn-update" value="update">Update</button>
    </form>
        </div>
    </div>
<%
        } else {
            // Handle case where product ID or SKU is not found
            out.println("BARANG GA DITEMUKAN!!");
            out.println("<a href='barang.jsp'>Back to barang</a>");
            
        }
        rs.close();
        st.close();
        conn.close();
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Error: " + e.getMessage());
    }
}
%>
</body>
</html>
