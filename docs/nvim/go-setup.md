# Neovim setup for golang

## Youtube
- [The perfect Neovim setup for Go](https://www.youtube.com/watch?v=i04sSQjd-qo)


### Golang config for neovim
```
Sample go neovim config that I am reffering https://github.com/dreamsofcode-io/neovim-go-config/tree/main
1. Download an lsp server for go (gopls is the official)
  download it with either mason or go get
  add configs

2. Autoformatting on save
  we can either use gopls or use null-ls plugin
  we have null-ls.lua config file where we have added all the formatting related configs
  we have used gofumpt,goimports_reviser, and golines, but we have to install these using go get package name
  go install -v github.com/incu6us/goimports-reviser/v3@latest
  go install github.com/segmentio/golines@latest

  now we have formatting setup and we can call it by (:lua vim.lsp.buf.format())
  but it is hectic to run everytime, so we can turn autoformat on save

  null-ls is having some issues in my local so I have used normal gopls for setting autoformatting

3. now we will setup delve (go install github.com/go-delve/delve/cmd/dlv)
    if delve is unrecognized then use the following line
      export PATH=$PATH:~/go/bin/dlv
      export PATH=$PATH:$(go env GOPATH)/bin
      ~/go/bin/dlv version
  Along with delve we need neovim dap (debug adapter protocoll) we will use nvim-dap-go plugin for that
  to install go grammar for neovim Treesitter use (:TSInstall go)
    <space> + db for debug point
    <space> + dn => :DapStepOver for going to next line
    <space> + dc => :DapContinue for go to the next debug point
    <space> + du for debug ui
    <space> + dgt for running test
    <space> + dgl for running last test
    

4. for extra capabilities we use gopher.nvim (https://github.com/olexsmir/gopher.nvim)
    nvim-dap is required
  see the link for more shortcut
    :GoTagAdd json " For add json tag
    :GoTagRm yaml " For remove yaml tag

    :GoMod tidy " Runs `go mod tidy`
    :GoMod init asdf " Runs `go mod init asdf`
    :GoGet github.com/gorilla/mux

    :GoImpl [receiver] [interface]
    " Also you can put cursor on the struct and run:
    :GoImpl [interface]

    " Example
    :GoImpl r Read io.Reader
    " or simply put your cursor in the struct and run:
    :GoImpl io.Reader

    :GoTestAdd
    :GoTestsAll
    :GoTestsExp

    " Run `go generate` in cwd path
    :GoGenerate
    " Run `go generate` for current file
    :GoGenerate %

    Generate doc comment
    First set a cursor on public package/function/interface/struct and execute:
    :GoCmt

    :GoIfErr
  5. Go to definition
    gd -> go to defination
    gD -> g + shift + d -> go to declaration

```