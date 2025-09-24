package SecuGen.FDxSDKPro.samples;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseManager {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/huella_prueba";
    private static final String DB_USER = "root"; // Cambiar si es necesario
    private static final String DB_PASSWORD = "password"; // Cambiar si es necesario

    public DatabaseManager() {
        try {
            // Cargar el driver JDBC de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("Error: MySQL JDBC Driver no encontrado.");
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    public void createFingerprintTable() throws SQLException {
        String createTableSQL = "CREATE TABLE IF NOT EXISTS huellas_dactilares (" +
                                "id INT AUTO_INCREMENT PRIMARY KEY," +
                                "nombre_usuario VARCHAR(255) NOT NULL UNIQUE," +
                                "plantilla_huella BLOB NOT NULL)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(createTableSQL)) {
            pstmt.executeUpdate();
            System.out.println("Tabla 'huellas_dactilares' creada o ya existente.");
        }
    }

    public boolean saveFingerprintTemplate(String username, byte[] template) {
        String insertSQL = "INSERT INTO huellas_dactilares (nombre_usuario, plantilla_huella) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
            pstmt.setString(1, username);
            pstmt.setBytes(2, template);
            pstmt.executeUpdate();
            System.out.println("Plantilla de huella dactilar guardada para el usuario: " + username);
            return true;
        } catch (SQLException e) {
            System.err.println("Error al guardar la plantilla de huella dactilar para " + username + ": " + e.getMessage());
            return false;
        }
    }

    public List<byte[]> getAllFingerprintTemplates() {
        List<byte[]> templates = new ArrayList<>();
        String selectSQL = "SELECT plantilla_huella FROM huellas_dactilares";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(selectSQL);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                templates.add(rs.getBytes("plantilla_huella"));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener las plantillas de huellas dactilares: " + e.getMessage());
        }
        return templates;
    }
    
    public byte[] getFingerprintTemplateByUsername(String username) {
        String selectSQL = "SELECT plantilla_huella FROM huellas_dactilares WHERE nombre_usuario = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(selectSQL)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getBytes("plantilla_huella");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener la plantilla de huella dactilar para " + username + ": " + e.getMessage());
        }
        return null;
    }
}
