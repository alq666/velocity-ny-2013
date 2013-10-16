# Alerting: More Signal, Less Noise, Less Pain

This is the code and data supporting [my presentation](http://velocityconf.com/velocityny2013/public/schedule/detail/30062) at Velocity NY 2013.

## General flow

1. Turn your PagerDuty flow into a csv
2. Load the csv into a SQL database (here, postgres)
3. Massage the data for easier feature extraction
4. Visualize the data (here, in R)

## What I used for the presentation

* alerts.csv` the anonymized version of a production alert stream
* PostgreSQL to run most queries
* R for visualization (the excellent ggplot2)

# Replicating the analyses on your own data

## Get data out of PagerDuty

1. Install `pygerduty` with `pip install pygerduty`.
2. Create a read-only API token in your PagerDuty account.
3. Run the following script

```python
import pygerduty
from datetime import datetime
pd = pygerduty.PagerDuty(subdomain='XXX', api_token='YYY')
incidents = pd.incidents.list()

# postgresql schema
# id serial primary key,
# ts timestamp not null, -- hourly timestamp
# src text not null,     -- src == PagerDuty
# typ varchar not null,  -- error, success, warning
# pd_id text not null,  -- external identifier
# name text not null, -- alert name
# service text not null -- service name

print(
for i in range(len(incidents)):
    incident = incidents[i]
    print("%d,%s,PagerDuty,%s,%s,%s".format(i+1,
                                            incident.created_on,
                                            incident.trigger_summary_data.description,
                                            incident.service.name))
```
