with a as (  -- ТАБЛИЦА, отфильтрованная по периоду 1 со строками, где только Нов.польз, Нов. сеансы, Поль, сеансы
select * 
from travelata.attr_final_final
where (statusIn = 1 or statusIn = 2 or statusIn = 5 or statusIn = 6)
and (toDate(__datetime) between '2023-11-17' and '2023-11-21')
),
b as (    -- ТАБЛИЦА, отфильтрованная по периоду 2 со строками, где только Нов.польз, Нов. сеансы, Поль, сеансы
select * 
from travelata.attr_final_final
where (statusIn = 1 or statusIn = 2 or statusIn = 5 or statusIn = 6)
and (toDate(__datetime) between '2023-11-17' and '2023-11-19')
),
np_a as ( -- Нов пользователи за период 1 по шагам
select  'np' as step,
     count(case when statusIn = 1 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 1 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 1 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 1 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 1 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 1 and __priority=6 then statusIn end) as step6
from a),
ns_a as ( -- Нов сеансы за период 1 по шагам
select  'ns' as step,
     count(case when statusIn = 2 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 2 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 2 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 2 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 2 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 2 and __priority=6 then statusIn end) as step6
from a),
p_a as ( -- Пользователи за период 1 по шагам
select  'p' as step,
     count(case when statusIn = 5 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 5 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 5 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 5 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 5 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 5 and __priority=6 then statusIn end) as step6
from a),
s_a as (   -- Сеансы за период 1 по шагам
select  's' as step,
     count(case when statusIn = 6 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 6 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 6 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 6 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 6 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 6 and __priority=6 then statusIn end) as step6
from a),
svIn1 as (   --  Сводная StatusIn за период 1
select * from np_a
union all 
select * from ns_a
union all 
select * from p_a
union all 
select * from s_a),
np_b as (
select  'np' as step,
     count(case when statusIn = 1 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 1 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 1 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 1 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 1 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 1 and __priority=6 then statusIn end) as step6
from b),
ns_b as (
select  'ns' as step,
     count(case when statusIn = 2 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 2 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 2 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 2 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 2 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 2 and __priority=6 then statusIn end) as step6
from b),
p_b as (
select  'p' as step,
     count(case when statusIn = 5 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 5 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 5 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 5 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 5 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 5 and __priority=6 then statusIn end) as step6
from b),
s_b as (
select  's' as step,
     count(case when statusIn = 6 and __priority=1 then statusIn end) as step1,
     count(case when statusIn = 6 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 6 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 6 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 6 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 6 and __priority=6 then statusIn end) as step6
from b),
svIn2 as (   --  Сводная StatusIn за период 2
select * from np_b
union all 
select * from ns_b
union all 
select * from p_b
union all 
select * from s_b),
t1_a as (  -- Талб1 по сеансам
select '1 Сеансы за период1' as step, toFloat64(sum(step1)) as step1, toFloat64(sum(step2)) as step2, toFloat64(sum(step3)) as step3,
                                    toFloat64(sum(step4)) as step4, toFloat64(sum(step5)) as step5, toFloat64(sum(step6)) as step6  from svIn1
        ),
t1_b as (
select '1 Сеансы за период2' as step, toFloat64(sum(step1)) as step1, toFloat64(sum(step2)) as step2, toFloat64(sum(step3)) as step3,
                                    toFloat64(sum(step4)) as step4, toFloat64(sum(step5)) as step5, toFloat64(sum(step6)) as step6  from svIn2
        ),
t1_c as (
select '1 относительное сравнение' as step, b.step1/a.step1-1 as step1, b.step2/a.step2-1 as step2, b.step3/a.step3-1 as step3, b.step4/a.step4-1 as step4,  b.step5/a.step5-1 as step5, b.step6/a.step6-1 as step6
from t1_a a, t1_b b
),
t1 as(
select * from t1_a
union all
select * from t1_b
union all
select * from t1_c),
t2_a as (   -- Талб2 по конверсиям с прошлого шага
select distinct '2 CR по сеансам с прошлого шага за период1' as step, 0 as step1, 
                                                 (p_a.step2+s_a.step2)/(select sum(step1) from svIn1) as step2,
                                                 (p_a.step3+s_a.step3)/(select sum(step2) from svIn1) as step3,
                                                 (p_a.step4+s_a.step4)/(select sum(step3) from svIn1) as step4,
                                                 (p_a.step5+s_a.step5)/(select sum(step4) from svIn1) as step5,
                                                 (p_a.step6+s_a.step6)/(select sum(step5) from svIn1) as step6
from p_a, s_a),
t2_b as (
select distinct '2 CR по сеансам с прошлого шага за период2' as step, 0 as step1, 
                                                 (p_b.step2+s_b.step2)/(select sum(step1) from svIn2) as step2,
                                                 (p_b.step3+s_b.step3)/(select sum(step2) from svIn2) as step3,
                                                 (p_b.step4+s_b.step4)/(select sum(step3) from svIn2) as step4,
                                                 (p_b.step5+s_b.step5)/(select sum(step4) from svIn2) as step5,
                                                 (p_b.step6+s_b.step6)/(select sum(step5) from svIn2) as step6
from p_b, s_b),
t2_c as (
select '2 В сравнении' as step, 0 as step1, 
		b.step2/a.step2-1 as step2, b.step3/a.step3-1 as step3, b.step4/a.step4-1 as step4,  b.step5/a.step5-1 as step5, b.step6/a.step6-1 as step6
from t2_a a, t2_b b
),
t2 as (
select  * from t2_a
union all 
select  * from t2_b
union all 
select  * from t2_c),
t3_a as (  -- Талб3 по конверсиям с начала воронки
select distinct '3 CR по сеансам с начала воронки за период1' as step, 0 as step_1, 
                                                 (p_a.step2+s_a.step2)/(np_a.step1 + ns_a.step1) as step_2,
                                                 (p_a.step3+s_a.step3)/(np_a.step1 + ns_a.step1 + np_a.step2 + ns_a.step2) as step_3,
                                                 (p_a.step4+s_a.step4)/(np_a.step1 + ns_a.step1 + np_a.step2 + ns_a.step2 + np_a.step3 + ns_a.step3) as step_4,
                                                 (p_a.step5+s_a.step5)/(np_a.step1 + ns_a.step1 + np_a.step2 + ns_a.step2 + np_a.step3 + ns_a.step3 + np_a.step4 + ns_a.step4) as step_5,
                                                 (p_a.step6+s_a.step6)/(np_a.step1 + ns_a.step1 + np_a.step2 + ns_a.step2 + np_a.step3 + ns_a.step3 + np_a.step4 + ns_a.step4 + np_a.step5 + ns_a.step5) as step_6
from p_a, s_a, np_a, ns_a),
t3_b as (
select  '3 CR по сеансам с начала воронки за период2' as step, 0 as step_1, 
                                                   (p_b.step2+s_b.step2)/(np_b.step1 + ns_b.step1) as step_2,
                                                   (p_b.step3+s_b.step3)/(np_b.step1 + ns_b.step1 + np_b.step2 + ns_b.step2) as step_3,
                                                   (p_b.step4+s_b.step4)/(np_b.step1 + ns_b.step1 + np_b.step2 + ns_b.step2 + np_b.step3 + ns_b.step3) as step_4,
                                                   (p_b.step5+s_b.step5)/(np_b.step1 + ns_b.step1 + np_b.step2 + ns_b.step2 + np_b.step3 + ns_b.step3 + np_b.step4 + ns_b.step4) as step_5,
                                                   (p_b.step6+s_b.step6)/(np_b.step1 + ns_b.step1 + np_b.step2 + ns_b.step2 + np_b.step3 + ns_b.step3 + np_b.step4 + ns_b.step4 + np_b.step5 + ns_b.step5) as step_6
from p_b, s_b, ns_b, np_b),
t3_c as (
select '3 В сравнении' as step, 0 as step_1, 
		b.step_2/a.step_2-1 as step_2, b.step_3/a.step_3-1 as step_3, b.step_4/a.step_4-1 as step_4,  b.step_5/a.step_5-1 as step_5, b.step_6/a.step_6-1 as step_6
from t3_a a, t3_b b
),
t3 as (select step, step_1 as step1, step_2 as step2, step_3 as step3, step_4 as step4, step_5 as step5, step_6 as step6 from (
	select * from t3_b
	union all
	select * from t3_a
	union all
	select * from t3_c)),
ot_a as (   -- Отвалы на каждом шаге за период 1
select  'ot' as step,
     count(case when statusOut = 8 and __priority=1 then statusOut end) as step1,
     count(case when statusOut = 8 and __priority=2 then statusOut end) as step2,
     count(case when statusOut = 8 and __priority=3 then statusOut end) as step3,
     count(case when statusOut = 8 and __priority=4 then statusOut end) as step4,
     count(case when statusOut = 8 and __priority=5 then statusOut end) as step5,
     count(case when statusOut = 8 and __priority=6 then statusOut end) as step6
from a),
ot_b as ( -- Отвалы на каждом шаге за период 2
select  'ot' as step,
     count(case when statusOut = 8 and __priority=1 then statusOut end) as step1,
     count(case when statusOut = 8 and __priority=2 then statusOut end) as step2,
     count(case when statusOut = 8 and __priority=3 then statusOut end) as step3,
     count(case when statusOut = 8 and __priority=4 then statusOut end) as step4,
     count(case when statusOut = 8 and __priority=5 then statusOut end) as step5,
     count(case when statusOut = 8 and __priority=6 then statusOut end) as step6
from b),
t4_a as (  -- Талб4 по проценту отвала за период1
select  '4 % отвала за период1' as step, 
		ot_a.step1/(select sum(step1) from svIn1) as step1, 
		ot_a.step2/(select sum(step2) from svIn1) as step2, 
		ot_a.step3/(select sum(step3) from svIn1) as step3, 
		ot_a.step4/(select sum(step4) from svIn1) as step4, 
		ot_a.step5/(select sum(step5) from svIn1) as step5, 
		ot_a.step6/(select sum(step6) from svIn1) as step6
from ot_a),
t4_b as ( -- Талб4 по проценту отвала за период2
select  '4 % отвала за период2' as step, 
		ot_b.step1/(select sum(step1) from svIn2) as step1, 
		ot_b.step2/(select sum(step2) from svIn2) as step2, 
		ot_b.step3/(select sum(step3) from svIn2) as step3, 
		ot_b.step4/(select sum(step4) from svIn2) as step4, 
		ot_b.step5/(select sum(step5) from svIn2) as step5, 
		ot_b.step6/(select sum(step6) from svIn2) as step6
from ot_b),
t4_c as (
select '4 В сравнении' as step, b.step1/a.step1-1 as step1,	b.step2/a.step2-1 as step2, b.step3/a.step3-1 as step3, b.step4/a.step4-1 as step4,  b.step5/a.step5-1 as step5, b.step6/a.step6-1 as step6
from t4_a a, t4_b b),
t4 as (
select * from t4_a
union all
select * from t4_b
union all
select * from t4_c)
select * from (
select * from t1
union all
select * from t2
union all
select * from t3
union all
select * from t4
)
order by step
  