-- QUALITY CHECK -- 

-- Check For Nulls or Duplicates in Primary Key
-- Expectation: No Result
SELECT
prd_id,
COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for unwanted Spaces
-- Expectation: No Results
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLs or Negative Numbers
-- Expectation: No Result
SELECT prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Data Standardization & Consistency
SELECT prd_line
FROM bronze.crm_prd_info

-- Check for Invalid Date Orders
SELECT *
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt

SELECT * 
FROM silver.crm_prd_info