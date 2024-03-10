function prompt {
  $EXITSTATUS = $?
  $EXITCODE = "?"
  if ( $LASTEXITCODE ) { $EXITCODE = $LASTEXITCODE }

  $ESC = [char]27
  $None = "$ESC[0m"
  $Red = "$ESC[1;31m"
  $Yellow = "$ESC[1;33m"
  $Blue = "$ESC[1;34m"
  $DarkRed = "$ESC[0;31m"
  $DarkGreen = "$ESC[0;32m"
  $DarkBlue = "$ESC[0;34m"
  $DarkCyan = "$ESC[0;36m"

  $u = "${DarkCyan}$env:USERNAME${None}"
  $h = "${DarkGreen}$env:COMPUTERNAME${None}"
  $w = "${Yellow}$($PWD.ProviderPath)${None}"
  $t = $(Get-Date -Format HH:mm:ss)

  $git_info = ""
  try { $git_info = $(git rev-parse) }
  catch { $Global:LASTEXITCODE = 127 }
  finally {
    if ( -not $LASTEXITCODE ) {
      if ( $(git status --porcelain) ) {
        $git_info = " on ${DarkBlue}git:${DarkCyan}$(git branch --show-current) ${DarkRed}x${None}"
      }
      else {
        $git_info = " on ${DarkBlue}git:${DarkCyan}$(git branch --show-current) ${DarkGreen}o${None}"
      }
    }
  }

  $venv_info = ""
  if ( $env:VIRTUAL_ENV_PROMPT ) { $venv_info = " ${DarkGreen}$env:VIRTUAL_ENV_PROMPT${None}" }

  $exit_code = ""
  if ( -not $EXITSTATUS ) { $exit_code = "C:${DarkRed}$EXITCODE${None}" }

  Write-Host "`n${Blue}#${None} $u @ $h in $w$git_info$venv_info [$t] $exit_code`n${Red}`$${None}" -NoNewline

  $Global:LASTEXITCODE = $EXITCODE
  return " "
}

# Basic editing functions
Set-PSReadLineKeyHandler -Chord Ctrl+Alt+Backspace -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardDeleteLine
Set-PSReadLineKeyHandler -Chord Alt+Backspace -Function BackwardDeleteLine
Set-PSReadlineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Chord Escape -Function Copy

# Cursor movement functions
Set-PSReadLineKeyHandler -Chord Alt+LeftArrow -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord Alt+RightArrow -Function EndOfLine
# Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
# Set-PSReadlineKeyHandler -Chord Ctrl+e -Function EndOfLine
Set-PSReadLineKeyHandler -Chord Alt+b -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Alt+f -Function NextWord

# History functions
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward

# Completion functions
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord Shift+Tab -Function MenuComplete

# Selection functions
# Set-PSReadLineKeyHandler -Chord Shift+Alt+LeftArrow -Function SelectBackwardsLine
# Set-PSReadLineKeyHandler -Chord Shift+Alt+RightArrow -Function SelectLine
