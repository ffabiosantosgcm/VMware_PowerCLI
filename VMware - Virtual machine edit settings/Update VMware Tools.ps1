# PowerCLI Script Update VMware Tools - Versão 1.0
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# vCenter 6.7


Import-Csv "D:\VMware_PowerCLI\update_vmwaretools.csv" |ForEach-Object{
    Get-VM $_.Name | Update-Tools
}

#logsaida