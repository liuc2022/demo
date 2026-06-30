package cmb.cmbchina.demo.domain.model.user;

public class User {

    private final Long id;
    private final String username;
    private final String email;
    private final String status;

    public User(Long id, String username, String email, String status) {
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

