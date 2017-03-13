--Load sample data to pig.
data = LOAD '/user/data/data.csv' USING PigStorage(',') AS 
(
	id : int,
    year : int,
    temp : int,
    city : chararray,
    country : chararray,
    ip_address : chararray
);

-- using GROUP funtion to group sample data based on particular columns
data_group_by_year = GROUP data BY year;

--FOREACH function helps to calculate on each particular GROUP data.
result_data_avg = FOREACH data_group_by_year {
	GENERATE group,
    AVG(data.temp);
}

-- DUMP used to get output. 
dump result_data_avg;