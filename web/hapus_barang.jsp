<%@ page import="jdbc.koneksi" %>
<%@ page import="java.sql.*" %>
<%
koneksi konek = new koneksi();
Connection conn = konek.bukaKoneksi();

// Ambil parameter yang dikirim dari halaman sebelumnya (kemungkinan berisi ID barang yang ingin dihapus)
String[] ids = request.getParameterValues("id_barang");

if (ids != null && ids.length > 0) {
    try {
        // Loop untuk setiap ID barang yang ingin dihapus
        for (String id : ids) {
            // Query untuk hapus data dengan ID yang sesuai
            String deleteQuery = "DELETE FROM barang WHERE kdbarang = ?";
            PreparedStatement ps = conn.prepareStatement(deleteQuery);
            ps.setString(1, id);
            ps.executeUpdate();
        }
        // Redirect kembali ke halaman sebelumnya setelah selesai menghapus
        response.sendRedirect("barang.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        // Tindakan jika terjadi kesalahan saat menghapus data
        // Misalnya, menampilkan pesan kesalahan atau mengarahkan ke halaman lain
    }
} else {
    // Tindakan jika tidak ada ID barang yang dipilih untuk dihapus
    // Misalnya, menampilkan pesan atau mengarahkan kembali ke halaman sebelumnya
    response.sendRedirect("barang.jsp");
}
%>
