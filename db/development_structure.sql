CREATE TABLE `conditions` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `google_url` text,
  `wiki_url` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `editransactions` (
  `id` int(11) NOT NULL auto_increment,
  `isa01` varchar(2) default NULL,
  `isa02` varchar(10) default NULL,
  `isa03` varchar(2) default NULL,
  `isa04` varchar(10) default NULL,
  `isa05` varchar(2) default NULL,
  `isa06` varchar(15) default NULL,
  `isa07` varchar(2) default NULL,
  `isa08` varchar(15) default NULL,
  `isa09` varchar(6) default NULL,
  `isa10` varchar(4) default NULL,
  `isa11` varchar(1) default NULL,
  `isa12` varchar(5) default NULL,
  `isa13` varchar(9) default NULL,
  `isa14` varchar(1) default NULL,
  `isa15` varchar(1) default NULL,
  `isa16` varchar(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `patient_conditions` (
  `id` int(11) NOT NULL auto_increment,
  `patient_profile_id` int(11) default NULL,
  `condition_id` int(11) default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  `treated_by` varchar(255) default NULL,
  `treat_notes` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `patient_profiles` (
  `id` int(11) NOT NULL auto_increment,
  `pmd_patient_id` int(11) NOT NULL,
  `pmd_user_id` int(11) NOT NULL,
  `physician_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `primary_address` varchar(255) default NULL,
  `alternate_address` varchar(255) default NULL,
  `zip_code` varchar(9) default NULL,
  `city` varchar(30) default NULL,
  `state_province` varchar(2) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_home` varchar(10) default NULL,
  `phone_mobile` varchar(10) default NULL,
  `phone_work` varchar(10) default NULL,
  `phone_fax` varchar(10) default NULL,
  `phone_emergency` varchar(10) default NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(1) NOT NULL,
  `ethnicity` smallint(6) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

CREATE TABLE `patients` (
  `id` int(11) NOT NULL auto_increment,
  `blood_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `hashed_password` varchar(255) default NULL,
  `salt` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20090513220412');

INSERT INTO schema_migrations (version) VALUES ('20090514220412');

INSERT INTO schema_migrations (version) VALUES ('20090514224058');

INSERT INTO schema_migrations (version) VALUES ('20090515022401');

INSERT INTO schema_migrations (version) VALUES ('20090618211146');

INSERT INTO schema_migrations (version) VALUES ('20090630232131');

INSERT INTO schema_migrations (version) VALUES ('20090707155749');