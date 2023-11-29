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
ot_a as (   -- Отвалы на каждом шаге за период 1
select  'ot' as step,
     count(case when statusOut = 8 and __priority=2 then statusOut end) as step2,
     count(case when statusOut = 8 and __priority=3 then statusOut end) as step3,
     count(case when statusOut = 8 and __priority=4 then statusOut end) as step4,
     count(case when statusOut = 8 and __priority=5 then statusOut end) as step5,
     count(case when statusOut = 8 and __priority=6 then statusOut end) as step6
from a),
ot_b as ( -- Отвалы на каждом шаге за период 2
select  'ot' as step,
     count(case when statusOut = 8 and __priority=2 then statusOut end) as step2,
     count(case when statusOut = 8 and __priority=3 then statusOut end) as step3,
     count(case when statusOut = 8 and __priority=4 then statusOut end) as step4,
     count(case when statusOut = 8 and __priority=5 then statusOut end) as step5,
     count(case when statusOut = 8 and __priority=6 then statusOut end) as step6
from b),
t4_a as (  -- Талб4 по проценту отвала за период1
select  '1' as num, '% отвала за период1' as step, 
		ot_a.step2/(select sum(step2) from svIn1) as step2, 
		ot_a.step3/(select sum(step3) from svIn1) as step3, 
		ot_a.step4/(select sum(step4) from svIn1) as step4, 
		ot_a.step5/(select sum(step5) from svIn1) as step5, 
		ot_a.step6/(select sum(step6) from svIn1) as step6
from ot_a),
t4_b as ( -- Талб4 по проценту отвала за период2
select  '2' as num, '% отвала за период2' as step, 
		ot_b.step2/(select sum(step2) from svIn2) as step2, 
		ot_b.step3/(select sum(step3) from svIn2) as step3, 
		ot_b.step4/(select sum(step4) from svIn2) as step4, 
		ot_b.step5/(select sum(step5) from svIn2) as step5, 
		ot_b.step6/(select sum(step6) from svIn2) as step6
from ot_b),
t4_c as (
select '3' as num, 'В сравнении' as step, b.step2/a.step2-1 as step2, b.step3/a.step3-1 as step3, b.step4/a.step4-1 as step4,  b.step5/a.step5-1 as step5, b.step6/a.step6-1 as step6
from t4_a a, t4_b b),
t4_p as(
select '4' as num, 'Р-value' as step,
                pValue(
                      (select t4_a.step2 from t4_a), 
					  (select t4_b.step2 from t4_b),
					  (select sum(svIn1.step2) from svIn1),
					  (select sum(svIn2.step2) from svIn2)) as step2,
			    pValue(
                      (select t4_a.step3 from t4_a), 
					  (select t4_b.step3 from t4_b),
					  (select sum(svIn1.step3) from svIn1),
					  (select sum(svIn2.step3) from svIn2)) as step3,
			    pValue(
                      (select t4_a.step4 from t4_a), 
					  (select t4_b.step4 from t4_b),
					  (select sum(svIn1.step4) from svIn1),
					  (select sum(svIn2.step4) from svIn2)) as step4,	
			   pValue(
                      (select t4_a.step5 from t4_a), 
					  (select t4_b.step5 from t4_b),
					  (select sum(svIn1.step5) from svIn1),
					  (select sum(svIn2.step5) from svIn2)) as step5,
			    pValue(
                      (select t4_a.step6 from t4_a), 
					  (select t4_b.step6 from t4_b),
					  (select sum(svIn1.step6) from svIn1),
					  (select sum(svIn2.step6) from svIn2)) as step6)
select * from t4_a
union all
select * from t4_b
union all
select * from t4_c
union all
select * from t4_p;
		