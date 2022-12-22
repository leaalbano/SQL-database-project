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
 
</body>
</html>


<?php
$link = mysqli_connect('mariadb', 'cs332f38', 'r6p4JN3p','cs332f38');
if (!$link) {
   die('Could not connect: ' . mysql_error());
}
echo 'Connected successfully<p>';
  $name = $_POST["name"];
    
  $sql = "SELECT classroom, beginning_time, end_time, COURSES.title
FROM SECTIONS, COURSES
WHERE '$name'=SECTIONS.SSN AND COURSES.course_number=SECTIONS.course_number";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "classroom: " . $row["classroom"]. "  - beginning time:  " . $row["beginning_time"]. " end time: " . $row["end_time"].  
 " title: " . $row["title"]. "<br>";
  }
} else {
  echo "0 results";
}

  $sql = "SELECT MEETING_DAYS.meeting_days, MEETING_DAYS.course_number, MEETING_DAYS.section_number
FROM MEETING_DAYS, SECTIONS
WHERE '$name'=SECTIONS.SSN AND MEETING_DAYS.section_number = SECTIONS.section_number AND MEETING_DAYS.course_number = SECTIONS.course_number";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Meeting days: " . $row["meeting_days"]. "  - Course number:  " . $row["course_number"]. " Section number: " . $row["section_number"].   "<br>";
  }
} else {
  echo "0 results";
}

$link->close();
?>