package com.xthena.bridge.user;

import java.util.Map;

import com.xthena.api.user.UserCache;
import com.xthena.api.user.UserConnector;
import com.xthena.api.user.UserDTO;

import com.xthena.core.page.Page;

public class UserConnectorWrapper implements UserConnector {
    private UserConnector userConnector;
    private UserCache userCache;

    @Override
	public UserDTO findById(String id) {
        UserDTO userDto = userCache.findById(id);

        if (userDto == null) {
            synchronized (userCache) {
                userDto = userCache.findById(id);

                if (userDto == null) {
                    userDto = userConnector.findById(id);

                    if (userDto != null) {
                        userCache.updateUser(userDto);
                    }
                }
            }
        }

        return userDto;
    }

    @Override
	public UserDTO findByUsername(String username, String userRepoRef) {
        UserDTO userDto = userCache.findByUsername(username, userRepoRef);

        if (userDto == null) {
            synchronized (userCache) {
                userDto = userCache.findByUsername(username, userRepoRef);

                if (userDto == null) {
                    userDto = userConnector.findByUsername(username,
                            userRepoRef);

                    if (userDto != null) {
                        userCache.updateUser(userDto);
                    }
                }
            }
        }

        return userDto;
    }

    @Override
	public UserDTO findByRef(String ref, String userRepoRef) {
        UserDTO userDto = userCache.findByRef(ref, userRepoRef);

        if (userDto == null) {
            synchronized (userCache) {
                userDto = userCache.findByRef(ref, userRepoRef);

                if (userDto == null) {
                    userDto = userConnector.findByRef(ref, userRepoRef);

                    if (userDto != null) {
                        userCache.updateUser(userDto);
                    }
                }
            }
        }

        return userDto;
    }

    @Override
	public Page pagedQuery(Page page, Map<String, Object> parameters) {
        return userConnector.pagedQuery(page, parameters);
    }

    public void setUserConnector(UserConnector userConnector) {
        this.userConnector = userConnector;
    }

    public void setUserCache(UserCache userCache) {
        this.userCache = userCache;
    }
}
