# PowerCLI Script Adicionando um Hard Disk - Versão 1.0
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# vCenter 7

$vmname = read-host "Qual o nome da VM para criar o disco"

write-host = "Anote o nome da controladora para especificar na criacao do disco"
write-host = (get-vm $vmname | Get-HardDisk | Get-ScsiController | Select-Object name)

$numero_discos = read-host "Informe a quantidade de discos para adicionar"
$formato = read-host "formato do disco (thin, thick, EagerZeroedThick)"
$size = read-host "Tamanho do Disco em (GB)"
$scsi = read-host "Anotou na atapa anterior? Digite "SCSI Controller 0" ou "SCSI Controller 1" ou "SCSI Controller 2" ou "SCSI Controller 3""
 
$vm = get-vm $vmname
$Controller = $scsi
$contador=0
write-host "$listscsi"
 
### Adiciona uma quantidade de discos para VM
while ($contador -lt $numero_discos){ # -lt menor que

    write-host "Adicionando $size VMDK para $vm"

New-HardDisk -vm $vm -CapacityGB $size -Storageformat $formato -Controller $Controller
 $contador++
}

# Próximos passos . . . .