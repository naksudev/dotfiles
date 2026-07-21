return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    event = { 'Bufreadpre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    main = 'nvim-treesitter.config', -- Sets main module to use for opts
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'lua',
        'luadoc',
        'python',
        'javascript',
        'markdown',
        'markdown_inline',
        'html',
        'css',
        'yaml',
        'vim',
        'vimdoc',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
}
