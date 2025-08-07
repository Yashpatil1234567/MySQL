SELECT MAX(marks) AS Second_Highest
FROM Students
WHERE marks < (
    SELECT MAX(marks) FROM Students
);
