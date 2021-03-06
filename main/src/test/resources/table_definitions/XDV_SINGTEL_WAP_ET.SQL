CREATE TABLE XDV_SINGTEL_WAP_ET
(
  RECORDING_ENTITY            VARCHAR2(4000 BYTE),
  CLIENT_ID_MSISDN            VARCHAR2(4000 BYTE),
  DESTINATION_URL             VARCHAR2(4000 BYTE),
  CONTENT_SIZE_TO_TERMINAL    VARCHAR2(4000 BYTE),
  CONTENT_SIZE_FROM_TERMINAL  VARCHAR2(4000 BYTE),
  EVENT_TIMESTAMP             TIMESTAMP(6),
  RETURN_CODE                 VARCHAR2(4000 BYTE),
  HTTP_METHOD                 VARCHAR2(4000 BYTE),
  SGSN_IP                     VARCHAR2(4000 BYTE),
  SOURCE_IP                   VARCHAR2(4000 BYTE),
  NETWORK_ACCESS_TYPE         VARCHAR2(4000 BYTE),
  IMSI                        VARCHAR2(4000 BYTE),
  UA_IDENTIFICATION           VARCHAR2(4000 BYTE),
  HTTP_RESPOND_TIMESTAMP      TIMESTAMP(9),
  HTTP_REQUEST_TIMESTAMP      TIMESTAMP(9),
  NEGOTIATED_QOS_PROFILE      VARCHAR2(4000 BYTE)
)
ORGANIZATION EXTERNAL
  (  TYPE ORACLE_LOADER
     DEFAULT DIRECTORY XDV_EXT_GEN_DATA_DIR
     ACCESS PARAMETERS
       ( RECORDS DELIMITED BY NEWLINE
    BADFILE     XDV_EXT_GEN_LOG_DIR:'singtel_wap.bad'
    DISCARDFILE XDV_EXT_GEN_LOG_DIR:'singtel_wap.dis'
    LOGFILE     XDV_EXT_GEN_LOG_DIR:'singtel_wap_log'
    LOAD WHEN (EVENT_TIMESTAMP != BLANKS)
    FIELDS TERMINATED BY '`' OPTIONALLY ENCLOSED BY '"' MISSING FIELD VALUES ARE NULL
    (
      RECORDING_ENTITY CHAR(4000),
      CLIENT_ID_MSISDN CHAR(4000),
      DESTINATION_URL CHAR(4000),
      CONTENT_SIZE_TO_TERMINAL CHAR(4000),
      CONTENT_SIZE_FROM_TERMINAL CHAR(4000),
      EVENT_TIMESTAMP CHAR(14) DATE_FORMAT TIMESTAMP MASK 'YYYYMMDDHH24MISS' ,
      RETURN_CODE CHAR(4000),
      HTTP_METHOD CHAR(4000),
      SGSN_IP CHAR(4000),
      SOURCE_IP CHAR(4000),
      NETWORK_ACCESS_TYPE CHAR(4000),
      IMSI CHAR(4000),
      UA_IDENTIFICATION CHAR(4000),
      HTTP_RESPOND_TIMESTAMP CHAR(29) DATE_FORMAT TIMESTAMP MASK  'YYYY-MM-DD HH24:MI:SS.FF9',
      HTTP_REQUEST_TIMESTAMP CHAR(29) DATE_FORMAT TIMESTAMP MASK  'YYYY-MM-DD HH24:MI:SS.FF9',
      NEGOTIATED_QOS_PROFILE CHAR(4000)
    )
   )
     LOCATION (XDV_EXT_GEN_DATA_DIR:'singtel_wap_dat')
  )
REJECT LIMIT UNLIMITED
PARALLEL ( DEGREE DEFAULT INSTANCES 1 )
NOMONITORING;
