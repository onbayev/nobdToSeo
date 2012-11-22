set echo off 
set newpage 0 
set pagesize 0 
set space 0 
set feedback off 
set trimspool on 
set heading off 
set linesize 5555 
select 
'INSERT INTO "nobd_bridge".students( id,iin, n, l, p, eid, eprop, class, school, egroup, gender, bd,parallel,class_code) 
 VALUES ('||s.id||','''||nvl(s.IIN,'')||''','''||s.I||''', '''||s.F||''', '''||nvl(s.O,'')||''', null, null,'||nvl(sl.CLASS_ID,0)||', '||sl.SCHOOL_ID||',null, '||nvl(c2.id,0)||', '''||nvl(to_char(sd.date_value,'yyyy-mm-dd HH24:MI:SS'),'')||''','''||nvl(sl.parallel,'')||''','''||c.code||''')'||'###'
from STUDENT s
        join SCHOOL_STUDENT_LINK sl on (sl.STUDENT_ID = s.id)
		left join CLASS_ITEM_TREE c on (sl.class_id = c.id)
		left join STUDENT_DATA sd on (sd.student_id = s.id and sd.PASS_IND_LINK_ID =205 )
		left join STUDENT_DATA sd2 on (sd2.student_id = s.id and sd2.PASS_IND_LINK_ID =206 )
		left join CLASS_ITEM_TREE c2 on (sd2.class_item_tree_id = c2.id)
where  sl.SCHOOL_ID in
(*#*)
;
