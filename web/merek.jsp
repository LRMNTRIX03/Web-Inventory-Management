<%-- 
    Document   : merek
    Created on : 1 May 2024, 20.19.32
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="prosesmerek.jsp" %>
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
  </head>
  <style>
    form {
    width: 100%;
    margin: auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
}

form label {
    display: block;
    margin-top: 5px;
}

form input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button[type="submit"] {
    display: flex;
    align-items: center;
    gap: 5px;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;

}
.title {
    color: white;
}
  </style>
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
                <span>merek</span>
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
            <div class="breadcrumb">Dashboard / Merek / Data Merek</div>
            <h2 class="title">Data Merek</h2>
            <form action="prosesmerek.jsp">
                <label for="kode">Kode:</label>
                <input type="text" id="kode" name="kodemrk" value="MRK<%= nol_plusm + no_autom%>" readonly><br>
                <label for="nama">Nama Merek:</label>
                <input type="text" id="nama" name="namamrk" placeholder="Masukkan Nama"><br>
                <button type="submit" name="submit-mrk" value="simpan-mrk">
                    <i class="fa-regular fa-floppy-disk"></i>Simpan
                </button>
            </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <script src="./index.js"></script>
  </body>
</html>
