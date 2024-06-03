<%-- 
    Document   : index.jsp
    Created on : 29 Apr 2024, 12.02.47
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.koneksi" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Dashboard CRUD</title>
    <%
    koneksi konek = new koneksi();
    Connection conn = konek.bukaKoneksi();
    Statement st = conn.createStatement();
    String sql1 = "select count(*) as urutan from barang";
    ResultSet rs = st.executeQuery(sql1);
    %>
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
                    <div class="cards">
                        <!-- Card 1 -->
                        <div class="card">
                            <div class="card_content">
                                <div>
                                    <h1>4</h1>
                                    <span>Karyawan</span>
                                </div>
                                <img class="user_logo" src="./user.png" alt="">
                            </div>
                            <div class="card_footer">
                                <i class="fa-solid fa-arrow-right"></i>
                                <span>info Lengkap</span>
                            </div>
                        </div>
                        <!-- Card 2 -->
                        <div class="card">
                            <div class="card_content">
                                <div>
                                    <%
                                    while(rs.next()){
                                        String jml = rs.getString("urutan");
                                        
                                    %>
                                    <h1><%=jml%></h1>
                                    <%
                                        }
                                    %>
                                    <span>Jumlah Barang</span>
                                </div>
                                <img class="user_logo" src="./user.png" alt="">
                            </div>
                            <div class="card_footer">
                                <i class="fa-solid fa-arrow-right"></i>
                                <span>info Lengkap</span>
                            </div>
                        </div>
                        <!-- Card 3 -->
                        <div class="card">
                            <div class="card_content">
                                <div>
                                    <%
                                    String sql2= "Select count(*) as kat from kategori";
                                    rs = st.executeQuery(sql2);
                                    while(rs.next()){
                                        String kat = rs.getString("kat");
                                        
                                    %>
                                    <h1><%=kat%></h1>
                                    <%
                                        }
                                    %>
                                    <span>Kategori</span>
                                </div>
                                <img class="user_logo" src="./user.png" alt="">
                            </div>
                            <div class="card_footer">
                                <i class="fa-solid fa-arrow-right"></i>
                                <span>info Lengkap</span>
                            </div>
                        </div>
                        <!-- Card 4 -->
                        <div class="card">
                            <div class="card_content">
                                <div>
                                    <%
                                    String sql4= "Select count(*) as mrk from merek";
                                    rs = st.executeQuery(sql4);
                                    while(rs.next()){
                                        String mrk = rs.getString("mrk");
                                        
                                    %>
                                    <h1><%=mrk%></h1>
                                    <%
                                        }
                                    %>
                                    <span>Merek</span>
                                </div>
                                <img class="user_logo" src="./user.png" alt="">
                            </div>
                            <div class="card_footer">
                                <i class="fa-solid fa-arrow-right"></i>
                                <span>info Lengkap</span>
                            </div>
                        </div>                    
                    </div>
                    <div class="conten_barang">
                        <div class="card_barang">
                            <div class="card_barang_header">
                                <span >Barang dibawah stok minimal </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="./index.js"></script>
</body>
</html>
