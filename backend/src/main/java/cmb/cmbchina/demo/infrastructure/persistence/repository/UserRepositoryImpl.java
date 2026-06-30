package cmb.cmbchina.demo.infrastructure.persistence.repository;

import cmb.cmbchina.demo.domain.model.user.User;
import cmb.cmbchina.demo.domain.repository.UserRepository;
import cmb.cmbchina.demo.infrastructure.persistence.mapper.UserMapper;
import cmb.cmbchina.demo.infrastructure.persistence.po.UserPO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
public class UserRepositoryImpl implements UserRepository {

    private final UserMapper userMapper;

    public UserRepositoryImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll()
                .stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public boolean existsByUsername(String username) {
        return userMapper.findByUsername(username) != null;
    }

    @Override
    public void save(User user) {
        UserPO userPO = new UserPO();
        userPO.setUsername(user.getUsername());
        userPO.setEmail(user.getEmail());
        userPO.setStatus(user.getStatus());
        userMapper.insert(userPO);
    }

    private User toDomain(UserPO userPO) {
        return new User(userPO.getId(), userPO.getUsername(), userPO.getEmail(), userPO.getStatus());
    }
}
