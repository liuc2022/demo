package cmb.cmbchina.demo.application.dto;

public class UserDTO {

    private final Long id;
    private final String username;
    private final String email;
    private final String status;

    public UserDTO(Long id, String username, String email, String status) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getStatus() {
        return status;
    }
}

