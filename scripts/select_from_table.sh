#! /bin/bash
database_name=$1
db_path="./Databases"
echo -n "Enter table name: "
read table_name
table_path="$db_path/$database_name/$table_name"
# check table exists
if [ -f "$table_path" ]; then
    # select all from table
    echo "1) Select All"
    echo "2) Select With WHERE"
    echo -n "Choose option: "
    read choice
    case $choice in
        1)
             #print name of columns
            columns=$(sed -n '3p' "$table_path")
            echo "----------------------------"
            echo "$columns"
            echo "----------------------------"
            # -------- Select All --------
            awk -F: 'NR > 3 { print }' "$table_path"
            ;;
        2)
            # -------- Select With WHERE --------
            echo -n "Enter column name: "
            read col_name
            echo -n "Enter value: "
            read value
            #print name of columns
            columns=$(sed -n '3p' "$table_path")
            echo "----------------------------"
            echo "$columns"
            echo "----------------------------"
            # get column number
            col_num=$(echo "$columns" | awk -F: -v col="$col_name" '{
                for (i=1; i<=NF; i++) {
                    if ($i == col) {
                        print i
                        exit
                    }
                }
            }')
            # check column exists
            if [ -z "$col_num" ]; then
                echo "Column not found!"
                exit 1
            fi
            # select rows
            awk -F: -v col="$col_num" -v val="$value" \
                'NR > 3 && $(col) == val { print }' "$table_path"
            ;;

        *)
            echo "Invalid choice!"
            ;;
        esac

else
    echo "Table does not exist!"
    exit 1
fi 