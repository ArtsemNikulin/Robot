Select  c.name as column_name, ty.name as data_type
FROM TRN.sys.Tables t 
INNER JOIN TRN.sys.objects o ON o.object_id = t.object_id
INNER JOIN TRN.sys.partitions p ON o.object_id = p.object_id
INNER JOIN TRN.sys.columns c ON c.object_id = t.object_id
INNER JOIN TRN.sys.types ty ON c.user_type_id = ty.user_type_id
WHERE t.schema_id =5 and t.name like 'employees'
GROUP BY t.name, c.name, ty.name
ORDER BY t.name

