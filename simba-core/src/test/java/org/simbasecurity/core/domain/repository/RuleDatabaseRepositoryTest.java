/*
 * Copyright 2013 Simba Open Source
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

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Collection;

import org.junit.Before;
import org.junit.Test;
import org.simbasecurity.core.domain.Group;
import org.simbasecurity.core.domain.GroupEntity;
import org.simbasecurity.core.domain.Policy;
import org.simbasecurity.core.domain.PolicyEntity;
import org.simbasecurity.core.domain.ResourceRule;
import org.simbasecurity.core.domain.ResourceRuleEntity;
import org.simbasecurity.core.domain.Role;
import org.simbasecurity.core.domain.RoleEntity;
import org.simbasecurity.core.domain.Rule;
import org.simbasecurity.core.domain.URLRule;
import org.simbasecurity.core.domain.URLRuleEntity;
import org.simbasecurity.core.domain.User;
import org.simbasecurity.core.domain.UserEntity;
import org.simbasecurity.test.PersistenceTestCase;
import org.springframework.beans.factory.annotation.Autowired;

public class RuleDatabaseRepositoryTest extends PersistenceTestCase {

    private static final String RESOURCE_NAME = "vennootschappen";
    private static final String RESOURCE_RULE_NAME = "vennootschappenReadRule";
    private static final String POLICY_NAME = "vennootschappenReadPolicy";
    private static final String ROLE_NAME = "venn_dossierbeheerder";
    private static final String USER_NAME = "joZEF123456";
    public static final String USER_VIA_GROUP = "user2";
    private ResourceRuleEntity resourceRuleEntity;
    private PolicyEntity policy;
    private URLRuleEntity urlRuleEntity;
    private URLRule urlRuleEntityViaGroup;

    @Autowired
    private RuleDatabaseRepository ruleDatabaseRepository;

    @Before
    public void setUp() {
        UserEntity user = new UserEntity(USER_NAME);
        RoleEntity role = new RoleEntity(ROLE_NAME);
        policy = new PolicyEntity(POLICY_NAME);
        resourceRuleEntity = new ResourceRuleEntity(RESOURCE_RULE_NAME);
        resourceRuleEntity.setResourceName(RESOURCE_NAME);
        urlRuleEntity = new URLRuleEntity("urlrule");
        persistAndRefresh(user, role, policy, resourceRuleEntity, urlRuleEntity);

        policy.addRule(resourceRuleEntity);
        policy.addRule(urlRuleEntity);
        role.addPolicy(policy);
        user.addRole(role);
    }



    @Test
    public void canFetchResourceRuleWithResourceName() {
        resourceRuleEntity.setWriteAllowed(true);
        Collection<ResourceRule> retrievedRules = ruleDatabaseRepository.findResourceRules(USER_NAME, RESOURCE_NAME);

        assertEquals(resourceRuleEntity, retrievedRules.iterator().next());
    }

    @Test
    public void canFetchResourceRuleWithResourceCaseInsensitive() {
        resourceRuleEntity.setReadAllowed(true);
        Collection<ResourceRule> retrievedRules = ruleDatabaseRepository.findResourceRules(USER_NAME, "vEnnoOtschApPen");

        assertEquals(resourceRuleEntity, retrievedRules.iterator().next());
    }

    @Test
    public void canFindAllURLRulesForAUser() {
        Collection<URLRule> rules = ruleDatabaseRepository.findURLRules(USER_NAME);
        assertTrue(rules.containsAll(Arrays.asList(urlRuleEntity)));
        assertEquals(1, rules.size());
    }

    @Test
    public void canFindAllURLRulesForAUserViaGroup() {
        setupWithGroups();
        Collection<URLRule> rules = ruleDatabaseRepository.findURLRules(USER_VIA_GROUP);
        assertTrue(rules.containsAll(Arrays.asList(urlRuleEntityViaGroup)));
        assertEquals(1, rules.size());
    }

    @Test
    public void canFindAllRulesNotLinkedToAPolicy() throws Exception {
        ResourceRuleEntity notLinkedRule = new ResourceRuleEntity("hipiejipie");
        notLinkedRule.setResourceName("hipiejipie");
        persistAndRefresh(notLinkedRule);
        Policy anotherPolicy = new PolicyEntity("hipiepolicy");
        anotherPolicy.addRule(notLinkedRule);
        persistAndRefresh(anotherPolicy);

        Collection<Rule> rules = ruleDatabaseRepository.findNotLinked(policy);
        assertTrue(rules.containsAll(Arrays.asList(notLinkedRule)));
    }

    @Test
    public void canFindRulesLinkedViaGroup() {
        ResourceRule resourceRuleEntity = setupWithGroups();

        Collection<ResourceRule> retrievedRules = ruleDatabaseRepository.findResourceRules(USER_VIA_GROUP, "resname2");

        assertEquals(1, retrievedRules.size());
        assertEquals(resourceRuleEntity, retrievedRules.iterator().next());
    }

    @Test
    public void ResourceNotAssignedToUser_NotFound() {
        setupWithGroups();

        Collection<ResourceRule> retrievedRules = ruleDatabaseRepository.findResourceRules(USER_VIA_GROUP, RESOURCE_NAME);

        assertEquals(0, retrievedRules.size());
    }

    private ResourceRule setupWithGroups() {
        User user = new UserEntity(USER_VIA_GROUP);
        Role role = new RoleEntity("role2");
        Group group = new GroupEntity("groupName", "cn");
        Policy policy = new PolicyEntity("policy2");
        ResourceRule resourceRuleEntity = new ResourceRuleEntity("resrule2");
        resourceRuleEntity.setResourceName("resname2");
        urlRuleEntityViaGroup = new URLRuleEntity("urlrule2");
        persistAndRefresh(user, role, policy, resourceRuleEntity, urlRuleEntityViaGroup);

        persistAndRefresh(user, group, role, policy, resourceRuleEntity, urlRuleEntityViaGroup);

        policy.addRule(resourceRuleEntity);
        policy.addRule(urlRuleEntityViaGroup);
        role.addPolicy(policy);
        group.addRole(role);
        user.addGroup(group);
        return resourceRuleEntity;
    }
}
