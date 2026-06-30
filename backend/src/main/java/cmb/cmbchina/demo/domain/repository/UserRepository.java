package cmb.cmbchina.demo.domain.repository;

import cmb.cmbchina.demo.domain.model.user.User;

import java.util.List;

public interface UserRepository {

    List<User> findAll();

    boolean existsByUsername(String username);

    void save(User user);
}
