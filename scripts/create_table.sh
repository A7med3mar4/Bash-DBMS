#! /bin/bash
db_path="./Databases"
database_name=$1
#read name from user
echo -n "enter the name of table":
read table_name
# enter the database folder

#check if table exists or not
if [ -f "$db_path/$database_name/$table_name" ];then
    echo "the table already exist"
else
#create table
    touch "$db_path/$database_name/$table_name"
    echo "the $table_name table is created"
fi
