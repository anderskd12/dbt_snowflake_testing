WITH RankedSurfers AS (
  SELECT
    SURFERS.SURFER_NAME,
    HOME_COUNTRY,
    STANCE,
    SURF_SPOT,
    SURF_SPOT_RATING,
    ROW_NUMBER() OVER (PARTITION BY SURFERS.SURFER_NAME ORDER BY SURF_SPOT_RATING DESC) AS rn
FROM SURFERS
LEFT JOIN SURF_SPOTS_FAV ON SURF_SPOTS_FAV.SURFER_NAME = SURFERS.SURFER_NAME
WHERE SURFERS.SURFER_NAME LIKE 'KELLY%'
)

SELECT
  SURFER_NAME,
  HOME_COUNTRY,
  STANCE,
  SURF_SPOT,
  SURF_SPOT_RATING
FROM RankedSurfers
WHERE rn = 1