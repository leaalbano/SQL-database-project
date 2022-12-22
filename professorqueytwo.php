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
  $section = $_POST["section"];
    
  $sql = "SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='A' AND CONCAT('$name', '-', '$section')=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section)";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Grade: " . $row["grade"]. "  - Count:  " . $row["COUNT(grade)"].  "<br>";
  }
} else {
  echo "0 results";
}

    
$sql = "SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='B' AND CONCAT('$name', '-', '$section')=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section)";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Grade: " . $row["grade"]. "  - Count:  " . $row["COUNT(grade)"].  "<br>";
  }
} else {
  echo "0 results";
}


 $sql = "SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='C' AND CONCAT('$name', '-', '$section')=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section)";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Grade: " . $row["grade"]. "  - Count:  " . $row["COUNT(grade)"].  "<br>";
  }
} else {
  echo "0 results";
}


 $sql = "SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='D' AND CONCAT('$name', '-', '$section')=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section)";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Grade: " . $row["grade"]. "  - Count:  " . $row["COUNT(grade)"].  "<br>";
  }
} else {
  echo "0 results";
}


 $sql = "SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='F' AND CONCAT('$name', '-', '$section')=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section)";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Grade: " . $row["grade"]. "  - Count:  " . $row["COUNT(grade)"].  "<br>";
  }
} else {
  echo "0 results";
}


$link->close();
?>