<%-- 
    Document   : proseskategori
    Created on : 1 May 2024, 22.34.58
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.koneksi" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kategori</title>
    </head>
    <body>
        <%
            String tombol1 =  request.getParameter("btn-submitkat");
            String kdkat = request.getParameter("kodektg");
            String nmkat = request.getParameter("namaktg");
            String no_auto = "0001";
            String nol_plus = "";
            
            try{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement st = conn.createStatement();
                String sql = "Select Max(right(kdkategori,4)) as urutan from kategori";
                ResultSet rs =  st.executeQuery(sql);
                while(rs.next()) {
                  int p;
                  no_auto = Integer.toString(rs.getInt(1)+1);
                  p = no_auto.length();
                  nol_plus = "";
                  for(int i=0;i<4-p;i++ ){
                  nol_plus = nol_plus + "0";
                    }
                }
                
                    
            }
            catch (Exception e)
            {
                out.print(e);
            }
          if(tombol1 != null && tombol1.toString().equals("simpan-kat")){
            if(nmkat == null | nmkat.trim().isEmpty()){
                out.println("<script>alert('Nama Kategori Tidak Boleh Kosong!');</script>");
                out.println("<a href='kategori.jsp'>Back to kategori</a>");
            }
            else{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement st = conn.createStatement();
                String sql1 = "INSERT INTO kategori(kdkategori,nmkategori)"+ "values('"+kdkat+"', '"+nmkat+"')";
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
