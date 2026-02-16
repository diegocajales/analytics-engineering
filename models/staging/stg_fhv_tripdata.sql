select
    dispatching_base_num,
    affiliated_base_number,

    pickup_datetime,
    dropoff_datetime,

    -- Rename to match conventions
    pulocationid as pickup_location_id,
    dolocationid as dropoff_location_id,

    sr_flag
from {{ source('raw', 'fhv_tripdata') }}
where dispatching_base_num is not null
