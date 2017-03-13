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

-- CONCAT funtion used to combine two different chararray fields together. 
--FOREACH function helps to calculate on each particular GROUP data.
result_data_concat = FOREACH data {
	GENERATE address,
    CONCAT(city,country);
}

-- DUMP used to get output. 
dump result_data_concat;