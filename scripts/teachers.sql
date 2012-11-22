set echo off 
set newpage 0 
set pagesize 0 
set space 0 
set feedback off 
set trimspool on 
set heading off 
set linesize 5555 
select 
'INSERT INTO "nobd_bridge".teacher( id,iin, n, l, p, eid, eprop, school, egroup, gender, bd) 
 VALUES ('||s.id||','''||nvl(s.IIN,'')||''','''||s.I||''', '''||s.F||''', '''||nvl(s.O,'')||''', null, null, '||sl.SCHOOL_ID||',null, '||nvl(c2.id,0)||', '''||nvl(to_char(sd.date_value,'yyyy-mm-dd HH24:MI:SS'),'')||''')'||'###'
from TEACHER s
        join SCHOOL_TEACHER_LINK sl on (sl.TEACHER_ID = s.id)
		left join TEACHER_DATA sd on (sd.teacher_id = s.id and sd.PASS_IND_LINK_ID =201 )
		left join TEACHER_DATA sd2 on (sd2.teacher_id = s.id and sd2.PASS_IND_LINK_ID =199 )
		left join CLASS_ITEM_TREE c2 on (sd2.class_item_tree_id = c2.id)
        where  sl.SCHOOL_ID in
(*#*)
;
