[System.Environment]::SetEnvironmentVariable('VCToolsVersion', '14.39.33519', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('VCToolsInstallDir', 'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\%VCToolsVersion%', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('WindowsSDKVersion', '10.0.22000.0', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('WindowsSdkDir', 'C:\Program Files (x86)\Windows Kits\10', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('WindowsSdkVerBinPath', '%WindowsSdkDir%\bin\%WindowsSDKVersion%', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('WindowsSdkVerInlcudePath', '%WindowsSdkDir%\Include\%WindowsSDKVersion%', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('WindowsSdkVerLibPath', '%WindowsSdkDir%\Lib\%WindowsSDKVersion%', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('Path', '%VCToolsInstallDir%\bin\Hostx64\x64;%WindowsSdkVerBinPath%\x64', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('Include', '%VCToolsInstallDir%\include;%WindowsSdkVerInlcudePath%\ucrt;%WindowsSdkVerInlcudePath%\um;%WindowsSdkVerInlcudePath%\shared', [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('Lib', '%VCToolsInstallDir%\lib\x64;%WindowsSdkVerLibPath%\ucrt\x64;%WindowsSdkVerLibPath%\um\x64;%WindowsSdkVerLibPath%\ucrt_enclave\x64', [System.EnvironmentVariableTarget]::Machine)