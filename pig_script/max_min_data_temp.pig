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

-- MAX and MIN funtion used for getting maximum and minimum values for respected columns. 
--FOREACH function helps to calculate on each particular GROUP data.
result_data_max_min = FOREACH data_group {
	GENERATE group,
    MAX(data.temp) as maxTemprature,
    MIN(data.temp) as minTemprature;
}

-- DUMP used to get output. 
dump result_data_max_min;