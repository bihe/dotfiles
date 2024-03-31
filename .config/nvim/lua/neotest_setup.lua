require("neotest").setup({
  adapters = {
    -- your neotest config here
    require("neotest-go"),
    require("neotest-java")({
        ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
    }),
    --require("neotest-plenary"),
    --require("neotest-vim-test")({
    --  ignore_file_types = { "python", "vim", "lua" },
    --}),
  },
})
