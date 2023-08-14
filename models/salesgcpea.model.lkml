connection: "salesgcpea"

# include all the views
include: "/views/**/*.view"

datagroup: salesgcpea_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: salesgcpea_default_datagroup

explore: customers {}

explore: date {}

explore: markets {}

explore: products {}

explore: transactions {}
