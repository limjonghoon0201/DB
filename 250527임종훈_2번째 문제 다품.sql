--2장 단일행 함수 연습문제
1. emp 테이블을 사용하여 deptno가 10 번인 사원들의 사원이름을 총 9 바이트로 출력하되 빈 자리에는 해당 자리의 숫자로 채우세요.
select lpad(ename,9,'123456789') from emp where deptno = 10;

2. emp 테이블에서 아래와 같이 deptno 가 10번인 사원들의 ename 을 10자리로 출력하되 오른쪽 빈자리에는 ‘-’ 로 채우세요.
select rpad(ename,10,'-') from emp where deptno = 10;

3. emp테이블에서 deptno가 10번인 사원들의 이름을 총 9자리로 출력하되 오른쪽 빈자리는 해당 자릿수에 해당하는 숫자가 출력되도록 출력
select rpad(ename,9,substr('123456789',lengthb(ename)+1)) from emp where deptno = 10;

4. emp테이블에서 아라와 같이 20번 부서에 소속된 직원들의 이름과 2~3번째 글자만 '-'으로 변경해서 출력하세요.
select ename, replace(ename, substr(ename,2,2),'--') from emp where deptno=20;

5. student테이블에서 전공1(deptno1)dl 101번인 학생들의 이름과 주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 '-/'로 표시되도록 출력하세요.
select name, jumin, replace(jumin, substr(jumin,7,7),'-/-/-/-') from student where deptno1 = 101;

6. student 테이블에서 전공1이 102번인 학생들의 이름과 전화번호, 전호번호에서 국번 부분만 '*'처리하여 출력하세요.
   단, 모든 국번은 3자리로 간주합니다. ** REPLACE 퀴즈 3 ** 
select * from student;
select name, tel, replace(tel,substr(tel,1,3),'***') from student where deptno1 = 102;

7. student 테이블에서 deptno1이 101번인 학과 학생들의 이름과 전화번호와 전화번호에서 지역번호와 국번을 제외한 나머지 번호를 *로 표시해서 출력하세요. ** REPLACE 퀴즈 4 
select name, tel, replace(tel, substr(tel,9,4),'****') from student where deptno1 = 101;

8. Student 테이블의 birthday 컬럼을 사용하여 생일이 1월인 학생의 이름과 birthday 를 아래 화면과 같이 출력하세요.
select birthday from student where substr(birthday,4,2) = '01';


9. emp 테이블의 hiredate 컬럼을 사용하여 입사일이 1,2,3 월인 사람들의 사번과 이름, 입사일을 출력하세요.
select ename, hiredate from emp where substr(hiredate,4,2) in ('01','02','03');

10. emp 테이블을 조회하여 이름이 'ALLEN' 인 사원의 사번과 이름과 연봉을 출력하세요. 단 연봉은 (sal * 12)+comm 로 계산하고, 연봉은 천 단위 구분기호로 표시하세요.
select ename, to_char((sal*12)+ comm, '999,999') from emp where ename = 'ALLEN';

11. professor 테이블을 조회하여 201 번 학과에 근무하는 교수들의 이름과 급여, 보너스, 연봉을 아래와 같이 출력하세요. 
    단 연봉은 (pay*12)+bonus 로 계산하고 천 단위 구분기호를 표시합니다.
select * from professor;
select name, pay, bonus, to_char((pay*12)+bonus,'999,999') from professor where deptno = 101;

12. emp 테이블을 조회하여 comm 값을 가지고 있는 사람들의 empno , ename , hiredate , 총연봉,15% 인상 후 연봉을 아래 화면처럼 출력하세요.
    단 총연봉은 (sal*12)+comm 으로 계산하고 아래 화면에서는 SAL 로 출력되었으며 15% 인상한 값은 총연봉의 15% 인상 값입니다.(HIREDATE 컬럼의 날짜 형식과 SAL 컬럼 , 15% UP 컬럼의 $ 표시와 , 기호 나오게 하세요)
select empno, ename, to_char(hiredate,'yyyy-mm-dd') HIREDATE, to_char((sal*12)+comm,'$999,999') "SAL", to_char(((sal*12)+comm)*1.15,'$999,999') "15% up" from emp where comm is not null;

13. Professor 테이블에서 201번 학과 교수들의 이름과 급여, bonus,총 연봉을 출력하세요.단, 연봉은(PAY*12+bonus)로 계산하고 bonus가 없는 교수는 0으로 계산하세요.
select * from professor;
select name, pay, bonus, to_char((pay*12)+nvl(bonus,0),'999,999') from professor where deptno=201;

14. emp 테이블에서 deptno 가 30번 인 사람들의 empno , ename , sal , comm 값을 출력하되 만약 comm 값이 null 이 아니면 sal+comm 값을 출력하고, comm 값이 null 이면 sal*0 의 값을 출력하세요.
select empno, ename, sal, comm, nvl2(comm, comm+sal, sal*0) from emp where deptno=30;
select empno, ename, sal, comm, nvl(comm+sal, sal*0) from emp where deptno=30;

15. EMP 테이블에서 deptno가 30번인 사원들을 조회히여 comm값이 있을 경우 'Exist'을 출력하고 comm값이 null일 경우 'NULL'을 출력하세요.
select nvl2(comm,'Exist','Null') from emp where deptno=30;

16. professor 테이블에서 학과번호와 교수명, 학과명을 출력하되 deptno 가 101 번인 교수만 학과명을 "Computer Engineering" 으로 출력하고, 101번이 아닌 교수들은 학과명에 아무것도 출력하지 마세요.
select * from professor;
select deptno, name, decode(deptno,101,'Computer Engineering') from professor;

17. Professor 테이블에서 deptno와 name과 dname을 출력하되 dname에 학과 번호가 101 번 이면 ‘Computer Engineering’ , 102 번이면 'Multimedia Engineering' , 103 번이면 'Software Engineering' 나머지는 'ETC' 로 출력하세요.
select deptno, name, decode(deptno,101,'Computer Engineering', 102, 'Multimedia Engineering', 103, 'Software Engineering', 'ETC') from professor;

18. Student 테이블을 참조하여 deptno1 이 201 번인 학생의 이름과 전화번호, 지역 명을 출력하세요. 단 지역번호가 02 면 "SEOUL", 031 이면 "GYEONGGI", 051 이면 "BUSAN", 052 이면 "ULSAN", 055 이면 "GYEONGNAM", 나머지는 "ETC" 로 표시하세요.
select * from student;
select name, tel, case substr(tel,1,instr(tel,')')-1)
    when '02' then 'SEOUL' 
    when '031' then 'GYEONGGI' 
    when '051' then 'BUSAN' 
    when '052' then 'ULSAN' 
    when '055' then 'GYEONGNAM' 
    else 'ETC' end "LOC"
from student where deptno1=201;

19. Student 테이블의 jumin 컬럼을 참조하여 학생들의 이름과 태어난 달 , 그리고 분기를 출력하세요. 태어난 달이 01-03월 은 1/4, 04 ? 06월 은 2/4 , 07 ? 09 월 은 3/4 , 10 ? 12 월은 4/4 로 출력하세요.
select * from student;
select name, substr(jumin,4,2),case 
    when substr(jumin,4,2) in ('01','02','03') then '1/4'
    when substr(jumin,4,2) in ('04','05','06') then '2/4'
    when substr(jumin,4,2) in ('07','08','09') then '3/4'
    else '4/4' end "분기"
from student;

20. emp 테이블을 조회하여 empno , ename , sal , LEVEL(급여등급)을 아래와 같이 출력하세요. 단 급여등급은 sal 을 기준으로 1 - 1000 이면 Level 1 , 1001 - 2000 이면 Level 2 , 2001 - 3000 이면 Level 3 , 3001 - 4000 이면 Level 4 , 4001 보다 많으면 Level 5 로 출력하세요.
select empno, ename, sal, case
    when sal between 1 and 1000 then 'Level 1'
    when sal between 1001 and 2000 then 'Level 2'
    when sal between 2001 and 3000 then 'Level 3'
    when sal between 3001 and 4000 then 'Level 4'
    else 'Level 5' end as "LEVEL(급여등급)"
from emp;
