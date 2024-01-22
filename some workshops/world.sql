use world;

(SELECT name , population FROM country c
WHERE c.population > 20000000
LIMIT 0,5)
UNION
(SELECT name , population FROM city cc
WHERE cc.population > 5000000
LIMIT 0,5)
