package com.xthena.bridge.userauth;

import com.xthena.api.userauth.UserAuthCache;
import com.xthena.api.userauth.UserAuthConnector;
import com.xthena.api.userauth.UserAuthDTO;

public class UserAuthConnectorWrapper implements UserAuthConnector {
    private UserAuthConnector userAuthConnector;
    private UserAuthCache userAuthCache;

    @Override
	public UserAuthDTO findByUsername(String username, String scopeId) {
        UserAuthDTO userAuthDto = userAuthCache.findByUsername(username,
                scopeId);

        if (userAuthDto == null) {
            synchronized (userAuthCache) {
                userAuthDto = userAuthCache.findByUsername(username, scopeId);

                if (userAuthDto == null) {
                    userAuthDto = userAuthConnector.findByUsername(username,
                            scopeId);

                    if (userAuthDto != null) {
                        userAuthCache.updateUserAuth(userAuthDto);
                    }
                }
            }
        }

        return userAuthDto;
    }

    @Override
	public UserAuthDTO findByRef(String ref, String scopeId) {
        UserAuthDTO userAuthDto = userAuthCache.findByRef(ref, scopeId);

        if (userAuthDto == null) {
            synchronized (userAuthCache) {
                userAuthDto = userAuthCache.findByRef(ref, scopeId);

                if (userAuthDto == null) {
                    userAuthDto = userAuthConnector.findByRef(ref, scopeId);

                    if (userAuthDto != null) {
                        userAuthCache.updateUserAuth(userAuthDto);
                    }
                }
            }
        }

        return userAuthDto;
    }

    @Override
	public UserAuthDTO findById(String id, String scopeId) {
        UserAuthDTO userAuthDto = userAuthCache.findById(id, scopeId);

        if (userAuthDto == null) {
            synchronized (userAuthCache) {
                userAuthDto = userAuthCache.findById(id, scopeId);

                if (userAuthDto == null) {
                    userAuthDto = userAuthConnector.findById(id, scopeId);

                    if (userAuthDto != null) {
                        userAuthCache.updateUserAuth(userAuthDto);
                    }
                }
            }
        }

        return userAuthDto;
    }

    public void setUserAuthConnector(UserAuthConnector userAuthConnector) {
        this.userAuthConnector = userAuthConnector;
    }

    public void setUserAuthCache(UserAuthCache userAuthCache) {
        this.userAuthCache = userAuthCache;
    }
}
