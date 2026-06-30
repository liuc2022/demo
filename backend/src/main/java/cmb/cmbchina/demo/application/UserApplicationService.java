package cmb.cmbchina.demo.application;

import cmb.cmbchina.demo.application.command.CreateUserCommand;
import cmb.cmbchina.demo.application.dto.UserDTO;
import cmb.cmbchina.demo.domain.model.user.User;
import cmb.cmbchina.demo.domain.repository.UserRepository;
import cmb.cmbchina.demo.infrastructure.common.BusinessException;
import cmb.cmbchina.demo.infrastructure.common.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserApplicationService {

    private final UserRepository userRepository;

    public UserApplicationService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<UserDTO> listUsers() {
        List<User> users = userRepository.findAll();
        return users.stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    @Transactional
    public void createUser(CreateUserCommand command) {
        if (userRepository.existsByUsername(command.getUsername())) {
            throw new BusinessException(ErrorCode.USER_ALREADY_EXISTS);
        }

        User user = new User(null, command.getUsername(), command.getEmail(), command.getStatus());
        userRepository.save(user);
    }

    private UserDTO toDTO(User user) {
        return new UserDTO(user.getId(), user.getUsername(), user.getEmail(), user.getStatus());
    }
}
