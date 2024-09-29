# go-scratch Neovim plugin

## Installation

##         Method One
##           lazy 
```{
    'gpr3211/go-scratch',
    config = function()
      require('go-scratch.go-scratch').setup {
        base_path = vim.fn.expand '~/go_scratch', 
        go_mod_name = 'github.com/<username>', 
      }
    end,
  }```

    - go_mod_name is a prefix to the go  modules created . github in example.
    - base_path is the root folder where new projects will be created. You can place in "/tmp" if you want to discard periodically

##       Method Two
##          Manual
    
    
    1. copy lua file inside 
    ```.config/nvim/lua/custom/plugins```
    2. add this to init.lua
    ```
    require('custom.plugins.go-scratch.go-scratch').setup {
        base_path = vim.fn.expand '~/go_scratch', -- Adjust this path as needed
        go_mod_name = 'github.com/gpr3211', -- Adjust this to your preferred module prefix
    }

    ```
