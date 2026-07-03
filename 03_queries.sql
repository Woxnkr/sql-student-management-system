Use StudentManagementDB;

-- 1. List all students 
SELECT * FROM Students;

-- 2. Display only first name and last name 
SELECT FirstName, LastName
FROM Students;

-- 3. Students born after the year 2003
SELECT *
FROM Students
WHERE BirthDate > '2003-01-01';

-- 4. Sort students by last name
SELECT *
FROM Students
ORDER BY LastName ASC;

-- 5. List courses with 4 or more credits
SELECT *
FROM Courses
WHERE Credits >= 4;

-- 6. Show total number of students 
SELECT COUNT(*) AS TotalStudents
FROM Students;

-- 7. Calculate average grade of students
SELECT AVG(Grade) AS AverageGrade
From Enrollments;

-- 8. Show the highest grade
SELECT Max(Grade) AS HighestGrade
FROM Enrollments;

-- 9. Show the lowest grade
SELECT Min(Grade) AS LowestGrade
FROM Enrollments;

-- 10. Calculate total number of credits for courses
SELECT SUM(Credits) AS TotalCredits
From Courses;

-- 11. How many students are taking each course?
SELECT
CourseID,
COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID;

-- 12. Average grade for each course 
SELECT 
CourseID,
AVG(Grade) AS AvarageGrade
FROM Enrollments
GROUP BY CourseID;

-- 13. Courses with at least 2 students
SELECT
CourseID,
COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) >= 2;

-- 14. List students' enrolled courses and their grades
SELECT
s.FirstName,
s.LastName,
c.CourseName,
e.Grade
FROM Students s
INNER JOIN Enrollments e 
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;

-- 15. List grades of a specific student for their courses
SELECT
s.FirstName,
s.LastName,
c.CourseName,
e.Grade
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON c.CourseID = e.CourseID
WHERE s.FirstName='Mehmet' and s.LastName='Kahveci';

-- 16. List students from highest grade to lowest grade
SELECT
s.FirstName,
s.LastName,
c.CourseName,
e.Grade
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c 
ON c.CourseID = e.CourseID
ORDER BY e.Grade DESC;

-- 17. List average grade of courses
SELECT
c.CourseName,
AVG(e.Grade) AS AverageGrade
FROM Courses c 
INNER JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseName;

-- 18. List distinct courses taken by students
SELECT DISTINCT CourseID
FROM Enrollments;

-- 19. Students whose first name starts with the letter 'M'
SELECT *
FROM Students
Where FirstName LIKE 'M%';

-- 20. List grades between 80 and 90
SELECT *
FROM Enrollments
WHERE Grade BETWEEN 80 AND 90;

-- 21. Enrollment records with CourseID 1 or 3
SELECT *
FROM Enrollments
Where CourseID IN (1,3);

-- 22. Show the first 3 students
SELECT *
FROM Students 
LIMIT 3;

-- 23. Students with CourseID 3 and grade above 85
SELECT *
FROM Enrollments
WHERE CourseID = 3
AND Grade > 85;

-- 24. Records with CourseID 1 or grade above 90
SELECT *
FROM Enrollments
Where CourseID = 1 
OR Grade > 90;

-- 25. Show first name and last name of students with custom column aliases
SELECT
FirstName AS Name,
LastName AS Surname
FROM Students;

-- 26. List all students and their courses if they have any (Left Join)
SELECT
s.FirstName,
s.LastName,
c.CourseName,
e.Grade
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseID = c.CourseID;

-- 27. Display letter grades of students
SELECT
StudentID,
Grade,
CASE
WHEN Grade >= 90 THEN 'A'
WHEN Grade >= 80 THEN 'B'
WHEN Grade >= 70 THEN 'C'
ELSE 'F'
END AS LetterGrade
FROM Enrollments;

-- 28. Records with a grade above the overall average grade
SELECT *
FROM Enrollments
WHERE Grade >
(
SELECT AVG(GRADE)
FROM Enrollments
);

-- 29. Create a view for student grades
CREATE VIEW StudentGrades AS
SELECT
s.FirstName,
s.LastName,
c.CourseName,
e.Grade
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID;

SELECT *
FROM StudentGrades;

-- If we want to recreate the view, we need to run this command first to drop it
DROP VIEW StudentGrades;

-- 30. Sort average grades of courses from highest to lowest
SELECT
c.CourseNAME,
COUNT(e.StudentID) AS TotalStudents,
AVG(e.Grade) AS AverageGrade
FROM Courses c
JOIN Enrollments e 
ON c.CourseID = e.CourseID
GROUP BY c.CourseName
ORDER BY AverageGrade DESC;







