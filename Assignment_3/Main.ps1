$Choice = 0
$UserInput = 0
$Path = pwd
#Function to Clean the bin directory
function cleanTheBin {
   if(Test-Path $Path\bin -PathType Container){
       rmdir -r bin
       Write-Output "Cleaning bin folder......"
   }
}

#Function to Check for changes in the remote repository
function gitCheckout {
    
}


while (1) {
    Write-Output "Press 1 to Clean the bin directory"
    Write-Output "Press 2 to checkout changes in git remote repository"
    Write-Output "Press 3 to build the local repository project"
    Write-Output "Press 4 to zip the build output in bin folder to a directory"
    Write-Output "Press 0 to exit the script"
    $Choice = Read-Host -Prompt "Select any of the above options:"
    clear
    switch ($Choice) {
        1{ 
            cleanTheBin
            Write-Output "bin folder has been cleaned."
            break
        }

        2{
            gitCheckout
            break
        }

        3{
            buildProject
            break
        }
        
        4{
            zipTheBin
            break
        }
        
        0{
            Write-Output "You are exiting the script........"
            break
        }
        Default {
            Write-Output "Invalid input! Please choose the valid option"
        }
    }
}