<%-- 
    Document   : prosesbarang
    Created on : 1 May 2024, 20.53.32
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.koneksi" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proses Barang</title>
    </head>
    <body>
        <%
        String kdbarang = request.getParameter("kodebrg");
        String nmbarang = request.getParameter("namabrg");
        String jualbrg = request.getParameter("harga_jualbrg");
        String belibrg = request.getParameter("harga_belibrg");
        String kategoribrg = request.getParameter("kategoribrg");
        String merekbrg = request.getParameter("merekbrg");
        String stockbrg = request.getParameter("stok_minimalbrg");
        String keteranganbrg = request.getParameter("keteranganbrg");
        String tombol = request.getParameter("btn-simpan");
        String no_autob = "0001";
        String nol_plusb = "";
        
        
        
        
        try{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement st = conn.createStatement();
                String sql = "Select Max(right(kdbarang,4)) as urutan from barang";
                
                ResultSet rs =  st.executeQuery(sql);
                while(rs.next()) {
                  int p;
                  no_autob = Integer.toString(rs.getInt(1)+1);
                  p = no_autob.length();
                  nol_plusb = "";
                  for(int i=0;i<4-p;i++ ){
                  nol_plusb = nol_plusb + "0";
                    }
                }
                
                    
            }
            catch (Exception e)
            {
                out.print(e);
            }
          if(tombol != null && tombol.toString().equals("simpan")){
            if(nmbarang == null | nmbarang.trim().isEmpty()){
                out.println("<script>alert('Nama barang Tidak Boleh Kosong!');</script>");
                out.println("<a href='input_barang.jsp'>Back to barang</a>");
            }
            else{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement st = conn.createStatement();
                String sql1 = "INSERT INTO barang(kdbarang,nmbarang,hrgjual,hrgbeli,nmkategori,nmmerek,stkbarang,ktrbarang)"+ "values('"+kdbarang+"', '"+nmbarang+"','"+jualbrg+"','"+belibrg+"','"+kategoribrg+"','"+merekbrg+"','"+stockbrg+"','"+keteranganbrg+"')";
                st.executeUpdate(sql1);
                conn.close();
                //alert("Berhasil Disimpan");
                out.print("<h1>Berhasil Disimpan</h1>");
                out.println("<a href='kategori.jsp'>Back to kategori</a>");
                out.println("<a href='index.jsp'>Back to Dashboard</a>");}
                 
                }
        
        %>
    </body>
</html>
