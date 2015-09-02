//II.1 ch?n to�n b? th�ng tin trong b?ng salgrade
select * from 
salgrade;

//II.2 ch?n to�n b? th�ng tin trong b?ng emp
select * 
from emp;

//II.3 hi?n th? m?i lo?i ngh? nghi?p
select DISTINCT job 
from emp;

//II.4 hi?n th? t�n nv v� thu nh?p 1 n�m
select ename, NVL(sal*12,0) renumeration 
from emp;

//II.5 hi?n th? v?i n?i dung sau ��y : who, what and when
select ename || ' has help the position of ' || job || ' in dept ' || deptno || ' since ' || to_char(hiredate,'dd-mm-yyyy')
from emp;

//II.6 hi?n th? c?u tr�c b?ng emp
desc emp;

//II.7 Thay �?i nh?n v� �?nh d?ng hi?n th? c?a c?t sal v� hiredate trong b?ng emp
COLUMN SAL HEADING 'money for employee' FORMAT A9
select * from emp;
//thay �?i ? c?t hiredate
COLUMN HIREDATE HEADING 'date start' FORMAT A15

//III.1 Ch?n nv trong b?ng EMP c� m?c l��ng t? 1000 �?n 2000 (ch?n c�c tr�?ng ENAME, DEPTNO, SAL).
select ename, deptno, sal
from emp
where sal between 1000 and 2000;

//III.2 Hi?n th? m? ph?ng ban, t�n ph?ng ban, s?p x?p theo th? t? t�n ph?ng ban
select deptno, dname
from dept
order by dname asc;

//III.3 Hi?n th? danh s�ch nh?ng nh�n vi�n l�m t?i ph?ng 10 v� 20 theo th? t? A,B,C
select *
from emp
where deptno in (10,20)
order by ename asc;

//III.4 Hi?n th? t�n v� ngh? nh?ng nv l�m ngh? th� k? (cleck) t?i ph?ng 20
select ename, job
from emp
where job = 'CLERK' and deptno =20;

//III.5 Hi?n th? t?t c? nh?ng nh�n vi�n m� t�n c� c�c k? t? TH v� LL
select ename
from emp
where ename like '%TH%' OR ename like '%LL%';

//III.6 Hi?n th? t�n nv, ngh?, l��ng c?a nh?ng nv c� gi�m �?c qu?n l?.
select ename, job, sal
from emp
where mgr is not null;

//III.7 Hi?n th? t�n nv, m? pb, ng�y gia nh?p cty sao cho gia nh?p cty trong n�m 1983.
select ename, hiredate
from emp
where EXTRACT(YEAR from hiredate) = 1983;

//III.8 Hi?n th? t�n nv, l��ng m?t n�m (ANUAL_SAL ), th�?ng sao cho l��ng l?n h�n th�?ng v� ngh? l� SALEMAN, 
// s?p theo th? t? l��ng gi?m d?n v� t�n t�ng d?n.
select ename,sal * 12 anual_sal, comm
from emp
where sal > comm and job = 'SALESMAN'
order by anual_sal desc, ename asc;


//IV.1.1 Li?t k� t�n nh�n vi�n, m? ph?ng ban v� l��ng nh�n vi�n ��?c t�ng 15% (PCTSAL)
select deptno, ename,round(nvl(sal,0)* 0.15 + sal) PCTSAL
from emp;

//IV.1.2 Vi?t c�u l?nh hi?n th?
select RPAD(ename,10,'*') || LPAD(job,10,'*')
from emp;

//IV.1.3 Vi?t c�u l?nh hi?n th?
select ename || '   (' || INITCAP(JOB) || ')' employee
from emp;

//IV.1.4 Vi?t c�u l?nh hi?n th?
select ename, deptno, INITCAP(replace(job, 'SALESMAN', 'Salesperson')) job
from emp
where deptno = 30;

//IV.1.5 T?m ng�y th? 6 �?u ti�n c�ch 2 th�ng so v?i ng�y hi?n t?i hi?n th? ng�y d�?i d?ng 09 February 1990.
select to_char(next_day(add_months(sysdate,-2), 'Friday'), 'dd Month yyyy') day
from dual;

//IV.1.6 - Hi?n th? th�ng tin ng�y gia nh?p cty c?a nv c� s? ph?ng = 20, sao cho hi?n th? nh� y�u c?u : 
select ename, RTRIM(TO_CHAR(hiredate, 'Month')) || ',' || TO_CHAR(hiredate,'DDSPTH yyyy') Hired_date
from emp
where deptno = 20;

//IV.1.7 Hi?n th? t�n nv, ng�y gia nh?p cty, ng�y x�t n�ng l��ng (sau ng�y gia nh?p cty 1 n�m), s?p x?p theo th? t? ng�y x�t n�ng l��ng.
select ename, TO_CHAR(hiredate,'dd-mm-yyyy') hire_date, TO_CHAR(add_months(hiredate,12),'dd-mm-yyyy') review
from emp
order by add_months(hiredate,12) asc;

//IV.1.8 Hi?n th? t�n nh�n vi�n v� l��ng d�?i d?ng
select ename, 
case
when sal < 1500 then 'BELOW 1500'
when sal > 1500  then to_char(sal)
else 'On Target'
end salary
from emp;

//IV.1.9 Cho bi?t th? c?a ng�y hi?n t?i
select to_char(sysdate, 'day') today
from dual;

//IV.1.10 10. ��a chu?i d�?i d?ng nn/nn, ki?m tra n?u kh�ng khu�n d?ng tr? l?i l� YES, ng�?c l?i
// l� NO. Ki?m tra v?i c�c chu?i 12/34, 01/1a, 99\88
DECLARE
  v_input varchar2(12);
BEGIN
  v_input := &input;
  IF v_input like '[0-9][0-9]/[0-9][0-9]' THEN
    DBMS_OUTPUT.PUT_LINE('YES');
  ELSIF v_input like '[0-9][0-9]\[0-9][0-9]' THEN
    DBMS_OUTPUT.PUT_LINE('NO');
  ELSE
    DBMS_OUTPUT.PUT_LINE('NO');
  END IF;
END;

select case
when REGEXP_LIKE('12/ws4','[0-9][0-9]/[0-9][0-9]') THEN 'YES'
else 'NO'
end
from dual;

//IV.1.11 Hi?n th? t�n nh�n vi�n, ng�y gia nh?p c�ng ty, ng�y l?nh l��ng sao cho ng�y l?nh
// l��ng ph?i v�o th? 6, nh�n vi�n ch? ��?c nh?n l��ng sau �t nh?t 15 ng�y l�m vi?c t?i
// c�ng ty, s?p x?p theo th? t? ng�y gia nh?p c�ng ty.
select ename, hiredate, TO_CHAR(Next_day((sysdate+15),'FRIDAY'),'dd-MON-yy') DATE_SAL
from emp
order by hiredate;

//IV.2.1 t?m l��ng th?p nh?t, cao nh?t v� trung b?nh
//nh? nh?t
select min(sal)
from emp;

//l?n nh?t
select max(sal)
from emp;

// trung b?nh
select ROUND(avg(nvl(sal,0))) 
from emp;

//IV.2.2 t?m l��ng nh? nh?t v� l?n nh?t c?a m?i lo?i ngh?
select job, min(sal) MIN
from emp
group by job;

// l?n nh?t
select job, max(sal) MAX
from emp
group by job;

//IV.2.3 t?m xem c� bao nhi�u gi�m �?c trong danh s�ch nh�n vi�n
select count(*) Pre_No
from emp
where job = 'MANAGER';

//IV.2.4 T?m t?t c? c�c ph?ng ban m� s? nh�n vi�n trong ph?ng >3
select deptno
from emp
group by deptno
having count(*) > 3;

//IV.2.5 T?m ra m?c l��ng nh? nh?t c?a m?i nv l�m vi?c cho m?t g� n�o �� s?p x?p theo th? t? t�ng d?n c?a m?c l��ng.


select e.ename, s.grade from emp e, salgrade s
where (e.sal between s.losal and s.hisal) and 
		e.sal = any (select MIN(sal) from emp where mgr IN 
		(select empno from emp where job = 'MANAGER') group by mgr);



//V.1 Hi?n th? to�n b? t�n nh�n vi�n v� t�n ph?ng ban l�m vi?c s?p x?p theo t�n ph?ng ban.
select e.ENAME, d.DNAME
from emp e natural join dept d
order by d.DNAME asc;

//V.2 Hi?n th? t�n nh�n vi�n, v? tr� �?a l?, t�n ph?ng v?i �i?u ki?n l��ng >1500
select e.ENAME, d.loc, d.dname
from emp e natural join dept d
where e.SAL > 1500
order by d.DNAME asc;

//V.3 hi?n th? t�n nh�n vi�n, ngh?, l��ng v� m?c l��ng
select e.ename, e.job job, e.sal sal, s.grade grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

//V.4 hi?n th? th�ng tin nh�n vi�n v?i m?c l��ng = 3
select e.ename ename, e.job job, e.sal sal, s.grade grade
from emp e, salgrade s 
where e.sal between s.losal and s.hisal and s.grade = 3;

//V.5 hi?n th? nh?ng nh�n vi�n l�m t?i DALLAS
select e.ename, d.loc loc, e.sal sal
from emp e
join dept d ON ( e.deptno = d.deptno)
where d.loc = 'DALLAS';

//V.6 hi?n th? t�n nv, ngh?, l��ng, m?c l��ng, t�n ph?ng tr? ngh? clerk v� s?p x?p gi?m
select e.ename ename, e.job job, e.sal sal, s.GRADE grade , d.dname dname
from emp e, salgrade s, dept d
where e.job != 'CLECK' and d.deptno = e.deptno and e.sal between s.losal and s.hisal
order by d.dname desc;

//V.7 hi?n th? nh�n vi�n ki?m >= 36000$ 1 n�m ho?c ngh? l� clerk



select e.ename, e.job, nvl(e.sal,0) * 12 anual_sal, d.deptno ,d.dname, s.grade
from emp e, dept d, salgrade s
where ( e.job = 'CLERK' or nvl(e.sal,0) * 12 = 36000 ) 
		and ( e.sal between s.losal and s.hisal )
		and ( e.deptno = d.deptno )
order by s.grade asc;



//V.8 hi?n th? ph?ng kh�ng c� nh�n vi�n
select d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno (+)= d.deptno and e.ename is NULL;

//V.9 hi?n th? m? nv, t�n nv, m? ng qu?n l? v� t�n qu?n l?.
select e.empno emp_no, e.ename e_name, m.empno, m.ename mgr_name
from emp e, emp m
where e.mgr = m.empno;

//V.10 nh� c�u 9, hi?n th? th�m king
select e.empno emp_no, e.ename e_name, m.empno, m.ename mgr_name
from emp e, emp m
where m.empno (+)= e.mgr;

//V.11 hi?n th? t�n ngh? tuy?n d?ng v�o n�m 81 v� k tuy?n v�o n�m 94
select job
from emp
where extract(year from hiredate) = 1981 and extract(year from hiredate) != 1994
group by job;

//V.12 t?m nh?ng nh�n vi�n gia nh?p c�ng ty tr�?c gi�m �?c c?a h?
select ename
from emp 
where hiredate < any (select hiredate from emp where job = 'MANAGER');

//V.13 t?m t?t c? nv, ng�y gia nh?p cty, t�n nv, t�n g� v� ng�y gia nh?p c?a gi�m �?c ?y
select e.ename, e.hiredate, m.ename Manager, m.hiredate Manager_hiredate
from emp e, emp m
where e.mgr = m.empno and m.job = 'MANAGER';

//V.14 t?m nh�n vi�n ki?m ��?c l��ng cao nh?t trong m?i lo?i ngh?
select ename, job, sal
from emp
where sal in (select max(sal) from emp group by job);

//V.15 t?m m?c l��ng cao nh?t trong m?i ph?ng ban s?p x?p theo th? t? ph?ng ban
select e.ename, e.job, e.deptno, d.dname, e.sal
from emp e 
join dept d ON ( e.deptno = d.deptno)
where e.sal in ( select max(sal) from emp group by deptno)  
order by d.deptno;

//V.16 t?m nh�n vi�n gia nh?p ph?ng ban s?m nh?t
select e.ename, d.dname, e.hiredate
from emp e 
join dept d ON ( e.deptno = d.deptno)
where e.hiredate in ( select min(hiredate) from emp group by deptno)  
order by d.deptno;

//V.17 hi?n th? nh?ng nv c� l��ng > l��ng TB c?a ph?ng ban h? l�m
select empno, ename, sal, deptno
from emp
where sal >= any ( select avg(nvl(sal,0)) from emp group by deptno);

//V.18 hi?n th? t�n nv, m? nv, m? g�, t�n g�, pb l�m vi?c m� m?c l��ng c?a g�


select e.ename, e.empno, m.empno Manager_no, m.ename manager_name, 
		m.deptno manager_dept, s.grade mananger_grade
from emp e, emp m, salgrade s
where e.mgr = m.empno and m.job = 'MANAGER' and 
		( m.sal between s.losal and s.hisal );


//VI.1 Hi?n th? t�n nh�n vi�n, ng�y gia nh?p cty v?i �i?u ki?n ng�y gia nh?p cty
//n?m trong kho?ng hai bi?n runtime ��?c nh?p v�o t? b�n ph�m (&first_date, &last_date).
select ename, hiredate
from emp
where hiredate between &frist_date and &last_date;

//VI.2 Hi?n th? t�n nh�n vi�n, ngh? nghi?p, l��ng, m? gi�m �?c, m? ph?ng ban v?i �i?u
// ki?n ngh? nghi?p b?ng m?t bi?n ��?c nh?p v�o t? b�n ph�m. (&job)
select e.ename, e.job, e.sal, e.mgr, e.deptno
from emp e, emp m
where e.job = &e_job and e.mgr = m.empno and m.job = 'MANAGER';

//VI.3 �?nh ngh?a m?t bi?n t�nh thu nh?p m?t n�m c?a nh�n vi�n. D�ng bi?n n�y �? t?m
// nh?ng nh�n vi�n c� thu nh?p l?n h�n ho?c b?ng $30000.

define sal_total = 'nvl(sal,0)*12'

// th?c hi?n truy v?n
select ename
from emp
where &sal_total > 30000;

//VI.4 �?t 1 bi?n l� kho?ng th?i gian nv l�m cho cty. Hi?n th? t�n nv v� qu?ng time nh�n vi�n �� l�m cho cty v?i �i?u
// ki?n nh�n vi�n l� bi?n nh?p t? b�n ph�m

define Time_service = 'MONTHS_BETWEEN(sysdate,hiredate)/12'  

//th?c hi?n truy v?n
select FLOOR(&Time_service) || ' YEARS ' || MOD(FLOOR(&Time_service),12) || ' Months' LENGTH_OF_SERVICE
from emp
where '&e_name' = ename;


// VII.1 T?o b?ng PROJECT v?i c�c column ��?c ch? ra d�?i ��y, PROJID l� primary key, v� P_END_DATE > P_START_DATE.
create table Project(
  projid number(4) CONSTRAINT project_pk Primary key,
  p_desc varchar2(20),
  p_start_date date,
  p_end_date date,
  budget_amount number(7,2),
  max_no_staff number(2),
  CONSTRAINT end_date_ck CHECK(p_end_date > p_start_date)
  );


//VII.2 T?o b?ng ASSIGNMENTS v?i c�c column ��?c ch? ra d�?i ��y, �?ng th?i c?t
// PROJID l� foreign key t?i b?ng PROJECT, c?t EMPNO l� foreign key t?i b?ng EMP.
create table assignments(
  projid number(4) not null,
  empno number(4) not null,
  a_start_date date,
  a_end_date date,
  bill_amount number(4,2),
  assign_type varchar2(2),
  CONSTRAINT fk_project FOREIGN KEY (projid) REFERENCES scott.project(projid),
  CONSTRAINT fk_emp FOREIGN KEY (empno) REFERENCES scott.emp(empno)
  );

//VII.3 Th�m column COMMENTS ki?u LONG v�o b?ng PROJECTS. Th�m column HOURS ki?u
// NUMBER v�o b?ng ASSIGNMENTS
alter table project add(comments long);

//th�m c?t hours ? b?ng assignments
alter table assignments add(hours number);

//VII.4 S? d?ng view USER_OBJECTS hi?n th? t?t c? c�c �?i t�?ng user s? h?u.
select * from USER_OBJECTS;

//VII.5 Th�m r�ng bu?c duy nh?t (UNIQUE) cho 2 column PROJECT_ID v� EMPNO c?a b?ng ASSIGNMENTS.
alter table assignments add(constraint unq_proj_emp UNIQUE(projid,empno));

//VII.6 Xem c�c th�ng tin v? c�c r�ng bu?c trong USER_CONSTRAINTS
select * from USER_CONSTRAINTS;

//VII.7 Xem trong USER hi?n t?i c� t?t c? bao nhi�u b?ng.
select * from tab;

//VIII.1 Th�m d? li?u v�o b?ng PROJECTS
INSERT INTO
PROJECT(PROJID, P_DESC,P_START_DATE,P_END_DATE,BUDGET_AMOUNT,MAX_NO_STAFF,COMMENTS) 
VALUES(1,'WRITE c030 COURSE',TO_DATE('02-JAN-88','dd-mon-yy'),TO_DATE('07-JAN-88','dd-mon-yy'),500,1,DEFAULT);

INSERT INTO
PROJECT(PROJID, P_DESC,P_START_DATE,P_END_DATE,BUDGET_AMOUNT,MAX_NO_STAFF,COMMENTS) 
VALUES(2,'PROOF READ NOTES',TO_DATE('01-JAN-89','dd-mon-yy'),TO_DATE('10-JAN-89','dd-mon-yy'),600,1,DEFAULT);
  
//VIII.2 Th�m d? li?u v�o b?ng ASSIGNMENTS
INSERT INTO
ASSIGNMENTS(PROJID,EMPNO ,A_START_DATE,A_END_DATE,BILL_AMOUNT,ASSIGN_TYPE,HOURS) 
VALUES(1,7369,TO_DATE('01-JAN-88','dd-mon-yy'),TO_DATE('03-JAN-88','dd-mon-yy'),50.00,'WR',15);

INSERT INTO
ASSIGNMENTS(PROJID,EMPNO ,A_START_DATE,A_END_DATE,BILL_AMOUNT,ASSIGN_TYPE,HOURS) 
VALUES(1,7902,TO_DATE('04-JAN-88','dd-mon-yy'),TO_DATE('07-JAN-88','dd-mon-yy'),55.00,'WR',20);

INSERT INTO
ASSIGNMENTS(PROJID,EMPNO ,A_START_DATE,A_END_DATE,BILL_AMOUNT,ASSIGN_TYPE,HOURS) 
VALUES(2,7844,TO_DATE('01-JAN-89','dd-mon-yy'),TO_DATE('10-JAN-89','dd-mon-yy'),45.50,'PF',30);

//VIII.3 C?p nh?t tr�?ng ASSIGNMENTS_TYPE t? WT th�nh WR
update table assignments
set assign_type = 'WR'
where assign_type = 'WT';

//VIII.4 Nh?p th�m s? li?u v�o b?ng ASSIGNMENTS
insert into assignments(projid,empno,a_start_date,a_end_date,bill_amount,assign_type,hours)
values (2,7788,TO_DATE('20-MAR-1979','dd-mon-yy'),TO_DATE('28-MAR-1979','dd-mon-yy'),55.5,'WT',18);

//IX.1T?o Index tr�n c?t PROJID cho b?ng ASSIGNMENT
create index iasg on assignments (projid);

//IX.2 Hi?n th? danh s�ch c?a nh�n vi�n thu?c s? qu?n l? c?a ng�?i c� t�n l� 1 bi?n ��?c
// nh?p t? b�n ph�m
select *
from emp 
where mgr = ( select DISTINCT empno from emp where ename = '&e_name');   

//X.1 t?o view c� hi?n th? nh� sau :
create or replace view aggredates
as
select deptno, avg(nvl(sal,0)) average, max(sal) maximun, min(sal) minimun, sum(nvl(sal,0)) sum,count(sal) no_sals, count(comm) no_comms
from emp
group by deptno;

//X.2 T?o view �? nh?p s? li?u v�o b?ng ASSIGNMENTS v?i c�c �i?u ki?n :



create view assign_view
as
select *
from ASSIGNMENTS
where A_START_DATE < A_END_DATE and EMPNO is not NULL and PROJID < 2000
		and (( BILL_AMOUNT < 50 AND ASSIGN_TYPE = 'PS') or 
		(BILL_AMOUNT <  60 AND ASSIGN_TYPE = 'WT') or 
		(BILL_AMOUNT < 70 AND ASSIGN_TYPE = 'ED'))
WITH CHECK OPTION CONSTRAINT assign_view_check; 



//X.3 �?nh ngh?a b?ng Messages c� c?u tr�c sau : 
create table Messages( numcol1 number(9,2),
numcol2 number(9,2),
charcol1 varchar2(60),
charcol2 varchar2(60),
Datecol1 date,
datecol2 date);

//XI - kh�ng c� b�i

//XII.1 Vi?t �o?n ch��ng tr?nh t?m ki?m c�c h�ng trong b?ng EMP v?i bi?n ��?c ��a t?
// ngo�i v�o l� &1 d?ng JOb_type(emp.job%type) v� ��a ra th�ng b�o th�ch h?p v�o b?ng MESSAGES.
DECLARE
  CURSOR c_emp
  IS
  SELECT job
  FROM emp
  WHERE job = &job_t;
  job_type emp.job%type;
BEGIN
OPEN c_emp;
  LOOP
    FETCH c_emp INTO job_type;
    EXIT WHEN c_emp%notfound;
    INSERT INTO messages(numcol1,numcol2,charcol1,charcol2,datecol1,datecol2)
    SELECT empno,deptno,job,ename,hiredate,sysdate
    FROM emp
    WHERE job = job_type;
  END LOOP;
CLOSE c_emp;
END;

//XII.2 Vi?t �o?n ch��ng tr?nh ghi d? li?u v�o b?ng MESSAGES v?i c?t NUMCOL1 mang gi� tr?
// l� 1 n?u l� row 1 ��?c Insert, 2 n?u row 2 ��?c Insert... . Kh�ng ��?c Insert nh?ng
// row c� gi� tr? l� 6 ho?c 8, tho�t kh?i v?ng l?p insert sau gi� tr? 10. Commit sau v?ng l?p.

DECLARE
x number(4);
BEGIN
x := 1;
LOOP
  EXIT WHEN x = 11;  
  IF x != 6 AND x != 8 THEN
     INSERT INTO MESSAGES(numcol1,numcol2,charcol1,charcol2,datecol1,datecol2)
     VALUES (x,default,default,default,default,default);
  ELSE
    INSERT INTO MESSAGES(numcol1,numcol2,charcol1,charcol2,datecol1,datecol2)
     VALUES (default,default,default,default,default,default);
  END IF;
  x := x + 1;
END LOOP;
COMMIT;
END;

//XII.3 Li?t k� c�c c?t ENAME, HIREDATE, SAL V?i �i?u ki?n EMPNO b?ng gi� tr? bi?n
// &EMPLOYEE_NO ��?c ��a v�o, sau �� ki?m tra:
// 1.1 C� ph?i m?c l��ng l?n h�n 1200
// 1.2 T�n nh�n vi�n c� ph?i c� ch?a ch? T
// 1.3 ng�y gia nh?p c� quan c� ph?i l� th�ng 10 (DEC)
// v� ��a gi� tr? ki?m tra n�y v�o b?ng message c?t charcol1 (th? v?i c�c gi� tr? 7654, 7369, 7900, 7876)
DECLARE
  CURSOR ct_emp
  IS
  SELECT ename, hiredate, sal
  FROM emp
  WHERE empno = &employee_no;
  vt_emp ct_emp%rowtype;
BEGIN
  OPEN ct_emp;
  LOOP
    FETCH ct_emp INTO vt_emp;
    EXIT WHEN ct_emp%notfound;
    IF vt_emp.sal > 1200 THEN
      IF vt_emp.ename like '%T%' THEN
        IF EXTRACT(MONTH from vt_emp.hiredate) = 10 THEN
          INSERT INTO Messages(numcol1,numcol2,charcol1,charcol2,datecol1,datecol2)
          VALUES (default,default,'TRUE',default,default,default);
        ELSE 
          INSERT INTO Messages(numcol1,numcol2,charcol1,charcol2,datecol1,datecol2)
          VALUES (default,default,'FALSE',default,default,default);
        END IF;
      ELSE
        INSERT INTO Messages(numcol1,numcol2,charcol1,charcol2,datecol1,datecol2)
        VALUES (default,default,'FALSE',default,default,default);
      END IF;
    ELSE
      INSERT INTO Messages(numcol1,numcol2,charcol1,charcol2,datecol1,datecol2)
      VALUES (default,default,'FALSE',default,default,default);
    END IF;
  END LOOP;
  CLOSE ct_emp;
END;

//XII.4 ��a v�o v?ng l?p v t? 1 �?n 10 l?nh:
// UPDATE messages
// SET numcol2=100
// WHERE numcol1 = v;
// n?u b?t k? m?t l?n update n�o �� c� s? l�?ng row > 1 th? exit kh?i v?ng l?p.



DECLARE
  dem int(2);
  ck int(2);
BEGIN
  dem := 1;
  LOOP
    SELECT count(*) INTO ck
    FROM MESSAGES 
    WHERE numcol1 = dem;
    EXIT WHEN ck = 2 OR dem = 11;
    
    UPDATE MESSAGES
    SET numcol2 = 100
    WHERE numcol1 = dem;
    dem := dem + 1;
  END LOOP;
END;



//XIII v� XIV kh�ng c� b�i t?p.



UPDATE messages
SET numcol2=100
WHERE numcol1 = v;

