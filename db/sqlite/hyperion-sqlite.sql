/* File generated automatically by dynamo */
/* The Agent table holds the information about a monitoring agent
who is allowed to connect to the Hyperion server. */
CREATE TABLE hyperion_agent (
  /* the agent identifier */
  `id` BIGINT NOT NULL,
  /* the agent host name */
  `hostname` VARCHAR(255) NOT NULL,
  /* the IP address */
  `ip` VARCHAR(255) NOT NULL,
  /* the agent key */
  `key` VARCHAR(255) NOT NULL,
  /* the date when the agent was registered */
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE hyperion_host_desc (
  /* the identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the description text */
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE hyperion_host (
  /* the host identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the host name */
  `name` VARCHAR(255) NOT NULL,
  /* the IPv4 address */
  `ip` VARCHAR(255) NOT NULL,
  /* the host identification key */
  `key` VARCHAR(255) NOT NULL,
  /* the host creation date */
  `create_date` DATETIME NOT NULL,
  /* the serial number */
  `serial` VARCHAR(255) NOT NULL,
  /* host description text */
  `description` VARCHAR(255) NOT NULL,
  /* the host status type */
  `status` TINYINT NOT NULL,
  /*  */
  `agent_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE hyperion_host_info (
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the description index */
  `index` INTEGER NOT NULL,
  /*  */
  `host_id` BIGINT NOT NULL,
  /*  */
  `desc_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The Series table holds the collected data
for a given time frame. Values are serialized
in the 'content' blob in a format described by
the Format_Type enumeration. */
CREATE TABLE hyperion_series (
  /* the series unique identifier */
  `id` BIGINT NOT NULL,
  /* the optimistic lock version. */
  `version` INTEGER NOT NULL,
  /* the date and time of the first value in the series. */
  `start_date` DATETIME NOT NULL,
  /* the date and time of the last value in the series. */
  `end_date` DATETIME NOT NULL,
  /* the series content (JSON). */
  `content` LONGBLOB NOT NULL,
  /* the number of values in the series. */
  `count` INTEGER NOT NULL,
  /* the first value of the serie. */
  `first_value` INTEGER NOT NULL,
  /* the format of the content blob data. */
  `format`  NOT NULL,
  /*  */
  `source_id` BIGINT NOT NULL,
  /* the snapshot that produced the series */
  `snapshot_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE hyperion_snapshot (
  /* the snapshot identifier */
  `id` BIGINT NOT NULL,
  /* the snapshot date */
  `start_date` DATETIME NOT NULL,
  /* the snapshot end date. */
  `end_date` DATETIME NOT NULL,
  /* the optimistic lock version */
  `version` INTEGER NOT NULL,
  /* the host to which the snapshot is associated */
  `host_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The source describes an element of the system that is monitored and which
for which we have collected data. */
CREATE TABLE hyperion_source (
  /* unique identifier. */
  `id` BIGINT NOT NULL,
  /* the time series name. */
  `name` VARCHAR(255) NOT NULL,
  /* the label to be used in presentation. */
  `label` VARCHAR(255) NOT NULL,
  /* the optimistic lock version */
  `version` INTEGER NOT NULL,
  /* the host to which the source is associated */
  `host_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES ("hyperion_agent");
INSERT INTO entity_type (name) VALUES ("hyperion_host_desc");
INSERT INTO entity_type (name) VALUES ("hyperion_host");
INSERT INTO entity_type (name) VALUES ("hyperion_host_info");
INSERT INTO entity_type (name) VALUES ("hyperion_series");
INSERT INTO entity_type (name) VALUES ("hyperion_snapshot");
INSERT INTO entity_type (name) VALUES ("hyperion_source");
