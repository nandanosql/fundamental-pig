--Load sample data to pig.
employee = LOAD '/user/data/employee' USING PigStorage(',') AS 
(
	emp_id : int,
    name : chararray,
    age : int,
    post : chararray
);

salary = LOAD '/user/data/salary' USING PigStorage(',') AS 
(
	sal_id : int,
    emp_id : int,
    amount : int
);

--JOIN used to do join Operation between two files. 
emp_sal = JOIN employee by emp_id LEFT OUTER, salary BY emp_id;

-- DUMP used to get output. 
dump emp_sal;