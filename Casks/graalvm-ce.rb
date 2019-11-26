cask 'graalvm-ce' do
  version '19.3.0'
  
  # github.com/oracle/graal was verified as official when first introduced to the cask
  url "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-19.3.0/graalvm-ce-java8-darwin-amd64-19.3.0.tar.gz"
  appcast 'https://github.com/oracle/graal/releases.atom'
  name 'GraalVM Community Edition'
  homepage 'https://www.graalvm.org/'

  postflight do
    system_command '/bin/mv',
                   args: [
                           '-f', '--',
                           "#{staged_path}/graalvm-ce-#{version.downcase}",
                           "/Library/Java/JavaVirtualMachines/graalvm-ce-#{version.downcase}"
                         ],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/graalvm-ce-#{version.downcase}"
end
