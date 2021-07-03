"""
2.1 Write a query that outputs the names of employees that Oliver Warbucks directly supervises.
"""
SELECT name FROM records
    WHERE supervisor = "Oliver Warbucks";

"""
2.2 Write a query that outputs all information about employees that supervise themselves.
"""
SELECT * FROM records
    WHERE name = supervisor;

"""
2.3 Write a query that outputs the names of all employees with salary greater than
50,000 in alphabetical order.
"""
SELECT name FROM records
    WHERE salary > 50000 ORDER BY name;

"""
3.1 Write a query that outputs the meeting days and times of all employees directly
supervised by Oliver Warbucks.
"""
SELECT m.day, m.time FROM records AS r, meetings AS m
    WHERE r.division = m.division AND r.supervisor = "Oliver Warbucks";

"""
3.2 Write a query that outputs the names of employees whose supervisor is in a dierent
division.
"""
SELECT e.name FROM records AS e, records AS supervisor
    WHERE e.supervisor = s.name AND e.division != s.division;

"""
Write a query that outputs the names of all pairs of employees that have a meeting
at the same time. Make sure that if A|B appears in your output, B|A does not
appear as well (A|A and B|B should additionally not appear).
"""
SELECT e1.name, e2.name FROM records AS e1, records AS e2, meetings AS m1, meetings AS m2
    WHERE e1.division = m1.division AND e2.division = m2.division AND
          m1.time = m2.time AND m1.day = m2.day AND e1.name < e2.name;


"""
4.1 Write a query that outputs each supervisor and the sum of salaries of all the em-
ployees they supervise.
"""
SELECT supervisor, SUM(salary) FROM records GROUP BY supervisor;

"""
4.2 Write a query that outputs the days of the week for which fewer than 5 employees
have a meeting. You may assume no department has more than one meeting on a
given day.
"""
SELECT m.day FROM records AS e, meetings AS m
    WHERE e.division = m.division GROUP BY m.day HAVING COUNT(*) < 5;

"""
4.3 Write a query that outputs all divisions for which there is more than one employee,
and all pairs of employees within that division have a salary less than 100,000.
"""
SELECT e1.division FROM records AS e1, records AS e2
    WHERE e1.name != e2.name AND e1.division = e2.division
    GROUP BY e1.division HAVING MAX(e1.salary + e2.salary) < 10000;