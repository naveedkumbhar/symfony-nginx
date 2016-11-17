<!DOCTYPE html>
<head>
<title> Insert Data</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
li {
list-style: none;
}
</style>
</head>
<body>
<h2>Enter data into info table</h2>
<ul>
<form name="insert" action="insert.php" method="POST" >
<li>First Name:</li><li><input type="text" name="first_name" /></li>
<li>Last Name:</li><li><input type="text" name="last_name" /></li>
<li>Age:</li><li><input type="text" name="age" /></li>
<li><input type="submit" /></li>
</form>
</ul>
</body>
</html>
<?php
$db = pg_connect("host=nidduserver.ddns.net port=5432 dbname=naveed user=postgres password=naveedahmed");
$query = "INSERT INTO info VALUES ('$_POST[first_name]','$_POST[last_name]',
'$_POST[age]')";
$result = pg_query($query);
?>
