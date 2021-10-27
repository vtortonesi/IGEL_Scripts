SELECT  
	tc.[tcname] 'ThinClient Name',
	dlm.Unit_id, 
	CONVERT(varchar(20), dsa.ExpirationDate, 107 ) AS 'Expiration Date', 
	Type =  CASE WHEN LICENSE_CATEGORY = 'SUBSCRIPTION' THEN 'EMP' ELSE 'WORKSPACE' END,
	License_Key

FROM DSA_LICENSE_MAC dlm
JOIN DSA_LICENSE dsa ON dlm.LICENSEID= dsa.LICENSEID
JOIN THINCLIENT tc ON dlm.UNIT_ID = tc.MACADDRESS 