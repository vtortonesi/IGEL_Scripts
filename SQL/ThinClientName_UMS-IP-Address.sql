SELECT 
    tc.LASTKNOWNIP, 
    tc.TCNAME, 
    tcs.PVALUE AS 'Remote Management (UMS) IP'
 
FROM igelums.THINCLIENT tc JOIN igelums.THINCLIENTSETTINGS tcs ON tc.TCID = tcs .TCID

WHERE CLASSNAME = 'system.remotemanager.server%.ip'