# go-scratch Neovim plugin

## I. Installation

### Lazy Method 

```
require('lazy').setup({

{
    'gpr3211/go-scratch',
    config = function()
      require('go-scratch.go-scratch').setup {
        base_path = vim.fn.expand '~/go_scratch', 
        go_mod_name = 'github.com/<username>', 
      }
    end,
  },
...
...
...
```

    - go_mod_name is a prefix to the go  modules created . github in example.
    - base_path is the root folder where new projects will be created. You can place in "/tmp" if you want to discard periodically

## Manual Method
    
    
    1. copy lua file inside    ~/.config/nvim/lua/custom/plugins  

    2. add this to init.lua
```
require('custom.plugins.go-scratch.go-scratch').setup {
        base_path = vim.fn.expand '~/go_scratch', -- Adjust this path as needed
        go_mod_name = 'github.com/gpr3211', -- Adjust this to your preferred module prefix
    }
```

### II. Commands
```
:Scratch
```
    

1.promps for a new project inside your base_path and inits a go module with the name


2. creates a main.go file inside with basic code
```
:ScratchRun
```
1. Saves the file and runs it. Output is shown in neovim terminal bufffer window
```
:ScratchChdir
```
1. Prompts for a new base_dir. Use with caution !!!
  
   ### Enjoy :)
