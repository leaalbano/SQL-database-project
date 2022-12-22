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
     
</body>
</html>

<?php
$link = mysqli_connect('mariadb', 'cs332f38', 'r6p4JN3p','cs332f38');
if (!$link) {
   die('Could not connect: ' . mysql_error());
}
echo 'Connected successfully<p>';
  $name = $_POST["name"];
    
  $sql = "SELECT SECTIONS.section_number, classroom, beginning_time, end_time, MEETING_DAYS.meeting_days
  FROM SECTIONS
  JOIN MEETING_DAYS
  ON SECTIONS.course_number = '$name' AND SECTIONS.course_number =  MEETING_DAYS.course_number AND SECTIONS.section_number = 
  MEETING_DAYS.section_number";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "section number: " . $row["section_number"]. "  - classroom:  " . $row["classroom"]. " beginning_time: " . $row["beginning_time"]. " end_time: " . $row["end_time"]. " Meeting days " . $row["meeting_days"].  "<br>";
  }
} else {
  echo "0 results";
}

$sql = "SELECT course_section, COUNT(*)
FROM ENROLLMENT_RECORDS
WHERE ENROLLMENT_RECORDS.course_number = '$name' AND course_section = '01'";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "section number: " . $row["course_section"]. "  - Number of students enrolled:  " . $row["COUNT(*)"]. "<br>";
  }
} else {
  echo "0 results";
}

$sql = "SELECT course_section, COUNT(*)
FROM ENROLLMENT_RECORDS
WHERE ENROLLMENT_RECORDS.course_number = '$name' AND course_section = '02'";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
   echo "section number: " . $row["course_section"]. "  - Number of students enrolled:  " . $row["COUNT(*)"]. "<br>";
  }
} else {
  echo "0 results";
}

$link->close();
?>