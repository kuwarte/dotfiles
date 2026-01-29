vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local ok_jdtls, jdtls = pcall(require, "jdtls")
    if not ok_jdtls then
      return
    end
    
    local home = os.getenv("HOME")
    if not home then
      return
    end

    local root_files = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1])
    
    if not root_dir then
      root_dir = vim.loop.cwd()
    end

    local workspace = home .. "/.local/share/nvim/java/" ..
      vim.fn.fnamemodify(root_dir, ":p:h:t")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok_cmp then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    local jdtls_path = home .. "/.local/share/jdtls"
    local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    
    if launcher_jar == "" then
      return
    end

    local cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1G",
      "-jar", launcher_jar,
      "-configuration", jdtls_path .. "/config_linux",
      "-data", workspace
    }

    local config = {
      cmd = cmd,
      root_dir = root_dir,
      capabilities = capabilities,
      settings = {
        java = {
          project = {
            sourcePaths = {"src/main/java", "src/test/java"}
          },
          eclipse = { downloadSources = true },
          configuration = { updateBuildConfiguration = "interactive" },
          maven = { downloadSources = true },
          implementationsCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          references = { includeDecompiledSources = true },
          format = {
            enabled = true,
            settings = {
              url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
              profile = "GoogleStyle",
            },
          },
        }
      },
      init_options = {
        bundles = {}
      },
      on_attach = function(client, bufnr)
        jdtls.setup_dap({ hotcodereplace = 'auto' })
      end,
    }

    jdtls.start_or_attach(config)
  end
})


