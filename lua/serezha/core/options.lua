local opt = vim.opt

-- misc
opt.completeopt = "longest,menuone"
opt.confirm = true
opt.cursorline = true
opt.hidden = true
opt.history = 256
opt.ignorecase = true
opt.imsearch = 0
opt.infercase = true
opt.laststatus = 2
opt.linebreak = true
opt.list = true
opt.listchars = {
	eol = "˺",
	tab = "⋅ ",
}
opt.mouse = "a"
opt.backup = false
opt.foldenable = false
opt.swapfile = false
opt.number = true
opt.pastetoggle = ""

-- identation settings
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 4

opt.showbreak = ""
opt.showcmd = true
opt.showmatch = false
opt.showtabline = 2
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitright = true
opt.splitbelow = true
opt.statusline = "+=%F"
opt.statusline = string.format(
	"%%<%%f%%h%%m%%r%%=format=%s file=%s enc=%s %%b 0x%%B %%l,%%c%%V %%P",
	vim.o.fileformat, 
	vim.o.fileencoding, 
	vim.o.encoding
)

opt.title = true
opt.titleold = ""
opt.titlestring = "%t%( %M%)%( (" .. vim.fn.expand("%:p:h") .. ")%)%( %a%) - " .. vim.v.servername
opt.titlelen = 0
opt.timeout = false
opt.undolevels = 1000
opt.updatetime = 100
opt.wildignore = {
  "*/min/*",
  "*/vendor/*",
  "*/node_modules/*",
  "*/bower_components/*",
  "*/dictionaries/*",
  "*/dist_version/*",
  "*/sitestatic/*",
}
opt.wildmenu = true
opt.wrap = true
opt.wrapscan = true
