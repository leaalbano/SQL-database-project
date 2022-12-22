<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel = "stylesheet" href="css/style.css">
    <title>fs</title>
</head>
<body>
  <ul>
  <li><a class="active" href="index.html">Home</a></li>
  <li><a href="students.php">Students</a></li>
</ul>


<div class="wrapper">
<div id ="login">
<form method = "POST" enctype="multipart/form-data" action="professorqueryone.php">
<div class="label">SSN: <input type="text" name="name"></div>
<div class="submit"><input type="submit" name="submit_query" value="search SSN" /></div>
</form>
</div>
</div>

  
<div class="wrapper">
<div id ="login">
<form method = "POST" enctype="multipart/form-data" action="professorquerytwo.php">
<div class="label">Course Number: <input type="text" name="name"></div>
<div class="label">Section Number: <input type="text" name="section"></div>
<div class="submit"><input type="submit" name="submit_query" value="search course+section" /></div>
</form>
</div>
</div>
  
</body>
</html>