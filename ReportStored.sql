------------------------Reports----------------------------------
     -------R1-----
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GetStudentsR1]    Script Date: 10/30/2022 1:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetStudentsR1] @Dept_ID int as
select * from Students
where Dept_Id=@Dept_ID
------------------------------------------------------------------------------------
	 ------R2------
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GetGradesR2]    Script Date: 10/30/2022 1:42:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetGradesR2] @Student_ID int as
select sa.St_id, c.Crs_Name , (sum (sa.St_Point)*100)/10 as Grades
from St_Answers as sa
inner join Exam as e on sa.Ex_Id =e.Ex_Id
inner join course as c on e.Crs_Id =c.Crs_Id
where sa.St_Id=@Student_ID
group by sa.St_id, c.crs_Name
order by c.crs_Name
-----------------------------------------------------------------------------------
	 ------R3------
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GetNumStR3]    Script Date: 10/30/2022 1:43:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetNumStR3] @Instructor_ID int as
select p.P_Id,c.Crs_Name, count(cs.St_Id) as 'Number Of Students'
from Professor as p
inner join Course as c on p.P_Id=c.P_Id
inner join Crs_St as cs on c.Crs_Id=cs.Crs_Id
where p.P_Id=@Instructor_ID
group by p.P_Id,c.Crs_Name
order by c.Crs_Name
------------------------------------------------------------------------------------
	 -----R4-------
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GetCrsTopicsR4]    Script Date: 10/30/2022 1:44:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetCrsTopicsR4] @Course_ID int as
select Crs_Id, T_Name
from Topic
where Crs_Id=@Course_ID
order by T_Name
------------------------------------------------------------------------------------
	 -----R5-------
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GetExQuestionsR5]    Script Date: 10/30/2022 1:43:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetExQuestionsR5] @Exam_ID int as
select e.Ex_Id, q.Q_Header,CH_1 ,CH_2 ,CH_3 ,CH_4
from Ex_Q as e
inner join Questions as q on e.Q_Id = q.Q_Id
inner join Q_Choises ch on q.Q_Id=ch.Q_Id 
where e.Ex_Id=@Exam_ID
------------------------------------------------------------------------------------
	 ------R6------
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GetStAnswersR6]    Script Date: 10/30/2022 1:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetStAnswersR6] @Exam_ID int , @Student_ID int as
select q.Q_Header,CH_1, CH_2, CH_3, CH_4 ,sa.St_Answer
from St_Answers as sa
left join Questions as q on sa.Q_Id=q.Q_Id
inner join Q_Choises ch on q.Q_Id=ch.Q_Id
where sa.Ex_Id=@Exam_ID
and sa.St_Id=@Student_ID