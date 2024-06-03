<%-- 
    Document   : barang
    Created on : 1 May 2024, 20.17.40
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.koneksi" %>
<%@page import="java.sql.*" %>
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
    <%
    koneksi konek = new koneksi();
    Connection conn = konek.bukaKoneksi();
    Statement st = conn.createStatement();
    String sql = "select count(*) as urutan from barang";
    String kdbarang,nmbarang,nmkategori,nmmerek,ktrbarang,stkbarang;
    String p = "0";
    int hrgjual,hrgbeli;
    ResultSet rs = st.executeQuery(sql);
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
            <a href="" class="menu_barang">
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
                <a href="./kategori.jsp"">Kategori</a>
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
            <div class="breadcrumb">Dashboard / Barang</div>
            <div class="buttons">
              <a href="./input_barang.jsp" class="tambah">
                <i class="fa-solid fa-plus"></i>
                 Tambah
              </a>
              <button class="stok-minimal">
                <i class="fa-solid fa-tag"></i>Stok Minimal</button>
              <button class="refresh">
                <i class="fa-solid fa-arrows-rotate"></i>Refresh</button>
            </div>
            <div class="table_card">
                <div class="table_header">
                    <%
                          while(rs.next()){
                            p = rs.getString("urutan");
                           
                           
                            
                    %>
                    <div class="entries">
                        Show
                        <select name="entries" id="entries">
                           <option value="<%= p %>"><%= p %></option>
                           <%
                               }
                           %>
                          <!-- Tambahkan opsi lain jika diperlukan -->
                        </select>
                        entries
                      </div>
                      <div class="search">
                        <span>Search:</span>
                        <input class="input" placeholder="Search" type="text" id="search" />
                    </div>
                </div>
                  
                  <table>
                    <thead>
                        <tr>
                        <th>SKU</th>
                        <th>Nama</th>
                        <th>Harga Jual</th>
                        <th>Harga Beli</th>
                        <th>Kategori</th>
                        <th>Merek</th>
                        <th>stock</th>
                        <th>Keterangan</th>
                        
                      </tr>
                    </thead>
                           <%
                        String sql1 = "Select * from barang";
                        rs = st.executeQuery(sql1);
                        while(rs.next()){
                         kdbarang = rs.getString("kdbarang");
                         nmbarang = rs.getString("nmbarang");
                         nmkategori = rs.getString("nmkategori");
                         nmmerek = rs.getString("nmmerek");
                         ktrbarang = rs.getString("ktrbarang");
                         hrgjual = rs.getInt("hrgjual");
                         hrgbeli = rs.getInt("hrgbeli");
                         stkbarang = rs.getString("stkbarang");
                            %>
                    <tbody>
                      <tr>
                        <td><%= kdbarang %></td>
                        <td><%= nmbarang %></td>
                        <td><%= hrgjual %></td>
                        <td><%= hrgbeli%></td>
                        <td><%= nmkategori%></td>
                        <td><%= nmmerek%></td>
                        <td><%= stkbarang %></td>
                        <td><%= ktrbarang%></td>
                        <td>
                            <div class="opsi">
                                
                                <a class="edit" href="edit_Update.jsp?kdbarang=<%= kdbarang%>">
                                 <i class="fa-solid fa-pen-to-square"></i>
                               </a>
                                <form action="hapus_barang.jsp" method="post">
                                <input type="hidden" name="id_barang" value="<%= kdbarang %>">
                                <button type="submit" class="hapus" onclick="return  confirm('Apakah Anda yakin ingin menghapus Barang?');">
                                <i class="fa-solid fa-trash"></i>hapus
                                </button>
                                </form>
                           </div>
                        </td>
                      </tr>
                      
                    </tbody>
                      <%
                      }
                  %>
                  </table>
                
                  <!-- <div class="pagination">
                    Showing 1 to 1 of 1 entries
                    <button class="previous">Previous</button>
                    <span>1</span>
                    <button class="next">Next</button>
                  </div> -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <script src="./index.js"></script>
  </body>
</html>
