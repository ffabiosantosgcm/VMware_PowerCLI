# PowerCLI Script para aumentar tamanho do vmdk - # Versão 1.1
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# Bloco foreach-object só funciona na versão vCenter 7.x

# Informe o nome da VM.
$vmname = read-host "Escreva o nome da VM?"

# Informações dos discos locais no SO.
write-host ("********** DISCOS LOCAIS DO SO **********")


$result = Get-VMGuestDisk -VM $vmname | Foreach-Object{ # Crédito para o mestre "@LucD" da comunidade VMware.

    $guestDisk = $_
    $hardDisk = Get-HardDisk -VMGuestDisk $guestDisk
    
    New-Object -TypeName PSObject -Property @{
        VMName = $hardDisk.Parent
        VMGuest = $guestDisk.VMGuest
        DriveLetter = $guestDisk.DiskPath
        CapacityGB = $guestDisk.CapacityGB
        FreeSpaceGB = $guestDisk.FreeSpaceGB
        DiskID = $hardDisk.ID
        DiskName = $hardDisk.Name
        VMDK = $hardDisk.Filename
        }
    }
    
# Resultado 1
$result