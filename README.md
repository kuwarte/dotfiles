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
