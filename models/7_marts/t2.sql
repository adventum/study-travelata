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
t2_a as (   -- Талб2 по конверсиям с прошлого шага
select distinct '1' as num, 'CR по сеансам с прошлого шага за период1' as step, 0 as step2, 
                                                 (p_a.step3+s_a.step3)/(select sum(step2) from svIn1) as step3,
                                                 (p_a.step4+s_a.step4)/(select sum(step3) from svIn1) as step4,
                                                 (p_a.step5+s_a.step5)/(select sum(step4) from svIn1) as step5,
                                                 (p_a.step6+s_a.step6)/(select sum(step5) from svIn1) as step6
from p_a, s_a),
t2_b as (
select distinct '2' as num, 'CR по сеансам с прошлого шага за период2' as step, 0 as step2, 
                                                 (p_b.step3+s_b.step3)/(select sum(step2) from svIn2) as step3,
                                                 (p_b.step4+s_b.step4)/(select sum(step3) from svIn2) as step4,
                                                 (p_b.step5+s_b.step5)/(select sum(step4) from svIn2) as step5,
                                                 (p_b.step6+s_b.step6)/(select sum(step5) from svIn2) as step6
from p_b, s_b),
t2_c as (
select '3' as num, 'В сравнении' as step, 0 as step2, 
		b.step3/a.step3-1 as step3, b.step4/a.step4-1 as step4,  b.step5/a.step5-1 as step5, b.step6/a.step6-1 as step6
from t2_a a, t2_b b
),
t2_p as(
select   '4' as num, 'Р-value' as step, 0 as step2,
                pValue(
                      (select t2_a.step3 from t2_a), 
					  (select t2_b.step3 from t2_b),
					  (select sum(svIn1.step2) from svIn1),
					  (select sum(svIn2.step2) from svIn2)) as step3,
			    pValue(
                      (select t2_a.step4 from t2_a), 
					  (select t2_b.step4 from t2_b),
					  (select sum(svIn1.step3) from svIn1),
					  (select sum(svIn2.step3) from svIn2)) as step4,	
			    pValue(
                      (select t2_a.step5 from t2_a), 
					  (select t2_b.step5 from t2_b),
					  (select sum(svIn1.step4) from svIn1),
					  (select sum(svIn2.step4) from svIn2)) as step5,
			    pValue(
                      (select t2_a.step6 from t2_a), 
					  (select t2_b.step6 from t2_b),
					  (select sum(svIn1.step5) from svIn1),
					  (select sum(svIn2.step5) from svIn2)) as step6)
select * from t2_a
union all 
select * from t2_b
union all 
select * from t2_c					  
union all
select * from t2_p;
		