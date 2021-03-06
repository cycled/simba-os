insert into SIMBA_POLICY (ID,VERSION,NAME) values (1,0,'zoo URL');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (2,0,'PHP Test URL');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (3,0,'simba manager url');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (4,0,'simba messagebroker url');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (5,0,'Jersey Test URL');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (6,0,'Simba Manager Services URL');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (11,0,'animalReadPolicy');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (12,0,'animalWritePolicy');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (13,0,'managementReadPolicy');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (14,0,'managementWritePolicy');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (15,0,'SessionTabPolicy');
insert into SIMBA_POLICY (ID,VERSION,NAME) values (16,0,'ConfigurationTabPolicy');

insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,GET_ALLOWED,POST_ALLOWED,RULE_TYPE)
     select 1,0,'Simba Zoo URL','*',p.id,1,1,'URL' from SIMBA_POLICY p where NAME = 'zoo URL';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,GET_ALLOWED,POST_ALLOWED,RULE_TYPE)
     select 2,0,'Simba PHP Test URL','*.php',p.id,1,1,'URL'  from SIMBA_POLICY p where NAME = 'PHP Test URL';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,GET_ALLOWED,POST_ALLOWED,RULE_TYPE)
     select 3,0,'SIMBA MANAGER','*/simba-manager/*',p.id,1,1,'URL' from SIMBA_POLICY p where NAME = 'simba manager url';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,GET_ALLOWED,POST_ALLOWED,RULE_TYPE)
     select 4,0,'SIMBA messagebroker','*/messagebroker/*',p.id,1,1,'URL' from SIMBA_POLICY p where NAME = 'simba messagebroker url';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,GET_ALLOWED,POST_ALLOWED,RULE_TYPE)
     select 5,0,'Simba Jersey Test URL','*/simba/jersey/*',p.id,1,1,'URL' from SIMBA_POLICY p where NAME = 'Jersey Test URL';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,GET_ALLOWED,POST_ALLOWED,RULE_TYPE)
     select 6,0,'Simba Manager Services','*/simba/manager/*',p.id,1,1,'URL' from SIMBA_POLICY p where NAME = 'Simba Manager Services URL';

insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 101,0,'generalSheet read Permission','aansluitingen',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'generalSheetReadPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 102,0,'generalSheet write Permission','aansluitingen',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'generalSheetWritePolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 103,0,'animal read Permission','animal',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'animalReadPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 104,0,'animal write Permission','animal',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'animalWritePolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 105,0,'management roles read Permission','manage-roles',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementReadPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 106,0,'management roles write Permission','manage-roles',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementWritePolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 107,0,'management users read Permission','manage-users',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementReadPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 108,0,'management users write Permission','manage-users',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementWritePolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 109,0,'management policies read Permission','manage-policies',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementReadPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 110,0,'management policies write Permission','manage-policies',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementWritePolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 111,0,'management groups read Permission','manage-groups',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementReadPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 112,0,'management groups write Permission','manage-groups',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'managementWritePolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 113,0,'management sessions read Permission','manage-sessions',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'SessionTabPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 114,0,'management sessions write Permission','manage-sessions',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'SessionTabPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 115,0,'management configuration read Permission','manage-configuration',p.id,0,0,1,0,'RESOURCE' from SIMBA_POLICY p where NAME = 'ConfigurationTabPolicy';
insert into SIMBA_RULE (ID,VERSION,NAME,RESOURCENAME,POLICY_ID,CREATE_ALLOWED,DELETE_ALLOWED,READ_ALLOWED,WRITE_ALLOWED,RULE_TYPE)
     select 116,0,'management configuration write Permission','manage-configuration',p.id,1,1,1,1,'RESOURCE' from SIMBA_POLICY p where NAME = 'ConfigurationTabPolicy';

insert into SIMBA_ROLE (ID,VERSION,NAME) values (1,0,'zoo user');
insert into SIMBA_ROLE (ID,VERSION,NAME) values (2,0,'junior');
insert into SIMBA_ROLE (ID,VERSION,NAME) values (3,0,'senior');
insert into SIMBA_ROLE (ID,VERSION,NAME) values (4,0,'simba-admin');
insert into SIMBA_ROLE (ID,VERSION,NAME) values (5,0,'zoo keeper');

insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (1,1,0,TIMESTAMP('2011-12-11'),'Admin',null,0,'nl_NL','Admin','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',0,'ACTIVE',null,'admin',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (2,1,0,TIMESTAMP('2011-12-11'),'Guest',null,1,'nl_NL','Guest','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',0,'ACTIVE',null,'guest',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (3,1,0,TIMESTAMP('2011-12-11'),'John',null,0,'nl_NL','Senior','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',0,'ACTIVE',null,'johns',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (4,1,0,TIMESTAMP('2011-12-11'),'Jeff',null,0,'nl_NL','Junior','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',0,'ACTIVE',null,'jeffj',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (5,1,0,TIMESTAMP('2011-12-11'),'simbaht',null,0,'nl_NL','simbaht','$apr1$q5fpwm63$5qK4aaNGxPKt7qGl/GzWB/',0,'ACTIVE',null,'simbaht',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (6,1,0,TIMESTAMP('2011-12-11'),'Groupie',null,0,'nl_NL','Groupie','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',0,'ACTIVE',null,'groupie',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (7,1,1,TIMESTAMP('2011-12-11'),'DummyFirstName1',null,0,'nl_NL','DummyLastName1','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',1,'ACTIVE',null,'changePwdUser1',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (8,1,1,TIMESTAMP('2011-12-11'),'DummyFirstName2',null,0,'nl_NL','DummyLastName2','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',1,'ACTIVE',null,'changePwdUser2',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (9,1,0,TIMESTAMP('2011-12-11'),'Zoo User',null,0,'nl_NL','Admin','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',0,'ACTIVE',null,'zoouser',0);
insert into SIMBA_USER (ID,VERSION,CHANGEPASSWORDONNEXTLOGON,DATEOFLASTPASSWORDCHANGE,FIRSTNAME,INACTIVEDATE,INVALIDLOGINCOUNT,LANGUAGE,NAME,PASSWORD,PASSWORDCHANGEREQUIRED,STATUS,SUCCESSURL,USERNAME,DATABASELOGINBLOCKED) values (10,1,0,TIMESTAMP('2011-12-11'),'Zoo Keeper',null,0,'nl_NL','Admin','TqXiRtMAW6CRV/qCs2e6fUV4tRahHTTnjFzwfA==',0,'ACTIVE',null,'zookeeper',0);

insert into SIMBA_GROUP (ID, VERSION,NAME, CN) values (1, 0,'rockBand', 'CN=Rockband,OU=Global,OU=Groups,OU=SimbaSecurity,OU=ORG');
insert into SIMBA_GROUP (ID, VERSION,NAME, CN) values (2, 0,'Simba', 'CN=Simba,OU=Global,OU=Groups,OU=SimbaSecurity,OU=ORG');

insert into SIMBA_POLICY_SIMBA_ROLE (POLICY_ID,ROLE_ID)
     select p.id, r.id from SIMBA_POLICY p, SIMBA_ROLE r
      where p.name in ('zoo URL', 'animalReadPolicy')
        and r.name = 'zoo user';
insert into SIMBA_POLICY_SIMBA_ROLE (POLICY_ID,ROLE_ID)
  select p.id, r.id from SIMBA_POLICY p, SIMBA_ROLE r
  where p.name in ('zoo URL', 'animalReadPolicy', 'animalWritePolicy')
        and r.name = 'zoo keeper';
insert into SIMBA_POLICY_SIMBA_ROLE (POLICY_ID,ROLE_ID)
     select p.id, r.id from SIMBA_POLICY p, SIMBA_ROLE r
      where p.name in ('generalSheetReadPolicy','generalSheetWritePolicy','simba manager url','Simba Manager Services URL')
        and r.name = 'junior';
insert into SIMBA_POLICY_SIMBA_ROLE (POLICY_ID,ROLE_ID)
  select p.id, r.id from SIMBA_POLICY p, SIMBA_ROLE r
  where p.name in ('generalSheetReadPolicy','generalSheetWritePolicy','managementReadPolicy','simba manager url','Simba Manager Services URL')
        and r.name = 'senior';
insert into SIMBA_POLICY_SIMBA_ROLE (POLICY_ID,ROLE_ID)
  select p.id, r.id from SIMBA_POLICY p, SIMBA_ROLE r
  where p.name in ('generalSheetReadPolicy','generalSheetWritePolicy','managementReadPolicy','managementWritePolicy','SessionTabPolicy','ConfigurationTabPolicy','simba manager url','Simba Manager Services URL','Jersey Test URL','PHP Test URL')
        and r.name = 'simba-admin';

insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
     select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
      where u.username = 'admin'
        and r.name in ('simba-admin','zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'guest'
        and r.name in ('zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'johns'
        and r.name in ('senior','zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'jeffj'
        and r.name in ('junior','zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'simbaht'
        and r.name in ('simba-admin','zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'changePwdUser1'
        and r.name in ('zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'changePwdUser2'
        and r.name in ('zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'zoouser'
        and r.name in ('zoo user');
insert into SIMBA_USER_ROLE (USER_ID,ROLE_ID)
  select u.id, r.id from SIMBA_USER u, SIMBA_ROLE r
  where u.username = 'zookeeper'
        and r.name in ('zoo user','zoo keeper');


insert into SIMBA_GROUP_ROLE (GROUP_ID,ROLE_ID)
     select g.id, r.id from SIMBA_GROUP g, SIMBA_ROLE r
      where g.name in ('rockBand', 'Simba')
        and r.name = 'simba-admin';

insert into SIMBA_USER_GROUP (USER_ID,GROUP_ID)
     select u.id, g.id from SIMBA_USER u, SIMBA_GROUP g
      where u.name = 'groupie'
