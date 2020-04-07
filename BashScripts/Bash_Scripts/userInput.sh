#!/bin/bash
EXIT=0
CHOICE=0
#Defining display function
function Display () {
    echo "Press 1 for file and folder manipulation."
    # echo "Press 2 for services manipulation."
    echo "Press 0 to exit the script."
}

function TakeUserInput () {
	read -p "Choose any of the above options: " CHOICE
	clear
}

function ProcessUserInput () {
    case $CHOICE in
        1)
            FaFManipulation ;;
        2)
            ServManipulation ;;
        0)  
            EXIT=1 ;;
        *)
            echo "Wrong option selected! Make the selection again." ;;

    esac
}
#Function for executing file and folder manipulation commands
function FaFManipulation () {
    echo "Press 1 to make a directory"
    echo "Press 2 to make a file"
    echo "Press 3 to delete a directory"
    echo "Press 4 to delete a file"
    echo "Press 5 to view current directory contents"
    echo "Press 0 to go back to main menu"
    TakeUserInput
    case $CHOICE in 
        1) 
            read -p "Enter a directory name: " CHOICE
	   clear
            if [ -d "$CHOICE" ]
                then
                    echo "Cannot create ${CHOICE} as it already exits!"
                else
                    sudo mkdir $CHOICE
                    echo "${CHOICE} directory is created. "
            fi        
            ;;
        2)  
            
            
            read -p "Enter a file name: " CHOICE
	   clear
            if [ -d "$CHOICE" ]
                then
                    echo "Cannot create ${CHOICE} as it already exits!"
                else    
                    sudo touch $CHOICE
                    echo "${CHOICE} file is created. "
            fi    
            ;;
        3) 
            read -p "Enter a directory name to delete: " CHOICE
	    clear 
            if [ -d "$CHOICE" ]
                then
                    sudo rmdir $CHOICE 
                    echo "${CHOICE} directory is deleted"
                else
                    echo "${CHOICE} does not exit! exiting..."
            fi ;;
        4) 
            read -p "Enter a file name to delete: " CHOICE
	    clear 
            if [ -f "$CHOICE" ]
                then
                    sudo rm $CHOICE 
                    echo "${CHOICE} file is deleted"
                else
                    echo "${CHOICE} does not exit! exiting..."    
            fi ;;
        5)
            ls    ;;
        0) 
                continue ;;
        *)
            echo "Wrong option selected! Exiting...." ;;

        esac
}           

# function ServManipulation () {
#     read -p "Enter the service name to know the details about: " SERVICENAME
#     if [ service --status-all | grep -Fq '${SERVICENAME}' ]
#         then
#             echo "Press 1 to know the status of ${CHOICE}"
#             echo "Press 2 to stop ${CHOICE} service"
#             echo "Press 3 to start ${CHOICE} service"
#             echo "Press 4 to restart ${CHOICE} service"
#             echo "Press 0 to exit to main menu."
#             TakeUserInput
#             case $CHOICE in
#                 1)
#                     systemctl status ${SERVICE} ;;
#                 2)
#                     if [ '$(systemctl is-active !SERVICENAME)'='active' ]
#                         echo "Service is active"

                        
     
# }
#Main loop           
while [ $EXIT != 1 ]
do
    Display
    TakeUserInput
    ProcessUserInput
done

exit
