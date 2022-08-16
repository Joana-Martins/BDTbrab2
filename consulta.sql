DROP DATABASE IF EXISTS db_trab2;
CREATE DATABASE db_trab2;

DROP TABLE IF EXISTS Schedule;

CREATE TABLE Schedule(
       time SERIAL NOT NULL,
       t INTEGER NOT NULL,
       op VARCHAR(1) NOT NULL,
       attr VARCHAR(1)
);

INSERT INTO Schedule (t, op, attr)
VALUES (1,'R','X'),
       (2, 'R', 'X'),
       (2, 'W', 'X'),
       (1, 'W', 'X'),
       (2, 'C', NULL),
       (1, 'C', NULL);

DROP TABLE IF EXISTS edge;
CREATE TABLE edge(
        id SERIAL PRIMARY KEY,
        parent INTEGER,
        child INTEGER NOT NULL,
        UNIQUE (child, parent)
);

DROP TABLE IF EXISTS NewSchedule;
SELECT * INTO NewSchedule
FROM(
     SELECT t, op, attr,
      Lead(t) OVER (ORDER by time) as NextT, 
      Lead(op) OVER (ORDER by time) as NextOp,
      Lead(attr) OVER (ORDER by time) as NextAttr
     FROM Schedule
)Schedule;

DROP TABLE IF EXISTS Graph;
SELECT t, NextT INTO Graph
FROM NewSchedule
WHERE attr = NextAttr AND ((op = 'R' AND NextOp = 'W')
      OR (op = 'W' AND NextOp = 'R') OR (op = 'W' AND NextOp = 'W')) 
      AND t != NextT;

INSERT INTO edge (parent, child)
SELECT t, NextT 
FROM Graph;

WITH RECURSIVE search_graph(parent, child, id, depth, path, Resultado)
    AS (
            SELECT e.parent, e.child, e.id, 1,
              ARRAY[e.id],
              false
            FROM edge e
          UNION ALL
            SELECT e.parent, e.child, e.id, sg.depth + 1,
              path || e.id,
              e.id = ANY(path)
            FROM edge e, search_graph sg
            WHERE e.parent = sg.child AND NOT Resultado
    )
    SELECT Resultado FROM search_graph ORDER BY Resultado DESC LIMIT 1;



