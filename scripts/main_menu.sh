#!/bin/bash

# create main menu
select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit"
do 
    case $REPLY in
        1)
        echo "Create Database"
        ./scripts/create_database.sh
        ;;
        2)
        echo "List Databases"
        ./scripts/list_databases.sh
        ;;
        3)
        echo "Connect To Databases"
        ./scripts/connect_to_database.sh
        ;;
        4)
        echo "Drop Database"
        ./scripts/drop_databases.sh
        ;;
        5)
        echo "Exit"
        exit
        ;;
        *)
        echo "$REPLY is not one of the choices"
        exit
        ;;
    esac
done
