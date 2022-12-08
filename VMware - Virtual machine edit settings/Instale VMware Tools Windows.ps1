# PowerCLI Script para Instalar VMware tools no Windows - # Versão 1.0
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# vCenter 7

# Primeira parte no VMware. Monta a ISO no SO.
Import-Csv "D:\VMware_PowerCLI\instale_vmwaretools.csv" | ForEach-Object{
    Get-VM $_.Name | Mount-Tools

}

# Segunda parte no VMware. Necessário um playbook para executar a instalação do pacote.

# D:\Setup /s /v /qn
# nvoke-Command –scriptblock {D:\Setup /s /v /qn} –computer "VM"
# 
    
# Terceira parte, dismonte a ISO do VMware tools.

# Import-Csv "D:\VMware_PowerCLI\instale_vmwaretools.csv" | %{
#     Get-VM $_.Name | Dismount-Tools

# }