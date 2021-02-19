/*If you log into the database with an account that is not the schema owner, you need 
reference the schema name (e.g. igelums).

Replace the variable @profile in SET @profile with the profile name
*/

DECLARE @profile varchar(100)
SET @profile = 'YOUR PROFILE NAME'

SELECT 
	tc.tcname 'Device Name',
    p.[Name] 'Profile',
	pinst.Classname 'Profile Setting',
	pinst.Pvalue 'Profile Value'

FROM igelums.THINCLIENT tc
JOIN igelums.THINCLIENTHASPROFILE tp ON tc.TCID = tp.TCID
JOIN igelums.PROFILES p ON tp.PROFILEID = p.PROFILEID
JOIN igelums.PROFILEINSTANCESETTINGS pinst ON p.PROFILEID = pinst.PROFILEID

WHERE p.[Name] = @profile