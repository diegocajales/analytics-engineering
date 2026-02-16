# analytics-engineering

## Homework

### Question 1 - dbt Lineage and Execution

```
int_trips_unioned only
```

Because in order to execute up or downstream, it's necessary to add a '+', otherwise, it just runs the selected model

### Question 2 - dbt Tests

What happens when you run dbt test --select fct_trips?

```
dbt will fail the test, returning a non-zero exit code
```

Because we only accept values from 1 to 5

### Question 3 - Counting Records in fct_monthly_zone_revenue

```
12,184
```

It's also in the metadata, as learnt in previous Module

### Question 4 - Best Performing Zone for Green Taxis (2020)

Using this query

```sql
SELECT 
  pickup_zone
FROM
  `analytics-engineering-487300.dbt_prod.fct_monthly_zone_revenue`
WHERE
  service_type = 'Green'
ORDER BY 
  revenue_monthly_total_amount DESC
LIMIT 
  1;
```

We get the answer

```
East Harlem North
```

### Question 5 - Green Taxi Trip Counts (October 2019)

This query

```sql
SELECT 
  SUM(total_monthly_trips)
FROM
  `analytics-engineering-487300.dbt_prod.fct_monthly_zone_revenue`
WHERE
  service_type = 'Green' AND
  revenue_month = '2019-10-01'
```

Gets

```
384,624
```

### Question 6. Build a Staging Model for FHV Data

When running 

```sql
SELECT 
  COUNT(1)
FROM 
  `analytics-engineering-487300.dbt_prod.stg_fhv_tripdata`;
```

The result is

```
43244693
```