# Cria usuários de teste
Import-Module ActiveDirectory

New-ADUser -Name "Desenvolvedor1" -GivenName "Dev" -Surname "Um" -SamAccountName "dev1" -AccountPassword (ConvertTo-SecureString "Senha123!" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Desenvolvedor2" -GivenName "Dev" -Surname "Dois" -SamAccountName "dev2" -AccountPassword (ConvertTo-SecureString "Senha123!" -AsPlainText -Force) -Enabled $true
