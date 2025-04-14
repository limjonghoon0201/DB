select * from emp;
--입력값이 첫 글자만 대문자로 변환
select ename, initcap(ename) "INITCAR" from emp where deptno=10;
--소문자, 대문자 변환
select ename, lower(ename) "LOWER", upper(ename) "UPPER" from emp where deptno=10;
--길이
select ename, length(ename), lengthb(ename) from emp where deptno=20;
select '홍길동', length('홍길동'), lengthb('홍길동') from dual;
--글자 추출
select substr('abcde',3,2) "3,2", substr('abcde',-3,2), substr('abcde',-3,4) from dual;
--student테이블에서 jumin컬럼을 사용해서 1전공이 101번인 학생들의 이름과 태어난 월일,생일, 하루 전 날짜를 출력하세요(050413-3111111)
select * from student;
select name, substr(jumin,3,4)-1 "Birthday-1" from student where deptno1=101;
--'-'이 3번째 나오는 위치
select 'A-B-C-D', instr('A-B-C-D','-',1,3) "INSTR" from dual;
--student 테이블에서 1전공이 101번인 학생들의 tel컬럼을 조회하여 3이 첫번째로 나오는 위치를 이름과 전화번호와 함께 출력
select name, tel, instr(tel,'3'), profno from student where deptno1=101;
--INSTR:특정문자 위치 추출
select 'A-B-C-D', instr('A-B-C-D','-',1,3) "INTSTR" from dual;
select name, tel, instr(tel,'3'), profno from student where deptno1 = 101;
--LPAD:왼쪽에 특정 문자 채움
select name, id, lpad(id, 10, '*') from student where deptno1 = 201;
select name, id, lpad(id, 10, '123456') from student where deptno1 = 201;
select lpad(ename, 9, '123456789') from emp where deptno = 10;
--RPAD:오른쪽에 특정 문자 채움
select name, id, rpad(id, 10, '*') from student where deptno1 = 201;
select rpad(ename, 10, '-') from emp where deptno = 10;
select rpad(ename, 9, substr('123456789',lengthb(ename)+1)) from emp where deptno = 10;
select rpad(ename, 9, '123456789') from emp where deptno = 10;
--LTRIM:주어진 문자열에서 왼쪽 문자 삭제
select ename from emp where deptno=10;
select ltrim(ename,'C') from emp where deptno=10;
--RTRIM:주어진 문자열에서 오른쪽 문자 삭제
select rtrim(ename,'R') from emp where deptno=10;
--REPLACE:A를 B로 변환
select ename, replace(ename,substr(ename,1,2), '**') from emp where deptno = 10;
select ename ,replace(ename,substr(ename,2,2), '--') from emp where deptno = 20;
select name, jumin, replace(jumin, substr(jumin,7,13), '-/-/-/-/') from student where deptno1 = 101;