["id", "created_at", "name", "has_test", "alternate_url"] as $columns

| .items
| map(. as $row | $columns | map($row[.])) as $rows
| $columns, $rows[]
| @csv