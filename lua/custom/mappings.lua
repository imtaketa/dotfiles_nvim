local M = {}
M.harpoon = {
  n = {
    ["<C-e>"] = {
      function() 
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list()) 
      end,
      "Open harpoon window",
    },
    ["<leader>h"] = {
      function()
        require("harpoon"):list():add()
      end,
      "Add file to harpoon",
    },
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    ["<C-a>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Select first harpoon entry",
    },
    ["<M-S-O>"] = {
      function()
        require("harpoon"):list():prev()
      end,
      "Previous harpoon buffer",
    },
    ["<M-S-I>"] = {
      function()
        require("harpoon"):list():next()
      end,
      "Next harpoon buffer",
    },
},
}

M.worktree = {
n = {
    ["<leader>fe"] = {
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
    "List worktrees",
    },
    ["<leader>fv"] = {
    "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    "Create worktree",
    },
  },
}
M.obsidian = { 
 n = {
        ["gf"] = {
      function()
        require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check-boxes.
    ["<leader>oc"] = {
      function()
        require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
      "Toggle checkbox",
    },
    ["<leader>ob"] = {
      ":ObsidianBacklinks<CR>",
      "Open backlinks",
    },
    ["<leader>od"] = {
      ":ObsidianDailies<CR>",
      "Open dailies",
    },
    ["<leader>os"] = {
      ":ObsidianSearch<CR>",
      "Search in Obsidian",
    },
    ["<leader>oo"] = {
      ":ObsidianQuickSwitch<CR>",
      "Quick switch",
    },
    ["<leader>oln"] = {
      ":ObsidianLinkNew<CR>",
      "Insert new link",
    },
    ["<leader>on"] = {
      ":ObsidianNew<CR>",
      "New note",
    },
    ["<leader>oe"] = {
      ":ObsidianExtractNote<CR>",
      "Extract note",
    },
    ["<leader>or"] = {
      ":ObsidianRename<CR>",
      "Rename note",
    },
    ["<leader>ot"] = {
      ":ObsidianTags<CR>",
      "Open tags",
    },
    ["<leader>ota"] = {
      ":ObsidianTags<CR>",
      "Open tags",
    },
    ["<leader>otd"] = {
      ":ObsidianToday<CR>",
      "Open today's note",
    },
    ["<leader>otm"] = {
      ":ObsidianTomorrow<CR>",
      "Open tomorrow's note",
    },
    ["<leader>ote"] = {
      ":ObsidianTemplate<CR>",
      "Insert template",
    },
    ["<leader>oy"] = {
      ":ObsidianYesterday<CR>",
      "Open yesterday's note",
    },
    ["<leader>oll"] = {
      ":ObsidianLinks<CR>",
      "Open links",
    },

  },   -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
  v = {
    ["<leader>oe"] = {
      ":ObsidianExtractNote<CR>",
      "Extract note",
    },
    ["<leader>oli"] = {
      ":ObsidianLink<CR>",
      "Insert link",
    },
    ["<leader>oln"] = {
      ":ObsidianLinkNew<CR>",
      "Insert new link",
    },

  },

}

M.chatgpt = {
v = {
    ["<leader>me"] = {
      ":ChatGPTEditWithInstructions<CR>",
      "Edit with instructions",
    },
    ["<leader>mo"] = {
      ":ChatGPTRun optimize_code<CR>",
      "Run ChatGPT to optimize code",
    },
  },
n = {

    ["<leader>mt"] = {
      ":ChatGPTRun add_tests<CR>",
      "Run ChatGPT to add tests",
    },
    ["<leader>mf"] = {
      ":ChatGPTRun fix_bugs<CR>",
      "Run ChatGPT to fix bugs",
    },
    ["<leader>mar"] = {
      ":ChatGPTRun code_readability_analysis<CR>",
      "Run ChatGPT for code readability analysis",
    },
    },
}

M.telescope = {
i = {
-- ["<M-q>"] = {
--     function()
--   require('telescope.actions').send_selected_to_qflist()
--       end,
--   "Send selected to quickfix list",
-- },

  },
n = {
  ["<leader>fn"] = {
    "<cmd>Telescope find_files<CR>",
    "Find files",
  },
  -- ["<leader>fw"] = {
  --   "<cmd> Telescope live_grep <CR>",
  --   "Grep in files",
  -- },
  ["<leader>fb"] = {
    "<cmd>Telescope buffers<CR>",
    "Find buffers",
  },
  ["<leader>fh"] = {
    "<cmd>Telescope help_tags<CR>",
    "Find help",
  },
  ["<leader>fc"] = {
    "<cmd>Telescope commands<CR>",
    "Find commands",
  },
  ["<leader>fo"] = {
    "<cmd>Telescope oldfiles<CR>",
    "Open recent files",
  },
  ["<leader>ft"] = {
    "<cmd>Telescope treesitter<CR>",
    "Treesitter",
  },
  ["<leader>fd"] = {
    "<cmd>Telescope diagnostics<CR>",
    "Workspace diagnostics",
  },
  -- ["<leader>fwd"] = {
  --   "<cmd>Telescope lsp_workspace_diagnostics<CR>",
  --   "Workspace diagnostics",
  -- },
  ["<leader>fr"] = {
    "<cmd>Telescope lsp_references<CR>",
    "LSP references",
  },
  ["<leader>fi"] = {
    "<cmd>Telescope lsp_implementations<CR>",
    "LSP implementations",
  },
  ["<leader>fs"] = {
    "<cmd>Telescope lsp_document_symbols<CR>",
    "Document symbols",
  },
  ["<leader>fS"] = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
    "Workspace symbols",
  },
  ["<leader>fq"] = {
    "<cmd>Telescope quickfix<CR>",
    "Quickfix list",
  },
  ["<leader>fl"] = {
    "<cmd>Telescope loclist<CR>",
    "Locallist",
  },
   ["<leader>gS"] = {
    "<cmd>Telescope git_stash<CR>",
    "Git stash",
  },
   ["<leader>fm"] = {
    "<cmd>Telescope marks<CR>",
    "Marks",
  },
},
}


M.gitsigns = {
n = {
  ["<leader>rh"] = {
    function()
      require("gitsigns").reset_hunk()
    end,
    "Reset hunk",
  },
  ["<leader>ph"] = {
    function()
      require("gitsigns").preview_hunk()
    end,
    "Preview hunk",
  },
  ["<leader>gb"] = {
    function()
      package.loaded.gitsigns.blame_line()
    end,
    "Blame line",
  },
  ["<leader>td"] = {
    function()
      require("gitsigns").toggle_deleted()
    end,
    "Toggle deleted",
  },
  -- next hunk
  ["]c"] = {
    function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    "Jump to next hunk",
    opts = { expr = true },
  },
},
}

M.general = {
  n = {
    ["<leader>cp"] = {
      ":let @+=expand('%:p')<CR>",
      "Copy file path to clipboard"
    },
    ["x"] = {
      '"_x',
      "Delete without yanking",
    },
    ["<leader>e"] = {
      ":NvimTreeToggle<CR>",
      "Toggle file explorer",
    },
    ["]f"] = {
      ":cn<CR>",
      "Go to next quickfix entry",
    },
    ["[f"] = {
      ":cp<CR>",
      "Go to previous quickfix entry",
    },
    ["]l"] = {
      ":lnext<CR>",
      "Go to next locallist entry",
    },
    ["[l"] = {
      ":lprevious<CR>",
      "Go to previous locallist entry",
    },
  },
  i = {
    ["jk"] = {
      "<ESC>",
      "use jk to exit insert mode"
    },
  },
}

M.maximizer = {
  n = {
    ["<leader>mm"] = {
      "<cmd>MaximizerToggle!<CR>",
      "Maximize window"
    }
  }
}

M.copilot = {
  -- i = {
  --   ["<C-a>"] = {
  --     function()
  --       vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
  --     end,
  --     "Copilot Accept",
  --      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
  --     }
  -- }
}

M.copilot_chat = {
 n = {  -- 'n' for normal mode mappings
    ["<leader>ae"] = { "<cmd>CopilotChatExplain<CR>", "AI Explain" },
    ["<leader>ar"] = { "<cmd>CopilotChatReview<CR>", "AI Review" },
    ["<leader>at"] = { "<cmd>CopilotChatTests<CR>", "AI Tests" },
    ["<leader>af"] = { "<cmd>CopilotChatFix<CR>", "AI Fix" },
    ["<leader>ao"] = { "<cmd>CopilotChatOptimize<CR>", "AI Optimize" },
    ["<leader>ad"] = { "<cmd>CopilotChatDocs<CR>", "AI Documentation" },
    ["<leader>ac"] = { "<cmd>CopilotChatCommitStaged<CR>", "AI Generate Commit" }
  },
 v = {  -- 'n' for normal mode mappings
    ["<leader>ae"] = { "<cmd>CopilotChatExplain<CR>", "AI Explain" },
    ["<leader>ar"] = { "<cmd>CopilotChatReview<CR>", "AI Review" },
    ["<leader>at"] = { "<cmd>CopilotChatTests<CR>", "AI Tests" },
    ["<leader>af"] = { "<cmd>CopilotChatFix<CR>", "AI Fix" },
    ["<leader>ao"] = { "<cmd>CopilotChatOptimize<CR>", "AI Optimize" },
    ["<leader>ad"] = { "<cmd>CopilotChatDocs<CR>", "AI Documentation" },
    ["<leader>ac"] = { "<cmd>CopilotChatCommitStaged<CR>", "AI Generate Commit" }
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

return M
