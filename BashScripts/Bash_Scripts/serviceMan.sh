#!/bin/bash
STATUS="$(systemctl is-active apache2)"

if [ 1 ]
then
   printf "apache2 service is running"
   printf "Enter 1 to restart the service\n
           Enter 2 to know the status of the service\n
           Enter 3 to stop the service\n
           Enter 0 to exit the script\n"
        read -p "Choose one of the above options: " choice
        case $choice in

          1)
                printf "Restarting service...."
                $(systemctl restart apache2) ;;
          2)
                printf "Status of the service: "
                $(systemctl status apache2) ;;
          3)
                printf "Stopping service...."
                $(systemctl stop apache2) ;;
          0)
                printf "Exiting the script......"
                ;;

      esac
      #     *)
      #           printf "Wrong option chosen!"
                
fi


exit
