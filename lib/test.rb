rows = ["a","b","c"]
columns = ["1", "2", "3"]
h = {}
 rows.each {|row| 
  columns.each {|column|
    h[row+column] = ""}
}

puts h