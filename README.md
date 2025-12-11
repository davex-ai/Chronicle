# Chronicle — Developer Journal CLI
![Build](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Language](https://img.shields.io/badge/language-Bash-orange)
![Last Commit](https://img.shields.io/github/last-commit/davex-ai/Chronicle)
![Version](https://img.shields.io/badge/version-3.0.0-lightgrey)


**A small, portable Bash tool to quickly log your developer notes with timestamps. Works on Linux, macOS, and Windows Git Bash.**

## Install
```bash
git clone https://github.com/davex-ai/Chronicle.git
cd chronicle
bash chronicle.sh install
```
This copies the script to ~/.local/bin/chronicle and makes it executable.
Make sure ~/.local/bin is in your PATH:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

Usage
```bash
chronicle             # Open dev log with timestamped entry
chronicle --no-open   # Add entry without opening editor
chronicle -m="Fixed bug"  # Add custom message
chronicle --last=5    # Show last 5 entries
chronicle --help    
```
- By default, Chronicle opens your editor ($EDITOR), or VS Code, Nano, or Vim.

- Dev log file is stored at $HOME/dev-log.md. Automatically created if missing.


---

### **5. Ensure Windows Git Bash compatibility**

- Avoid `mkdir -p` errors: it works in Git Bash.
- Use `$HOME` for paths (works in Git Bash and Linux/macOS).
- For editor detection, `code` (VS Code), `nano`, or `vim` are safe.
- Avoid `/usr/bin/env bash` if needed; Git Bash supports it.

---

**Aliases / Keyboard Shortcuts
To quickly open Chronicle from your terminal:**

1. Add an alias to your Bash config:
```bash
echo 'alias chronicle="$HOME/.local/bin/chronicle"' >> ~/.bashrc
source ~/.bashrc

```
 Now you can type chronicle anywhere in your terminal.
 
 Windows Git Bash shortcut:

Right-click Git Bash shortcut → Properties → Target: append:

```text
--login -i -c "chronicle"
```

Or create a small .bat file to launch Chronicle:

```bat
@echo off
"C:\Program Files\Git\bin\bash.exe" --login -i -c "chronicle"
```

- Assign a keyboard shortcut to the .bat file in Windows.

## Features
- Auto-create dev log file if missing.

- Timestamped entries with Markdown formatting.

- Custom messages for quick logging.

- List last N entries.

- Configurable editor support.

- Easy installation for sharing / cloning.

## Things To Note
1. This Means Your  script exists but Bash can’t see it.

```bash
$ chronicle
bash: chronicle: command not found
```

**Do the following**

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Now test**
```bash
chronicle --help
```

https://github.com/user-attachments/assets/1400ac6f-c822-427f-b5d8-0992e5f8a2e3



Made with 🔥 by [Daveora](https://github.com/davex-ai)
