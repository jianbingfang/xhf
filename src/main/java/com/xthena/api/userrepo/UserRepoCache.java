package com.xthena.api.userrepo;

public interface UserRepoCache {
    UserRepoDTO findById(String id);

    UserRepoDTO findByCode(String code);

    void updateUserRepo(UserRepoDTO userRepoDto);

    void removeUserRepo(UserRepoDTO userRepoDto);
}
