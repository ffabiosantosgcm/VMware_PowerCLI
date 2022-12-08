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


# Informação importante para usar para expandir o hard disk nas etapas posteriores.
write-host ("********** VMDKs **********")
Get-VM $vmname | Get-HardDisk |FT Parent, Name, CapacityGB -Autosize

# Conjunto de variáveis
$HardDisk = Read-Host "Entre com o nome do VMware Hard Disk (Ex. 1)"
$HardDisk = "Hard Disk " + $HardDisk
$HardDiskSize = Read-Host "Digite o tamanho do Hard Disk size em GB (Ex. Se o Hard Disk tem 3 GB e você quer expandir para 5 GB, adicione + 2 GB)"

# Resultado 2
write-host ("************************************************************************************************************************************")
Get-HardDisk -vm $vmname | where {$_.Name -eq $HardDisk} | Set-HardDisk -CapacityGB $HardDiskSize -Confirm:$false

# Próximos passos . . .