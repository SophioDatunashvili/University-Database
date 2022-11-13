CREATE TABLE [course] (
  [id] int PRIMARY KEY,
  [course_name] nvarchar(255),
  [faculty_id] int
)
GO

CREATE TABLE [faculty] (
  [id] int PRIMARY KEY,
  [faculty_name] nvarchar(255)
)
GO

CREATE TABLE [students] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [surname] nvarchar(255),
  [personal_number] nvarchar(255),
  [email] nvarchar(255),
  [address] nvarchar(255),
  [birth_date] nvarchar(255),
  [gender] nvarchar(255),
  [second_address] nvarchar(255),
  [flat_number] nvarchar(255),
  [faculty_id] int
)
GO

CREATE TABLE [student_course] (
  [id] int PRIMARY KEY,
  [student_id] int,
  [course_id] int
)
GO

CREATE TABLE [lecturer_timetable] (
  [id] int PRIMARY KEY,
  [lecturer_course_id] int,
  [weekday] nvarchar(255),
  [start_time] nvarchar(255)
)
GO

CREATE TABLE [lecturers] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [surname] nvarchar(255),
  [personal_number] nvarchar(255),
  [email] nvarchar(255),
  [address] nvarchar(255),
  [birth_date] nvarchar(255),
  [gender] nvarchar(255),
  [second_address] nvarchar(255),
  [flat_number] nvarchar(255),
  [iban] nvarchar(255),
  [position] nvarchar(255)
)
GO

CREATE TABLE [lecturer_course] (
  [id] int PRIMARY KEY,
  [lecturer_id] int,
  [course_id] int
)
GO

CREATE TABLE [managers] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [surname] nvarchar(255),
  [personal_number] nvarchar(255),
  [email] nvarchar(255),
  [address] nvarchar(255),
  [birth_date] nvarchar(255),
  [gender] nvarchar(255),
  [second_address] nvarchar(255),
  [flat_number] nvarchar(255),
  [iban] nvarchar(255),
  [position] nvarchar(255)
)
GO

CREATE TABLE [manager_faculty] (
  [id] int PRIMARY KEY,
  [manager_id] int,
  [faculty_id] int
)
GO

CREATE TABLE [student_timetable] (
  [id] int PRIMARY KEY,
  [student_course_id] int,
  [timetable_id] int
)
GO

ALTER TABLE [course] ADD FOREIGN KEY ([faculty_id]) REFERENCES [faculty] ([id])
GO

ALTER TABLE [students] ADD FOREIGN KEY ([faculty_id]) REFERENCES [faculty] ([id])
GO

ALTER TABLE [student_course] ADD FOREIGN KEY ([student_id]) REFERENCES [students] ([id])
GO

ALTER TABLE [student_course] ADD FOREIGN KEY ([course_id]) REFERENCES [course] ([id])
GO

ALTER TABLE [lecturer_timetable] ADD FOREIGN KEY ([lecturer_course_id]) REFERENCES [lecturer_course] ([id])
GO

ALTER TABLE [lecturer_course] ADD FOREIGN KEY ([lecturer_id]) REFERENCES [lecturers] ([id])
GO

ALTER TABLE [lecturer_course] ADD FOREIGN KEY ([course_id]) REFERENCES [course] ([id])
GO

ALTER TABLE [manager_faculty] ADD FOREIGN KEY ([manager_id]) REFERENCES [managers] ([id])
GO

ALTER TABLE [manager_faculty] ADD FOREIGN KEY ([faculty_id]) REFERENCES [faculty] ([id])
GO

ALTER TABLE [student_timetable] ADD FOREIGN KEY ([student_course_id]) REFERENCES [student_course] ([id])
GO

ALTER TABLE [student_timetable] ADD FOREIGN KEY ([timetable_id]) REFERENCES [lecturer_timetable] ([id])
GO
