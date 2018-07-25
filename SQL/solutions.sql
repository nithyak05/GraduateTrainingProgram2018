ProblemSet00, July25th 2018
-- Submission by n.c.karthikeyan@accenture.com

1)Select the Employee with the top three salaries
SELECT SALARY FROM EMPLOYEE ORDER BY SALARY DESC LIMIT 3;
"99475"
"94791"
"94324"


2)Select the Employee with the least salary
SELECT NAME, SALARY FROM EMPLOYEE WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEE);
"JOHN HELLEN" "15380"


3)Select the Employee who does not have a manager in the department table
SELECT NAME FROM EMPLOYEE WHERE MANAGERID NOT IN (SELECT E.NAME,E.E_ID FROM EMPLOYEE E INNER JOIN DEPT D ON E.NAME=D.DEP_MANAGER);
"BRUCE WILLS"
"TIM ARCHER"
"ADAM JUSTIN"
"ROBERT SWIFT"
"NATASHA STEVENS"


4)Select the Employee who is also a Manager
 SELECT E.NAME FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID WHERE E.NAME=D.DEP_MANAGER;
 "BRUCE WILLS"
 "ADAM JUSTIN"
 "ROBERT SWIFT"
 "NATASHA STEVENS"
 
 
 5)Select the Empolyee who is a Manager and has least salary
   SELECT E.NAME,MIN(E.SALARY) FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID WHERE E.NAME=D.DEP_MANAGER;
   "ROBERT SWIFT" "27700"
   
   
 6)Select the total number of Employees in Communications departments
  SELECT COUNT(*) FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID WHERE D.DEP_NAME='COMMUNICATIONS';
  COUNT = 6
  
  
 7)Select the Employee in Finance Department who has the top salary
  select max(salary),e.name from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_name='FINANCE';
  "94324" "ADAM WAYNE"
  
  
 8)Select the Employee in product depatment who has the least salary
   select min(salary),e.name from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_name='PRODUCT';
   "48834" "TIM ARCHER"
   
   
 9)Select the count of Empolyees in Health with maximum salary
 select count(*),max(salary) from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_name='HEALTH';
 "5" "94791"
 
 
 10)Select the Employees who report to Natasha Stevens
 select name from employee where managerid=(select e_id from employee where name='NATASHA STEVENS');
 "ADAM WAYNE"
"JOSEPH ANGELIN"
 
 11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department
 select e.name,count(e.name),d.dep_name,d.dep_manager from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_name="HEALTH";
 "JOHN HELLEN" "5" "HEALTH" "TIM ARCHER" 
 
 
 12)Display the Department id,Employee ids and Manager ids for the Communications department
 select d.dep_id,e.e_id,e.managerid from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_name="COMMUNICATIONS";
 "D02" "A116" "A187"
 "D02" "A198" "A187"
 "D02" "A187" "A298"
 "D02" "A121" "A187"
 "D02" "A194" "A187"
 "D02" "A133" "A187"
 
 
 13)Select the Average Expenses for Each dept with Dept id and Dept name
 select d.dep_id,d.dep_name,avg(e.salary) from employee e inner join  dept d on e.dep_id=d.dep_id group by d.dep_name;
 "D02" "COMMUNICATIONS" "48271.3333333333"
 "D05" "FINANCE" "56660.3333333333"
 "D01" "HEALTH" "55666.4"
 "D04" "INSURANCE" "51913.3333333333"
 "D03" "PRODUCT" "55289.6666666667"
 
 
 14)Select the total expense for the department finance
  select sum(e.salary),d.dep_name,d.dep_id from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_name='FINANCE';
  "169981" "FINANCE" "D05"
  
  
  15)Select the department which spends the least with Dept id and Dept manager name
  SELECT MIN(SALARY),DEP_ID,DEP_MANAGER FROM (SELECT SUM(E.SALARY) AS SALARY ,D.DEP_MANAGER,D.DEP_ID FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID GROUP BY D.DEP_ID);
  "155740" "D04" "ROBERT SWIFT"
  
  
  16)Select the count of Employees in each department
    SELECT COUNT(E.NAME),D.DEP_NAME FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID GROUP BY(D.DEP_NAME);
    "6" "COMMUNICATIONS"
    "3" "FINANCE"
    "5" "HEALTH"
    "3" "INSURANCE"
    "3" "PRODUCT"
    
    
   17)Select the count of Employees in each department having salary <10000
    SELECT COUNT(E.NAME),D.DEP_NAME,E.SALARY FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID GROUP BY(D.DEP_NAME) HAVING E.SALARY<10000;
    0 rows returned in 0ms
    
    
   18)Select the total number of Employees in Dept id D04
     SELECT COUNT(NAME) FROM EMPLOYEE WHERE DEP_ID='D04';
     COUNT=3
 
 
 19)Select all department details of the Department with Maximum Employees
select * from dept d inner join (select max(cnt),dep_id from(select count(e_id) as cnt,dep_id from employee group by dep_id)) as t on d.dep_id=t.dep_id;
"D02" "COMMUNICATIONS" "ADAM JUSTIN" "6" "D02"
 
 
 
 20)Select the Employees who has Tim Cook as their manager
 select e.name from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_manager='TIM COOK';
 0 rows returned in 0ms
     
     
    
   
   
   
   
   
   
