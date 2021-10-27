SELECT tcdir.[Name] AS 'View Folder', 
		 tcv.ViewName, 
		 tcc.ComparisonOperator, 
		 tcc.COMPARISONVALUE
  
FROM TCVIEWS tcv JOIN TCVIEWCONSTRAINTS tcc ON tcv.VIEWID = tcc.BELONGSTOVIEW
  
JOIN TCVIEWSTOREDIN store ON tcv.VIEWID = store.VIEWID
JOIN TCVIEWDIRECTORIES tcdir ON store.DIRID = tcdir.DIRID