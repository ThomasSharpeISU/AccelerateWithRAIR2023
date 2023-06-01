Select
  *
from completionsAIR
where SUBSTR(ACAD_YEAR,1,4) BETWEEN '2019' and '2022'
fetch first 50 rows only