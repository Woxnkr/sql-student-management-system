USE StudentManagementDB;

-- Insert Students
INSERT INTO Students (FirstName, LastName, Email, BirthDate)
VALUES
('Mehmet', 'Kahveci', 'mehmet.kahveci@email.com', '2003-05-12'),
('Hilal', 'Demir', 'hilal.demir@email.com', '2002-11-08'),
('Ali', 'Kaya', 'ali.kaya@email.com', '2003-01-25'),
('Zeynep', 'Deniz', 'zeynep.deniz@email.com', '2004-07-14'),
('Can', 'Mutlu', 'can.mutlu@email.com', '2003-09-30');

SELECT * FROM Students;

-- Insert Courses
INSERT INTO Courses (CourseName, Credits)
VALUES
('Database Systems', 4),
('Programming Fundamentals', 5),
('Data Analytics', 3),
('Business Intelligence', 4),
('Web Development', 3);

SELECT * FROM Courses;

-- Insert Instructors
INSERT INTO Instructors (InstructorName, Department)
VALUES
('Dr. Ahmet Yılmaz', 'Computer Engineering'),
('Dr. Ayşe Demir', 'Management Information Systems'),
('Dr. Mehmet Kaya', 'Business Administration');

SELECT * FROM Instructors;

-- Insert Enrollments
INSERT INTO Enrollments (StudentID, CourseID, Grade)
VALUES
(1,1,88.50),
(1,2,91.00),
(2,1,76.50),
(2,3,89.00),
(3,2,67.50),
(3,4,94.00),
(4,5,82.00),
(5,3,90.50);

SELECT * FROM Enrollments;
