set echo off 
set newpage 0 
set pagesize 0 
set space 0 
set feedback off 
set trimspool on 
set heading off 
set linesize 5555
SELECT 
'INSERT INTO "nobd_bridge".student_data (student,pil,datatype,val,description,value_desc) VALUES ('||STUDENT_ID||','||pil."ID"||','||pil.DATATYPE||','''||to_char(sd.DATE_VALUE, 'YYYY-MM-DD HH24:MI:SS')||''','''||i.rname||''','''')###'
FROM STUDENT_DATA SD
 JOIN PASS_IND_LINK PIL ON (SD.PASS_IND_LINK_ID = PIL."ID")
 JOIN "INDICATOR" I ON (I.ID = PIL.IND_ID)
WHERE sd.SCHOOL_ID IN 
(*#*)
and pil.DATATYPE = 1
UNION
SELECT 
'INSERT INTO "nobd_bridge".student_data (student,pil,datatype,val,description,value_desc) VALUES ('||STUDENT_ID||','||pil."ID"||','||pil.DATATYPE||','''||CAST(sd.BOOLEAN_VALUE as VARCHAR2(5))||''','''||i.rname||''','''')###'
FROM STUDENT_DATA SD
 JOIN PASS_IND_LINK PIL ON (SD.PASS_IND_LINK_ID = PIL."ID")
 JOIN "INDICATOR" I ON (I.ID = PIL.IND_ID)
WHERE sd.SCHOOL_ID IN 
(*#*)
and pil.DATATYPE = 2
UNION
SELECT 
'INSERT INTO "nobd_bridge".student_data (student,pil,datatype,val,description,value_desc) VALUES ('||STUDENT_ID||','||pil."ID"||','||pil.DATATYPE||','''||CAST(CIT.id as VARCHAR2(10))||''','''||i.rname||''','''||CIT.RNAME||''')###'
FROM STUDENT_DATA SD
 JOIN PASS_IND_LINK PIL ON (SD.PASS_IND_LINK_ID = PIL."ID")
 JOIN "INDICATOR" I ON (I.ID = PIL.IND_ID)
 JOIN CLASS_ITEM_TREE CIT ON (CIT.ID = SD.CLASS_ITEM_TREE_ID)
WHERE sd.SCHOOL_ID IN 
(*#*)
and pil.DATATYPE = 3
UNION
SELECT 
'INSERT INTO "nobd_bridge".student_data (student,pil,datatype,val,description,value_desc) VALUES ('||STUDENT_ID||','||pil."ID"||','||pil.DATATYPE||','''||sd.STRING_VALUE||''','''||i.rname||''','''')###'
FROM STUDENT_DATA SD
 JOIN PASS_IND_LINK PIL ON (SD.PASS_IND_LINK_ID = PIL."ID")
 JOIN "INDICATOR" I ON (I.ID = PIL.IND_ID)
WHERE sd.SCHOOL_ID IN 
(*#*)
and pil.DATATYPE = 4
UNION
SELECT 
'INSERT INTO "nobd_bridge".student_data (student,pil,datatype,val,description,value_desc) VALUES ('||STUDENT_ID||','||pil."ID"||','||pil.DATATYPE||','''||CAST(CIT.id as VARCHAR2(10))||''','''||i.rname||''','''||CIT.RNAME||''')###'
FROM STUDENT_DATA SD
 JOIN PASS_IND_LINK PIL ON (SD.PASS_IND_LINK_ID = PIL."ID")
 JOIN "INDICATOR" I ON (I.ID = PIL.IND_ID)
 JOIN CLASS_ITEM_TREE CIT ON (CIT.ID = SD.CLASS_ITEM_TREE_ID)
WHERE sd.SCHOOL_ID IN 
(*#*)
and pil.DATATYPE = 7;

