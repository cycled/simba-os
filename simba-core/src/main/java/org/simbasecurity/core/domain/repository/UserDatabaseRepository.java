/*
 * Copyright 2011 Simba Open Source
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.simbasecurity.core.domain.repository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.simbasecurity.core.domain.Role;
import org.simbasecurity.core.domain.User;
import org.simbasecurity.core.domain.UserEntity;
import org.springframework.stereotype.Repository;

@Repository
public class UserDatabaseRepository extends AbstractVersionedDatabaseRepository<User> implements UserRepository {

    @Override
    public User findByName(String userName) {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM UserEntity u WHERE u.userName = :userName", User.class)
                                              .setParameter("userName", userName);
        List<User> resultList = query.getResultList();

        if (resultList.size() == 0) {
            return null;
        } else if (resultList.size() == 1) {
            return resultList.get(0);
        }

        throw new IllegalStateException("Multiple users found for username: '" + userName + "'");
    }

    @Override
    public Collection<User> findNotLinked(Role role) {
        TypedQuery<User> query = entityManager.createQuery("SELECT user FROM UserEntity user WHERE :role not in elements(user.roles) order by user.userName", User.class)
                                              .setParameter("role", role);
        return new ArrayList<>(query.getResultList());
    }

    @Override
    public Collection<User> findForRole(Role role) {
        TypedQuery<User> query = entityManager.createQuery("SELECT user FROM UserEntity user WHERE :role in elements(user.roles) order by user.userName", User.class)
                                              .setParameter("role", role);
        return new ArrayList<>(query.getResultList());
    }

    @Override
    protected Class<? extends User> getEntityType() {
        return UserEntity.class;
    }


}
