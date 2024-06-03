<%-- 
    Document   : prosesmerek
    Created on : 1 May 2024, 22.35.16
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.koneksi" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merek</title>
    </head>
    <body>
        <%
            String tombol1 =  request.getParameter("submit-mrk");
            String kdmrk = request.getParameter("kodemrk");
            String nmmrk = request.getParameter("namamrk");
            String no_autom = "0001";
            String nol_plusm = "";
            
            try{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement st = conn.createStatement();
                String sql = "Select Max(right(kdmerek,4)) as urutan from merek";
                
                ResultSet rs =  st.executeQuery(sql);
                while(rs.next()) {
                  int p;
                  no_autom = Integer.toString(rs.getInt(1)+1);
                  p = no_autom.length();
                  nol_plusm = "";
                  for(int i=0;i<4-p;i++ ){
                  nol_plusm = nol_plusm + "0";
                    }
                }
                
                    
            }
            catch (Exception e)
            {
                out.print(e);
            }
          if(tombol1 != null && tombol1.toString().equals("simpan-mrk")){
            if(nmmrk == null | nmmrk.trim().isEmpty()){
                out.println("<script>alert('Nama Merek Tidak Boleh Kosong!');</script>");
                out.println("<a href='merek.jsp'>Back to Merek</a>");
            }
            else{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement st = conn.createStatement();
                String sql1 = "INSERT INTO merek(kdmerek,nmmerek)"+ "values('"+kdmrk+"', '"+nmmrk+"')";
                st.executeUpdate(sql1);
                conn.close();
                //alert("Berhasil Disimpan");
                out.print("<h1>Berhasil Disimpan</h1>");
                out.print("<a href='merek.jsp'>Back to merek</a><br>");
                out.print("<a href='index.jsp'>Back to Dashboard</a>");}
                 
                }
           
            
        %>
    </body>
</html>
