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

--GROUP function used to group similer data at one place.
data_group = GROUP data by year;

--SUM function used to calculate on total value based on particulat column. 
--Column should be numeric. 
--FOREACH function helps to calculate on each particular GROUP data.
result_data_sum = FOREACH data_group {
	GENERATE group,
    SUM(data.temp) as totalTemprature;
}

-- DUMP used to get output. 
dump result_data_sum;