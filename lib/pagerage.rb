require 'json'
require 'rest_client'
require 'sequel'
require 'time'

Sequel.datetime_class = DateTime

DB = Sequel.connect ENV['DATABASE_URL'] || 'postgres://localhost/pagerage'

DB.create_table :incidents do
  primary_key :id
  Integer     :incident_number
  DateTime    :pagerduty_created_on
  String      :service_name
  String      :subject
  Text        :data
end unless DB.table_exists?(:incidents)

require 'pagerage/config'
require 'pagerage/incident'
require 'pagerage/incidents_fetcher'
require 'pagerage/incidents_parser'
require 'pagerage/version'
