data = LOAD '/user/data/data.csv' USING PigStorage(',') AS 
(
	id : int,
    year : int,
    temp : int,
    city : chararray,
    country : chararray,
    ip_address : chararray
);

data_group_by_year = GROUP data BY year;
DUMP data_group_by_year;