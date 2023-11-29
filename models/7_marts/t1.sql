--- Таблица 1 с суммой сеансов

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
t1_a as (  -- Талб1 по сеансам
select '1' as num, 'Сеансы за период1' as step, toFloat64(sum(step2)) as step2, toFloat64(sum(step3)) as step3,
                                    toFloat64(sum(step4)) as step4, toFloat64(sum(step5)) as step5, toFloat64(sum(step6)) as step6  from svIn1
        ),
t1_b as (
select '2' as num, 'Сеансы за период2' as step, toFloat64(sum(step2)) as step2, toFloat64(sum(step3)) as step3,
                                    toFloat64(sum(step4)) as step4, toFloat64(sum(step5)) as step5, toFloat64(sum(step6)) as step6  from svIn2
        ),
t1_c as (
select '3' as num, 'В сравнении, в %' as step, round(b.step2/a.step2-1, 2)*100 as step2, round(b.step3/a.step3-1, 2)*100 as step3, round(b.step4/a.step4-1,2) as step4,  round(b.step5/a.step5-1,2)*100 as step5, round(b.step6/a.step6-1,2)*100 as step6
from t1_a a, t1_b b
)
select * from t1_a
union all
select * from t1_b
union all
select * from t1_c;