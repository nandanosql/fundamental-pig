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

--FILRER keyword used to filter search operation which is based on particular filter criteria.
filter_data = FILTER data BY id ==73;

--TOKENIZE function used to split string. 
--Column should be chararray. 
--FOREACH function helps to calculate on each particular GROUP data.
result_token_data = FOREACH filter_data {
	GENERATE
    TOKENIZE(country);
}

-- DUMP used to get output. 
dump result_token_data;