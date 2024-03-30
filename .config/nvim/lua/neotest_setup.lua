require("neotest").setup({
  adapters = {
    -- your neotest config here
    require("neotest-go"),
    --require("neotest-plenary"),
    --require("neotest-vim-test")({
    --  ignore_file_types = { "python", "vim", "lua" },
    --}),
  },
})
