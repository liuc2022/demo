package cmb.cmbchina.demo.infrastructure.persistence.mapper;

import cmb.cmbchina.demo.infrastructure.persistence.po.UserPO;

import java.util.List;

public interface UserMapper {

    List<UserPO> findAll();

    UserPO findByUsername(String username);

    int insert(UserPO userPO);
}
