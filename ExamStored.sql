----------------------------------Exam------------------------------
                   -----GENERATE EXAM-----
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GenerateExam2]    Script Date: 10/29/2022 10:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GenerateExam2] @crsname nvarchar(50) , @nomcq int, @notf int
as
begin
declare @exid int =(SELECT MAX(EX_ID)+1 FROM EXAM) ,
@crsid int=(select Crs_Id from Course where Crs_Name=@crsname)
CREATE table #test2 
(Q_Id int
,Q_Header nvarchar(260)
,CH_1 nvarchar(260)
,CH_2 nvarchar(260)
,CH_3 nvarchar(260)
,CH_4 nvarchar(260)
,Ex_Id int
 )
 insert into #test2
select * 
from
(
(select top (@notf) q.Q_Id,  Q_Header,CH_1,CH_2,''AS CH_3,''AS CH_4 ,@exid as Ex_Id
from Questions q
left join Q_Choises c on q.Q_Id=c.Q_Id
inner join Course s on s.Crs_Id=q.Crs_id
where Crs_Name=@crsname and Q_Type ='T or F'
 ORDER BY NEWID())
 union
 (select top (@nomcq) q.Q_Id, Q_Header,CH_1,CH_2,CH_3,CH_4 ,@exid as Ex_Id
from Questions q
left join Q_Choises c on q.Q_Id=c.Q_Id
inner join Course s on s.Crs_Id=q.Crs_id
where Crs_Name=@crsname and Q_Type ='MCQ' ORDER BY NEWID())
) as l
select * from #test2

-------------------------
insert into EXAM (Ex_Id ,Crs_Id)
VALUES (@exid, @crsid)
-------------------------
insert into Ex_Q (Ex_Id,Q_Id)
select * from
(
select  Ex_Id, Q_Id from  #test2 

)as m
end
--
----------------------------------------------------------------------------------
                               -----ANSWERS-----
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[GetAnswers]    Script Date: 10/29/2022 9:40:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[GetAnswers] @Ex_Id int ,@St_Id int , @Answer nvarchar(260)
AS

DECLARE @qid int =(SELECT ex.Q_Id 
		           FROM Ex_Q ex
		           INNER JOIN Questions Q  ON ex.Q_Id= q.Q_Id
		           INNER JOIN Q_Choises ch ON ch.Q_Id =q.Q_Id
		           WHERE (@Answer = CH_1
		                  OR @Answer =CH_2
		                  OR @Answer= CH_3
		                  OR @Answer= CH_4)
                   AND ex.Ex_Id=@Ex_Id)


INSERT INTO St_Answers (Ex_Id,Q_Id,St_Id,St_Answer,St_Point)
VALUES 
( @Ex_Id,@qid,@St_Id,@Answer,
CASE
     WHEN @Answer=(select Q_Model_Answer
                             from Questions	
							 where Q_Id=@qid) THEN 1
	 WHEN @Answer!=(select Q_Model_Answer
                             from Questions	
							 where Q_Id=@qid) THEN 0
     END
)
---------------------------------------------------------
                  -----CORRECTION-------
USE [Project]
GO
/****** Object:  StoredProcedure [dbo].[CORRECTION]    Script Date: 10/29/2022 11:14:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[CORRECTION] @exid int, @stid int
AS
CREATE TABLE #CORR (GRADE INT)
INSERT INTO #CORR
SELECT * FROM
(SELECT sum(st_point) over(partition by ex_id, st_id) as Grade
FROM St_Answers
where Ex_Id=@exid
and St_Id=@stid) AS Q
SELECT TOP 1 (GRADE*100)/10 FROM #CORR