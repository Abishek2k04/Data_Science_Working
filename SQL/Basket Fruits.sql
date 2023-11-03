CREATE TABLE basket01(
  a INT PRIMARY KEY,
  fruits1 VARCHAR (100) NULL
  );
CREATE TABLE basket02(
  b INT PRIMARY KEY,
  fruits2 VARCHAR (100) NULL
  );
  INSERT INTO basket01(a,fruits1)
  VALUES
        (1,'GRAPE'),
		(2,'APPLE'),
		(3,'GRAPE');
  INSERT INTO basket02(b,fruits2)
  VALUES
        (1,'DRAGONFRUIT'),
		(2,'APPLE'),
		(3,'GRAPE');
SELECT*FROM basket01;
SELECT*FROM basket02;

SELECT a,fruits1, b,fruits2
FROM basket01
INNER JOIN basket02
on fruits1=fruits2;

SELECT a,fruits1, b,fruits2
FROM basket01
LEFT JOIN basket02
on fruits1=fruits2;

SELECT a,fruits1, b,fruits2
FROM basket01
RIGHT JOIN basket02
on fruits1=fruits2;

SELECT a,fruits1, b,fruits2
FROM basket01
FULL OUTER JOIN basket02
on fruits1=fruits2;

SELECT a,fruits1, b,fruits2
FROM basket01
LEFT JOIN basket02
on fruits1=fruits2
WHERE b is NOT NULL;

SELECT a,fruits1, b,fruits2
FROM basket01
LEFT JOIN basket02
on fruits1=fruits2
WHERE b is NOT NULL;

SELECT*FROM basket01
UNION
SELECT*FROM basket02
order by fruits1

SELECT*FROM basket01
INTERSECT
SELECT*FROM basket02
order by fruits1
				
SELECT*FROM basket01
UNION
SELECT*FROM basket02
order by fruits1				