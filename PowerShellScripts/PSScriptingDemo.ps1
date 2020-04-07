#Variables used
$Choice = 0
$UserInput =0
#function to perform file and folder handling
function FileAndFolderHandling(){
    Write-Output "Press 1 to create a folder"
    Write-Output "Press 2 to create a file"
    Write-Output "Press 3 to delete a folder"
    Write-Output "Press 4 to delete a file"
    Write-Output "Press 5 to know the current directory contents"
    Write-Output "Press 0 to enter previous menu"
    $Choice = Read-Host -Prompt "Choose any of the above options"
    clear
    switch($Choice){
        1{
          #To create new folder
          $UserInput = Read-Host -Prompt "Enter folder name"
          if(Test-Path C:\Users\vs185216\powerShellScripts\$UserInput -PathType Container){
            Write-Output "Cannot create folder. $UserInput already exists!"
          }else{
               New-Item -Path ('C:\Users\vs185216\powerShellScripts\'+$UserInput) -ItemType Directory
               Write-Output "$UserInput folder is created"
          }  
        }
        2{
          #To create new text file
          $UserInput = Read-Host -Prompt "Enter file name"
          if(Test-Path C:\Users\vs185216\powerShellScripts\$UserInput -PathType Leaf){
            Write-Output "Cannot create file. $UserInput already exists!"
          }else{
            New-Item -Path ('C:\Users\vs185216\powerShellScripts\'+$UserInput+'.txt') -ItemType File
            Write-Output "$UserInput file is created"
          }
        }
        3{
            #To delete folder
            $UserInput = Read-Host -Prompt "Enter folder name"
            if(Test-Path C:\Users\vs185216\powerShellScripts\$UserInput -PathType Container){
                Remove-Item  ('C:\Users\vs185216\powerShellScripts\'+$UserInput) -Recurse
                Write-Output "$UserInput folder and it's contents are deleted!"
            }else{
                Write-Output "$UserInput folder doesn't exist!"
            }
        }
        4{
            #To delete text file
            $UserInput = Read-Host -Prompt "Enter file name"
            $UserInput+=".txt"
            if(Test-Path C:\Users\vs185216\powerShellScripts\$UserInput -PathType Leaf){
                Remove-Item ('C:\Users\vs185216\powerShellScripts\'+$UserInput)
                Write-Output "$UserInput file has been deleted!"
            }else{
                Write-Output "$UserInput file doesn't exist!"
            }
        }
        5{
            #To view current directory contents
            Write-Output "Current directory folder contents are: "
            Get-ChildItem
        }
        0{
            #Exit to main menu
            Write-Host "Returning to the main menu..."
            continue
        }
        default{
            #Invalid input handling
            Write-Output "Invalid input! please select correct option!"
        }
    }
}
#function to do services handling
function ServicesHandling(){
    Write-Output "Press 1 to view the services on this system"
    Write-Output "Press 0 to return to previous menu"
    $Choice = Read-Host -Prompt "Choose any of the above options"
    clear
    switch($Choice){
        1{
            #To view all services on this system
            Get-Service 
        }

        0{
               #To return to main menu
               Write-Host "Returning to the main menu..."
               continue        
        }
        default{
            Write-Output "Invalid user input! Please select correct option."
        }
    }
}
#Main Loop
while(1){
    #$Name = Read-Host -Prompt 'Enter your name: '
    #Write-Output $Name
    Write-Output "Press 1 to enter file and folder handling"
    Write-Output "Press 2 to enter services handling"
    Write-Output "Press 0 to exit script"
    $Choice = Read-Host -Prompt "Select an option from above"
    clear

    switch($Choice){
        1{
            FileAndFolderHandling
            break
        }
        2{
            ServicesHandling
            break
        }
        0{  
            "You are exiting from the script..."
            exit
        }
        default{
            Write-Output "Invalid input! Choose the correct option"
        }
    }

    Write-Output "`n"


    
}

