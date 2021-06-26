#!/usr/bin/env ruby

require 'csv'
require 'time'

table = CSV::Table.new([])
table = CSV.parse(File.read("report.csv"), headers: true)

# puts table.headers
table.each do |row|
  row["Start Time"] = Time.parse(row["Start Time"])
  row["End Time"]   = Time.parse(row["End Time"])
  row["Duration"]   = row["End Time"]  - row["Start Time"]

  row["Start Time"] = row["Start Time"].strftime("%Y/%m/%d %H:%M:%S")
  row["End Time"]   = row["End Time"].strftime("%Y/%m/%d %H:%M:%S")

  puts row["Monitor Name"]
  puts row["Start Time"]
  puts row["End Time"]
  puts row["Duration"] 
end

# Write the data to a new file
CSV.open("converted.csv", "w") do |csv|
  csv << table.headers
  table.each do |row|
    csv << row
  end
end
