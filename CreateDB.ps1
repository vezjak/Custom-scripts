$Server="servername";
$username="dbusername";
$password="dbpassword";
$Query=Get-Content .\CreateDb.sql
    
#build connection string
$connstring = "Server=$Server; "
$connstring += "Trusted_Connection=Yes; Integrated Security=SSPI;"

#connect to database
$connection = New-Object System.Data.SqlClient.SqlConnection($connstring)
$connection.Open()
    
#build query object
$command = $connection.CreateCommand()
$command.CommandText = $Query
$command.CommandTimeout = $CommandTimeout
    
#run query
$adapter = New-Object System.Data.SqlClient.SqlDataAdapter $command
$dataset = New-Object System.Data.DataSet
$adapter.Fill($dataset) | out-null

$connection.Close()
