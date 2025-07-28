/*This report shows all apps installed on devices where the install status equals 
Installed or Activated
*/


/*To return app info from a single device, uncomment out the declared variable and WHERE clause
replace ENTER DEVICE NAME with the actual device name
*/
 
--DECLARE @devicename varchar(50)
--SET @devicename = 'ENTER DEVICE NAME'

SELECT 
	   tc.tcname 'DEVICE_NAME',
	   av.APP_NAME 'APP_NAME',
	   av.APP_VERSION AS 'INSTALLED_VERSION',
	   CONVERT(date, av.IMPORTED_AT, 103) AS 'DATE_IMPORTED',
	   CONVERT(date, tai.STATE_DATE, 103) AS 'DATE_INSTALLED',
	   tai.[STATE] as 'CURRENT_STATUS'

FROM igelums.THINCLIENT tc JOIN igelums.THINCLIENT_APP_INSTALLATION tai ON tc.TCID = tai.TCID
JOIN igelums.APP_VERSION av ON tai.APP_VERSION_ID = av.APP_VERSION_ID
JOIN igelums.APP_LINE al ON av.APP_LINE_ID = al.APP_LINE_ID
WHERE tai.STATE = 'Installed' OR tai.STATE = 'Activated'

--AND tc.TCNAME = @devicename