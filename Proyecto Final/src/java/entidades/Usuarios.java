package entidades;

public class Usuarios {
    
    private Integer idUsuario;
    private String admin;
    private String contrasena;
    private String correo;

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getAdmin() {
        return admin;
    }
    
}
