# Configurações
$esxName = "esxi102.virtualizandoaju.com.br" # Esxi localizado no vcenter
$template = "ARIA_WindowsServer2022" # Nome do template base Windows Ou Linux
$datastore = "DATA-103" # Nome do datastore
$portgroup = "VM Network" # Nome do portgroup
$newVmList = "ARIA100", "ARIA101" # Escreva os nomes das vms que você deseja criar.

# Criando VMs usando ForEach-Object COM StorageFormat Thin
$taskTab = @{}
$newVmList | ForEach-Object {
    $taskTab[(New-VM -Name $_ -VMHost (Get-VMHost -Name $esxName) -Template $template -Datastore $datastore -NetworkName $portgroup -RunAsync -StorageFormat Thin).Id] = $_
}

# Iniciando VMs
Start-VM -VM $newVmList



