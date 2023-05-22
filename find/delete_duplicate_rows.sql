DELETE FROM myschema.mytable a USING (
      SELECT MIN(ctid) as ctid, id
        FROM myschema.mytable 
        GROUP BY id HAVING COUNT(*) > 1
      ) b
      WHERE a.id = b.id 
      AND a.ctid <> b.ctid
