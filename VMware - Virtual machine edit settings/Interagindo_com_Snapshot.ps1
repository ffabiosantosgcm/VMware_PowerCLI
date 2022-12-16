# PowerCLI Script Interagindo com Snapshot no VMware - Versão 1.0
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# vCenter 7.0

# Variável maquina virtual
$vmname = read-host "Escreva o nome da maquina virtual"
$namesnap = read-host "Escreva o nome do snapshot"
$Description = read-host "Escreva a desrição snapshot"


# Função menu
function show-menu {
   param
  ([string]$TItulo = 'Tabela'
  )
   clear-host
   Write-Host "============ ATENÇÃO! =========================================================="
   Write-Host " 1: Pressione '1' para verificar se existe snapashot criado e suas propriedades."
   Write-Host " 2: Pressione '2' Para criar um snapashot com "-Memory".                        "
   Write-Host " 3: Pressione '3' Para criar um snapashot com "-Quiesce".                       " 
   Write-Host " 4: Pressione '4' Conceito snapashot com "-Memory".                             "
   Write-Host " 5: Pressione '5' Conceito snapashot com "-Quiesce".                            "
   Write-Host " 6: Pressione '6' Conceito snapashot com "-Quiesce -Memory".                    "
   Write-Host " 7: Pressione '7' Para criar um snapashot com com "-Quiesce -Memory".           "
   Write-Host " 8: Pressione '8' Para listar snapashot criado. (Para restaurar ou remover).    "
   Write-Host " 9: Pressione '9' Para restaurar um snapashot.                                  "
   Write-Host " 10: Pressione '10' Para remover snapashot.                                     "
   Write-Host " Q: Pressione 'Q' para sair do menu.                                            " 
   Write-Host "================================================================================"
}

do {
   Show-Menu
   $selecao = Read-Host "Por favor, faça uma seleção"
   switch ($selecao) {
      '1' {
         Get-Snapshot -vm $vmname | select VM, Name, Created, age, SizeGB
      } '2' {
         New-Snapshot -vm $vmname -Name $namesnap -Description $Description -Quiesce
      } '3' {
         New-Snapshot -vm $vmname -Name $namesnap -Description $Description -Memory
      }
      '4' {
         'Se o valor for $true e a máquina virtual estiver ligada,
           o VMware Tools será usado para desativar o sistema de arquivos da máquina virtual.
           Isso garante que um instantâneo de disco represente um estado consistente dos sistemas de arquivos convidados.
           Se a máquina virtual estiver desligada ou o VMware Tools não estiver disponível, o parâmetro Quiesce será ignorado.'
      }
      '5' {
         'Se o valor for $true e se a máquina virtual estiver ligada,
           o estado da memória da máquina virtual será preservado com o instantâneo.'
      }
      '6' {
         'Essa combinação de parâmetros provavelmente levará mais tempo para ser criada, mas deve colocar
          a máquina virtual de volta no estado exato caso eu a restaure. Você terá que levar em consideração
          quais aplicativos estão em execução que podem ser afetados negativamente se você capturar e restaurar a memória.
          Naturalmente, se posso fazer isso para uma máquina virtual, posso fazer para muitas.'
      }
      '7' {
         New-snapshot -vm $vmname -Name $namesnap -Description $Description -Quiesce -Memory
      }
      '8' {
         Get-Snapshot -vm $vmname | select VM, Created, Name, SizeGB, Quiesced, Description
      }
      '9' {
         "Em construção"
      }
      '10' {
         Get-Snapshot -vm $vmname | Remove-Snapshot -RemoveChildren
      }
   }
   pause
}
until ($selecao -eq 'q')