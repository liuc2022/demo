package cmb.cmbchina.demo.application.command;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class CreateUserCommand {

    @NotBlank(message = "username must not be blank")
    private String username;

    @NotBlank(message = "email must not be blank")
    @Email(message = "email format is invalid")
    private String email;

    @NotBlank(message = "status must not be blank")
    private String status;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

