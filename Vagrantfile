Vagrant.configure("2") do |config|

  # AD - Windows Server
  config.vm.define "ad" do |ad|
    ad.vm.box = "StefanScherer/windows_2022"
    ad.vm.hostname = "SRVAD01"
    ad.vm.communicator = "winrm"
    ad.winrm.username = "vagrant"
    ad.winrm.password = "vagrant"

    ad.vm.network "public_network",
      ip: "192.168.3.145",
      bridge: "enp1s0"

    ad.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.gui = true
    end

    # Configurar WinRM
    ad.vm.provision "shell", privileged: true, inline: <<-SHELL
      winrm quickconfig -q
      winrm set winrm/config '@{MaxTimeoutms="1800000"}'
      winrm set winrm/config/service '@{AllowUnencrypted="true"}'
      winrm set winrm/config/service/auth '@{Basic="true"}'
      netsh advfirewall firewall add rule name="Allow WinRM" dir=in action=allow protocol=TCP localport=5985
    SHELL

    # Configurar AD
    ad.vm.provision "shell", privileged: true, path: "scripts/setup-ad.ps1"

    # Reiniciar após configurar o domínio
    ad.vm.provision "shell", privileged: true, inline: "Restart-Computer -Force"

    # Criar usuários após reinicialização
    ad.vm.provision "shell", privileged: true, path: "scripts/create-users.ps1"
  end

end
