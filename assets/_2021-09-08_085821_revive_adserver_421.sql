/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ revive_adserver_421 /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE revive_adserver_421;

DROP TABLE IF EXISTS rv_accounts;
CREATE TABLE `rv_accounts` (
  `account_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `rv_accounts_account_type` (`account_type`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_account_preference_assoc;
CREATE TABLE `rv_account_preference_assoc` (
  `account_id` mediumint(9) NOT NULL,
  `preference_id` mediumint(9) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`account_id`,`preference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_account_user_assoc;
CREATE TABLE `rv_account_user_assoc` (
  `account_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `linked` datetime NOT NULL,
  PRIMARY KEY (`account_id`,`user_id`),
  KEY `rv_account_user_assoc_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_account_user_permission_assoc;
CREATE TABLE `rv_account_user_permission_assoc` (
  `account_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `permission_id` mediumint(9) NOT NULL,
  `is_allowed` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`,`user_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_acls;
CREATE TABLE `rv_acls` (
  `bannerid` mediumint(9) NOT NULL DEFAULT '0',
  `logical` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'and',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comparison` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '==',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `executionorder` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `rv_acls_bannerid_executionorder` (`bannerid`,`executionorder`),
  KEY `rv_acls_bannerid` (`bannerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_acls_channel;
CREATE TABLE `rv_acls_channel` (
  `channelid` mediumint(9) NOT NULL DEFAULT '0',
  `logical` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'and',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comparison` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '==',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `executionorder` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `rv_acls_channel_channelid_executionorder` (`channelid`,`executionorder`),
  KEY `rv_acls_channel_channelid` (`channelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_ad_category_assoc;
CREATE TABLE `rv_ad_category_assoc` (
  `ad_category_assoc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ad_category_assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_ad_zone_assoc;
CREATE TABLE `rv_ad_zone_assoc` (
  `ad_zone_assoc_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `zone_id` mediumint(9) DEFAULT NULL,
  `ad_id` mediumint(9) DEFAULT NULL,
  `priority` double DEFAULT '0',
  `link_type` smallint(6) NOT NULL DEFAULT '1',
  `priority_factor` double DEFAULT '0',
  `to_be_delivered` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ad_zone_assoc_id`),
  KEY `rv_ad_zone_assoc_zone_id` (`zone_id`),
  KEY `rv_ad_zone_assoc_ad_id` (`ad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_affiliates;
CREATE TABLE `rv_affiliates` (
  `affiliateid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `agencyid` mediumint(9) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mnemonic` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime NOT NULL,
  `oac_country_code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `oac_language_id` int(11) DEFAULT NULL,
  `oac_category_id` int(11) DEFAULT NULL,
  `account_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`affiliateid`),
  UNIQUE KEY `rv_affiliates_account_id` (`account_id`),
  KEY `rv_affiliates_agencyid` (`agencyid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_affiliates_extra;
CREATE TABLE `rv_affiliates_extra` (
  `affiliateid` mediumint(9) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payee_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode_of_payment` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_users` int(11) DEFAULT NULL,
  `unique_views` int(11) DEFAULT NULL,
  `page_rank` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`affiliateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_agency;
CREATE TABLE `rv_agency` (
  `agencyid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `logout_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime NOT NULL,
  `account_id` mediumint(9) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`agencyid`),
  UNIQUE KEY `rv_agency_account_id` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_application_variable;
CREATE TABLE `rv_application_variable` (
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_audit;
CREATE TABLE `rv_audit` (
  `auditid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `actionid` mediumint(9) NOT NULL,
  `context` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` mediumint(9) DEFAULT NULL,
  `parentid` mediumint(9) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` mediumint(9) NOT NULL DEFAULT '0',
  `username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usertype` tinyint(4) NOT NULL DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `account_id` mediumint(9) NOT NULL,
  `advertiser_account_id` mediumint(9) DEFAULT NULL,
  `website_account_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`auditid`),
  KEY `rv_audit_parentid_contextid` (`parentid`,`contextid`),
  KEY `rv_audit_updated` (`updated`),
  KEY `rv_audit_usertype` (`usertype`),
  KEY `rv_audit_username` (`username`),
  KEY `rv_audit_context_actionid` (`context`,`actionid`),
  KEY `rv_audit_account_id` (`account_id`),
  KEY `rv_audit_advertiser_account_id` (`advertiser_account_id`),
  KEY `rv_audit_website_account_id` (`website_account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_banners;
CREATE TABLE `rv_banners` (
  `bannerid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `campaignid` mediumint(9) NOT NULL DEFAULT '0',
  `contenttype` enum('gif','jpeg','png','html','swf','dcr','rpm','mov','txt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gif',
  `pluginversion` mediumint(9) NOT NULL DEFAULT '0',
  `storagetype` enum('sql','web','url','html','network','txt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sql',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `htmltemplate` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `htmlcache` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` smallint(6) NOT NULL DEFAULT '0',
  `height` smallint(6) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '1',
  `seq` tinyint(4) NOT NULL DEFAULT '0',
  `target` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `statustext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bannertext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `adserver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` int(11) NOT NULL DEFAULT '0',
  `capping` int(11) NOT NULL DEFAULT '0',
  `session_capping` int(11) NOT NULL DEFAULT '0',
  `compiledlimitation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `acl_plugins` text COLLATE utf8mb4_unicode_ci,
  `append` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bannertype` tinyint(4) NOT NULL DEFAULT '0',
  `alt_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alt_imageurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alt_contenttype` enum('gif','jpeg','png') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gif',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `updated` datetime NOT NULL,
  `acls_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transparent` tinyint(1) NOT NULL DEFAULT '0',
  `parameters` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `ext_bannertype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepend` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `iframe_friendly` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bannerid`),
  KEY `rv_banners_campaignid` (`campaignid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_banner_vast_element;
CREATE TABLE `rv_banner_vast_element` (
  `banner_vast_element_id` mediumint(9) NOT NULL,
  `banner_id` mediumint(9) NOT NULL,
  `vast_element_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vast_video_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vast_video_duration` mediumint(9) DEFAULT NULL,
  `vast_video_delivery` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vast_video_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vast_video_bitrate` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vast_video_height` mediumint(9) DEFAULT NULL,
  `vast_video_width` mediumint(9) DEFAULT NULL,
  `vast_video_outgoing_filename` text COLLATE utf8mb4_unicode_ci,
  `vast_companion_banner_id` mediumint(9) DEFAULT NULL,
  `vast_overlay_height` mediumint(9) DEFAULT NULL,
  `vast_overlay_width` mediumint(9) DEFAULT NULL,
  `vast_video_clickthrough_url` text COLLATE utf8mb4_unicode_ci,
  `vast_overlay_action` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vast_overlay_format` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vast_overlay_text_title` text COLLATE utf8mb4_unicode_ci,
  `vast_overlay_text_description` text COLLATE utf8mb4_unicode_ci,
  `vast_overlay_text_call` text COLLATE utf8mb4_unicode_ci,
  `vast_creative_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vast_thirdparty_impression` text COLLATE utf8mb4_unicode_ci,
  KEY `rv_banner_vast_element_banner_vast_banner_vast_element_id` (`banner_vast_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_campaigns;
CREATE TABLE `rv_campaigns` (
  `campaignid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `campaignname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clientid` mediumint(9) NOT NULL DEFAULT '0',
  `views` int(11) DEFAULT '-1',
  `clicks` int(11) DEFAULT '-1',
  `conversions` int(11) DEFAULT '-1',
  `priority` int(11) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '1',
  `target_impression` int(11) NOT NULL DEFAULT '0',
  `target_click` int(11) NOT NULL DEFAULT '0',
  `target_conversion` int(11) NOT NULL DEFAULT '0',
  `anonymous` enum('t','f') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f',
  `companion` smallint(1) DEFAULT '0',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `revenue` decimal(10,4) DEFAULT NULL,
  `revenue_type` smallint(6) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `capping` int(11) NOT NULL DEFAULT '0',
  `session_capping` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `hosted_views` int(11) NOT NULL DEFAULT '0',
  `hosted_clicks` int(11) NOT NULL DEFAULT '0',
  `viewwindow` mediumint(9) NOT NULL DEFAULT '0',
  `clickwindow` mediumint(9) NOT NULL DEFAULT '0',
  `ecpm` decimal(10,4) DEFAULT NULL,
  `min_impressions` int(11) NOT NULL DEFAULT '0',
  `ecpm_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `activate_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `show_capped_no_cookie` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaignid`),
  KEY `rv_campaigns_clientid` (`clientid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_campaigns_trackers;
CREATE TABLE `rv_campaigns_trackers` (
  `campaign_trackerid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `campaignid` mediumint(9) NOT NULL DEFAULT '0',
  `trackerid` mediumint(9) NOT NULL DEFAULT '0',
  `status` smallint(1) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`campaign_trackerid`),
  KEY `rv_campaigns_trackers_campaignid` (`campaignid`),
  KEY `rv_campaigns_trackers_trackerid` (`trackerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_category;
CREATE TABLE `rv_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_channel;
CREATE TABLE `rv_channel` (
  `channelid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `agencyid` mediumint(9) NOT NULL DEFAULT '0',
  `affiliateid` mediumint(9) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compiledlimitation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `acl_plugins` text COLLATE utf8mb4_unicode_ci,
  `active` smallint(1) DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `updated` datetime NOT NULL,
  `acls_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`channelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_clients;
CREATE TABLE `rv_clients` (
  `clientid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `agencyid` mediumint(9) NOT NULL DEFAULT '0',
  `clientname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `report` enum('t','f') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f',
  `reportinterval` mediumint(9) NOT NULL DEFAULT '7',
  `reportlastdate` date NOT NULL DEFAULT '0000-00-00',
  `reportdeactivate` enum('t','f') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `updated` datetime NOT NULL,
  `account_id` mediumint(9) DEFAULT NULL,
  `advertiser_limitation` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`clientid`),
  UNIQUE KEY `rv_clients_account_id` (`account_id`),
  KEY `rv_clients_agencyid_type` (`agencyid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_database_action;
CREATE TABLE `rv_database_action` (
  `database_action_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upgrade_action_id` int(10) unsigned DEFAULT '0',
  `schema_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) NOT NULL,
  `timing` int(2) NOT NULL,
  `action` int(2) NOT NULL,
  `info1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablename` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablename_backup` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_backup_schema` text COLLATE utf8mb4_unicode_ci,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`database_action_id`),
  KEY `rv_database_action_upgrade_action_id` (`upgrade_action_id`,`database_action_id`),
  KEY `rv_database_action_schema_version_timing_action` (`schema_name`,`version`,`timing`,`action`),
  KEY `rv_database_action_updated` (`updated`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_bkt_a;
CREATE TABLE `rv_data_bkt_a` (
  `server_conv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tracker_id` mediumint(9) NOT NULL,
  `date_time` datetime NOT NULL,
  `action_date_time` datetime NOT NULL,
  `creative_id` mediumint(9) NOT NULL,
  `zone_id` mediumint(9) NOT NULL,
  `ip_address` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `action` int(10) DEFAULT NULL,
  `window` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`server_conv_id`,`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_bkt_a_var;
CREATE TABLE `rv_data_bkt_a_var` (
  `server_conv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tracker_variable_id` mediumint(9) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`server_conv_id`,`server_ip`,`tracker_variable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_bkt_c;
CREATE TABLE `rv_data_bkt_c` (
  `interval_start` datetime NOT NULL,
  `creative_id` mediumint(9) NOT NULL,
  `zone_id` mediumint(9) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`interval_start`,`creative_id`,`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_bkt_m;
CREATE TABLE `rv_data_bkt_m` (
  `interval_start` datetime NOT NULL,
  `creative_id` mediumint(9) NOT NULL,
  `zone_id` mediumint(9) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`interval_start`,`creative_id`,`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_bkt_r;
CREATE TABLE `rv_data_bkt_r` (
  `interval_start` datetime NOT NULL,
  `creative_id` mediumint(9) NOT NULL,
  `zone_id` mediumint(9) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`interval_start`,`creative_id`,`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_bkt_vast_e;
CREATE TABLE `rv_data_bkt_vast_e` (
  `interval_start` datetime NOT NULL,
  `creative_id` mediumint(20) NOT NULL,
  `zone_id` mediumint(20) NOT NULL,
  `vast_event_id` mediumint(20) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`interval_start`,`creative_id`,`zone_id`,`vast_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_intermediate_ad;
CREATE TABLE `rv_data_intermediate_ad` (
  `data_intermediate_ad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `operation_interval` int(10) unsigned NOT NULL,
  `operation_interval_id` int(10) unsigned NOT NULL,
  `interval_start` datetime NOT NULL,
  `interval_end` datetime NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  `creative_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `requests` int(10) unsigned NOT NULL DEFAULT '0',
  `impressions` int(10) unsigned NOT NULL DEFAULT '0',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0',
  `conversions` int(10) unsigned NOT NULL DEFAULT '0',
  `total_basket_value` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `total_num_items` int(11) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`data_intermediate_ad_id`),
  KEY `rv_data_intermediate_ad_ad_id_date_time` (`ad_id`,`date_time`),
  KEY `rv_data_intermediate_ad_zone_id_date_time` (`zone_id`,`date_time`),
  KEY `rv_data_intermediate_ad_date_time` (`date_time`),
  KEY `rv_data_intermediate_ad_interval_start` (`interval_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_intermediate_ad_connection;
CREATE TABLE `rv_data_intermediate_ad_connection` (
  `data_intermediate_ad_connection_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_raw_ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `server_raw_tracker_impression_id` bigint(20) NOT NULL,
  `viewer_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewer_session_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_date_time` datetime NOT NULL,
  `connection_date_time` datetime DEFAULT NULL,
  `tracker_id` int(10) unsigned NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  `creative_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `tracker_channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_channel_ids` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_channel_ids` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_language` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_language` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_ip_address` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_ip_address` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_https` int(10) unsigned DEFAULT NULL,
  `connection_https` int(10) unsigned DEFAULT NULL,
  `tracker_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_search_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_search_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_os` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_os` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_browser` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_browser` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_action` int(10) unsigned DEFAULT NULL,
  `connection_window` int(10) unsigned DEFAULT NULL,
  `connection_status` int(10) unsigned NOT NULL DEFAULT '4',
  `inside_window` tinyint(1) NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`data_intermediate_ad_connection_id`),
  KEY `rv_data_intermediate_ad_connection_tracker_date_time` (`tracker_date_time`),
  KEY `rv_data_intermediate_ad_connection_tracker_id` (`tracker_id`),
  KEY `rv_data_intermediate_ad_connection_ad_id` (`ad_id`),
  KEY `rv_data_intermediate_ad_connection_zone_id` (`zone_id`),
  KEY `rv_data_intermediate_ad_connection_viewer_id` (`viewer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_intermediate_ad_variable_value;
CREATE TABLE `rv_data_intermediate_ad_variable_value` (
  `data_intermediate_ad_variable_value_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_intermediate_ad_connection_id` bigint(20) NOT NULL,
  `tracker_variable_id` int(11) NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`data_intermediate_ad_variable_value_id`),
  KEY `rv_data_intermediate_ad_variable_value_data_intermediate_ad_con` (`data_intermediate_ad_connection_id`),
  KEY `rv_data_intermediate_ad_variable_value_tracker_variable_id` (`tracker_variable_id`),
  KEY `rv_data_intermediate_ad_variable_value_tracker_value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_raw_ad_click;
CREATE TABLE `rv_data_raw_ad_click` (
  `viewer_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewer_session_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  `creative_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_ids` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `https` tinyint(1) DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_https` tinyint(1) DEFAULT NULL,
  `geo_region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_latitude` decimal(8,4) DEFAULT NULL,
  `geo_longitude` decimal(8,4) DEFAULT NULL,
  `geo_dma_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_area_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_organisation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_netspeed` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_continent` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `rv_data_raw_ad_click_viewer_id` (`viewer_id`),
  KEY `rv_data_raw_ad_click_date_time` (`date_time`),
  KEY `rv_data_raw_ad_click_ad_id` (`ad_id`),
  KEY `rv_data_raw_ad_click_zone_id` (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_raw_ad_impression;
CREATE TABLE `rv_data_raw_ad_impression` (
  `viewer_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewer_session_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  `creative_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_ids` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `https` tinyint(1) DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_https` tinyint(1) DEFAULT NULL,
  `geo_region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_latitude` decimal(8,4) DEFAULT NULL,
  `geo_longitude` decimal(8,4) DEFAULT NULL,
  `geo_dma_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_area_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_organisation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_netspeed` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_continent` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `rv_data_raw_ad_impression_viewer_id` (`viewer_id`),
  KEY `rv_data_raw_ad_impression_date_time` (`date_time`),
  KEY `rv_data_raw_ad_impression_ad_id` (`ad_id`),
  KEY `rv_data_raw_ad_impression_zone_id` (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_raw_ad_request;
CREATE TABLE `rv_data_raw_ad_request` (
  `viewer_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewer_session_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  `creative_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_ids` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `https` tinyint(1) DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_https` tinyint(1) DEFAULT NULL,
  KEY `rv_data_raw_ad_request_viewer_id` (`viewer_id`),
  KEY `rv_data_raw_ad_request_date_time` (`date_time`),
  KEY `rv_data_raw_ad_request_ad_id` (`ad_id`),
  KEY `rv_data_raw_ad_request_zone_id` (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_raw_tracker_impression;
CREATE TABLE `rv_data_raw_tracker_impression` (
  `server_raw_tracker_impression_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_raw_ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `viewer_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `viewer_session_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `tracker_id` int(10) unsigned NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_ids` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `https` int(10) unsigned DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_https` int(10) unsigned DEFAULT NULL,
  `geo_region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_latitude` decimal(8,4) DEFAULT NULL,
  `geo_longitude` decimal(8,4) DEFAULT NULL,
  `geo_dma_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_area_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_organisation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_netspeed` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_continent` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`server_raw_tracker_impression_id`,`server_raw_ip`),
  KEY `rv_data_raw_tracker_impression_viewer_id` (`viewer_id`),
  KEY `rv_data_raw_tracker_impression_date_time` (`date_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_raw_tracker_variable_value;
CREATE TABLE `rv_data_raw_tracker_variable_value` (
  `server_raw_tracker_impression_id` bigint(20) NOT NULL,
  `server_raw_ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tracker_variable_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`server_raw_tracker_impression_id`,`server_raw_ip`,`tracker_variable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_summary_ad_hourly;
CREATE TABLE `rv_data_summary_ad_hourly` (
  `data_summary_ad_hourly_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  `creative_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `requests` int(10) unsigned NOT NULL DEFAULT '0',
  `impressions` int(10) unsigned NOT NULL DEFAULT '0',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0',
  `conversions` int(10) unsigned NOT NULL DEFAULT '0',
  `total_basket_value` decimal(10,4) DEFAULT NULL,
  `total_num_items` int(11) DEFAULT NULL,
  `total_revenue` decimal(10,4) DEFAULT NULL,
  `total_cost` decimal(10,4) DEFAULT NULL,
  `total_techcost` decimal(10,4) DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`data_summary_ad_hourly_id`),
  KEY `rv_data_summary_ad_hourly_date_time` (`date_time`),
  KEY `rv_data_summary_ad_hourly_ad_id_date_time` (`ad_id`,`date_time`),
  KEY `rv_data_summary_ad_hourly_zone_id_date_time` (`zone_id`,`date_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_summary_ad_zone_assoc;
CREATE TABLE `rv_data_summary_ad_zone_assoc` (
  `data_summary_ad_zone_assoc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_interval` int(10) unsigned NOT NULL,
  `operation_interval_id` int(10) unsigned NOT NULL,
  `interval_start` datetime NOT NULL,
  `interval_end` datetime NOT NULL,
  `ad_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `required_impressions` int(10) unsigned NOT NULL,
  `requested_impressions` int(10) unsigned NOT NULL,
  `priority` double NOT NULL,
  `priority_factor` double DEFAULT NULL,
  `priority_factor_limited` smallint(6) NOT NULL DEFAULT '0',
  `past_zone_traffic_fraction` double DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `expired` datetime DEFAULT NULL,
  `expired_by` int(10) unsigned DEFAULT NULL,
  `to_be_delivered` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`data_summary_ad_zone_assoc_id`),
  KEY `rv_data_summary_ad_zone_assoc_interval_start` (`interval_start`),
  KEY `rv_data_summary_ad_zone_assoc_interval_end` (`interval_end`),
  KEY `rv_data_summary_ad_zone_assoc_ad_id` (`ad_id`),
  KEY `rv_data_summary_ad_zone_assoc_zone_id` (`zone_id`),
  KEY `rv_data_summary_ad_zone_assoc_expired` (`expired`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_summary_channel_daily;
CREATE TABLE `rv_data_summary_channel_daily` (
  `data_summary_channel_daily_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `forecast_impressions` int(10) unsigned NOT NULL DEFAULT '0',
  `actual_impressions` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`data_summary_channel_daily_id`),
  KEY `rv_data_summary_channel_daily_day` (`day`),
  KEY `rv_data_summary_channel_daily_channel_id` (`channel_id`),
  KEY `rv_data_summary_channel_daily_zone_id` (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_data_summary_zone_impression_history;
CREATE TABLE `rv_data_summary_zone_impression_history` (
  `data_summary_zone_impression_history_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_interval` int(10) unsigned NOT NULL,
  `operation_interval_id` int(10) unsigned NOT NULL,
  `interval_start` datetime NOT NULL,
  `interval_end` datetime NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `forecast_impressions` int(10) unsigned DEFAULT NULL,
  `actual_impressions` int(10) unsigned DEFAULT NULL,
  `est` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`data_summary_zone_impression_history_id`),
  KEY `rv_data_summary_zone_impression_history_operation_interval_id` (`operation_interval_id`),
  KEY `rv_data_summary_zone_impression_history_zone_id` (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_images;
CREATE TABLE `rv_images` (
  `filename` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contents` longblob NOT NULL,
  `t_stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_log_maintenance_forecasting;
CREATE TABLE `rv_log_maintenance_forecasting` (
  `log_maintenance_forecasting_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_run` datetime NOT NULL,
  `end_run` datetime NOT NULL,
  `operation_interval` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `updated_to` datetime DEFAULT NULL,
  PRIMARY KEY (`log_maintenance_forecasting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_log_maintenance_priority;
CREATE TABLE `rv_log_maintenance_priority` (
  `log_maintenance_priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_run` datetime NOT NULL,
  `end_run` datetime NOT NULL,
  `operation_interval` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `run_type` tinyint(3) unsigned NOT NULL,
  `updated_to` datetime DEFAULT NULL,
  PRIMARY KEY (`log_maintenance_priority_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_log_maintenance_statistics;
CREATE TABLE `rv_log_maintenance_statistics` (
  `log_maintenance_statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_run` datetime NOT NULL,
  `end_run` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `adserver_run_type` int(2) DEFAULT NULL,
  `search_run_type` int(2) DEFAULT NULL,
  `tracker_run_type` int(2) DEFAULT NULL,
  `updated_to` datetime DEFAULT NULL,
  PRIMARY KEY (`log_maintenance_statistics_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_password_recovery;
CREATE TABLE `rv_password_recovery` (
  `user_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(10) NOT NULL,
  `recovery_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`user_type`,`user_id`),
  UNIQUE KEY `rv_password_recovery_recovery_id` (`recovery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_placement_zone_assoc;
CREATE TABLE `rv_placement_zone_assoc` (
  `placement_zone_assoc_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `zone_id` mediumint(9) DEFAULT NULL,
  `placement_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`placement_zone_assoc_id`),
  KEY `rv_placement_zone_assoc_zone_id` (`zone_id`),
  KEY `rv_placement_zone_assoc_placement_id` (`placement_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_preferences;
CREATE TABLE `rv_preferences` (
  `preference_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `account_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`preference_id`),
  UNIQUE KEY `rv_preferences_preference_name` (`preference_name`),
  KEY `rv_preferences_account_type` (`account_type`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_session;
CREATE TABLE `rv_session` (
  `sessionid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sessiondata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastused` datetime DEFAULT NULL,
  `user_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `rv_session_user_id_key` (`user_id`),
  KEY `rv_session_lastused_key` (`lastused`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_stats_vast;
CREATE TABLE `rv_stats_vast` (
  `interval_start` datetime NOT NULL,
  `creative_id` mediumint(20) NOT NULL,
  `zone_id` mediumint(20) NOT NULL,
  `vast_event_id` mediumint(20) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  KEY `rv_stats_vast_creativekey` (`interval_start`,`creative_id`),
  KEY `rv_stats_vast_zonekey` (`interval_start`,`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_targetstats;
CREATE TABLE `rv_targetstats` (
  `day` date NOT NULL DEFAULT '0000-00-00',
  `campaignid` mediumint(9) NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_trackers;
CREATE TABLE `rv_trackers` (
  `trackerid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `trackername` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clientid` mediumint(9) NOT NULL DEFAULT '0',
  `viewwindow` mediumint(9) NOT NULL DEFAULT '0',
  `clickwindow` mediumint(9) NOT NULL DEFAULT '0',
  `blockwindow` mediumint(9) NOT NULL DEFAULT '0',
  `status` smallint(1) unsigned NOT NULL DEFAULT '4',
  `type` smallint(1) unsigned NOT NULL DEFAULT '1',
  `linkcampaigns` enum('t','f') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f',
  `variablemethod` enum('default','js','dom','custom') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `appendcode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`trackerid`),
  KEY `rv_trackers_clientid` (`clientid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_tracker_append;
CREATE TABLE `rv_tracker_append` (
  `tracker_append_id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` mediumint(9) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `tagcode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `paused` enum('t','f') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f',
  `autotrack` enum('t','f') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f',
  PRIMARY KEY (`tracker_append_id`),
  KEY `rv_tracker_append_tracker_id` (`tracker_id`,`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_upgrade_action;
CREATE TABLE `rv_upgrade_action` (
  `upgrade_action_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upgrade_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_to` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version_from` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` int(2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logfile` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confbackup` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`upgrade_action_id`),
  KEY `rv_upgrade_action_updated` (`updated`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_userlog;
CREATE TABLE `rv_userlog` (
  `userlogid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `usertype` tinyint(4) NOT NULL DEFAULT '0',
  `userid` mediumint(9) NOT NULL DEFAULT '0',
  `action` mediumint(9) NOT NULL DEFAULT '0',
  `object` mediumint(9) DEFAULT NULL,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`userlogid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_users;
CREATE TABLE `rv_users` (
  `user_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email_address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_account_id` mediumint(9) DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sso_user_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `email_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `rv_users_username` (`username`),
  UNIQUE KEY `rv_users_sso_user_id` (`sso_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_variables;
CREATE TABLE `rv_variables` (
  `variableid` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `trackerid` mediumint(9) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datatype` enum('numeric','string','date') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'numeric',
  `purpose` enum('basket_value','num_items','post_code') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reject_if_empty` smallint(1) unsigned NOT NULL DEFAULT '0',
  `is_unique` int(11) NOT NULL DEFAULT '0',
  `unique_window` int(11) NOT NULL DEFAULT '0',
  `variablecode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hidden` enum('t','f') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`variableid`),
  KEY `rv_variables_is_unique` (`is_unique`),
  KEY `rv_variables_trackerid` (`trackerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_variable_publisher;
CREATE TABLE `rv_variable_publisher` (
  `variable_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`variable_id`,`publisher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS rv_zones;
CREATE TABLE `rv_zones` (
  `zoneid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `affiliateid` mediumint(9) DEFAULT NULL,
  `zonename` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delivery` smallint(6) NOT NULL DEFAULT '0',
  `zonetype` smallint(6) NOT NULL DEFAULT '0',
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` smallint(6) NOT NULL DEFAULT '0',
  `height` smallint(6) NOT NULL DEFAULT '0',
  `ad_selection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prepend` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `append` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `appendtype` tinyint(4) NOT NULL DEFAULT '0',
  `forceappend` enum('t','f') COLLATE utf8mb4_unicode_ci DEFAULT 'f',
  `inventory_forecast_type` smallint(6) NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `cost` decimal(10,4) DEFAULT NULL,
  `cost_type` smallint(6) DEFAULT NULL,
  `cost_variable_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technology_cost` decimal(10,4) DEFAULT NULL,
  `technology_cost_type` smallint(6) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `capping` int(11) NOT NULL DEFAULT '0',
  `session_capping` int(11) NOT NULL DEFAULT '0',
  `what` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(19,2) DEFAULT NULL,
  `pricing` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CPM',
  `oac_category_id` int(11) DEFAULT NULL,
  `ext_adselection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_capped_no_cookie` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`zoneid`),
  KEY `rv_zones_zonenameid` (`zonename`,`zoneid`),
  KEY `rv_zones_affiliateid` (`affiliateid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO rv_accounts(account_id,account_type,account_name) VALUES(1,'ADMIN','Administrator account'),(2,'MANAGER','Default manager'),(3,'ADVERTISER','Test Advertiser'),(4,'TRAFFICKER','127.0.0.1:3000');

INSERT INTO rv_account_preference_assoc(account_id,preference_id,value) VALUES(1,1,X''),(1,2,X''),(1,3,X'31'),(1,4,X'31'),(1,5,X'31'),(1,6,X'313030'),(1,7,X'31'),(1,8,X''),(1,9,X''),(1,10,X'31'),(1,11,X'313030'),(1,12,X'31'),(1,13,X'31'),(1,14,X'313030'),(1,15,X'31'),(1,16,X'555443'),(1,17,X'34'),(1,18,X'31'),(1,19,X''),(1,20,X'31'),(1,21,X'31'),(1,22,X''),(1,23,X''),(1,24,X'31'),(1,25,X''),(1,26,X''),(1,27,X'31'),(1,28,X''),(1,29,X''),(1,30,X'31'),(1,31,X'31'),(1,32,X'32'),(1,33,X'31'),(1,34,X''),(1,35,X'34'),(1,36,X''),(1,37,X''),(1,38,X'30'),(1,39,X''),(1,40,X''),(1,41,X'30'),(1,42,X''),(1,43,X''),(1,44,X'30'),(1,45,X''),(1,46,X''),(1,47,X'30'),(1,48,X''),(1,49,X''),(1,50,X'30'),(1,51,X''),(1,52,X''),(1,53,X'30'),(1,54,X''),(1,55,X''),(1,56,X'30'),(1,57,X''),(1,58,X''),(1,59,X'30'),(1,60,X''),(1,61,X''),(1,62,X'30'),(1,63,X'31'),(1,64,X''),(1,65,X'35'),(1,66,X''),(1,67,X''),(1,68,X'30'),(1,69,X''),(1,70,X''),(1,71,X'30'),(1,72,X''),(1,73,X''),(1,74,X'30'),(1,75,X''),(1,76,X''),(1,77,X'30'),(1,78,X'31'),(1,79,X''),(1,80,X'31'),(1,81,X'31'),(1,82,X''),(1,83,X'32'),(1,84,X'31'),(1,85,X''),(1,86,X'33'),(1,87,X''),(1,88,X''),(1,89,X'30'),(1,90,X''),(1,91,X''),(1,92,X'30'),(1,93,X''),(1,94,X''),(1,95,X'30'),(1,96,X''),(1,97,X''),(1,98,X'30');

INSERT INTO rv_account_user_assoc(account_id,user_id,linked) VALUES(1,1,'2021-09-08 13:39:48'),(2,1,'2021-09-08 13:39:48');





INSERT INTO rv_ad_zone_assoc(ad_zone_assoc_id,zone_id,ad_id,priority,link_type,priority_factor,to_be_delivered) VALUES(1,0,1,0,0,1,1),(2,1,1,0,1,1,1);

INSERT INTO rv_affiliates(affiliateid,agencyid,name,mnemonic,comments,contact,email,website,updated,oac_country_code,oac_language_id,oac_category_id,account_id) VALUES(1,1,'127.0.0.1:3000','',X'','Joaquin Briceno','jbriceno@nomad-cms.com','http://127.0.0.1:3000','2021-09-08 13:55:03','',NULL,NULL,4);


INSERT INTO rv_agency(agencyid,name,contact,email,logout_url,updated,account_id,status) VALUES(1,'Default manager',NULL,'jbriceno@nomad-cms.com',NULL,'2021-09-08 13:39:48',2,0);

INSERT INTO rv_application_variable(name,value) VALUES('tables_core',X'363235'),('oa_version',X'352e332e302d726331'),('admin_account_id',X'31'),('oxHtml_version',X'312e362e31'),('oxText_version',X'312e362e31'),('Client_version',X'352e302e37'),('Geo_version',X'352e302e37'),('Site_version',X'352e302e37'),('Time_version',X'352e302e37'),('oxReportsStandard_version',X'312e362e31'),('oxReportsAdmin_version',X'312e362e31'),('oxCacheFile_version',X'312e352e30'),('oxMemcached_version',X'312e352e30'),('oxInvocationTags_version',X'312e362e31'),('tables_oxDeliveryDataPrepare',X'303032'),('oxDeliveryDataPrepare_version',X'312e352e30'),('oxLogClick_version',X'312e352e30'),('oxLogConversion_version',X'312e352e30'),('oxLogImpression_version',X'312e352e30'),('oxLogRequest_version',X'312e352e30'),('tables_vastbannertypehtml',X'303133'),('vastInlineBannerTypeHtml_version',X'312e31332e35'),('vastOverlayBannerTypeHtml_version',X'312e31332e35'),('oxLogVast_version',X'312e31332e35'),('vastServeVideoPlayer_version',X'312e31332e35'),('videoReport_version',X'312e31332e35'),('rvMaxMindGeoIP2_version',X'312e312e30'),('rvMaxMindGeoIP2Maintenance_version',X'312e312e30');

INSERT INTO rv_audit(auditid,actionid,context,contextid,parentid,details,userid,username,usertype,updated,account_id,advertiser_account_id,website_account_id) VALUES(1,1,'accounts',1,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31323a226163636f756e745f74797065223b733a353a2241444d494e223b733a31323a226163636f756e745f6e616d65223b733a32313a2241646d696e6973747261746f72206163636f756e74223b733a383a226b65795f64657363223b733a32313a2241646d696e6973747261746f72206163636f756e74223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(2,1,'accounts',2,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a323b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a31323a226163636f756e745f6e616d65223b733a31353a2244656661756c74206d616e61676572223b733a383a226b65795f64657363223b733a31353a2244656661756c74206d616e61676572223b7d',0,'Installer',0,'2021-09-08 13:39:48',2,NULL,NULL),(3,1,'agency',1,NULL,X'613a393a7b733a383a226167656e63796964223b693a313b733a343a226e616d65223b733a31353a2244656661756c74206d616e61676572223b733a373a22636f6e74616374223b4e3b733a353a22656d61696c223b733a32323a226a62726963656e6f406e6f6d61642d636d732e636f6d223b733a31303a226c6f676f75745f75726c223b4e3b733a373a2275706461746564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a31303a226163636f756e745f6964223b693a323b733a363a22737461747573223b693a303b733a383a226b65795f64657363223b733a31353a2244656661756c74206d616e61676572223b7d',0,'Installer',0,'2021-09-08 13:39:48',2,NULL,NULL),(4,1,'users',1,NULL,X'613a31343a7b733a373a22757365725f6964223b693a313b733a31323a22636f6e746163745f6e616d65223b733a31333a2241646d696e6973747261746f72223b733a31333a22656d61696c5f61646472657373223b733a32323a226a62726963656e6f406e6f6d61642d636d732e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a383a2270617373776f7264223b733a363a222a2a2a2a2a2a223b733a383a226c616e6775616765223b733a323a22656e223b733a31383a2264656661756c745f6163636f756e745f6964223b693a323b733a383a22636f6d6d656e7473223b4e3b733a363a22616374697665223b733a343a226e756c6c223b733a31313a2273736f5f757365725f6964223b693a303b733a31323a22646174655f63726561746564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a31353a22646174655f6c6173745f6c6f67696e223b4e3b733a31333a22656d61696c5f75706461746564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a383a226b65795f64657363223b733a353a2261646d696e223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(5,1,'account_user_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a373a22757365725f6964223b693a313b733a363a226c696e6b6564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a383a226b65795f64657363223b733a32313a224163636f756e74202331202d3e2055736572202331223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(6,1,'account_user_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a323b733a373a22757365725f6964223b693a313b733a363a226c696e6b6564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a383a226b65795f64657363223b733a32313a224163636f756e74202332202d3e2055736572202331223b7d',0,'Installer',0,'2021-09-08 13:39:48',2,NULL,NULL),(7,1,'preferences',1,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a313b733a31353a22707265666572656e63655f6e616d65223b733a32343a2264656661756c745f62616e6e65725f696d6167655f75726c223b733a31323a226163636f756e745f74797065223b733a31303a22545241464649434b4552223b733a383a226b65795f64657363223b733a32343a2264656661756c745f62616e6e65725f696d6167655f75726c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(8,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a313b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202331223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(9,1,'preferences',2,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a323b733a31353a22707265666572656e63655f6e616d65223b733a33303a2264656661756c745f62616e6e65725f64657374696e6174696f6e5f75726c223b733a31323a226163636f756e745f74797065223b733a31303a22545241464649434b4552223b733a383a226b65795f64657363223b733a33303a2264656661756c745f62616e6e65725f64657374696e6174696f6e5f75726c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(10,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a323b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202332223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(11,1,'preferences',3,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a333b733a31353a22707265666572656e63655f6e616d65223b733a32313a2264656661756c745f62616e6e65725f776569676874223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32313a2264656661756c745f62616e6e65725f776569676874223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(12,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a333b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202333223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(13,1,'preferences',4,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a343b733a31353a22707265666572656e63655f6e616d65223b733a32333a2264656661756c745f63616d706169676e5f776569676874223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32333a2264656661756c745f63616d706169676e5f776569676874223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(14,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a343b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202334223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(15,1,'preferences',5,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a353b733a31353a22707265666572656e63655f6e616d65223b733a31363a227761726e5f656d61696c5f61646d696e223b733a31323a226163636f756e745f74797065223b733a353a2241444d494e223b733a383a226b65795f64657363223b733a31363a227761726e5f656d61696c5f61646d696e223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(16,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a353b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202335223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(17,1,'preferences',6,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a363b733a31353a22707265666572656e63655f6e616d65223b733a33333a227761726e5f656d61696c5f61646d696e5f696d7072657373696f6e5f6c696d6974223b733a31323a226163636f756e745f74797065223b733a353a2241444d494e223b733a383a226b65795f64657363223b733a33333a227761726e5f656d61696c5f61646d696e5f696d7072657373696f6e5f6c696d6974223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(18,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a363b733a353a2276616c7565223b693a3130303b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202336223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(19,1,'preferences',7,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a373b733a31353a22707265666572656e63655f6e616d65223b733a32363a227761726e5f656d61696c5f61646d696e5f6461795f6c696d6974223b733a31323a226163636f756e745f74797065223b733a353a2241444d494e223b733a383a226b65795f64657363223b733a32363a227761726e5f656d61696c5f61646d696e5f6461795f6c696d6974223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(20,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a373b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202337223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(21,1,'preferences',8,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a383b733a31353a22707265666572656e63655f6e616d65223b733a32313a2263616d706169676e5f6563706d5f656e61626c6564223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32313a2263616d706169676e5f6563706d5f656e61626c6564223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(22,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a383b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202338223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(23,1,'preferences',9,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a393b733a31353a22707265666572656e63655f6e616d65223b733a32313a22636f6e74726163745f6563706d5f656e61626c6564223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32313a22636f6e74726163745f6563706d5f656e61626c6564223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(24,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a393b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32373a224163636f756e74202331202d3e20507265666572656e6365202339223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(25,1,'preferences',10,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31303b733a31353a22707265666572656e63655f6e616d65223b733a31383a227761726e5f656d61696c5f6d616e61676572223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31383a227761726e5f656d61696c5f6d616e61676572223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(26,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31303b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233130223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(27,1,'preferences',11,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31313b733a31353a22707265666572656e63655f6e616d65223b733a33353a227761726e5f656d61696c5f6d616e616765725f696d7072657373696f6e5f6c696d6974223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a33353a227761726e5f656d61696c5f6d616e616765725f696d7072657373696f6e5f6c696d6974223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(28,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31313b733a353a2276616c7565223b693a3130303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233131223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(29,1,'preferences',12,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31323b733a31353a22707265666572656e63655f6e616d65223b733a32383a227761726e5f656d61696c5f6d616e616765725f6461795f6c696d6974223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32383a227761726e5f656d61696c5f6d616e616765725f6461795f6c696d6974223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(30,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31323b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233132223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(31,1,'preferences',13,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31333b733a31353a22707265666572656e63655f6e616d65223b733a32313a227761726e5f656d61696c5f61647665727469736572223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32313a227761726e5f656d61696c5f61647665727469736572223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(32,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31333b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233133223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(33,1,'preferences',14,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31343b733a31353a22707265666572656e63655f6e616d65223b733a33383a227761726e5f656d61696c5f616476657274697365725f696d7072657373696f6e5f6c696d6974223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a33383a227761726e5f656d61696c5f616476657274697365725f696d7072657373696f6e5f6c696d6974223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(34,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31343b733a353a2276616c7565223b693a3130303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233134223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(35,1,'preferences',15,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31353b733a31353a22707265666572656e63655f6e616d65223b733a33313a227761726e5f656d61696c5f616476657274697365725f6461795f6c696d6974223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a33313a227761726e5f656d61696c5f616476657274697365725f6461795f6c696d6974223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(36,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31353b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233135223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(37,1,'preferences',16,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31363b733a31353a22707265666572656e63655f6e616d65223b733a383a2274696d657a6f6e65223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a383a2274696d657a6f6e65223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(38,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31363b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233136223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(39,1,'preferences',17,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31373b733a31353a22707265666572656e63655f6e616d65223b733a32323a22747261636b65725f64656661756c745f737461747573223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32323a22747261636b65725f64656661756c745f737461747573223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(40,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31373b733a353a2276616c7565223b693a343b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233137223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(41,1,'preferences',18,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31383b733a31353a22707265666572656e63655f6e616d65223b733a32303a22747261636b65725f64656661756c745f74797065223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32303a22747261636b65725f64656661756c745f74797065223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(42,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31383b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233138223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(43,1,'preferences',19,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a31393b733a31353a22707265666572656e63655f6e616d65223b733a32323a22747261636b65725f6c696e6b5f63616d706169676e73223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32323a22747261636b65725f6c696e6b5f63616d706169676e73223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(44,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a31393b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233139223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(45,1,'preferences',20,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32303b733a31353a22707265666572656e63655f6e616d65223b733a32313a2275695f73686f775f63616d706169676e5f696e666f223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32313a2275695f73686f775f63616d706169676e5f696e666f223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(46,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32303b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233230223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(47,1,'preferences',21,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32313b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f73686f775f62616e6e65725f696e666f223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a31393a2275695f73686f775f62616e6e65725f696e666f223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(48,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32313b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233231223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(49,1,'preferences',22,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32323b733a31353a22707265666572656e63655f6e616d65223b733a32343a2275695f73686f775f63616d706169676e5f70726576696577223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32343a2275695f73686f775f63616d706169676e5f70726576696577223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(50,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32323b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233232223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(51,1,'preferences',23,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32333b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f73686f775f62616e6e65725f68746d6c223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a31393a2275695f73686f775f62616e6e65725f68746d6c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(52,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32333b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233233223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(53,1,'preferences',24,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32343b733a31353a22707265666572656e63655f6e616d65223b733a32323a2275695f73686f775f62616e6e65725f70726576696577223b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a383a226b65795f64657363223b733a32323a2275695f73686f775f62616e6e65725f70726576696577223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(54,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32343b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233234223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(55,1,'preferences',25,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32353b733a31353a22707265666572656e63655f6e616d65223b733a32323a2275695f68746d6c5f7779737779675f656e61626c6564223b733a31323a226163636f756e745f74797065223b733a303a22223b733a383a226b65795f64657363223b733a32323a2275695f68746d6c5f7779737779675f656e61626c6564223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(56,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32353b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233235223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(57,1,'preferences',26,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32363b733a31353a22707265666572656e63655f6e616d65223b733a31363a2275695f686964655f696e616374697665223b733a31323a226163636f756e745f74797065223b733a303a22223b733a383a226b65795f64657363223b733a31363a2275695f686964655f696e616374697665223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(58,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32363b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233236223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(59,1,'preferences',27,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32373b733a31353a22707265666572656e63655f6e616d65223b733a32343a2275695f73686f775f6d61746368696e675f62616e6e657273223b733a31323a226163636f756e745f74797065223b733a31303a22545241464649434b4552223b733a383a226b65795f64657363223b733a32343a2275695f73686f775f6d61746368696e675f62616e6e657273223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(60,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32373b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233237223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(61,1,'preferences',28,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32383b733a31353a22707265666572656e63655f6e616d65223b733a33323a2275695f73686f775f6d61746368696e675f62616e6e6572735f706172656e7473223b733a31323a226163636f756e745f74797065223b733a31303a22545241464649434b4552223b733a383a226b65795f64657363223b733a33323a2275695f73686f775f6d61746368696e675f62616e6e6572735f706172656e7473223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(62,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32383b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233238223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(63,1,'preferences',29,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a32393b733a31353a22707265666572656e63655f6e616d65223b733a31373a2275695f73686f775f656e746974795f6964223b733a31323a226163636f756e745f74797065223b733a303a22223b733a383a226b65795f64657363223b733a31373a2275695f73686f775f656e746974795f6964223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(64,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a32393b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233239223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(65,1,'preferences',30,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33303b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f6e6f766963655f75736572223b733a31323a226163636f756e745f74797065223b733a303a22223b733a383a226b65795f64657363223b733a31343a2275695f6e6f766963655f75736572223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(66,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33303b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233330223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(67,1,'preferences',31,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33313b733a31353a22707265666572656e63655f6e616d65223b733a31373a2275695f7765656b5f73746172745f646179223b733a31323a226163636f756e745f74797065223b733a303a22223b733a383a226b65795f64657363223b733a31373a2275695f7765656b5f73746172745f646179223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(68,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33313b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233331223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(69,1,'preferences',32,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33323b733a31353a22707265666572656e63655f6e616d65223b733a32323a2275695f70657263656e746167655f646563696d616c73223b733a31323a226163636f756e745f74797065223b733a303a22223b733a383a226b65795f64657363223b733a32323a2275695f70657263656e746167655f646563696d616c73223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(70,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33323b733a353a2276616c7565223b693a323b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233332223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(71,1,'preferences',33,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33333b733a31353a22707265666572656e63655f6e616d65223b733a31373a2275695f636f6c756d6e5f726576656e7565223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31373a2275695f636f6c756d6e5f726576656e7565223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(72,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33333b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233333223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(73,1,'preferences',34,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33343b733a31353a22707265666572656e63655f6e616d65223b733a32333a2275695f636f6c756d6e5f726576656e75655f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32333a2275695f636f6c756d6e5f726576656e75655f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(74,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33343b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233334223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(75,1,'preferences',35,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33353b733a31353a22707265666572656e63655f6e616d65223b733a32323a2275695f636f6c756d6e5f726576656e75655f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32323a2275695f636f6c756d6e5f726576656e75655f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(76,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33353b733a353a2276616c7565223b693a343b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233335223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(77,1,'preferences',36,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33363b733a31353a22707265666572656e63655f6e616d65223b733a31323a2275695f636f6c756d6e5f6276223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31323a2275695f636f6c756d6e5f6276223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(78,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33363b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233336223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(79,1,'preferences',37,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33373b733a31353a22707265666572656e63655f6e616d65223b733a31383a2275695f636f6c756d6e5f62765f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31383a2275695f636f6c756d6e5f62765f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(80,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33373b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233337223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(81,1,'preferences',38,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33383b733a31353a22707265666572656e63655f6e616d65223b733a31373a2275695f636f6c756d6e5f62765f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31373a2275695f636f6c756d6e5f62765f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(82,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33383b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233338223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(83,1,'preferences',39,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a33393b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f6e756d5f6974656d73223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f6e756d5f6974656d73223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(84,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a33393b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233339223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(85,1,'preferences',40,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34303b733a31353a22707265666572656e63655f6e616d65223b733a32353a2275695f636f6c756d6e5f6e756d5f6974656d735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32353a2275695f636f6c756d6e5f6e756d5f6974656d735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(86,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34303b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233430223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(87,1,'preferences',41,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34313b733a31353a22707265666572656e63655f6e616d65223b733a32343a2275695f636f6c756d6e5f6e756d5f6974656d735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32343a2275695f636f6c756d6e5f6e756d5f6974656d735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(88,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34313b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233431223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(89,1,'preferences',42,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34323b733a31353a22707265666572656e63655f6e616d65223b733a31363a2275695f636f6c756d6e5f726576637063223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31363a2275695f636f6c756d6e5f726576637063223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(90,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34323b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233432223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(91,1,'preferences',43,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34333b733a31353a22707265666572656e63655f6e616d65223b733a32323a2275695f636f6c756d6e5f7265766370635f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32323a2275695f636f6c756d6e5f7265766370635f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(92,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34333b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233433223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(93,1,'preferences',44,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34343b733a31353a22707265666572656e63655f6e616d65223b733a32313a2275695f636f6c756d6e5f7265766370635f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32313a2275695f636f6c756d6e5f7265766370635f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(94,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34343b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233434223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(95,1,'preferences',45,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34353b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f6572706d223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f6572706d223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(96,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34353b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233435223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(97,1,'preferences',46,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34363b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f6572706d5f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f6572706d5f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(98,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34363b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233436223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(99,1,'preferences',47,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34373b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f6572706d5f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f6572706d5f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(100,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34373b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233437223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(101,1,'preferences',48,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34383b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f65727063223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f65727063223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(102,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34383b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233438223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(103,1,'preferences',49,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a34393b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f657270635f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f657270635f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(104,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a34393b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233439223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(105,1,'preferences',50,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35303b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f657270635f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f657270635f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(106,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35303b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233530223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(107,1,'preferences',51,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35313b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f65727073223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f65727073223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(108,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35313b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233531223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(109,1,'preferences',52,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35323b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f657270735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f657270735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(110,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35323b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233532223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(111,1,'preferences',53,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35333b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f657270735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f657270735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(112,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35333b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233533223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(113,1,'preferences',54,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35343b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f6569706d223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f6569706d223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(114,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35343b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233534223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(115,1,'preferences',55,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35353b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f6569706d5f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f6569706d5f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(116,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35353b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233535223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(117,1,'preferences',56,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35363b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f6569706d5f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f6569706d5f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(118,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35363b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233536223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(119,1,'preferences',57,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35373b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f65697063223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f65697063223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(120,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35373b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233537223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(121,1,'preferences',58,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35383b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f656970635f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f656970635f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(122,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35383b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233538223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(123,1,'preferences',59,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a35393b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f656970635f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f656970635f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(124,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a35393b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233539223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(125,1,'preferences',60,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36303b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f65697073223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f65697073223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(126,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36303b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233630223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(127,1,'preferences',61,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36313b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f656970735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f656970735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(128,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36313b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233631223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(129,1,'preferences',62,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36323b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f656970735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f656970735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(130,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36323b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233632223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(131,1,'preferences',63,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36333b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f6563706d223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f6563706d223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(132,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36333b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233633223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(133,1,'preferences',64,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36343b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f6563706d5f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f6563706d5f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(134,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36343b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233634223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(135,1,'preferences',65,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36353b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f6563706d5f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f6563706d5f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(136,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36353b733a353a2276616c7565223b693a353b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233635223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(137,1,'preferences',66,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36363b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f65637063223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f65637063223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(138,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36363b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233636223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(139,1,'preferences',67,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36373b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f656370635f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f656370635f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(140,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36373b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233637223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(141,1,'preferences',68,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36383b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f656370635f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f656370635f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(142,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36383b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233638223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(143,1,'preferences',69,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a36393b733a31353a22707265666572656e63655f6e616d65223b733a31343a2275695f636f6c756d6e5f65637073223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31343a2275695f636f6c756d6e5f65637073223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(144,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a36393b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233639223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(145,1,'preferences',70,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37303b733a31353a22707265666572656e63655f6e616d65223b733a32303a2275695f636f6c756d6e5f656370735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32303a2275695f636f6c756d6e5f656370735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(146,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37303b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233730223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(147,1,'preferences',71,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37313b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f656370735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f656370735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(148,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37313b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233731223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(149,1,'preferences',72,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37323b733a31353a22707265666572656e63655f6e616d65223b733a31323a2275695f636f6c756d6e5f6964223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31323a2275695f636f6c756d6e5f6964223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(150,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37323b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233732223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(151,1,'preferences',73,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37333b733a31353a22707265666572656e63655f6e616d65223b733a31383a2275695f636f6c756d6e5f69645f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31383a2275695f636f6c756d6e5f69645f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(152,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37333b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233733223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(153,1,'preferences',74,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37343b733a31353a22707265666572656e63655f6e616d65223b733a31373a2275695f636f6c756d6e5f69645f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31373a2275695f636f6c756d6e5f69645f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(154,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37343b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233734223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(155,1,'preferences',75,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37353b733a31353a22707265666572656e63655f6e616d65223b733a31383a2275695f636f6c756d6e5f7265717565737473223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31383a2275695f636f6c756d6e5f7265717565737473223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(156,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37353b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233735223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(157,1,'preferences',76,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37363b733a31353a22707265666572656e63655f6e616d65223b733a32343a2275695f636f6c756d6e5f72657175657374735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32343a2275695f636f6c756d6e5f72657175657374735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(158,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37363b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233736223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(159,1,'preferences',77,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37373b733a31353a22707265666572656e63655f6e616d65223b733a32333a2275695f636f6c756d6e5f72657175657374735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32333a2275695f636f6c756d6e5f72657175657374735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(160,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37373b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233737223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(161,1,'preferences',78,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37383b733a31353a22707265666572656e63655f6e616d65223b733a32313a2275695f636f6c756d6e5f696d7072657373696f6e73223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32313a2275695f636f6c756d6e5f696d7072657373696f6e73223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(162,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37383b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233738223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(163,1,'preferences',79,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a37393b733a31353a22707265666572656e63655f6e616d65223b733a32373a2275695f636f6c756d6e5f696d7072657373696f6e735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32373a2275695f636f6c756d6e5f696d7072657373696f6e735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(164,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a37393b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233739223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(165,1,'preferences',80,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38303b733a31353a22707265666572656e63655f6e616d65223b733a32363a2275695f636f6c756d6e5f696d7072657373696f6e735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32363a2275695f636f6c756d6e5f696d7072657373696f6e735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(166,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38303b733a353a2276616c7565223b693a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233830223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(167,1,'preferences',81,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38313b733a31353a22707265666572656e63655f6e616d65223b733a31363a2275695f636f6c756d6e5f636c69636b73223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31363a2275695f636f6c756d6e5f636c69636b73223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(168,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38313b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233831223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(169,1,'preferences',82,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38323b733a31353a22707265666572656e63655f6e616d65223b733a32323a2275695f636f6c756d6e5f636c69636b735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32323a2275695f636f6c756d6e5f636c69636b735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(170,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38323b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233832223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(171,1,'preferences',83,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38333b733a31353a22707265666572656e63655f6e616d65223b733a32313a2275695f636f6c756d6e5f636c69636b735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32313a2275695f636f6c756d6e5f636c69636b735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(172,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38333b733a353a2276616c7565223b693a323b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233833223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(173,1,'preferences',84,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38343b733a31353a22707265666572656e63655f6e616d65223b733a31333a2275695f636f6c756d6e5f637472223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31333a2275695f636f6c756d6e5f637472223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(174,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38343b733a353a2276616c7565223b623a313b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233834223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(175,1,'preferences',85,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38353b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f6374725f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f6374725f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(176,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38353b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233835223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(177,1,'preferences',86,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38363b733a31353a22707265666572656e63655f6e616d65223b733a31383a2275695f636f6c756d6e5f6374725f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31383a2275695f636f6c756d6e5f6374725f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(178,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38363b733a353a2276616c7565223b693a333b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233836223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(179,1,'preferences',87,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38373b733a31353a22707265666572656e63655f6e616d65223b733a32313a2275695f636f6c756d6e5f636f6e76657273696f6e73223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32313a2275695f636f6c756d6e5f636f6e76657273696f6e73223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(180,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38373b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233837223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(181,1,'preferences',88,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38383b733a31353a22707265666572656e63655f6e616d65223b733a32373a2275695f636f6c756d6e5f636f6e76657273696f6e735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32373a2275695f636f6c756d6e5f636f6e76657273696f6e735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(182,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38383b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233838223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(183,1,'preferences',89,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a38393b733a31353a22707265666572656e63655f6e616d65223b733a32363a2275695f636f6c756d6e5f636f6e76657273696f6e735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32363a2275695f636f6c756d6e5f636f6e76657273696f6e735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(184,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a38393b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233839223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(185,1,'preferences',90,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39303b733a31353a22707265666572656e63655f6e616d65223b733a32393a2275695f636f6c756d6e5f636f6e76657273696f6e735f70656e64696e67223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32393a2275695f636f6c756d6e5f636f6e76657273696f6e735f70656e64696e67223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(186,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39303b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233930223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(187,1,'preferences',91,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39313b733a31353a22707265666572656e63655f6e616d65223b733a33353a2275695f636f6c756d6e5f636f6e76657273696f6e735f70656e64696e675f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a33353a2275695f636f6c756d6e5f636f6e76657273696f6e735f70656e64696e675f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(188,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39313b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233931223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(189,1,'preferences',92,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39323b733a31353a22707265666572656e63655f6e616d65223b733a33343a2275695f636f6c756d6e5f636f6e76657273696f6e735f70656e64696e675f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a33343a2275695f636f6c756d6e5f636f6e76657273696f6e735f70656e64696e675f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(190,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39323b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233932223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(191,1,'preferences',93,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39333b733a31353a22707265666572656e63655f6e616d65223b733a31383a2275695f636f6c756d6e5f73725f7669657773223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31383a2275695f636f6c756d6e5f73725f7669657773223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(192,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39333b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233933223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(193,1,'preferences',94,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39343b733a31353a22707265666572656e63655f6e616d65223b733a32343a2275695f636f6c756d6e5f73725f76696577735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32343a2275695f636f6c756d6e5f73725f76696577735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(194,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39343b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233934223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(195,1,'preferences',95,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39353b733a31353a22707265666572656e63655f6e616d65223b733a32333a2275695f636f6c756d6e5f73725f76696577735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32333a2275695f636f6c756d6e5f73725f76696577735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(196,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39353b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233935223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(197,1,'preferences',96,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39363b733a31353a22707265666572656e63655f6e616d65223b733a31393a2275695f636f6c756d6e5f73725f636c69636b73223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a31393a2275695f636f6c756d6e5f73725f636c69636b73223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(198,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39363b733a353a2276616c7565223b623a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233936223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(199,1,'preferences',97,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39373b733a31353a22707265666572656e63655f6e616d65223b733a32353a2275695f636f6c756d6e5f73725f636c69636b735f6c6162656c223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32353a2275695f636f6c756d6e5f73725f636c69636b735f6c6162656c223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(200,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39373b733a353a2276616c7565223b733a303a22223b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233937223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(201,1,'preferences',98,NULL,X'613a343a7b733a31333a22707265666572656e63655f6964223b693a39383b733a31353a22707265666572656e63655f6e616d65223b733a32343a2275695f636f6c756d6e5f73725f636c69636b735f72616e6b223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a383a226b65795f64657363223b733a32343a2275695f636f6c756d6e5f73725f636c69636b735f72616e6b223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(202,1,'account_preference_assoc',0,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a313b733a31333a22707265666572656e63655f6964223b693a39383b733a353a2276616c7565223b693a303b733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233938223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(203,2,'account_preference_assoc',0,NULL,X'613a323a7b733a353a2276616c7565223b613a323a7b733a333a22776173223b733a303a22223b733a323a226973223b733a333a22555443223b7d733a383a226b65795f64657363223b733a32383a224163636f756e74202331202d3e20507265666572656e636520233136223b7d',0,'Installer',0,'2021-09-08 13:39:48',1,NULL,NULL),(204,1,'accounts',3,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a333b733a31323a226163636f756e745f74797065223b733a31303a2241445645525449534552223b733a31323a226163636f756e745f6e616d65223b733a31353a22546573742041647665727469736572223b733a383a226b65795f64657363223b733a31353a22546573742041647665727469736572223b7d',1,'admin',0,'2021-09-08 13:48:15',1,3,NULL),(205,1,'clients',1,NULL,X'613a31353a7b733a383a22636c69656e746964223b693a313b733a383a226167656e63796964223b693a313b733a31303a22636c69656e746e616d65223b733a31353a22546573742041647665727469736572223b733a373a22636f6e74616374223b733a31353a224a6f617175696e2042726963656e6f223b733a353a22656d61696c223b733a32323a226a62726963656e6f406e6f6d61642d636d732e636f6d223b733a363a227265706f7274223b733a313a2274223b733a31343a227265706f7274696e74657276616c223b693a373b733a31343a227265706f72746c61737464617465223b733a31303a22323032312d30392d3038223b733a31363a227265706f727464656163746976617465223b733a313a2266223b733a383a22636f6d6d656e7473223b733a303a22223b733a373a2275706461746564223b733a31393a22323032312d30392d30382031333a34383a3135223b733a31303a226163636f756e745f6964223b693a333b733a32313a22616476657274697365725f6c696d69746174696f6e223b733a353a2266616c7365223b733a343a2274797065223b693a303b733a383a226b65795f64657363223b733a31353a22546573742041647665727469736572223b7d',1,'admin',0,'2021-09-08 13:48:15',2,3,NULL),(206,1,'campaigns',1,NULL,X'613a33333a7b733a31303a2263616d706169676e6964223b693a313b733a31323a2263616d706169676e6e616d65223b733a33343a22546573742041647665727469736572202d2044656661756c742043616d706169676e223b733a383a22636c69656e746964223b693a313b733a353a227669657773223b693a2d313b733a363a22636c69636b73223b693a2d313b733a31313a22636f6e76657273696f6e73223b693a2d313b733a383a227072696f72697479223b693a303b733a363a22776569676874223b693a313b733a31373a227461726765745f696d7072657373696f6e223b693a303b733a31323a227461726765745f636c69636b223b693a303b733a31373a227461726765745f636f6e76657273696f6e223b693a303b733a393a22616e6f6e796d6f7573223b733a313a2266223b733a393a22636f6d70616e696f6e223b693a303b733a383a22636f6d6d656e7473223b733a303a22223b733a373a22726576656e7565223b693a303b733a31323a22726576656e75655f74797065223b693a313b733a373a2275706461746564223b733a31393a22323032312d30392d30382031333a34383a3236223b733a353a22626c6f636b223b693a303b733a373a2263617070696e67223b693a303b733a31353a2273657373696f6e5f63617070696e67223b693a303b733a363a22737461747573223b693a303b733a31323a22686f737465645f7669657773223b693a303b733a31333a22686f737465645f636c69636b73223b693a303b733a31303a227669657777696e646f77223b693a303b733a31313a22636c69636b77696e646f77223b693a303b733a343a226563706d223b693a303b733a31353a226d696e5f696d7072657373696f6e73223b693a3130303b733a31323a226563706d5f656e61626c6564223b693a303b733a31333a2261637469766174655f74696d65223b733a31393a22323032312d30392d30382030303a30303a3030223b733a31313a226578706972655f74696d65223b733a343a224e554c4c223b733a343a2274797065223b693a303b733a32313a2273686f775f6361707065645f6e6f5f636f6f6b6965223b693a303b733a383a226b65795f64657363223b733a33343a22546573742041647665727469736572202d2044656661756c742043616d706169676e223b7d',1,'admin',0,'2021-09-08 13:48:26',2,3,NULL),(207,1,'banners',1,NULL,X'613a34313a7b733a383a2262616e6e65726964223b693a313b733a31303a2263616d706169676e6964223b693a313b733a31313a22636f6e74656e7474797065223b733a303a22223b733a31333a22706c7567696e76657273696f6e223b693a303b733a31313a2273746f7261676574797065223b733a343a2268746d6c223b733a383a2266696c656e616d65223b733a303a22223b733a383a22696d61676575726c223b733a303a22223b733a31323a2268746d6c74656d706c617465223b733a303a22223b733a393a2268746d6c6361636865223b733a303a22223b733a353a227769647468223b693a2d333b733a363a22686569676874223b693a2d333b733a363a22776569676874223b693a313b733a333a22736571223b693a303b733a363a22746172676574223b733a303a22223b733a333a2275726c223b733a303a22223b733a333a22616c74223b733a303a22223b733a31303a2273746174757374657874223b733a303a22223b733a31303a2262616e6e657274657874223b733a303a22223b733a31313a226465736372697074696f6e223b733a32303a22416420566964656f20546573742042616e6e6572223b733a383a226164736572766572223b733a303a22223b733a353a22626c6f636b223b693a303b733a373a2263617070696e67223b693a303b733a31353a2273657373696f6e5f63617070696e67223b693a303b733a31383a22636f6d70696c65646c696d69746174696f6e223b4e3b733a31313a2261636c5f706c7567696e73223b4e3b733a363a22617070656e64223b4e3b733a31303a2262616e6e657274797065223b693a303b733a31323a22616c745f66696c656e616d65223b733a303a22223b733a31323a22616c745f696d61676575726c223b733a303a22223b733a31353a22616c745f636f6e74656e7474797065223b733a303a22223b733a383a22636f6d6d656e7473223b733a303a22223b733a373a2275706461746564223b733a31393a22323032312d30392d30382031333a35333a3335223b733a31323a2261636c735f75706461746564223b4e3b733a373a226b6579776f7264223b733a31373a226e6f6d616420636d732061777320616473223b733a31313a227472616e73706172656e74223b733a343a226e756c6c223b733a31303a22706172616d6574657273223b733a313533303a22613a32313a7b733a32323a2262616e6e65725f766173745f656c656d656e745f6964223b733a32323a2262616e6e65725f766173745f656c656d656e745f6964223b733a31373a22766173745f656c656d656e745f74797065223b733a393a2273696e676c65726f77223b733a31333a22766173745f766964656f5f6964223b4e3b733a31393a22766173745f766964656f5f6475726174696f6e223b733a323a223239223b733a31393a22766173745f766964656f5f64656c6976657279223b733a31313a2270726f6772657373697665223b733a31353a22766173745f766964656f5f74797065223b733a31313a22766964656f2f782d6d7034223b733a31383a22766173745f766964656f5f62697472617465223b733a333a22343030223b733a31373a22766173745f766964656f5f686569676874223b733a333a22343830223b733a31363a22766173745f766964656f5f7769647468223b733a333a22363430223b733a32383a22766173745f766964656f5f6f7574676f696e675f66696c656e616d65223b733a3732383a2268747470733a2f2f636f6e74656e742e64656d6f312e6e6f6d61642d636d732e636f6d2f636f6e74656e742f6a6f617175696e2f616431393138336238342e6d70343f506f6c6963793d65794a54644746305a57316c626e51694f69426265794a535a584e7664584a6a5a534936496d68306448427a4f69387659323975644756756443356b5a5731764d533575623231685a43316a62584d75593239744c324e76626e526c626e5176616d396863585670626939685a4445354d54677a596a67304c6d31774e434973496b4e76626d527064476c766269493665794a455958526c5447567a6331526f595734694f6e7369515664544f6b567762324e6f56476c745a5349364d54597a4d4459354f444d344d483073496b6c775157526b636d567a6379493665794a4256314d3655323931636d4e6c535841694f6949334e5334344e7934784f4467754e4463764d7a4969665831395858305f265369676e61747572653d5a7a4b305a38426b505575772d6b6b775a646c344a7477517e5661534b3258586754564d57464c53714c43524e6a394c6d74536c6635323370534f6447464251337061776b564d6734564c4373556144375970654962584d707455514d76425a41484d346d484571647e4a3456355578415339707872744643745643485147396d565774794558586d49456d707e77724d426f52464f577062377a374b42397948566861576a5475757345734c5854387165717859467841647a31364d5463475270756e6a2d32664f4b76557a39347650684a396b776651337e783534717961353857722d316262612d714f6f434d7279335a6c5546304163304b6c684e55656435557a387432764f546348765254416f4165356a306b652d4e6663626333366f767431694f364b6d624f62664a79696842356d50337651625450313067546753394576447431666b7e70514f3339644d545a396b775f5f264b65792d506169722d49643d4b33384c555246564d414c543131223b733a32373a22766173745f766964656f5f636c69636b7468726f7567685f75726c223b733a32363a2268747470733a2f2f7777772e6e6f6d61642d636d732e636f6d2f223b733a31393a22766173745f6f7665726c61795f686569676874223b4e3b733a31383a22766173745f6f7665726c61795f7769647468223b4e3b733a32333a22766173745f6f7665726c61795f746578745f7469746c65223b4e3b733a32393a22766173745f6f7665726c61795f746578745f6465736372697074696f6e223b4e3b733a32323a22766173745f6f7665726c61795f746578745f63616c6c223b4e3b733a31393a22766173745f6f7665726c61795f666f726d6174223b4e3b733a31393a22766173745f6f7665726c61795f616374696f6e223b4e3b733a32343a22766173745f636f6d70616e696f6e5f62616e6e65725f6964223b733a313a2230223b733a31383a22766173745f63726561746976655f74797065223b4e3b733a32363a22766173745f746869726470617274795f696d7072657373696f6e223b733a303a22223b7d223b733a363a22737461747573223b693a303b733a31343a226578745f62616e6e657274797065223b733a35343a2262616e6e65725479706548746d6c3a76617374496e6c696e6542616e6e65725479706548746d6c3a76617374496e6c696e6548746d6c223b733a373a2270726570656e64223b4e3b733a31353a22696672616d655f667269656e646c79223b733a353a2266616c7365223b733a383a226b65795f64657363223b733a32303a22416420566964656f20546573742042616e6e6572223b7d',1,'admin',0,'2021-09-08 13:53:35',2,3,NULL),(208,1,'ad_zone_assoc',1,NULL,X'613a383a7b733a31363a2261645f7a6f6e655f6173736f635f6964223b693a313b733a373a227a6f6e655f6964223b693a303b733a353a2261645f6964223b693a313b733a383a227072696f72697479223b693a303b733a393a226c696e6b5f74797065223b693a303b733a31353a227072696f726974795f666163746f72223b693a313b733a31353a22746f5f62655f64656c697665726564223b733a343a226e756c6c223b733a383a226b65795f64657363223b733a31363a224164202331202d3e205a6f6e65202330223b7d',1,'admin',0,'2021-09-08 13:53:35',2,3,NULL),(209,2,'banners',1,NULL,X'613a333a7b733a31303a22706172616d6574657273223b613a323a7b733a333a22776173223b733a313533303a22613a32313a7b733a32323a2262616e6e65725f766173745f656c656d656e745f6964223b733a32323a2262616e6e65725f766173745f656c656d656e745f6964223b733a31373a22766173745f656c656d656e745f74797065223b733a393a2273696e676c65726f77223b733a31333a22766173745f766964656f5f6964223b4e3b733a31393a22766173745f766964656f5f6475726174696f6e223b733a323a223239223b733a31393a22766173745f766964656f5f64656c6976657279223b733a31313a2270726f6772657373697665223b733a31353a22766173745f766964656f5f74797065223b733a31313a22766964656f2f782d6d7034223b733a31383a22766173745f766964656f5f62697472617465223b733a333a22343030223b733a31373a22766173745f766964656f5f686569676874223b733a333a22343830223b733a31363a22766173745f766964656f5f7769647468223b733a333a22363430223b733a32383a22766173745f766964656f5f6f7574676f696e675f66696c656e616d65223b733a3732383a2268747470733a2f2f636f6e74656e742e64656d6f312e6e6f6d61642d636d732e636f6d2f636f6e74656e742f6a6f617175696e2f616431393138336238342e6d70343f506f6c6963793d65794a54644746305a57316c626e51694f69426265794a535a584e7664584a6a5a534936496d68306448427a4f69387659323975644756756443356b5a5731764d533575623231685a43316a62584d75593239744c324e76626e526c626e5176616d396863585670626939685a4445354d54677a596a67304c6d31774e434973496b4e76626d527064476c766269493665794a455958526c5447567a6331526f595734694f6e7369515664544f6b567762324e6f56476c745a5349364d54597a4d4459354f444d344d483073496b6c775157526b636d567a6379493665794a4256314d3655323931636d4e6c535841694f6949334e5334344e7934784f4467754e4463764d7a4969665831395858305f265369676e61747572653d5a7a4b305a38426b505575772d6b6b775a646c344a7477517e5661534b3258586754564d57464c53714c43524e6a394c6d74536c6635323370534f6447464251337061776b564d6734564c4373556144375970654962584d707455514d76425a41484d346d484571647e4a3456355578415339707872744643745643485147396d565774794558586d49456d707e77724d426f52464f577062377a374b42397948566861576a5475757345734c5854387165717859467841647a31364d5463475270756e6a2d32664f4b76557a39347650684a396b776651337e783534717961353857722d316262612d714f6f434d7279335a6c5546304163304b6c684e55656435557a387432764f546348765254416f4165356a306b652d4e6663626333366f767431694f364b6d624f62664a79696842356d50337651625450313067546753394576447431666b7e70514f3339644d545a396b775f5f264b65792d506169722d49643d4b33384c555246564d414c543131223b733a32373a22766173745f766964656f5f636c69636b7468726f7567685f75726c223b733a32363a2268747470733a2f2f7777772e6e6f6d61642d636d732e636f6d2f223b733a31393a22766173745f6f7665726c61795f686569676874223b4e3b733a31383a22766173745f6f7665726c61795f7769647468223b4e3b733a32333a22766173745f6f7665726c61795f746578745f7469746c65223b4e3b733a32393a22766173745f6f7665726c61795f746578745f6465736372697074696f6e223b4e3b733a32323a22766173745f6f7665726c61795f746578745f63616c6c223b4e3b733a31393a22766173745f6f7665726c61795f666f726d6174223b4e3b733a31393a22766173745f6f7665726c61795f616374696f6e223b4e3b733a32343a22766173745f636f6d70616e696f6e5f62616e6e65725f6964223b733a313a2230223b733a31383a22766173745f63726561746976655f74797065223b4e3b733a32363a22766173745f746869726470617274795f696d7072657373696f6e223b733a303a22223b7d223b733a323a226973223b733a313530383a22613a32313a7b733a32323a2262616e6e65725f766173745f656c656d656e745f6964223b733a313a2231223b733a31373a22766173745f656c656d656e745f74797065223b733a393a2273696e676c65726f77223b733a31333a22766173745f766964656f5f6964223b4e3b733a31393a22766173745f766964656f5f6475726174696f6e223b733a323a223239223b733a31393a22766173745f766964656f5f64656c6976657279223b733a31313a2270726f6772657373697665223b733a31353a22766173745f766964656f5f74797065223b733a31313a22766964656f2f782d6d7034223b733a31383a22766173745f766964656f5f62697472617465223b733a333a22343030223b733a31373a22766173745f766964656f5f686569676874223b733a333a22343830223b733a31363a22766173745f766964656f5f7769647468223b733a333a22363430223b733a32383a22766173745f766964656f5f6f7574676f696e675f66696c656e616d65223b733a3732383a2268747470733a2f2f636f6e74656e742e64656d6f312e6e6f6d61642d636d732e636f6d2f636f6e74656e742f6a6f617175696e2f616431393138336238342e6d70343f506f6c6963793d65794a54644746305a57316c626e51694f69426265794a535a584e7664584a6a5a534936496d68306448427a4f69387659323975644756756443356b5a5731764d533575623231685a43316a62584d75593239744c324e76626e526c626e5176616d396863585670626939685a4445354d54677a596a67304c6d31774e434973496b4e76626d527064476c766269493665794a455958526c5447567a6331526f595734694f6e7369515664544f6b567762324e6f56476c745a5349364d54597a4d5445794d7a59314e483073496b6c775157526b636d567a6379493665794a4256314d3655323931636d4e6c535841694f6949334e5334344e7934784f4467754e4463764d7a4969665831395858305f265369676e61747572653d6936557e334d6a746f4a43437174473669617030474e30736c59507334666b43486938785031574f59723665347e666e6255647662747e30423142727e674b4f2d505a4654767a425768435134554c446d656b746a5638524b784b35524650484e686f76755a4b39596b377269774274456e4e66434659464c58314b617a71726839626d3274675a4b7a62366b59374d794d5777494f6a4a357341596273664d77587258754371637536693375357a72746e35616b3956523844336b55694732514437586244454867506d5477354f64614c556631505863466d615339366268376973543978765761767876687961637847513277466a69315534555863316f762d355a4539514e6177634b6a3156564976356e703939634f482d62455561524756774b5a4d586d33743353544553493168592d6e336b3263746a636b3041765a337a456e6c4f6c31774d5345364e636149553079775f5f264b65792d506169722d49643d4b33384c555246564d414c543131223b733a32373a22766173745f766964656f5f636c69636b7468726f7567685f75726c223b733a32363a2268747470733a2f2f7777772e6e6f6d61642d636d732e636f6d2f223b733a31393a22766173745f6f7665726c61795f686569676874223b4e3b733a31383a22766173745f6f7665726c61795f7769647468223b4e3b733a32333a22766173745f6f7665726c61795f746578745f7469746c65223b4e3b733a32393a22766173745f6f7665726c61795f746578745f6465736372697074696f6e223b4e3b733a32323a22766173745f6f7665726c61795f746578745f63616c6c223b4e3b733a31393a22766173745f6f7665726c61795f666f726d6174223b4e3b733a31393a22766173745f6f7665726c61795f616374696f6e223b4e3b733a32343a22766173745f636f6d70616e696f6e5f62616e6e65725f6964223b733a313a2230223b733a31383a22766173745f63726561746976655f74797065223b4e3b733a32363a22766173745f746869726470617274795f696d7072657373696f6e223b733a303a22223b7d223b7d733a383a226b65795f64657363223b733a32303a22416420566964656f20546573742042616e6e6572223b733a31303a2263616d706169676e6964223b733a313a2231223b7d',1,'admin',0,'2021-09-08 13:54:29',2,3,NULL),(210,1,'accounts',4,NULL,X'613a343a7b733a31303a226163636f756e745f6964223b693a343b733a31323a226163636f756e745f74797065223b733a31303a22545241464649434b4552223b733a31323a226163636f756e745f6e616d65223b733a31343a223132372e302e302e313a33303030223b733a383a226b65795f64657363223b733a31343a223132372e302e302e313a33303030223b7d',1,'admin',0,'2021-09-08 13:55:03',1,NULL,4),(211,1,'affiliates',1,NULL,X'613a31343a7b733a31313a22616666696c696174656964223b693a313b733a383a226167656e63796964223b693a313b733a343a226e616d65223b733a31343a223132372e302e302e313a33303030223b733a383a226d6e656d6f6e6963223b4e3b733a383a22636f6d6d656e7473223b733a303a22223b733a373a22636f6e74616374223b733a31353a224a6f617175696e2042726963656e6f223b733a353a22656d61696c223b733a32323a226a62726963656e6f406e6f6d61642d636d732e636f6d223b733a373a2277656273697465223b733a32313a22687474703a2f2f3132372e302e302e313a33303030223b733a373a2275706461746564223b733a31393a22323032312d30392d30382031333a35353a3033223b733a31363a226f61635f636f756e7472795f636f6465223b4e3b733a31353a226f61635f6c616e67756167655f6964223b693a303b733a31353a226f61635f63617465676f72795f6964223b693a303b733a31303a226163636f756e745f6964223b693a343b733a383a226b65795f64657363223b733a31343a223132372e302e302e313a33303030223b7d',1,'admin',0,'2021-09-08 13:55:03',2,NULL,4),(212,1,'zones',1,NULL,X'613a33333a7b733a363a227a6f6e656964223b693a313b733a31313a22616666696c696174656964223b693a313b733a383a227a6f6e656e616d65223b733a32343a223132372e302e302e313a33303030202d2044656661756c74223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a2264656c6976657279223b693a363b733a383a227a6f6e6574797065223b693a333b733a383a2263617465676f7279223b733a303a22223b733a353a227769647468223b693a2d333b733a363a22686569676874223b693a2d333b733a31323a2261645f73656c656374696f6e223b733a303a22223b733a353a22636861696e223b733a303a22223b733a373a2270726570656e64223b733a303a22223b733a363a22617070656e64223b733a303a22223b733a31303a22617070656e6474797065223b693a303b733a31313a22666f726365617070656e64223b4e3b733a32333a22696e76656e746f72795f666f7265636173745f74797065223b693a303b733a383a22636f6d6d656e7473223b733a303a22223b733a343a22636f7374223b693a303b733a393a22636f73745f74797065223b693a303b733a31363a22636f73745f7661726961626c655f6964223b4e3b733a31353a22746563686e6f6c6f67795f636f7374223b693a303b733a32303a22746563686e6f6c6f67795f636f73745f74797065223b693a303b733a373a2275706461746564223b733a31393a22323032312d30392d30382031333a35353a3138223b733a353a22626c6f636b223b693a303b733a373a2263617070696e67223b693a303b733a31353a2273657373696f6e5f63617070696e67223b693a303b733a343a2277686174223b4e3b733a343a2272617465223b693a303b733a373a2270726963696e67223b4e3b733a31353a226f61635f63617465676f72795f6964223b693a303b733a31353a226578745f616473656c656374696f6e223b4e3b733a32313a2273686f775f6361707065645f6e6f5f636f6f6b6965223b693a303b733a383a226b65795f64657363223b733a32343a223132372e302e302e313a33303030202d2044656661756c74223b7d',1,'admin',0,'2021-09-08 13:55:18',2,NULL,4),(213,1,'placement_zone_assoc',1,NULL,X'613a343a7b733a32333a22706c6163656d656e745f7a6f6e655f6173736f635f6964223b693a313b733a373a227a6f6e655f6964223b693a313b733a31323a22706c6163656d656e745f6964223b693a313b733a383a226b65795f64657363223b733a32323a2243616d706169676e202331202d3e205a6f6e65202331223b7d',1,'admin',0,'2021-09-08 13:55:42',2,3,4),(214,1,'ad_zone_assoc',2,NULL,X'613a383a7b733a31363a2261645f7a6f6e655f6173736f635f6964223b693a323b733a373a227a6f6e655f6964223b693a313b733a353a2261645f6964223b693a313b733a383a227072696f72697479223b693a303b733a393a226c696e6b5f74797065223b693a303b733a31353a227072696f726974795f666163746f72223b693a313b733a31353a22746f5f62655f64656c697665726564223b733a343a226e756c6c223b733a383a226b65795f64657363223b733a31363a224164202331202d3e205a6f6e65202331223b7d',1,'admin',0,'2021-09-08 13:55:42',2,3,4);

INSERT INTO rv_banners(bannerid,campaignid,contenttype,pluginversion,storagetype,filename,imageurl,htmltemplate,htmlcache,width,height,weight,seq,target,url,alt,statustext,bannertext,description,adserver,block,capping,session_capping,compiledlimitation,acl_plugins,append,bannertype,alt_filename,alt_imageurl,alt_contenttype,comments,updated,acls_updated,keyword,transparent,parameters,status,ext_bannertype,prepend,iframe_friendly) VALUES(1,1,'',0,'html','','',X'',X'',-3,-3,1,0,'',X'','','',X'','Ad Video Test Banner','',0,0,0,X'',NULL,X'',0,'','','',X'','2021-09-08 13:54:29','0000-00-00 00:00:00','nomad cms aws ads',0,X'613a32313a7b733a32323a2262616e6e65725f766173745f656c656d656e745f6964223b733a313a2231223b733a31373a22766173745f656c656d656e745f74797065223b733a393a2273696e676c65726f77223b733a31333a22766173745f766964656f5f6964223b4e3b733a31393a22766173745f766964656f5f6475726174696f6e223b733a323a223239223b733a31393a22766173745f766964656f5f64656c6976657279223b733a31313a2270726f6772657373697665223b733a31353a22766173745f766964656f5f74797065223b733a31313a22766964656f2f782d6d7034223b733a31383a22766173745f766964656f5f62697472617465223b733a333a22343030223b733a31373a22766173745f766964656f5f686569676874223b733a333a22343830223b733a31363a22766173745f766964656f5f7769647468223b733a333a22363430223b733a32383a22766173745f766964656f5f6f7574676f696e675f66696c656e616d65223b733a3732383a2268747470733a2f2f636f6e74656e742e64656d6f312e6e6f6d61642d636d732e636f6d2f636f6e74656e742f6a6f617175696e2f616431393138336238342e6d70343f506f6c6963793d65794a54644746305a57316c626e51694f69426265794a535a584e7664584a6a5a534936496d68306448427a4f69387659323975644756756443356b5a5731764d533575623231685a43316a62584d75593239744c324e76626e526c626e5176616d396863585670626939685a4445354d54677a596a67304c6d31774e434973496b4e76626d527064476c766269493665794a455958526c5447567a6331526f595734694f6e7369515664544f6b567762324e6f56476c745a5349364d54597a4d5445794d7a59314e483073496b6c775157526b636d567a6379493665794a4256314d3655323931636d4e6c535841694f6949334e5334344e7934784f4467754e4463764d7a4969665831395858305f265369676e61747572653d6936557e334d6a746f4a43437174473669617030474e30736c59507334666b43486938785031574f59723665347e666e6255647662747e30423142727e674b4f2d505a4654767a425768435134554c446d656b746a5638524b784b35524650484e686f76755a4b39596b377269774274456e4e66434659464c58314b617a71726839626d3274675a4b7a62366b59374d794d5777494f6a4a357341596273664d77587258754371637536693375357a72746e35616b3956523844336b55694732514437586244454867506d5477354f64614c556631505863466d615339366268376973543978765761767876687961637847513277466a69315534555863316f762d355a4539514e6177634b6a3156564976356e703939634f482d62455561524756774b5a4d586d33743353544553493168592d6e336b3263746a636b3041765a337a456e6c4f6c31774d5345364e636149553079775f5f264b65792d506169722d49643d4b33384c555246564d414c543131223b733a32373a22766173745f766964656f5f636c69636b7468726f7567685f75726c223b733a32363a2268747470733a2f2f7777772e6e6f6d61642d636d732e636f6d2f223b733a31393a22766173745f6f7665726c61795f686569676874223b4e3b733a31383a22766173745f6f7665726c61795f7769647468223b4e3b733a32333a22766173745f6f7665726c61795f746578745f7469746c65223b4e3b733a32393a22766173745f6f7665726c61795f746578745f6465736372697074696f6e223b4e3b733a32323a22766173745f6f7665726c61795f746578745f63616c6c223b4e3b733a31393a22766173745f6f7665726c61795f666f726d6174223b4e3b733a31393a22766173745f6f7665726c61795f616374696f6e223b4e3b733a32343a22766173745f636f6d70616e696f6e5f62616e6e65725f6964223b733a313a2230223b733a31383a22766173745f63726561746976655f74797065223b4e3b733a32363a22766173745f746869726470617274795f696d7072657373696f6e223b733a303a22223b7d',0,'bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml',X'',0);

INSERT INTO rv_banner_vast_element(banner_vast_element_id,banner_id,vast_element_type,vast_video_id,vast_video_duration,vast_video_delivery,vast_video_type,vast_video_bitrate,vast_video_height,vast_video_width,vast_video_outgoing_filename,vast_companion_banner_id,vast_overlay_height,vast_overlay_width,vast_video_clickthrough_url,vast_overlay_action,vast_overlay_format,vast_overlay_text_title,vast_overlay_text_description,vast_overlay_text_call,vast_creative_type,vast_thirdparty_impression) VALUES(1,1,'singlerow',NULL,29,'progressive','video/x-mp4','400',480,640,X'68747470733a2f2f636f6e74656e742e64656d6f312e6e6f6d61642d636d732e636f6d2f636f6e74656e742f6a6f617175696e2f616431393138336238342e6d70343f506f6c6963793d65794a54644746305a57316c626e51694f69426265794a535a584e7664584a6a5a534936496d68306448427a4f69387659323975644756756443356b5a5731764d533575623231685a43316a62584d75593239744c324e76626e526c626e5176616d396863585670626939685a4445354d54677a596a67304c6d31774e434973496b4e76626d527064476c766269493665794a455958526c5447567a6331526f595734694f6e7369515664544f6b567762324e6f56476c745a5349364d54597a4d5445794d7a59314e483073496b6c775157526b636d567a6379493665794a4256314d3655323931636d4e6c535841694f6949334e5334344e7934784f4467754e4463764d7a4969665831395858305f265369676e61747572653d6936557e334d6a746f4a43437174473669617030474e30736c59507334666b43486938785031574f59723665347e666e6255647662747e30423142727e674b4f2d505a4654767a425768435134554c446d656b746a5638524b784b35524650484e686f76755a4b39596b377269774274456e4e66434659464c58314b617a71726839626d3274675a4b7a62366b59374d794d5777494f6a4a357341596273664d77587258754371637536693375357a72746e35616b3956523844336b55694732514437586244454867506d5477354f64614c556631505863466d615339366268376973543978765761767876687961637847513277466a69315534555863316f762d355a4539514e6177634b6a3156564976356e703939634f482d62455561524756774b5a4d586d33743353544553493168592d6e336b3263746a636b3041765a337a456e6c4f6c31774d5345364e636149553079775f5f264b65792d506169722d49643d4b33384c555246564d414c543131',0,NULL,NULL,X'68747470733a2f2f7777772e6e6f6d61642d636d732e636f6d2f',NULL,NULL,NULL,NULL,NULL,NULL,X'');

INSERT INTO rv_campaigns(campaignid,campaignname,clientid,views,clicks,conversions,priority,weight,target_impression,target_click,target_conversion,anonymous,companion,comments,revenue,revenue_type,updated,block,capping,session_capping,status,hosted_views,hosted_clicks,viewwindow,clickwindow,ecpm,min_impressions,ecpm_enabled,activate_time,expire_time,type,show_capped_no_cookie) VALUES(1,'Test Advertiser - Default Campaign',1,-1,-1,-1,0,1,0,0,0,'f',0,X'',NULL,1,'2021-09-08 13:48:26',0,0,0,0,0,0,0,0,NULL,100,0,'2021-09-08 00:00:00',NULL,0,0);




INSERT INTO rv_clients(clientid,agencyid,clientname,contact,email,report,reportinterval,reportlastdate,reportdeactivate,comments,updated,account_id,advertiser_limitation,type) VALUES(1,1,'Test Advertiser','Joaquin Briceno','jbriceno@nomad-cms.com','t',7,'2021-09-08','f',X'','2021-09-08 13:48:15',3,0,0);

INSERT INTO rv_database_action(database_action_id,upgrade_action_id,schema_name,version,timing,action,info1,info2,tablename,tablename_backup,table_backup_schema,updated) VALUES(1,20,'oxDeliveryDataPrepare',2,0,59,'CREATE SUCCEEDED',NULL,'data_bkt_c',NULL,NULL,'2021-09-08 13:40:02'),(2,20,'oxDeliveryDataPrepare',2,0,59,'CREATE SUCCEEDED',NULL,'data_bkt_m',NULL,NULL,'2021-09-08 13:40:02'),(3,20,'oxDeliveryDataPrepare',2,0,59,'CREATE SUCCEEDED',NULL,'data_bkt_r',NULL,NULL,'2021-09-08 13:40:02'),(4,20,'oxDeliveryDataPrepare',2,0,59,'CREATE SUCCEEDED',NULL,'data_bkt_a',NULL,NULL,'2021-09-08 13:40:02'),(5,20,'oxDeliveryDataPrepare',2,0,59,'CREATE SUCCEEDED',NULL,'data_bkt_a_var',NULL,NULL,'2021-09-08 13:40:02'),(6,26,'vastbannertypehtml',13,0,59,'CREATE SUCCEEDED',NULL,'banner_vast_element',NULL,NULL,'2021-09-08 13:40:04'),(7,26,'vastbannertypehtml',13,0,59,'CREATE SUCCEEDED',NULL,'data_bkt_vast_e',NULL,NULL,'2021-09-08 13:40:04'),(8,26,'vastbannertypehtml',13,0,59,'CREATE SUCCEEDED',NULL,'stats_vast',NULL,NULL,'2021-09-08 13:40:04');





















INSERT INTO rv_log_maintenance_priority(log_maintenance_priority_id,start_run,end_run,operation_interval,duration,run_type,updated_to) VALUES(1,'2021-09-08 13:53:35','2021-09-08 13:53:35',60,0,1,NULL),(2,'2021-09-08 13:53:35','2021-09-08 13:53:35',60,0,2,NULL),(3,'2021-09-08 13:53:35','2021-09-08 13:53:35',60,0,2,NULL),(4,'2021-09-08 13:55:43','2021-09-08 13:55:43',60,0,1,NULL),(5,'2021-09-08 13:55:43','2021-09-08 13:55:43',60,0,2,NULL),(6,'2021-09-08 13:55:43','2021-09-08 13:55:43',60,0,2,NULL);



INSERT INTO rv_placement_zone_assoc(placement_zone_assoc_id,zone_id,placement_id) VALUES(1,1,1);

INSERT INTO rv_preferences(preference_id,preference_name,account_type) VALUES(1,'default_banner_image_url','TRAFFICKER'),(2,'default_banner_destination_url','TRAFFICKER'),(3,'default_banner_weight','ADVERTISER'),(4,'default_campaign_weight','ADVERTISER'),(5,'warn_email_admin','ADMIN'),(6,'warn_email_admin_impression_limit','ADMIN'),(7,'warn_email_admin_day_limit','ADMIN'),(8,'campaign_ecpm_enabled','MANAGER'),(9,'contract_ecpm_enabled','MANAGER'),(10,'warn_email_manager','MANAGER'),(11,'warn_email_manager_impression_limit','MANAGER'),(12,'warn_email_manager_day_limit','MANAGER'),(13,'warn_email_advertiser','ADVERTISER'),(14,'warn_email_advertiser_impression_limit','ADVERTISER'),(15,'warn_email_advertiser_day_limit','ADVERTISER'),(16,'timezone','MANAGER'),(17,'tracker_default_status','ADVERTISER'),(18,'tracker_default_type','ADVERTISER'),(19,'tracker_link_campaigns','ADVERTISER'),(20,'ui_show_campaign_info','ADVERTISER'),(21,'ui_show_banner_info','ADVERTISER'),(22,'ui_show_campaign_preview','ADVERTISER'),(23,'ui_show_banner_html','ADVERTISER'),(24,'ui_show_banner_preview','ADVERTISER'),(25,'ui_html_wyswyg_enabled',''),(26,'ui_hide_inactive',''),(27,'ui_show_matching_banners','TRAFFICKER'),(28,'ui_show_matching_banners_parents','TRAFFICKER'),(29,'ui_show_entity_id',''),(30,'ui_novice_user',''),(31,'ui_week_start_day',''),(32,'ui_percentage_decimals',''),(33,'ui_column_revenue','MANAGER'),(34,'ui_column_revenue_label','MANAGER'),(35,'ui_column_revenue_rank','MANAGER'),(36,'ui_column_bv','MANAGER'),(37,'ui_column_bv_label','MANAGER'),(38,'ui_column_bv_rank','MANAGER'),(39,'ui_column_num_items','MANAGER'),(40,'ui_column_num_items_label','MANAGER'),(41,'ui_column_num_items_rank','MANAGER'),(42,'ui_column_revcpc','MANAGER'),(43,'ui_column_revcpc_label','MANAGER'),(44,'ui_column_revcpc_rank','MANAGER'),(45,'ui_column_erpm','MANAGER'),(46,'ui_column_erpm_label','MANAGER'),(47,'ui_column_erpm_rank','MANAGER'),(48,'ui_column_erpc','MANAGER'),(49,'ui_column_erpc_label','MANAGER'),(50,'ui_column_erpc_rank','MANAGER'),(51,'ui_column_erps','MANAGER'),(52,'ui_column_erps_label','MANAGER'),(53,'ui_column_erps_rank','MANAGER'),(54,'ui_column_eipm','MANAGER'),(55,'ui_column_eipm_label','MANAGER'),(56,'ui_column_eipm_rank','MANAGER'),(57,'ui_column_eipc','MANAGER'),(58,'ui_column_eipc_label','MANAGER'),(59,'ui_column_eipc_rank','MANAGER'),(60,'ui_column_eips','MANAGER'),(61,'ui_column_eips_label','MANAGER'),(62,'ui_column_eips_rank','MANAGER'),(63,'ui_column_ecpm','MANAGER'),(64,'ui_column_ecpm_label','MANAGER'),(65,'ui_column_ecpm_rank','MANAGER'),(66,'ui_column_ecpc','MANAGER'),(67,'ui_column_ecpc_label','MANAGER'),(68,'ui_column_ecpc_rank','MANAGER'),(69,'ui_column_ecps','MANAGER'),(70,'ui_column_ecps_label','MANAGER'),(71,'ui_column_ecps_rank','MANAGER'),(72,'ui_column_id','MANAGER'),(73,'ui_column_id_label','MANAGER'),(74,'ui_column_id_rank','MANAGER'),(75,'ui_column_requests','MANAGER'),(76,'ui_column_requests_label','MANAGER'),(77,'ui_column_requests_rank','MANAGER'),(78,'ui_column_impressions','MANAGER'),(79,'ui_column_impressions_label','MANAGER'),(80,'ui_column_impressions_rank','MANAGER'),(81,'ui_column_clicks','MANAGER'),(82,'ui_column_clicks_label','MANAGER'),(83,'ui_column_clicks_rank','MANAGER'),(84,'ui_column_ctr','MANAGER'),(85,'ui_column_ctr_label','MANAGER'),(86,'ui_column_ctr_rank','MANAGER'),(87,'ui_column_conversions','MANAGER'),(88,'ui_column_conversions_label','MANAGER'),(89,'ui_column_conversions_rank','MANAGER'),(90,'ui_column_conversions_pending','MANAGER'),(91,'ui_column_conversions_pending_label','MANAGER'),(92,'ui_column_conversions_pending_rank','MANAGER'),(93,'ui_column_sr_views','MANAGER'),(94,'ui_column_sr_views_label','MANAGER'),(95,'ui_column_sr_views_rank','MANAGER'),(96,'ui_column_sr_clicks','MANAGER'),(97,'ui_column_sr_clicks_label','MANAGER'),(98,'ui_column_sr_clicks_rank','MANAGER');

INSERT INTO rv_session(sessionid,sessiondata,lastused,user_id) VALUES('19f17890f1e8f2d8a6a8cb95d0b2c472',X'613a31313a7b733a31333a225f5f61757468656e7469635f5f223b623a313b733a343a2275736572223b4f3a31383a224f415f5065726d697373696f6e5f55736572223a323a7b733a353a226155736572223b613a31353a7b733a373a22757365725f6964223b733a313a2231223b733a31323a22636f6e746163745f6e616d65223b733a31333a2241646d696e6973747261746f72223b733a31333a22656d61696c5f61646472657373223b733a32323a226a62726963656e6f406e6f6d61642d636d732e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a383a226c616e6775616765223b733a323a22656e223b733a31383a2264656661756c745f6163636f756e745f6964223b733a313a2232223b733a383a22636f6d6d656e7473223b733a303a22223b733a363a22616374697665223b733a313a2231223b733a31313a2273736f5f757365725f6964223b733a303a22223b733a31323a22646174655f63726561746564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a31353a22646174655f6c6173745f6c6f67696e223b733a303a22223b733a31333a22656d61696c5f75706461746564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a31303a226163636f756e745f6964223b733a313a2231223b733a363a226c696e6b6564223b733a31393a22323032312d30392d30382031333a33393a3438223b733a383a2269735f61646d696e223b623a313b7d733a383a22614163636f756e74223b613a353a7b733a31303a226163636f756e745f6964223b733a313a2232223b733a31323a226163636f756e745f74797065223b733a373a224d414e41474552223b733a31323a226163636f756e745f6e616d65223b733a31353a2244656661756c74206d616e61676572223b733a393a22656e746974795f6964223b733a313a2231223b733a393a226167656e63795f6964223b733a313a2231223b7d7d733a353a22746f6b656e223b733a33323a223439633730316434323030326365303131353533303461383438666565633765223b733a31373a226e6f74696669636174696f6e5175657565223b613a303a7b7d733a31383a2273656375726974795f636865636b5f766572223b733a393a22352e332e302d726331223b733a353a227072656673223b613a393a7b733a32303a22616476657274697365722d696e6465782e706870223b613a333a7b733a31323a2268696465696e616374697665223b623a303b733a393a226c6973746f72646572223b733a303a22223b733a31343a226f72646572646972656374696f6e223b733a303a22223b7d733a31383a22696e76656e746f72795f656e746974696573223b613a313a7b693a313b613a333a7b733a383a22636c69656e746964223b733a313a2231223b733a31303a2263616d706169676e6964223b613a313a7b693a313b733a313a2231223b7d733a31313a22616666696c696174656964223b733a313a2231223b7d7d733a32343a22616476657274697365722d63616d706169676e732e706870223b613a313a7b693a313b613a333a7b733a31323a2268696465696e616374697665223b623a303b733a393a226c6973746f72646572223b733a303a22223b733a31343a226f72646572646972656374696f6e223b733a303a22223b7d7d733a32303a2263616d706169676e2d62616e6e6572732e706870223b613a313a7b693a313b613a333a7b733a31323a2268696465696e616374697665223b623a303b733a393a226c6973746f72646572223b733a303a22223b733a31343a226f72646572646972656374696f6e223b733a303a22223b7d7d733a31373a22776562736974652d696e6465782e706870223b613a323a7b733a393a226c6973746f72646572223b733a303a22223b733a31343a226f72646572646972656374696f6e223b733a303a22223b7d733a31393a22616666696c696174652d7a6f6e65732e706870223b613a323a7b733a393a226c6973746f72646572223b733a303a22223b733a31343a226f72646572646972656374696f6e223b733a303a22223b7d733a31363a227a6f6e652d696e636c7564652e706870223b613a363a7b733a31323a2268696465696e616374697665223b623a303b733a31313a2273686f7762616e6e657273223b623a313b733a31333a2273686f7763616d706169676e73223b623a303b733a393a226c6973746f72646572223b733a343a226e616d65223b733a31343a226f72646572646972656374696f6e223b733a323a227570223b733a343a2276696577223b733a393a22706c6163656d656e74223b7d733a373a22474c4f42414c53223b613a333a7b733a31333a22706572696f645f707265736574223b733a353a22746f646179223b733a31323a22706572696f645f7374617274223b733a31303a22323032312d30392d3038223b733a31303a22706572696f645f656e64223b733a31303a22323032312d30392d3038223b7d733a393a2273746174732e706870223b613a353a7b733a393a226c6973746f72646572223b733a343a226e616d65223b733a31343a226f72646572646972656374696f6e223b733a323a227570223b733a31303a2273746172746c6576656c223b693a303b733a353a226e6f646573223b733a303a22223b733a31323a2268696465696e616374697665223b623a303b7d7d733a393a226d6573736167654964223b693a313633313130383534303b733a31323a226d6573736167655175657565223b613a303a7b7d733a31353a226d61696e745f7570646174655f6a73223b623a313b733a32303a22726563656e746c79557365644163636f756e7473223b613a313a7b733a323a226132223b733a313a2232223b7d733a393a226d70655f746f6b656e223b4e3b7d','2021-09-08 13:57:35',1);





INSERT INTO rv_upgrade_action(upgrade_action_id,upgrade_name,version_to,version_from,action,description,logfile,confbackup,updated) VALUES(1,'install_5.3.0-rc1','5.3.0-rc1','0',1,'UPGRADE_COMPLETE','install.log',NULL,'2021-09-08 13:39:14'),(2,'install_openXBannerTypes','1.6.1','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:48'),(3,'install_oxHtml','1.6.1','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:48'),(4,'install_oxText','1.6.1','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:48'),(5,'install_openXDeliveryLimitations','5.0.7','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:51'),(6,'install_Client','5.0.7','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:51'),(7,'install_Geo','5.0.7','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:51'),(8,'install_Site','5.0.7','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:51'),(9,'install_Time','5.0.7','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:51'),(10,'install_openXReports','1.6.1','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:54'),(11,'install_oxReportsStandard','1.6.1','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:54'),(12,'install_oxReportsAdmin','1.6.1','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:54'),(13,'install_openXDeliveryCacheStore','1.5.0','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:56'),(14,'install_oxCacheFile','1.5.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:56'),(15,'install_oxMemcached','1.5.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:56'),(16,'install_openXInvocationTags','1.6.1','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:59'),(17,'install_oxInvocationTags','1.6.1','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:39:59'),(18,'install_openXDeliveryLog','1.5.0','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:02'),(19,'install_oxDeliveryDataPrepare','1.5.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:02'),(20,'install_oxLogClick','1.5.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:02'),(21,'install_oxLogConversion','1.5.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:02'),(22,'install_oxLogImpression','1.5.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:02'),(23,'install_oxLogRequest','1.5.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:02'),(24,'install_openXVideoAds','1.13.5','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:04'),(25,'install_vastInlineBannerTypeHtml','1.13.5','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:04'),(26,'install_vastOverlayBannerTypeHtml','1.13.5','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:04'),(27,'install_oxLogVast','1.13.5','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:04'),(28,'install_vastServeVideoPlayer','1.13.5','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:04'),(29,'install_videoReport','1.13.5','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:04'),(30,'install_reviveMaxMindGeoIP2','1.1.0','0',4,'PACKAGE INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:07'),(31,'install_rvMaxMindGeoIP2','1.1.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:07'),(32,'install_rvMaxMindGeoIP2Maintenance','1.1.0','0',4,'PLUGIN INSTALL COMPLETE','plugins.log',NULL,'2021-09-08 13:40:07');


INSERT INTO rv_users(user_id,contact_name,email_address,username,password,language,default_account_id,comments,active,sso_user_id,date_created,date_last_login,email_updated) VALUES(1,'Administrator','jbriceno@nomad-cms.com','admin','5f4dcc3b5aa765d61d8327deb882cf99','en',2,NULL,1,NULL,'2021-09-08 13:39:48',NULL,'2021-09-08 13:39:48');


INSERT INTO rv_zones(zoneid,affiliateid,zonename,description,delivery,zonetype,category,width,height,ad_selection,chain,prepend,append,appendtype,forceappend,inventory_forecast_type,comments,cost,cost_type,cost_variable_id,technology_cost,technology_cost_type,updated,block,capping,session_capping,what,rate,pricing,oac_category_id,ext_adselection,show_capped_no_cookie) VALUES(1,1,'127.0.0.1:3000 - Default','',6,3,X'',-3,-3,X'',X'',X'',X'',0,'f',0,X'',NULL,NULL,NULL,NULL,NULL,'2021-09-08 13:55:18',0,0,0,X'',NULL,'CPM',NULL,NULL,0);