Rename-Computer -NewName "SRVAD01" -Force
Start-Sleep -Seconds 60

# Definir senha para o usuário administrador
net user Administrator "SuaSenhaForte123!@#"

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Install-ADDSForest `
    -DomainName "novadata.local" `
    -DomainNetbiosName "NOVADATA" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Senha123!" -AsPlainText -Force) `
    -InstallDns `
    -Force

# Aguarda a reinicialização do domínio
Start-Sleep -Seconds 120

# Cria usuários de teste
Import-Module ActiveDirectory

New-ADUser -Name "Desenvolvedor1" -GivenName "Dev" -Surname "Um" -SamAccountName "dev1" -AccountPassword (ConvertTo-SecureString "Senha123!" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Desenvolvedor2" -GivenName "Dev" -Surname "Dois" -SamAccountName "dev2" -AccountPassword (ConvertTo-SecureString "Senha123!" -AsPlainText -Force) -Enabled $true
