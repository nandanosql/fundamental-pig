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


-- SIZE funtion used to get number of elements.
--SIZE funtion can apply only on chararray,tuple and bag.
--FOREACH function helps to calculate on each particular GROUP data.
result_char_size = FOREACH data {
	GENERATE
    SIZE(country) as charCount;
}

-- DUMP used to get output. 
dump result_char_size;