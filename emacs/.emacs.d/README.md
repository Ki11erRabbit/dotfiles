# Quick Installation Guide

## The Problem
The bootstrap `init.el` needs to set up package management BEFORE it can load org-mode to tangle your config.

## Fixed Setup

### File Structure:
- `init.el` - Bootstrap file (sets up packages, loads org, tangles config)
- `config.org` - Your literate configuration (tangles to `config.el`)
- `config.el` - Auto-generated from config.org (don't edit directly)
- `evil-custom-bindings.el` - Extended keybindings

### Installation Steps:

1. **Backup existing config**:
   ```bash
   mv ~/.emacs.d ~/.emacs.d.backup
   mkdir -p ~/.emacs.d
   ```

2. **Copy the files**:
   ```bash
   cp init-bootstrap-fixed.el ~/.emacs.d/init.el
   cp config.org ~/.emacs.d/
   cp evil-custom-bindings-eglot.el ~/.emacs.d/evil-custom-bindings.el
   ```

3. **First launch** - Start Emacs:
   ```bash
   emacs
   ```
   
   What happens:
   - `init.el` sets up package management
   - Installs org-mode if needed
   - Tangles `config.org` → creates `config.el`
   - Loads `config.el`
   - Installs all packages (this will take a few minutes)

4. **Wait for packages to install** - You'll see messages about packages being installed

5. **Restart Emacs** after the first launch to ensure everything loads cleanly

### Troubleshooting First Launch

If you get errors:

**Error: "config.org not found"**
- Make sure `config.org` is in `~/.emacs.d/`

**Error: Package errors**
```elisp
M-x package-refresh-contents
```
Then restart Emacs

**Error: Tangling failed**
- Check `*Messages*` buffer
- Manually tangle: `M-x org-babel-tangle-file` and select `config.org`

**After First Launch Issues**
- Delete `~/.emacs.d/elpa/` and restart (forces package reinstall)
- Check `*Warnings*` buffer for specific errors

### Verifying Installation

After Emacs starts successfully:

1. Check that `config.el` exists in `~/.emacs.d/`
2. Check that packages are installed: `M-x package-list-packages`
3. Test Evil mode: it should be active (you should be in normal mode)
4. Test keybindings: `n/e/i/m` should move cursor
5. Open a code file and check Eglot starts: `M-x eglot`

### Editing Your Config

**Important**: Always edit `config.org`, NOT `init.el` or `config.el`!

1. Open `~/.emacs.d/config.org`
2. Make changes
3. Save (auto-tangles to `config.el`)
4. Restart Emacs or evaluate changed sections

### What Each File Does

- **init.el**: 
  - Sets up package system
  - Ensures org-mode is installed
  - Tangles config.org → config.el
  - Loads config.el
  - YOU DON'T EDIT THIS

- **config.org**: 
  - Your actual configuration
  - Documented and organized
  - YOU EDIT THIS

- **config.el**: 
  - Auto-generated from config.org
  - Loaded by init.el
  - YOU DON'T EDIT THIS (changes will be overwritten)

- **evil-custom-bindings.el**:
  - Extended keybindings for custom layout
  - Loaded by config.el
  - Can be edited directly if needed

### Quick Start After Installation

Once everything is working:

```
F5          - Toggle Treemacs (file explorer)
F4          - Deadgrep (fast search)
SPC s e     - Sudo edit current file
C-c p       - Projectile commands
gd          - Go to definition
gr          - Find references
C-c l a     - Code actions
```

Your custom movement:
```
m - left
n - down
e - up
i - right
t - insert mode
```
