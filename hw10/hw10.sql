CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE min < height AND height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT parents.child FROM dogs, parents
    WHERE dogs.name = parents.parent
    ORDER BY dogs.height desc;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT c1.name as sibling1, c2.name as sibling2, c1.size as size
  from size_of_dogs as c1, size_of_dogs as c2, parents as p1, parents as p2
    where c1.name = p1.child and c1.size = c2.size and
      c2.name = p2.child and p1.parent = p2.parent and c1.name < c2.name
    order by c1.size;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT sibling1 || ' and ' || sibling2 || ' are '|| size || ' siblings' from siblings;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here
INSERT into stacks_helper
  SELECT name, height, height FROM dogs ORDER BY height;

INSERT into stacks_helper
  SELECT dogs || ', ' || name, stack_height + height, 
    height FROM stacks_helper, dogs WHERE height > last_height;

INSERT into stacks_helper
  SELECT DISTINCT dogs || ', ' || name, stack_height + height,
    height FROM stacks_helper, dogs WHERE height > last_height;

INSERT into stacks_helper
  SELECT DISTINCT dogs || ', ' || name, stack_height + height,
    height FROM stacks_helper, dogs WHERE height > last_height;

CREATE TABLE stacks AS
  SELECT dogs, stack_height FROM stacks_helper
    WHERE stack_height >= 170
    ORDER BY stack_height;
