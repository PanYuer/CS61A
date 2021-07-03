.read lab12.sql

CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students
              GROUP BY smallest HAVING count(smallest) = 1;

CREATE TABLE fa19favpets AS
  SELECT pet, count(pet) AS count_pet FROM students
          GROUP BY pet ORDER BY count_pet desc, pet LIMIT 10;


CREATE TABLE fa19dog AS
  SELECT * FROM fa19favpets WHERE pet = 'dog';


CREATE TABLE obedienceimages AS
  SELECT seven, instructor, count(instructor) FROM students
          WHERE seven = '7' GROUP BY instructor;
