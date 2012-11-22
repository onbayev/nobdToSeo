set echo off 
set newpage 0 
set pagesize 0 
set space 0 
set feedback off 
set trimspool on 
set heading off 
set linesize 5555
select
'INSERT INTO "nobd_bridge".schools( id, rname, kname, ename, eprop, eid, org_type,region)  VALUES ('||id||', '''||rname||''', '||nvl(''''||kname||'''','')||', '''||nvl(ename,'')||''',null , null,'||nvl(ORG_TYPE_ID,0)||','||CLASS_ITEM_TREE_ID||')'||CHR(59)
from SCHOOL_LIST s
        where  s.id
in
(*#*)
;
