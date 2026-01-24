-- use window function (method 1 )
SELECT DISTINCT num as ConsecutiveNums
FROM (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev1,
        LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1
AND num = prev2;


--  use self join (Method 2 )
SELECT distinct l1.num AS ConsecutiveNums
FROM Logs l1
 JOIN Logs l2 ON l1.id = l2.id + 1
 JOIN Logs l3 ON l1.id = l3.id + 2
WHERE l1.num = l2.num
  AND l2.num = l3.num;