ALTER AVAILABILITY GROUP Accounts
	ADD LISTENER 'Accounts' (
		WITH IP
			(
				(N'10.0.0.8', N'255.255.255.0'),
				(N'10.0.1.8', N'255.255.255.0')
			),
		PORT=1433
	);
GO 
