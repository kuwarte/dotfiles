vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
})

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local jdtls = require("jdtls")
    local home = os.getenv("HOME")

    local root_files = { ".git", "mvnw", "gradlew", "pom.xml" }
    -- local root_dir = require("jdtls.setup").find_root(root_files)
	local root_dir = vim.loop.cwd()

    if root_dir == nil or root_dir == "" then
      return
    end

    local workspace = home .. "/.local/share/nvim/java/" ..
      vim.fn.fnamemodify(root_dir, ":p:h:t")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1G",
      "-jar", home .. "/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
      "-configuration", home .. "/.local/share/jdtls/config_linux",
      "-data", workspace
    }

    local config = {
      cmd = cmd,
      root_dir = root_dir,
	  capabilities = capabilities,
      settings = {
        java = {
		  project = {
			sourcePaths = {"src/main/java"}
		  },
          eclipse = { downloadSources = true },
          configuration = { updateBuildConfiguration = "interactive" },
          maven = { downloadSources = true },
          implementationsCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          references = { includeDecompiledSources = true },
        }
      },
      init_options = {
        bundles = {}
      }
    }

    jdtls.start_or_attach(config)
  end
})


