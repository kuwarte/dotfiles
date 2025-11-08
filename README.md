# File Configurations

## 1. Editor Configurations

### Neovim (Windows Installation)

> This will download the `init.vim` file directly to your Neovim configuration folder.  
> Existing `init.vim` will be overwritten — backup if necessary.

#### Command Prompt

```cmd
curl -o %USERPROFILE%\AppData\Local\nvim\init.vim https://raw.githubusercontent.com/kuwarte/editor-config/main/dos/nvim/init.vim
```

#### PowerShell

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/kuwarte/editor-config/main/dos/nvim/init.vim -OutFile $env:LOCALAPPDATA\nvim\init.vim
```

### VSCode

> This will VSCode settings and install extensions.
> Adjust paths if your directory is in a different location.

#### PowerShell

##### Install `settings.json`

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/kuwarte/editor-config/dos/vscode/settings.json -OutFile "$env:APPDATA\Code\User\settings.json"
```

##### Install `vscode-extensions.txt` and Install Locally

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/kuwarte/editor-config/main/vscode/vscode-extensions.txt -OutFile "$env:USERPROFILE\vscode-extensions.txt"
```

```powershell
Get-Content "$env:USERPROFILE\vscode-extensions.txt" | ForEach-Object { code --install-extension $_ }
```
