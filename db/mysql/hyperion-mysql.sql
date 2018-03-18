/* File generated automatically by dynamo */
/* The Agent table holds the information about a monitoring agent
who is allowed to connect to the Hyperion server. */
CREATE TABLE Agent (
  /* the agent identifier */
  `id` BIGINT NOT NULL,
  /* the agent host name */
  `hostname` VARCHAR(255) BINARY NOT NULL,
  /* the IP address */
  `ip` VARCHAR(255) BINARY NOT NULL,
  /* the agent key */
  `key` VARCHAR(255) BINARY NOT NULL,
  /* the date when the agent was registered */
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*  */
CREATE TABLE hyperion_host_desc (
  /* the identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the description text */
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*  */
CREATE TABLE hyperion_host (
  /* the host identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the host name */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the IPv4 address */
  `ip` VARCHAR(255) BINARY NOT NULL,
  /* the host identification key */
  `key` VARCHAR(255) BINARY NOT NULL,
  /* the host creation date */
  `create_date` DATETIME NOT NULL,
  /* the serial number */
  `serial` VARCHAR(255) BINARY NOT NULL,
  /* host description text */
  `description` VARCHAR(255) BINARY NOT NULL,
  /* the host status type */
  `status`  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*  */
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
  `content` VARCHAR(255) BINARY NOT NULL,
  /* the number of values in the series. */
  `count` INTEGER NOT NULL,
  /*  */
  `source_id` BIGINT NOT NULL,
  /* the snapshot that produced the series */
  `snapshot_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*  */
CREATE TABLE hyperion_source (
  /* unique identifier. */
  `id` BIGINT NOT NULL,
  /* the time series name. */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the label to be used in presentation. */
  `label` VARCHAR(255) BINARY NOT NULL,
  /* the optimistic lock version */
  `version` INTEGER NOT NULL,
  /* the host to which the source is associated */
  `host_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO entity_type (name) VALUES
("Agent")
,("hyperion_host_desc")
,("hyperion_host")
,("hyperion_host_info")
,("hyperion_series")
,("hyperion_snapshot")
,("hyperion_source")
;
