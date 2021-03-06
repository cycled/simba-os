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
package org.simbasecurity.core.jaas.loginmodule;

import com.sun.security.auth.UserPrincipal;
import org.junit.Before;
import org.junit.Test;
import org.simbasecurity.core.jaas.callbackhandler.ChainContextCallbackHandler;
import org.simbasecurity.core.service.CredentialService;
import org.simbasecurity.test.LocatorTestCase;

import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.login.FailedLoginException;
import java.security.Principal;
import java.util.Collections;
import java.util.Set;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class DatabaseLoginModuleTest extends LocatorTestCase {

    private static final String ADMIN = "admin";
    private DatabaseLoginModule module;
    private Subject subject;
    private CredentialService mockCredentialService;
    private PasswordCallback mockPasswordCallback;

    @SuppressWarnings("unchecked")
    @Before
    public void setUp() throws Exception {
        module = new DatabaseLoginModule();

        Callback[] callbacks = new Callback[2];
        NameCallback mockNameCallback = mock(NameCallback.class);
        when(mockNameCallback.getName()).thenReturn(ADMIN);

        mockPasswordCallback = mock(PasswordCallback.class);
        when(mockPasswordCallback.getPassword()).thenReturn(ADMIN.toCharArray());

        callbacks[0] = mockNameCallback;
        callbacks[1] = mockPasswordCallback;
        module.setCallBacks(callbacks);

        ChainContextCallbackHandler mockCallbackHandler = mock(ChainContextCallbackHandler.class);
        mockCallbackHandler.handle(any(Callback[].class));

        mockCredentialService = implantMock(CredentialService.class);

        subject = new Subject();

        module.initialize(subject, mockCallbackHandler, Collections.EMPTY_MAP, Collections.EMPTY_MAP);
    }

    @Test
    public void testLogin() throws Exception {
        when(mockCredentialService.checkCredentials(any(), any())).thenReturn(true);
        assertTrue(module.login());
        assertTrue(module.isSucceeded());
    }

    @Test
    public void testCommitWhenLoginWasSuccessful_PrincipalShouldBeAddedToSubject() throws Exception {
        when(mockCredentialService.checkCredentials(any(), any())).thenReturn(true);
        module.login();

        assertTrue(module.commit());
        assertTrue(module.isCommitSucceeded());
        assertTrue(module.getSubject().getPrincipals().contains(getExpectedPrincipal()));
    }

    @Test(expected = FailedLoginException.class)
    public void testCommitWhenLoginWasNotSuccessful_NoPrincipalAddedToSubjectAfterCommit() throws Exception {
        when(mockCredentialService.checkCredentials(any(), any())).thenReturn(false);
        when(mockPasswordCallback.getPassword()).thenReturn("fout passwoord".toCharArray());
        assertFalse(module.login());
        assertFalse(module.commit());
        Set<Principal> principals = module.getSubject().getPrincipals();
        assertTrue(principals.isEmpty());
    }

    @Test
    public void testLogout_allStatesMustBeCleaned() throws Exception {
        when(mockCredentialService.checkCredentials(any(), any())).thenReturn(true);
        module.login();
        module.commit();

        assertTrue(module.logout());
        assertFalse(module.isSucceeded());
        assertFalse(module.isCommitSucceeded());
        assertNull(module.getUsername());
        assertNull(module.getPassword());
        assertFalse(module.getSubject().getPrincipals().contains(getExpectedPrincipal()));
    }

    @Test(expected = FailedLoginException.class)
    public void testAbortNotSucceeded() throws Exception {
        when(mockCredentialService.checkCredentials(any(), any())).thenReturn(false);
        when(mockPasswordCallback.getPassword()).thenReturn("fout passwoord".toCharArray());
        module.login();
    }

    @Test
    public void testAbort_LoginSucceeded_CommitFailed() throws Exception {
        when(mockCredentialService.checkCredentials(any(), any())).thenReturn(true);
        module.login();

        assertTrue(module.abort());
        assertFalse(module.isSucceeded());
        assertNull(module.getUsername());
        assertNull(module.getPassword());
        assertFalse(module.getSubject().getPrincipals().contains(getExpectedPrincipal()));
    }

    @Test
    public void testAbort_LoginAndCommitSucceeded_doLogout() throws Exception {
        when(mockCredentialService.checkCredentials(any(),any())).thenReturn(true);
        module.login();
        module.commit();

        assertTrue(module.abort());
        assertFalse(module.isSucceeded());
        assertNull(module.getUsername());
        assertNull(module.getPassword());
        assertFalse(module.getSubject().getPrincipals().contains(getExpectedPrincipal()));
    }

    private UserPrincipal getExpectedPrincipal() {
        return new UserPrincipal(ADMIN);
    }
}
