# Data

## Backup

This data is backed up in s3 at s3://map-input-output/bertie_shaw/dbt-test-project
- To download run `make sync_data_from_s3`
- To upload run `make sync_data_to_s3`

**You will first need to configure your environment for cli access to aws - see main README

## Link to github
If you are looking at this on s3, it is related to the project found here: https://github.com/bbc/dbt-test-project