/*
This will return the device, user, login/logoff times and session - Citrix or Kerberos.
Change the schema reference in the FROM statement (e.g. igelums.THINCLIENT) as needed.
Three variables have been created to filter by either device, user logon name or date range.  Remove
the comments from any or all of the DECLARE and SET statements and the corresponding WHERE clause.

Note: If multiple WHERE clauses are used, the the second and/or third should be changed to an AND or OR 
depending now how the data should be returned.

*/

--DECLARE @device varchar(50)
--SET @device = 'DEVICE NAME'

--DECLARE @user varchar(50)
--SET @user = 'USER NAME'

--DECLARE @date datetime
--SET @date = NUMBER

SELECT 
   tc.TCNAME AS 'Device Name',
   u.username,
   CONVERT(varchar, u.LOGINTIME, 100) AS 'Logon Time',
   CONVERT(varchar, u.LOGOFFTIME, 100) AS 'Logoff Time',
   LOGONTYPE AS 'Session Type'
FROM igelums.TCLOGIN u
JOIN igelums.THINCLIENT tc ON u.UNIT_ID = tc.UNIT_ID

--WHERE tc.TCNAME = @device
--WHERE u.USERNAME = @user
--WHERE DATEDIFF(dd, u.Logintime, GETDATE()) <=@date

