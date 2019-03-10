package org.pyarts.fullyjavaspringsecurity.repository;

import org.pyarts.fullyjavaspringsecurity.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);
}
