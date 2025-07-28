/*This returns  whether or not an app can be upgraded. It looks to see if the newest version 
available is greater than the version currently installed.
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
	   al.NEWEST_KNOWN_VERSION,

	CASE
		WHEN al.NEWEST_KNOWN_VERSION > av.APP_VERSION THEN 'YES'
		ELSE 'NO'
	END AS 'APP_CAN_BE_UPGRADED'

FROM igelums.THINCLIENT tc JOIN igelums.THINCLIENT_APP_INSTALLATION tai ON tc.TCID = tai.TCID
JOIN igelums.APP_VERSION av ON tai.APP_VERSION_ID = av.APP_VERSION_ID
JOIN igelums.APP_LINE al ON av.APP_LINE_ID = al.APP_LINE_ID
WHERE tai.STATE = 'Installed' OR tai.STATE ='Activated'

--AND tc.TCNAME = @devicename