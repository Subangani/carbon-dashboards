--
-- Copyright 2016 WSO2 Inc. (http://wso2.org)
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
DROP TABLE IF EXISTS GADGET_USAGE;
CREATE TABLE GADGET_USAGE (
    TENANT_ID INTEGER NOT NULL,
    DASHBOARD_ID VARCHAR(255) NOT NULL,
    GADGET_ID VARCHAR(255) NOT NULL,
    GADGET_STATE VARCHAR(255) NOT NULL,
    USAGE_DATA TEXT,
    PRIMARY KEY (TENANT_ID, DASHBOARD_ID, GADGET_ID));

CREATE INDEX G_INDEX ON GADGET_USAGE(TENANT_ID, GADGET_ID);


--Notification Tables
CREATE TABLE IF NOT EXISTS NOTIFICATION (
  NOTIFICATION_ID CHAR (255 ) NOT NULL ,
  TITLE CHAR (255 ),
  MESSAGE CHAR (255),
  DIRECT_URL CHAR (255),
  PRIMARY KEY (NOTIFICATION_ID)
);
CREATE TABLE IF NOT EXISTS USER_NOTIFICATION (
  NOTIFICATION_ID CHAR (255 )  REFERENCES NOTIFICATION(NOTIFICATION_ID) NOT NULL,
  USER_NAME CHAR (255) NOT NULL,
  READ BOOLEAN NOT NULL,
  PRIMARY KEY(NOTIFICATION_ID, USER_NAME),
);
CREATE TABLE IF NOT EXISTS ROLE_NOTIFICATION (
  NOTIFICATION_ID CHAR (255 )  REFERENCES NOTIFICATION(NOTIFICATION_ID) NOT NULL,
  ROLE CHAR (255) NOT NULL,
  PRIMARY KEY(NOTIFICATION_ID, ROLE),
);