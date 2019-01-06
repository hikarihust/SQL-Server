-- locacal temp
CREATE table #sample_temp(
	Id int,
	Name nvarchar(50),
)

INSERT INTO #sample_temp VALUES (1, 'name 1');

SELECT * FROM #sample_temp;

--global tamp
CREATE table ##sample_temp(
	id Int,
	name nvarchar(50)
)