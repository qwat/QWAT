export schema=distribution
export db=sige

postgresql_autodoc -d $db -f $schema -h 172.24.171.203 -u $db -s $schema

dot -Tpng -o $schema.png $schema.dot
dot -Tsvg -o $schema.svg $schema.dot
