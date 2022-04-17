SELECT country_site_code,
       count(*) as com_carts
FROM 
(SELECT country_site_code,search_guid 
FROM domain_search.search_detail 
WHERE log_date='2022-02-07' AND api_key='dpp_search') A
JOIN
(SELECT DISTINCT search_guid AS search_guid
FROM domain_search.suggestion_level_detail 
WHERE log_date='2022-02-07'
      AND carted_flag=true AND tld='com') B
ON (A.search_guid=B.search_guid)
GROUP BY country_site_code;
