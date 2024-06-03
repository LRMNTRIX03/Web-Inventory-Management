<%-- 
    Document   : input_barang
    Created on : 1 May 2024, 20.21.10
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.koneksi" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@include file="prosesbarang.jsp" %>
<!DOCTYPE html>
<html>
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
    <title>Dashboard CRUD</title>
      <style>
        .btn-kategori {
            padding: 10px;
            background-color: red;
            text-decoration: none;
            color: white;
        }
        .btn-merek {
            padding: 10px;
            background-color: blue;
            text-decoration: none;
            color: white;;
        }
     </style>
  </head>
  <body>
   <%
    String id = "";
    String namkat = "";
    koneksi konek = new koneksi();
    Connection conn = konek.bukaKoneksi();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String sql2 = "select * from kategori";
    stmt = conn.prepareStatement(sql2);
    rs = stmt.executeQuery();
        
        
    %>
    <section>
      <div class="dasboard">
        <nav class="header">
          <h1>Dashboard</h1>
        </nav>
        <div class="main">
          <!-- Menu Dasboard -->
          <div class="menu_dasboard">
            <div class="menu_profile">
              <img class="menu_logo" src="./logo.png" alt="Logo Profile" />
              <div class="menu_name">
                <span class="text_name">Codebyku</span>
                <div class="admin">
                  <div class="rounded"></div>
                  <span>Admin</span>
                </div>
              </div>
            </div>
            <a href="./index.jsp" class="menu">
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
              <div class="isi_menu_km" style="color: white">
                <a href="./kategori.jsp">Kategori</a>
                <a href="./merek.jsp">merek</a>
              </div>
            </div>
            <!-- Akhir isi Kategori dan Merek -->
            <a href="" class="setting">
              <i class="fa-solid fa-gear"></i>
              <span>Setting</span>
            </a>
          </div>
          <!-- Content Dasboard -->
          <div class="content">
            <div class="form-container">
                <h2>Data Barang</h2>
                <form action="prosesbarang.jsp">
                    <div class="form-group">
                    <label for="sku">SKU:</label>
                    <input type="text" id="sku" name="kodebrg" placeholder="BRG*******" value ="BRG<%=nol_plusb + no_autob%>" readonly>
                </div>
                <div class="form-group">
                    <label for="nama">Nama Barang:</label>
                    <input type="text" id="nama" name="namabrg" placeholder="Masukan Nama Barang">
                </div>
                <div class="form-group">
                    <label for="harga_jual">Harga Jual:</label>
                    <input type="text" id="harga_jual" name="harga_jualbrg" placeholder="Masukan Harga Jual">
                </div>
                <div class="form-group">
                    <label for="harga_beli">Harga Beli:</label>
                    <input type="text" id="harga_beli" name="harga_belibrg" placeholder="Masukan Harga Beli">
                </div>
                <div class="form-group">
                    <label for="kategori">Kategori:</label>
                    <select id="kategori" name="kategoribrg">
                        <option value="">Pilih Kategori</option>
                        <%
                        while(rs.next()){
                          namkat = rs.getString("nmkategori");
                            
                        %>
                        <option value="<%= namkat%>"><%= namkat%></option>
                        <%
                            }
                        %>
                      
                        <!-- Tambahkan opsi kategori di sini -->
                    </select>
                    <%
                    String sql3 = "select * from merek";
                    stmt = conn.prepareStatement(sql3);
                    rs = stmt.executeQuery();
                    String namaMerek = "";
                    %>
                    <a class="btn-kategori" href="./kategori.jsp">Tambah Kategori</a>
                </div>
                <div class="form-group">
                    <label for="merek">Merek:</label>
                    <select id="merek" name="merekbrg">
                        <option value="">Pilih Merek</option>
                        <%
                        while(rs.next()){
                            namaMerek = rs.getString("nmmerek");
                            
                        %>
                        <option value="<%=namaMerek%>"><%=namaMerek%></option>
                        <%
                            }
                        %>
                        
                        <!-- Tambahkan opsi merek di sini -->
                    </select>
                      <a class="btn-merek" href="./merek.jsp">Tambah Merek</a>
                </div>
                <div class="form-group">
                    <label for="stok_minimal">Stok Minimal:</label>
                    <input type="text" id="stok_minimal" name="stok_minimalbrg" placeholder="Masukan Nomor">
                </div>
                <div class="form-group">
                    <label for="keterangan">Keterangan:</label>
                    <input type="text" id="keterangan" name="keteranganbrg" placeholder="Masukan Keterangan">
                </div>
                <div class="form-buttons">
                    <button class="btn-red" type="reset">Batal</button>
                    <button class="btn-blue" name="btn-simpan" value="simpan">
                        <i class="fa-regular fa-floppy-disk"></i>
                        Simpan
                    </button>
                </div>
            </div>
          </div>
        </div>
      </div>
    </section>
                </form>
                
    <script src="./index.js"></script>
  </body>
</html>
