-----------------------------Tables----------------------------------------------
--1) course

--select (Get+ Table name)
create proc GetCourse @id int
as 
if exists ( select Crs_Id from Course where Crs_Id=@id)
  select * 
  from Course
  where Crs_Id=@id
  else
  select 'invalid'
  --execution
  GetCourse 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsCourse @id int, @name nvarchar(50)
as
  if not exists (select crs_id from Course where Crs_Id=@id)
   insert into Course (Crs_Id,Crs_Name)
   values (@id,@name)
   else 
   select 'Duplicate id'
   --execution
   InsCourse 300 , 'power bi'
-----------------------------------------
--update (Up+ table name)
create proc UpCourse @oldname nvarchar(50) ,@newname nvarchar(50)
as
if exists ( select Crs_Name from Course where Crs_Name=@oldname)
  update Course
  set Crs_Name=@newname
  where Crs_Name= @oldname
  else 
  select 'error'
  --execution
  UpCourse 'oop','power bi'
-------------------------------------------
--delete(D+ table name)
create proc DCourse @id int, @duration int
as
  if exists(select crs_id, Crs_Duration from Course where Crs_Id=@id and Crs_Duration=@duration)
  delete from Course 
  where Crs_Id=@id and Crs_Duration=@duration
  else
  select 'invalid info'
  --execute
  DCourse 100,2

----------------------------------------------------------------------------------------------------------
--2)crs_st
--select (Get+ Table name)
create proc GetCrs_St @id int
as 
if exists (select St_Id from Crs_St where St_Id=@id)
  select * 
  from Crs_St
  where St_Id=@id
  else 
  select'invalid'
  --execution
  GetCrs_St 1
  --------------------------------------------
--insert (Ins+ table name)
Create proc InsCrs_St @sid int ,@cid int
as
  if not exists (select St_Id, crs_id from Crs_St where St_Id=@sid and Crs_Id=@cid)
   insert into Crs_St (st_Id,Crs_Id)
   values (@sid,@cid)
   else 
   select 'Duplicate id'
   --execution
   InsCrs_St 1 , 100
-----------------------------------------
--update (Up+ table name)
create proc UpCrs_St @oldsid int, @newsid int 
as
if exists( select st_Id from Crs_St where St_Id=@oldsid)
  update Crs_St
  set St_Id=@newsid
  where St_Id= @oldsid
  else
  select 'invalid student id'
  --execution
 UpCrs_St 50, 100
-------------------------------------------
--delete(D+ table name)
create proc DCrs_St @sid int, @cid int
as
  if exists(select St_Id, crs_id from Crs_St where St_Id=@sid and Crs_Id=@cid)
  delete from Crs_St 
  where St_Id =@sid and Crs_Id=@cid 
  else
  select 'invalid info'
  --execute
  DCrs_St 100,2
------------------------------------------------------------------------------------
--3)Department
--select (Get+ Table name)
create proc GetDepartment @id int
as 
if exists ( select Dept_Id from Department where Dept_Id=@id)
  select * 
  from Department
  where Dept_Id=@id
  else
  select 'invalid'
  --execution
  GetDepartment 20
--------------------------------------------
--insert (Ins+ table name)
Create proc InsDepartment @id int ,@name nvarchar(50)
as
  if not exists (select Dept_Id, Dept_Name from Department where Dept_Id=@id and Dept_Name=@name)
   insert into Department (Dept_Id,Dept_Name)
   values (@id,@name)
   else 
   select 'Duplicate id'
   --execution
   InsDepartment 1 , 'nn'
-----------------------------------------
--update (Up+ table name)
create proc UpDepartment @oldname nvarchar(50), @newname nvarchar(50) 
as
if exists( select Dept_Name from Department where Dept_Name=@oldname)
  update Department
  set Dept_Name=@newname
  where Dept_Name= @oldname
  else
  select 'invalid'
  --execution
 UpDepartment 'nn', ''
-------------------------------------------
--delete(D+ table name)
create proc DDepartment @name nvarchar(50)
as
if exists( select Dept_Name from Department where Dept_Name=@name)
  delete from Department 
  where Dept_Name =@name  
  else
  select 'invalid info'
  --execute
  DDepartment 'nn'
------------------------------------------------------------------------------------
--4)Ex_Q
--select (Get+ Table name)
create proc GetEx_Q @id int
as 
if exists ( select Ex_Id from Ex_Q where Ex_Id=@id)
  select * 
  from Ex_Q
  where Ex_Id=@id
  else
  select 'invalid'
  --execution
  GetEx_Q 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsEx_Q @exid int, @qid int
as
  if not exists (select Ex_Id,Q_Id from Ex_Q where Ex_Id=@exid and Q_Id=@qid)
   insert into Ex_Q (Ex_Id,Q_Id)
   values (@exid,@qid)
   else 
   select 'Duplicate id'
   --execution
   InsEx_Q 1,1
-----------------------------------------
--update (Up+ table name)
create proc UpEx_Q @oldexid int ,@newexid int
as
if exists ( select Ex_Id from Ex_Q where Ex_Id=@oldexid)
  update Ex_Q
  set Ex_Id=@newexid
  where Ex_Id= @oldexid
  else 
  select 'error'
  --execution
  UpEx_Q 1,2
-------------------------------------------
--delete(D+ table name)
create proc DEx_Q @qid int
as
  if exists(select Q_Id from Ex_Q where Q_Id=@qid)
  delete from Ex_Q 
  where Q_Id=@qid 
  else
  select 'invalid info'
  --execute
  DEx_Q 2

----------------------------------------------------------------------------------------------------------
--5) Exam

--select (Get+ Table name)
create proc GetExam @id int
as 
if exists ( select Ex_Id from Exam where Ex_Id=@id)
  select * 
  from Exam
  where Ex_Id=@id
  else
  select 'invalid'
  --execution
  GetExam 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsExam @exid int, @crsid int
as
  if not exists (select Ex_Id,Crs_Id from Exam where Ex_Id=@exid and Crs_Id=@crsid)
   insert into Exam (Ex_Id,Crs_Id)
   values (@exid,@crsid)
   else 
   select 'Duplicate id'
   --execution
   InsExam 300 , 100
-----------------------------------------
--update (Up+ table name)
create proc UpExam @oldcrsid int ,@newcrsid int
as
if exists ( select Crs_Id from Exam where Crs_Id=@oldcrsid)
  update Exam
  set Crs_Id=@newcrsid
  where Crs_Id= @newcrsid
  else 
  select 'error'
  --execution
  UpExam 100, 200
-------------------------------------------
--delete(D+ table name)
create proc DExam @exid int
as
  if exists(select Ex_Id from Exam where Ex_Id=@exid)
  delete from Exam 
  where Ex_Id=@exid 
  else
  select 'invalid info'
  --execute
  DExam 300

-------------------------------------------------------------------------------------------------
--6) P_St

--select (Get+ Table name)
create proc GetP_St @id int
as 
if exists ( select St_Id from P_St where St_Id=@id)
  select * 
  from P_St
  where St_Id=@id
  else
  select 'invalid'
  --execution
  GetP_St 1
--------------------------------------------
--insert (Ins+ table name)
Create proc InsP_St @stid int, @pid int
as
  if not exists (select St_Id, P_Id from P_St where St_Id=@stid and P_Id=@pid)
   insert into P_St (St_Id,P_Id)
   values (@stid,@pid)
   else 
   select 'Duplicate id'
   --execution
   InsP_St 1,1
-----------------------------------------
--update (Up+ table name)
create proc UpP_St @oldstid int ,@newstid int
as
if exists ( select St_Id from P_St where St_Id=@oldstid)
  update P_St
  set St_Id=@newstid
  where St_Id= @oldstid
  else 
  select 'error'
  --execution
  UpP_St 50,1
-------------------------------------------
--delete(D+ table name)
create proc DP_St @stid int
as
  if exists(select st_id from P_St where st_Id=@stid)
  delete from P_St 
  where St_Id=@stid
  else
  select 'invalid info'
  --execute
  DP_St 50

-------------------------------------------------------------------------------------------------
--7) Professor

--select (Get+ Table name)
create proc GetProfessor @id int
as 
if exists ( select P_Id from Professor where P_Id=@id)
  select * 
  from Professor
  where P_Id=@id
  else
  select 'invalid'
  --execution
  GetProfessor 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsProfessor @pid int
as
  if not exists (select P_Id from Professor where P_Id=@pid)
   insert into Professor (P_Id)
   values (@pid)
   else 
   select 'Duplicate id'
   --execution
   InsProfessor 1
-----------------------------------------
--update (Up+ table name)
create proc UpProfessor @oldname nvarchar(50) ,@newname nvarchar(50)
as
if exists ( select P_Name from Professor where P_Name=@oldname)
  update Professor
  set P_Name=@newname
  where P_Name= @oldname
  else 
  select 'error'
  --execution
  UpProfessor 'oop','power bi'
-------------------------------------------
--delete(D+ table name)
create proc DProfessor @id int
as
  if exists(select P_Id from Professor where P_Id=@id)
  delete from Professor 
  where P_Id=@id 
  else
  select 'invalid info'
  --execute
  DProfessor 100

-------------------------------------------------------------------------------------------------
--8) Q_Choises

--select (Get+ Table name)
create proc GetQ_Choises @qid int
as 
if exists ( select Q_Id from Q_Choises where Q_Id=@qid)
  select * 
  from Q_Choises
  where Q_Id=@qid
  else
  select 'invalid'
  --execution
  GetQ_Choises 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsQ_Choises @qid int, @qch nvarchar(260)
as
  if not exists (select Q_Id, Q_Choises from Q_Choises where Q_Id=@qid and Q_Choises=@qch)
   insert into Q_Choises (Q_Id,Q_Choises)
   values (@qid,@qch)
   else 
   select 'Duplicate id'
   --execution
   InsQ_Choises 1 , 'power bi'
-----------------------------------------
--update (Up+ table name)
create proc UpQ_Choises @oldch nvarchar(260) ,@newch nvarchar(260)
as
if exists ( select Q_Choises from Q_Choises where Q_Choises=@oldch)
  update Q_Choises
  set Q_Choises=@newch
  where Q_Choises= @oldch
  else 
  select 'error'
  --execution
  UpQ_Choises 'oop','power bi'
-------------------------------------------
--delete(D+ table name)
create proc DQ_Choises @id int
as
  if exists(select Q_Id from Q_Choises where Q_Id=@id)
  delete from Q_Choises 
  where Q_Id=@id 
  else
  select 'invalid info'
  --execute
  DQ_Choises 100

-------------------------------------------------------------------------------------------------
--9) Questions

--select (Get+ Table name)
create proc GetQuestions @id int
as 
if exists ( select q_Id from Questions where q_Id=@id)
  select * 
  from Questions
  where Q_Id=@id
  else
  select 'invalid'
  --execution
  GetQuestions 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsQuestions @qid int, @type nvarchar(50), @header nvarchar(260),
@answer nvarchar(260), @mark int , @pid int, @crsid int
as
  if not exists (select Q_Id from Questions where Q_Id=@qid)
   insert into Questions 
   values (@qid,@type, @header, @answer,@mark ,@pid, @crsid)
   else 
   select 'Duplicate id'
   --execution
   InsQuestions 300 , 'power bi'
-----------------------------------------
--update (Up+ table name)
create proc UpQuestions @oldanswer nvarchar(260) ,@newanswer nvarchar(260)
as
if exists ( select Q_Model_Answer from Questions where Q_Model_Answer=@oldanswer)
  update Questions
  set Q_Model_Answer=@newanswer
  where Q_Model_Answer= @oldanswer
  else 
  select 'error'
  --execution
  UpQuestions 'oop','power bi'
-------------------------------------------
--delete(D+ table name)
create proc DQuestions @qid int
as
  if exists(select Q_Id from Questions where Q_Id=@qid)
  delete from Questions 
  where q_Id=@qid 
  else
  select 'invalid info'
  --execute
  DQuestions 100

-------------------------------------------------------------------------------------------------
--10) St_Answers

--select (Get+ Table name)
create proc GetSt_Answers @id int
as 
if exists ( select ex_Id from St_Answers where ex_Id=@id)
  select * 
  from St_Answers
  where ex_Id=@id
  else
  select 'invalid'
  --execution
  GetSt_Answers 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsSt_Answers @exid int, @qid int
as
  if not exists (select Ex_Id,Q_Id from St_Answers where Ex_Id=@exid and Q_Id=@qid)
   insert into St_Answers (Ex_Id,Q_Id)
   values (@exid,@qid)
   else 
   select 'Duplicate id'
   --execution
   InsSt_Answers 300 , 2
-----------------------------------------
--update (Up+ table name)
create proc UpSt_Answers @oldexid int ,@newexid int
as
if exists ( select Ex_Id from St_Answers where Ex_Id=@oldexid)
  update St_Answers
  set Ex_Id=@newexid
  where Ex_Id= @oldexid
  else 
  select 'error'
  --execution
  UpSt_Answers ,
-------------------------------------------
--delete(D+ table name)
create proc DSt_Answers @id int
as
  if exists(select Ex_Id from St_Answers where Ex_Id=@id)
  delete from St_Answers 
  where Ex_Id=@id 
  else
  select 'invalid info'
  --execute
  DSt_Answers 100

-------------------------------------------------------------------------------------------------
--11) Students

--select (Get+ Table name)
create proc GetStudents @id int
as 
if exists ( select St_Id from Students where St_Id=@id)
  select * 
  from Students
  where St_Id=@id
  else
  select 'invalid'
  --execution
  GetStudents 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsStudents @id int
as
  if not exists (select st_id from Students where st_Id=@id)
   insert into Students (st_Id)
   values (@id)
   else 
   select 'Duplicate id'
   --execution
   InsStudents 300 
-----------------------------------------
--update (Up+ table name)
create proc UpStudents @oldid int ,@newid int
as
if exists ( select st_id from Students where st_id=@oldid)
  update Students
  set St_Id=@newid
  where St_Id= @oldid
  else 
  select 'error'
  --execution
  UpStudents ,
-------------------------------------------
--delete(D+ table name)
create proc DStudents @id int
as
  if exists(select St_Id from Students where St_Id=@id)
  delete from Students 
  where St_Id=@id 
  else
  select 'invalid info'
  --execute
  DStudents 100

-------------------------------------------------------------------------------------------------
--12) Topic

--select (Get+ Table name)
create proc GetTopic @id int
as 
if exists ( select t_Id from Topic where t_Id=@id)
  select * 
  from Topic
  where t_Id=@id
  else
  select 'invalid'
  --execution
  GetTopic 100
--------------------------------------------
--insert (Ins+ table name)
Create proc InsTopic @crsid int, @tid int
as
  if not exists (select crs_id ,T_Id from Topic where Crs_Id=@crsid and T_Id=@tid)
   insert into Topic (Crs_Id,T_Id)
   values (@crsid,@tid)
   else 
   select 'Duplicate id'
   --execution
   InsTopic 300 , 1
-----------------------------------------
--update (Up+ table name)
create proc UpTopic @oldtid int ,@newtid int
as
if exists ( select T_Id from Topic where T_Id=@oldtid)
  update Topic
  set T_Id=@newtid
  where T_Id= @oldtid
  else 
  select 'error'
  --execution
  UpTopic ,
-------------------------------------------
--delete(D+ table name)
create proc DTopic @id int
as
  if exists(select T_Id from Topic where T_Id=@id)
  delete from Topic 
  where T_Id=@id 
  else
  select 'invalid info'
  --execute
  DTopic 100

-------------------------------------------------------------------------------------------------