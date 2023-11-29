--- Таблица 3 с конверсиями с начала воронки

with a as (  -- ТАБЛИЦА, отфильтрованная по периоду 1 со строками, где только Нов.польз, Нов. сеансы, Поль, сеансы
select * 
from travelata.attr_final_final
where (statusIn = 1 or statusIn = 2 or statusIn = 5 or statusIn = 6) and statusIn!=1
and (toDate(__datetime) between '2023-11-17' and '2023-11-21')
),
b as (    -- ТАБЛИЦА, отфильтрованная по периоду 2 со строками, где только Нов.польз, Нов. сеансы, Поль, сеансы
select * 
from travelata.attr_final_final
where (statusIn = 1 or statusIn = 2 or statusIn = 5 or statusIn = 6) and statusIn!=1
and (toDate(__datetime) between '2023-11-17' and '2023-11-19')
),
np_a as ( -- Нов пользователи за период 1 по шагам
select  'np' as step,
     count(case when statusIn = 1 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 1 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 1 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 1 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 1 and __priority=6 then statusIn end) as step6
from a),
ns_a as ( -- Нов сеансы за период 1 по шагам
select  'ns' as step,
     count(case when statusIn = 2 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 2 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 2 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 2 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 2 and __priority=6 then statusIn end) as step6
from a),
p_a as ( -- Пользователи за период 1 по шагам
select  'p' as step,
     count(case when statusIn = 5 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 5 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 5 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 5 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 5 and __priority=6 then statusIn end) as step6
from a),
s_a as (   -- Сеансы за период 1 по шагам
select  's' as step,
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
     count(case when statusIn = 1 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 1 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 1 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 1 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 1 and __priority=6 then statusIn end) as step6
from b),
ns_b as (
select  'ns' as step,
     count(case when statusIn = 2 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 2 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 2 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 2 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 2 and __priority=6 then statusIn end) as step6
from b),
p_b as (
select  'p' as step,
     count(case when statusIn = 5 and __priority=2 then statusIn end) as step2,
     count(case when statusIn = 5 and __priority=3 then statusIn end) as step3,
     count(case when statusIn = 5 and __priority=4 then statusIn end) as step4,
     count(case when statusIn = 5 and __priority=5 then statusIn end) as step5,
     count(case when statusIn = 5 and __priority=6 then statusIn end) as step6
from b),
s_b as (
select  's' as step,
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
t3_a as (  -- Талб3 по конверсиям с начала воронки
select '1' as num, 'CR по сеансам с начала воронки за период1' as step, 0 as step_2, 
                                                 (p_a.step3+s_a.step3)/(select sum(svIn1.step2) from svIn1) as step_3,
                                                 (p_a.step4+s_a.step4)/(select sum(svIn1.step3) from svIn1) as step_4,
                                                 (p_a.step5+s_a.step5)/(select sum(svIn1.step4) from svIn1) as step_5,
                                                 (p_a.step6+s_a.step6)/(select sum(svIn1.step5) from svIn1) as step_6
from p_a, s_a, np_a, ns_a),
t3_b as (
select  '2' as num, 'CR по сеансам с начала воронки за период2' as step, 0 as step_2, 
                                                   (p_b.step3+s_b.step3)/(select sum(svIn2.step2) from svIn2) as step_3,
                                                   (p_b.step4+s_b.step4)/(select sum(svIn2.step3) from svIn2) as step_4,
                                                   (p_b.step5+s_b.step5)/(select sum(svIn2.step4) from svIn2) as step_5,
                                                   (p_b.step6+s_b.step6)/(select sum(svIn2.step5) from svIn2) as step_6
from p_b, s_b, ns_b, np_b),
t3_c as (
select '3' as num, 'В сравнении' as step, 0 as step_2, 
		b.step_3/a.step_3-1 as step_3, b.step_4/a.step_4-1 as step_4,  b.step_5/a.step_5-1 as step_5, b.step_6/a.step_6-1 as step_6
from t3_a a, t3_b b
),
t3 as (select num, step, step_2 as step2, step_3 as step3, step_4 as step4, step_5 as step5, step_6 as step6 from (
	select * from t3_b
	union all
	select * from t3_a
	union all
	select * from t3_c)),
t3_p as(
select '4' as num, 'Р-value' as step, 0 as step2,
              pValue(
                      (select t3_a.step_3 from t3_a), 
					  (select t3_b.step_3 from t3_b),
					  (select ns_a.step2+np_a.step2 from ns_a, np_a),
					  (select ns_b.step2+np_b.step2 from ns_b, np_b)) as step3,
			  pValue(
                      (select t3_a.step_4 from t3_a), 
					  (select t3_b.step_4 from t3_b),
					  (select ns_a.step2+ns_a.step3+np_a.step2+np_a.step3 from ns_a, np_a),
					  (select ns_b.step2+ns_b.step3+np_b.step2+np_b.step3 from ns_b, np_b)) as step4,	
			  pValue(
                      (select t3_a.step_5 from t3_a), 
					  (select t3_b.step_5 from t3_b),
					  (select ns_a.step2+ns_a.step3+ns_a.step4+np_a.step2+np_a.step3+np_a.step4 from ns_a, np_a),
					  (select ns_b.step2+ns_b.step3+ns_b.step4+np_b.step2+np_b.step3+np_b.step4 from ns_b, np_b)) as step5,
			  pValue(
                      (select t3_a.step_6 from t3_a), 
					  (select t3_b.step_6 from t3_b),
					  (select ns_a.step2+ns_a.step3+ns_a.step4+ns_a.step5+np_a.step2+np_a.step3+np_a.step4+np_a.step5 from ns_a, np_a),
					  (select ns_b.step2+ns_b.step3+ns_b.step4+ns_b.step5+np_b.step2+np_b.step3+np_b.step4+np_b.step5 from ns_b, np_b)) as step6)
select * from t3
union all		
select * from t3_p;