package cmb.cmbchina.demo.controller;

import cmb.cmbchina.demo.application.UserApplicationService;
import cmb.cmbchina.demo.application.command.CreateUserCommand;
import cmb.cmbchina.demo.application.dto.UserDTO;
import cmb.cmbchina.demo.infrastructure.common.ApiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserApplicationService userApplicationService;

    public UserController(UserApplicationService userApplicationService) {
        this.userApplicationService = userApplicationService;
    }

    @GetMapping
    public ApiResponse<List<UserDTO>> listUsers() {
        return ApiResponse.success(userApplicationService.listUsers());
    }

    @PostMapping
    public ApiResponse<Void> createUser(@Valid @RequestBody CreateUserCommand command) {
        userApplicationService.createUser(command);
        return ApiResponse.success(null);
    }
}
