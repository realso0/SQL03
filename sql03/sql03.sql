/*테이블간 조인(JOIN) SQL 문제입니다.

문제 1. 
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 
매니저(manager)의 이름(first_name)을 조회하세요.*/
select emp.employee_id "사원 아이디",
        emp.first_name "사원 이름",
        dep.department_name "부서",
        man.first_name "매니저이름"
from departments dep, employees emp left outer join employees man
on emp.manager_id=man.employee_id
where emp.department_id=dep.department_id;
--매니저가 없는 사원 존재함. null 표시를 위해, 왼쪽을 기준으로 조인한다.
select manager_id        
from employees;

/*문제2.
지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되 
지역이름, 나라이름 순서대로 내림차순으로 정렬하세요.//25개국*/
select region_name,
        country_name
from countries coun, regions reg
where coun.region_id=reg.region_id
order by region_name desc, country_name desc;

/*문제3.
각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 
매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 
이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
//11개*/
--매니저 있는 부서만 출력.
select  dep.department_id "부서번호",
        dep.department_name "부서이름",
        emp.first_name "매니저이름",
        city "도시이름",
        country_name "나라이름",
        region_name "지역이름"
from departments dep, employees emp, locations loc, countries coun, regions reg
where dep.manager_id = emp.employee_id
and dep.location_id=loc.location_id
and loc.country_id=coun.country_id
and coun.region_id=reg.region_id;

select  dep.department_id "부서번호",
        dep.department_name "부서이름",
        emp.first_name "매니저이름",
        city "도시이름",
        country_name "나라이름",
        region_name "지역이름"
from departments dep, employees emp, locations loc, countries coun, regions reg
where dep.manager_id = emp.employee_id(+) --매니저 없는 부서도 출력하는 경우 이렇게 적어주어야 한다.
and dep.location_id=loc.location_id
and loc.country_id=coun.country_id
and coun.region_id=reg.region_id;
        
/*문제4.
‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 
이름을 출력하세요. (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 
고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력합니다.//2명*/

select emp.employee_id,first_name
from employees emp, jobs jo, job_history jobhi
where emp.EMPLOYEE_ID = jobhi.EMPLOYEE_ID
and jobhi.JOB_ID = jo.JOB_ID
and jo.job_title='Public Accountant';

/*문제5.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서 이름을 조회하여 
성(last_name)순서로 오름차순 정렬하세요//106명*/
select employee_id,
        first_name,
        last_name,
        department_name
from employees emp, departments dep
where emp.department_id=dep.department_id
order by last_name asc;

/*문제6.
자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 
채용일(hire_date)을 조회하세요 */
select emp.employee_id,
        emp.last_name,
        emp.hire_date "사원 채용일",
        man.hire_date "매니저 채용일"
from employees emp, employees man
where emp.manager_id=man.employee_id
and emp.hire_date<man.hire_date;
