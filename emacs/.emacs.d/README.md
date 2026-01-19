# Literate Emacs Configuration

This is a literate Emacs configuration written in Org mode. All configuration is documented and organized in a single `config.org` file.

## Features

- **Literate Programming**: Configuration is written in org-mode with full documentation
- **Custom Keyboard Layout**: Optimized for m/n/e/i movement (replaces h/j/k/l)
- **Evil Mode**: Vim-like editing with custom bindings
- **Eglot**: Built-in LSP client for IDE features
- **Modern UI**: Doom modeline, Catppuccin theme, icons, and tabs
- **Auto-tangle**: Configuration automatically tangles from org-mode

## Installation

### Fresh Install

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.emacs.d ~/.emacs.d.backup
   mkdir -p ~/.emacs.d
   ```

2. **Copy the files**:
   ```bash
   cp config.org ~/.emacs.d/
   cp evil-custom-bindings-eglot.el ~/.emacs.d/evil-custom-bindings.el
   cp init-bootstrap.el ~/.emacs.d/init.el
   ```

3. **Start Emacs**:
   ```bash
   emacs
   ```
   
   On first launch, Emacs will:
   - Tangle `config.org` → generate configuration files
   - Install all packages from MELPA/ELPA
   - Set up the environment

### Updating from Existing Config

If you want to migrate your existing configuration:

1. **Backup everything**:
   ```bash
   cp -r ~/.emacs.d ~/.emacs.d.backup
   ```

2. **Copy new files**:
   ```bash
   cp config.org ~/.emacs.d/
   cp evil-custom-bindings-eglot.el ~/.emacs.d/evil-custom-bindings.el
   ```

3. **Replace init.el**:
   ```bash
   cp init-bootstrap.el ~/.emacs.d/init.el
   ```

4. **Restart Emacs**

## File Structure

```
~/.emacs.d/
├── init.el                    # Bootstrap file (loads and tangles config.org)
├── config.org                 # Main literate configuration (YOU EDIT THIS)
├── evil-custom-bindings.el    # Extended evil keybindings for custom layout
└── ... (auto-generated files)
```

## Usage

### Editing Your Configuration

**Edit `config.org` - NOT `init.el`!**

The `config.org` file contains your entire configuration in a readable, documented format.

To edit your configuration:

1. Open `~/.emacs.d/config.org` in Emacs
2. Make your changes in the org file
3. Run `C-c C-v t` (`org-babel-tangle`) to generate the new `init.el`
4. Restart Emacs or evaluate the changed sections

### Auto-Tangle

The configuration is set to auto-tangle on save. When you save `config.org`, it will automatically update the tangled elisp files.

### Navigating config.org

- `TAB` - Cycle folding on current heading
- `S-TAB` - Cycle folding globally
- `C-c C-n` - Next heading
- `C-c C-p` - Previous heading

The file has a Table of Contents at the top for easy navigation.

## Customization

### Adding New Packages

1. Open `config.org`
2. Navigate to the appropriate section (or create a new one)
3. Add a new heading with your package:

   ```org
   ** My New Package
   
   Description of what this package does.
   
   #+begin_src emacs-lisp
   (use-package my-package
     :ensure t
     :config
     (setq my-package-option t))
   #+end_src
   ```

4. Save the file (auto-tangles)
5. Evaluate the block with `C-c C-c` or restart Emacs

### Modifying Keybindings

Keybindings are in two places:

1. **Basic bindings**: In `config.org` under "Custom Keybindings"
2. **Extended bindings**: In `evil-custom-bindings.el`

For the custom keyboard layout (m/n/e/i), edit the extended bindings file.

### Changing Theme

1. Open `config.org`
2. Navigate to "Visual Enhancements" → "Theme"
3. Change `catppuccin-flavor` (options: `latte`, `frappe`, `macchiato`, `mocha`)
4. Or use a different theme entirely

## Keyboard Layout

This config uses a custom layout optimized for Colemak/Workman-style keyboards:

- `m` = left (h)
- `n` = down (j)
- `e` = up (k)
- `i` = right (l)
- `t` = insert (i)

All Evil mode commands are remapped to this layout.

## Language Servers

Eglot automatically connects to language servers. Make sure you have the appropriate language servers installed:

- **Python**: `pip install pyright` or `pip install python-lsp-server`
- **Rust**: `rustup component add rust-analyzer`
- **C/C++**: Install `clangd`
- **Go**: `go install golang.org/x/tools/gopls@latest`
- **Haskell**: `ghcup install hls`
- **JavaScript/TypeScript**: `npm install -g typescript typescript-language-server`

## Troubleshooting

### Configuration not loading

1. Check `*Messages*` buffer for errors
2. Make sure `config.org` tangled correctly: `M-x org-babel-tangle`
3. Check that packages installed: `M-x package-list-packages`

### Keybindings not working

1. Make sure `evil-custom-bindings.el` is in `~/.emacs.d/`
2. Check it's being loaded: look for "(load-file" in the tangled config
3. Restart Emacs

### Performance issues

1. Disable `package-refresh-contents` after first install (in config.org)
2. Increase `gc-cons-threshold` value
3. Check language server performance with `M-x eglot-events-buffer`

### Package errors

```elisp
M-x package-refresh-contents
M-x package-install RET package-name
```

## Structure of config.org

The configuration is organized into logical sections:

1. **Introduction** - Overview and setup
2. **Package Management** - use-package setup
3. **Basic Settings** - UI, fonts, mouse
4. **Evil Mode Setup** - Vim emulation
5. **Visual Enhancements** - Theme, modeline, icons
6. **File Management** - Dired, Treemacs
7. **Editing Enhancements** - Completion, undo, etc.
8. **Development Tools** - Eglot, DAP, debugging
9. **Language Specific** - Per-language configuration
10. **Custom Keybindings** - Your custom layout

## Learning Org Mode

Org mode basics:
- `TAB` on a heading to fold/unfold
- `M-<left/right>` to promote/demote headings
- `M-<up/down>` to move headings
- `C-c C-c` to execute code blocks
- `C-c C-v t` to tangle all code blocks

## Contributing

Feel free to customize this configuration to your needs! The literate format makes it easy to document your changes and share them with others.

## License

This configuration is provided as-is. Feel free to use, modify, and share it.
