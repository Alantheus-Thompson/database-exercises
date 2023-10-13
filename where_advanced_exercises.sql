## Where Advanced Exercises Lesson
SHOW databases;
USE employees;
SELECT database();
SHOW tables;

-- #1 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' 
-- using IN. What is the employee number of the top three results?

select *
	FROM employees
		where first_name IN ('Irena', 'Vidya', 'Maya');

-- Answer: 10200, 10397, 10610

-- #2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as 
-- in Q1, but use OR instead of IN. What is the employee number of the top three results? 
-- Does it match the previous question?

select *
 from employees	
	where first_name = 'Irena'
    or first_name = 'Vidya'
    or first_name = 'Maya';
    
-- Answer: 10200, 10397, 10610 which matches the previsous question

-- # 3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', 
-- using OR, and who is male. What is the employee number of the top three results?

select *
	from employees
		where (first_name = 'Irena'
		or first_name = 'Vidya'
		or first_name = 'Maya')
        and gender = "M";

-- Answer: 10200, 10397, 10821

-- #4 Find all unique last names that start with 'E'.

select distinct last_name
	from employees
		where last_name like 'E%';

-- Answer:
# last_name
-- 'Eastman'
-- 'Ebeling'
-- 'Ecklund'
-- 'Edelhoff'
-- 'Egerstedt'
-- 'Eickenmeyer'
-- 'Einsfeld'
-- 'Eiron'
-- 'Eiter'
-- 'Eldridge'
-- 'Ellozy'
-- 'Emden'
-- 'Emiris'
-- 'Emmart'
-- 'Emmerich'
-- 'Encarnacion'
-- 'Engberts'
-- 'Engelmann'
-- 'England'
-- 'Eppinger'
-- 'Erbe'
-- 'Erde'
-- 'Erdi'
-- 'Erdmenger'
-- 'Erev'
-- 'Erez'
-- 'Erie'
-- 'Erman'
-- 'Ermel'
-- 'Erni'
-- 'Ernst'
-- 'Erol'
-- 'Ertl'
-- 'Erva'
-- 'Escriba'
-- 'Esposito'
-- 'Esteva'
-- 'Etalle'
-- 'Eterovic'
-- 'Eugenio'

-- #5 Find all unique last names that start or end with 'E'.

select distinct last_name
	from employees
		where last_name LIKE '%E';

-- ANSWER: # last_name
-- 'Antonisse'
-- 'Argence'
-- 'Aseltine'
-- 'Backhouse'
-- 'Badache'
-- 'Bade'
-- 'Bage'
-- 'Bale'
-- 'Bellmore'
-- 'Bellone'
-- 'Benveniste'
-- 'Bergere'
-- 'Bhattacharjee'
-- 'Birge'
-- 'Birke'
-- 'Boreale'
-- 'Boyle'
-- 'Brodie'
-- 'Caine'
-- 'Cannane'
-- 'Carrere'
-- 'Cheshire'
-- 'Clouatre'
-- 'Cochrane'
-- 'Codenie'
-- 'Collette'
-- 'Comte'
-- 'Conde'
-- 'Constantine'
-- 'Conte'
-- 'Cooke'
-- 'Crabtree'
-- 'Cunliffe'
-- 'Cyne'
-- 'Cyre'
-- 'Debuse'
-- 'Delaune'
-- 'Delgrande'
-- 'Delgrange'
-- 'Demke'
-- 'Deville'
-- 'Dredge'
-- 'DuCasse'
-- 'Eldridge'
-- 'Erbe'
-- 'Erde'
-- 'Erie'
-- 'Etalle'
-- 'Ferriere'
-- 'Foote'
-- 'Fraisse'
-- 'Fritzsche'
-- 'Furudate'
-- 'Gammage'
-- 'Gente'
-- 'Ghazalie'
-- 'Gide'
-- 'Gire'
-- 'Harllee'
-- 'Jayawardene'
-- 'Kamble'
-- 'Keohane'
-- 'Kilgore'
-- 'Krone'
-- 'Kusakabe'
-- 'Lalonde'
-- 'Lambe'
-- 'Lampe'
-- 'Lanzelotte'
-- 'Leslie'
-- 'Liedekerke'
-- 'Liesche'
-- 'Lorie'
-- 'Lowrie'
-- 'Luce'
-- 'Luke'
-- 'Maccarone'
-- 'Mahnke'
-- 'Mansanne'
-- 'Marrevee'
-- 'Matzke'
-- 'McAlpine'
-- 'McClure'
-- 'McConalogue'
-- 'Meriste'
-- 'Merle'
-- 'Miake'
-- 'Moehrke'
-- 'Munke'
-- 'Nitsche'
-- 'Onuegbe'
-- 'Passafiume'
-- 'Pepe'
-- 'Provine'
-- 'Puppe'
-- 'Rande'
-- 'Range'
-- 'Ranze'
-- 'Rebaine'
-- 'Remmele'
-- 'Ressouche'
-- 'Rindone'
-- 'Rodite'
-- 'Rothe'
-- 'Rouquie'
-- 'Savasere'
-- 'Schade'
-- 'Schapire'
-- 'Schiettecatte'
-- 'Schoegge'
-- 'Schonegge'
-- 'Serre'
-- 'Shanbhogue'
-- 'Shobatake'
-- 'Sidje'
-- 'Sinicrope'
-- 'Siprelle'
-- 'Stille'
-- 'Tchuente'
-- 'Tsukune'
-- 'Valette'
-- 'Valiente'
-- 'Vandervoorde'
-- 'Viele'
-- 'Waterhouse'
-- 'Waymire'
-- 'Wegerle'
-- 'Wuwongse'
-- 'Zaiane'
-- 'Zastre'
-- 'Zschoche'
-- 'Zumaque'

-- #6 Find all unique last names that end with E, but does not start with E?
 
 select distinct last_name
	from employees
		where (last_name not like 'E%' and last_name like '%E');
        
-- ANSWER: # last_name
-- 'Antonisse'
-- 'Argence'
-- 'Aseltine'
-- 'Backhouse'
-- 'Badache'
-- 'Bade'
-- 'Bage'
-- 'Bale'
-- 'Bellmore'
-- 'Bellone'
-- 'Benveniste'
-- 'Bergere'
-- 'Bhattacharjee'
-- 'Birge'
-- 'Birke'
-- 'Boreale'
-- 'Boyle'
-- 'Brodie'
-- 'Caine'
-- 'Cannane'
-- 'Carrere'
-- 'Cheshire'
-- 'Clouatre'
-- 'Cochrane'
-- 'Codenie'
-- 'Collette'
-- 'Comte'
-- 'Conde'
-- 'Constantine'
-- 'Conte'
-- 'Cooke'
-- 'Crabtree'
-- 'Cunliffe'
-- 'Cyne'
-- 'Cyre'
-- 'Debuse'
-- 'Delaune'
-- 'Delgrande'
-- 'Delgrange'
-- 'Demke'
-- 'Deville'
-- 'Dredge'
-- 'DuCasse'
-- 'Ferriere'
-- 'Foote'
-- 'Fraisse'
-- 'Fritzsche'
-- 'Furudate'
-- 'Gammage'
-- 'Gente'
-- 'Ghazalie'
-- 'Gide'
-- 'Gire'
-- 'Harllee'
-- 'Jayawardene'
-- 'Kamble'
-- 'Keohane'
-- 'Kilgore'
-- 'Krone'
-- 'Kusakabe'
-- 'Lalonde'
-- 'Lambe'
-- 'Lampe'
-- 'Lanzelotte'
-- 'Leslie'
-- 'Liedekerke'
-- 'Liesche'
-- 'Lorie'
-- 'Lowrie'
-- 'Luce'
-- 'Luke'
-- 'Maccarone'
-- 'Mahnke'
-- 'Mansanne'
-- 'Marrevee'
-- 'Matzke'
-- 'McAlpine'
-- 'McClure'
-- 'McConalogue'
-- 'Meriste'
-- 'Merle'
-- 'Miake'
-- 'Moehrke'
-- 'Munke'
-- 'Nitsche'
-- 'Onuegbe'
-- 'Passafiume'
-- 'Pepe'
-- 'Provine'
-- 'Puppe'
-- 'Rande'
-- 'Range'
-- 'Ranze'
-- 'Rebaine'
-- 'Remmele'
-- 'Ressouche'
-- 'Rindone'
-- 'Rodite'
-- 'Rothe'
-- 'Rouquie'
-- 'Savasere'
-- 'Schade'
-- 'Schapire'
-- 'Schiettecatte'
-- 'Schoegge'
-- 'Schonegge'
-- 'Serre'
-- 'Shanbhogue'
-- 'Shobatake'
-- 'Sidje'
-- 'Sinicrope'
-- 'Siprelle'
-- 'Stille'
-- 'Tchuente'
-- 'Tsukune'
-- 'Valette'
-- 'Valiente'
-- 'Vandervoorde'
-- 'Viele'
-- 'Waterhouse'
-- 'Waymire'
-- 'Wegerle'
-- 'Wuwongse'
-- 'Zaiane'
-- 'Zastre'
-- 'Zschoche'
-- 'Zumaque'

-- #7 Find all unique last names that start and end with 'E'.

select distinct last_name
	from employees
		where last_name like '%E' and last_name like 'E%';

-- ANSWER: # last_name
-- 'Etalle'
-- 'Erie'
-- 'Erde'
-- 'Erbe'
-- 'Eldridge'

-- # 8 Find all current or previous employees hired in the 90s. Enter a comment with the 
-- top three employee numbers.

Select hire_date
	from employees;
    
select distinct emp_no, first_name, last_name, hire_date
	from employees
		where hire_date like '199%';

        
-- ANSWER: 10008, 10011, 10012

-- #9 Find all current or previous employees born on Christmas. Enter a comment with the 
-- top three employee numbers.

select *
	from employees
		where birth_date like '%12-25';
        
-- ANSWER: 10078, 10115, 10261


-- # 10 Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with the top three employee numbers.

select distinct emp_no, hire_date, birth_date
	from employees
		where birth_date like '%12-25' and hire_date like '199%';

-- ANSWER: 10261, 10438, 10681

-- #11 Find all unique last names that have a 'q' in their last name.

select distinct last_name
	from employees 
		where last_name like '%q%';

-- ANSWER: # last_name
-- 'Rouquie'
-- 'Chleq'
-- 'Maquelin'
-- 'Lindqvist'
-- 'Quittner'
-- 'Zumaque'
-- 'Quaggetto'
-- 'Quadeer'
-- 'Marquardt'
-- 'Qiwen'


-- #12 Find all unique last names that have a 'q' in their last name but not 'qu'.

select distinct last_name
	from employees
		where last_name like '%q%' and last_name NOT like '%qu%';
        
-- ANSWER: # last_name
-- 'Chleq'
-- 'Lindqvist'
-- 'Qiwen'
