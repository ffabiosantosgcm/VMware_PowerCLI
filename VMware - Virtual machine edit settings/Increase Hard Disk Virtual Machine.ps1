# PowerCLI Script para aumentar tamanho do vmdk - # Versão 1.0
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# vCenter 6.7


# Informe o nome da VM.
$vmname = read-host "Qual o nome da VM?"

# Informações dos discos locais no SO.

write-host ("********** DISCOS LOCAIS DO SO **********")

Get-VM -name $vmname| Get-VMGuest -PipelineVariable guest |
where{$_.Disks -ne $null} |

ForEach-Object -Process {

    $_.Disks | ForEach-Object -Process {

        New-Object PSObject -Property ([ordered]@{

            Server = $guest.VM.Name

            Path = $_.Path

            CapacityGB = [math]::round($_.CapacityGB)

            FreeSpaceGB = [math]::round($_.FreeSpaceGB)

            Percent = [int]($_.FreeSpaceGB/$_.CapacityGB * 100)  

        })

    }

}

# Informações de Hard Disk.
write-host ("********** VMDKs **********")
Get-VM $vmname | Get-HardDisk |FT Parent, Name, CapacityGB -Autosize

# Conjunto de variáveis
$HardDisk = Read-Host "Entre com o nome do VMware Hard Disk (Ex. 1)"
$HardDisk = "Hard Disk " + $HardDisk
$HardDiskSize = Read-Host "Digite o tamanho do Hard Disk size em GB (Ex. Se o Hard Disk tem 3 GB e você quer expandir para 5 GB, adicione + 2 GB)"

# Resultado
write-host ("************************************************************************************************************************************")
Get-HardDisk -vm $VM | where {$_.Name -eq $HardDisk} | Set-HardDisk -CapacityGB $HardDiskSize -Confirm:$false

# Próximos passos . . .