local plugins = {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    init = function()
      -- Basic Neovim fold settings
      vim.o.foldcolumn = '1' -- '0' is also a valid option, depending on preference
      vim.o.foldlevel = 99 -- This needs to be a large value to ensure all folds are open by default
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Setup nvim-ufo
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          -- Specify which providers to use. Can be a list ordered by priority.
          return {'lsp', 'indent'}
        end
      })
    end
  },
  {
    "imtaketa/git-worktree.nvim",
    requires = "nvim-lua/plenary.nvim", -- git-worktree.nvim depends on plenary.nvim
    config = function()
      require("git-worktree").setup({
      })

      -- If you also have telescope installed and want to integrate it:
      require("telescope").load_extension("git_worktree")

    end
  },
{
  "epwalsh/obsidian.nvim",
  version = "*",  -- Use the latest release
  lazy = true,  -- Consider if lazy loading is appropriate for your use case
  ft = {"*"},  -- Assuming you want this specifically for markdown files
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      -- Define workspaces
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    -- vim.fn.jobstart({"open", url})  -- Mac OS
    vim.fn.jobstart({"xdg-open", url})  -- linux
  end,
  new_notes_location = "notes_subdir",
      -- Custom function for generating note IDs
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
      -- Custom function for generating note paths
      note_path_func = function(spec)
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix(".md")
      end,
    })

    -- Load custom mappings for obsidian if needed
    require("core.utils").load_mappings("obsidian")
  end,
},
{
  "imtaketa/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
          require("core.utils").load_mappings("chatgpt")

    require("chatgpt").setup({
api_key = vim.fn.getenv("CHATGPT_API_KEY"),
      -- api_key_cmd = "echo $CHATGPT_API_KEY",
      openai_params = {
      max_tokens = 4096,
      },
      -- openai_completion_params= {
      -- -- model = "code-davinci-edit-001",
      -- -- temperature = 0,
      -- -- top_p = 1,
      -- -- n = 1,
      -- max_tokens = 4096,
      -- },

    })
  end,
},
 {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {"szw/vim-maximizer",
lazy = false,
config = function()
  require("core.utils").load_mappings("maximizer")
end
  },
 {
  "christoomey/vim-tmux-navigator",
    lazy = false,
 },

{
  "github/copilot.vim",
  lazy = false,
  config = function()  -- Mapping tab is already used by NvChad
    vim.g.copilot_no_tab_map = true;
    vim.g.copilot_assume_mapped = true;
    vim.g.copilot_tab_fallback = "";
  -- The mapping is set to other key, see custom/lua/mappings
  -- or run <leader>ch to see copilot mapping section
  end
},
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
return plugins
