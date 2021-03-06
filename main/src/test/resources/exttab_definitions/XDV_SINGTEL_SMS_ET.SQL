CREATE TABLE XDV_SINGTEL_SMS_ET
(
  RECORD_TYPE              VARCHAR2(4000 BYTE),
  STRUCTURE_CODE           VARCHAR2(4000 BYTE),
  CALLING_TON_NPI          VARCHAR2(4000 BYTE),
  CALLING_NUMBER           VARCHAR2(4000 BYTE),
  CALLING_CUSTOMER_ID      VARCHAR2(4000 BYTE),
  CALLED_TON_NPI           VARCHAR2(4000 BYTE),
  CALLED_NUMBER            VARCHAR2(4000 BYTE),
  CALLED_CUSTOMER_ID       VARCHAR2(4000 BYTE),
  MESSAGE_SUBMISSION_TIME  VARCHAR2(16 BYTE),
  MESSAGE_DELIVERY_TIME    VARCHAR2(16 BYTE),
  CAUSE_FOR_TERMINATION    VARCHAR2(4000 BYTE),
  CALL_REFERENCE           VARCHAR2(4000 BYTE),
  LENGTH                   NUMBER(4),
  PRIORITY                 VARCHAR2(4000 BYTE),
  DEFERRED                 VARCHAR2(4000 BYTE),
  RECEIPT                  VARCHAR2(4000 BYTE),
  NUMBER_OF_ATTEMPTS       VARCHAR2(4000 BYTE),
  PROTOCOL_ID              VARCHAR2(4000 BYTE),
  SOURCE_SC_ADDRESS        VARCHAR2(4000 BYTE),
  SOURCE_IMSI              VARCHAR2(4000 BYTE),
  DESTINATION_IMSI         VARCHAR2(4000 BYTE),
  SOURCE_MSC_ADDRESS       VARCHAR2(4000 BYTE),
  DESTINATION_MSC_ADDRESS  VARCHAR2(4000 BYTE),
  SERVICE_ID               VARCHAR2(4000 BYTE),
  BILLABLE_PARTY_TON_NPI   VARCHAR2(4000 BYTE),
  BILLABLE_PARTY_NUMBER    VARCHAR2(4000 BYTE),
  PREPAID_FLAG             NUMBER(1),
  PREPAID_STATUS           NUMBER(1),
  PSA_TRANSACTION_ID       VARCHAR2(4000 BYTE),
  DEVICE_ID                VARCHAR2(40 BYTE)
)
ORGANIZATION EXTERNAL
  (  TYPE ORACLE_LOADER
     DEFAULT DIRECTORY XDV_EXT_GEN_DATA_DIR
     ACCESS PARAMETERS
       ( RECORDS DELIMITED BY NEWLINE
    BADFILE     XDV_EXT_GEN_LOG_DIR:'singtel_sms.bad'
    DISCARDFILE XDV_EXT_GEN_LOG_DIR:'singtel_sms.dis'
    LOGFILE     XDV_EXT_GEN_LOG_DIR:'singtel_sms_log'
    LOAD WHEN ((RECORD_TYPE='01' OR RECORD_TYPE='02'
                OR RECORD_TYPE='04' OR RECORD_TYPE='05'
                OR RECORD_TYPE='06')
                AND CALL_REFERENCE != "000000000000"
                AND MESSAGE_SUBMISSION_TIME != BLANKS
                AND MESSAGE_DELIVERY_TIME != BLANKS)
    FIELDS TERMINATED BY '|' OPTIONALLY ENCLOSED BY '"' MISSING FIELD VALUES ARE NULL
    (
        RECORD_TYPE CHAR(4000),
        STRUCTURE_CODE CHAR(4000),
        CALLING_TON_NPI CHAR(4000),
        CALLING_NUMBER CHAR(4000),
        CALLING_CUSTOMER_ID CHAR(4000),
        CALLED_TON_NPI CHAR(4000),
        CALLED_NUMBER CHAR(4000),
        CALLED_CUSTOMER_ID CHAR(4000),
        MESSAGE_SUBMISSION_TIME CHAR(16),
        MESSAGE_DELIVERY_TIME CHAR(16),
        CAUSE_FOR_TERMINATION CHAR(4000),
        CALL_REFERENCE CHAR(4000),
        LENGTH INTEGER EXTERNAL(4),
        PRIORITY CHAR(4000),
        DEFERRED CHAR(4000),
        RECEIPT CHAR(4000),
        NUMBER_OF_ATTEMPTS CHAR(4000),
        PROTOCOL_ID CHAR(4000),
        SOURCE_SC_ADDRESS CHAR(4000),
        SOURCE_IMSI CHAR(4000),
        DESTINATION_IMSI CHAR(4000),
        SOURCE_MSC_ADDRESS CHAR(4000),
        DESTINATION_MSC_ADDRESS CHAR(4000),
        SERVICE_ID CHAR(4000),
        BILLABLE_PARTY_TON_NPI CHAR(4000),
        BILLABLE_PARTY_NUMBER CHAR(4000),
        PREPAID_FLAG INTEGER EXTERNAL(1),
        PREPAID_STATUS INTEGER EXTERNAL(1),
        PSA_TRANSACTION_ID CHAR(4000),
        DEVICE_ID CHAR(40)
    )
   )
     LOCATION (XDV_EXT_GEN_DATA_DIR:'singtel_sms_dat')
  )
REJECT LIMIT UNLIMITED
PARALLEL ( DEGREE DEFAULT INSTANCES 1 )
NOMONITORING;
