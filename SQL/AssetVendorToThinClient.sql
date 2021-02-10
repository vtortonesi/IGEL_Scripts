/*The schema reference in the FROM statement will need to be 
adjusted based on current schema name (e.g igelums.thinclient
*/

--Change the vendor name accordingly
Declare @vendor varchar(50)
SET @vendor = 'Logitech, Inc.'

SELECT
	tc.tcname,
	ai.Vendor,
	ai.Device_Name

FROM igelums.Thinclient tc JOIN igelums.Asset_To_TC atc
ON tc.tcid = atc.tcid

JOIN igelums.ASSET_INFO ai ON atc.ASSET_ID =ai.ASSET_ID

WHERE ai.VENDOR = @vendor

