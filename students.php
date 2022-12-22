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
  <li><a href="professor.php">Professors</a></li>
</ul>



<div class="wrapper">
<div id ="login">
<form method = "POST" enctype="multipart/form-data" action="studentqueryone.php">
<div class="label">course number: <input type="text" name="name"></div>
<div class="submit"><input type="submit" name="submit_query" value="search course number" /></div>
</form>
</div>
</div>

<div class="wrapper">
<div id ="login">
<form method = "POST" enctype="multipart/form-data" action="studentquerytwo.php">
<div class="label">CWID: <input type="text" name="name"></div>
<div class="submit"><input type="submit" name="submit_query" value="search cwid" /></div>
</form>
</div>
</div>

  
</body>
</html>


