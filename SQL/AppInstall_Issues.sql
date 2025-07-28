/*
This report returns app install data is the installation wasn't succesful with the reason
why the install failed.
*/

/*To return app info from a single device, uncomment out the declared variable and WHERE clause.
Replace ENTER DEVICE NAME with the actual device name
*/
 
--DECLARE @devicename varchar(50)
--SET @devicename = 'ENTER DEVICE NAME'

SELECT 
	   tc.tcname 'DEVICE_NAME',
	   av.APP_NAME 'APP_NAME',
	   av.APP_VERSION AS 'INSTALLED_VERSION',
	   CONVERT(date, av.IMPORTED_AT, 103) AS 'DATE_IMPORTED',
	   CONVERT(date, tai.STATE_DATE, 103) AS 'DATE_OF_INSTALL_ATTEMPT',
	   tai.[STATE] as 'CURRENT_STATUS',
	   tai.[STATE_MESSAGE]

FROM igelums.THINCLIENT tc JOIN igelums.THINCLIENT_APP_INSTALLATION tai ON tc.TCID = tai.TCID
JOIN igelums.APP_VERSION av ON tai.APP_VERSION_ID = av.APP_VERSION_ID
JOIN igelums.APP_LINE al ON av.APP_LINE_ID = al.APP_LINE_ID
WHERE tai.STATE <> 'Installed' AND tai.STATE <> 'Activated'

--AND tc.TCNAME = @devicename