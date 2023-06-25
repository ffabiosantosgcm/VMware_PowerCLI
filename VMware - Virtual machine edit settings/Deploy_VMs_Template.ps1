1..<N> | Foreach {  
    New-VM -vmhost <ESX_HOST> -Name <VM_NAME> -Template <TEMPLATE> -Datastore <DATASTORE> [-OtherOptions]  
    } 

    1..2 | Foreach {  
        New-VM -vmhost esx1.testdomain.com -Name RAC$_ -Template OL6 -Datastore datastore1  
        }