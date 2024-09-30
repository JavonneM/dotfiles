General

Installation steps 
- Run nvim.sh
- Clone Packer 
- Open nvim
- Run :PackerSync
- Enjoy

General Keys
Alignment/indent  =
Git Search <C-p>
Line start 0
Line start non blank char ^
Line end $
open term :term
close term <C-\><C-n>


Default LEADER is /

Install 
- packer.nvim
- telescope.nvim
- Treesitter
- Treesitter playground
- Harpoon
- lsp

Packer (nvim Package manager)
Clone it 
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
:PackerSync calls packerSync script to sync packages.

Telescope (Fuzzy file search)
<leader>ff find files
<leader>ps grep

TreeSitter (incremental Language Parser)

TreeSitter Playground

Harpoon (File Quick navigator)
<leader>a Harpoon a file
<C-e> toggle quick menu
<C-h> File 1
<C-t> File 2 
<C-n> File 3
<C-s> File 4 

Fugitive (Git integration)
<leader>gs Git tools

LSP Zero
    <Enter>: Confirms selection.
    <Ctrl-y>: Confirms selection.
    <Up>: Navigate to previous item on the list.
    <Down>: Navigate to the next item on the list.
    <Ctrl-p>: Navigate to previous item on the list.
    <Ctrl-n>: Navigate to the next item on the list.
    <Ctrl-u>: Scroll up in the item's documentation.
    <Ctrl-f>: Scroll down in the item's documentation.
    <Ctrl-e>: Toggles the completion.
    <Ctrl-d>: Go to the next placeholder in the snippet.
    <Ctrl-b>: Go to the previous placeholder in the snippet.
    <Tab>: Enables completion when the cursor is inside a word. If the completion menu is visible it will navigate to the next item in the list.
    <S-Tab>: When the completion menu is visible navigate to the previous item in the list.


File Explorer
:Ex Access file explorer
% create new file
d create new directory


Editor
:so Source currently open file


