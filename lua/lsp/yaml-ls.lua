-- npm install -g yaml-language-server
require'lspconfig'.yamlls.setup{
	cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    settings = {
        yaml = {
            -- schemas = { ["https://raw.githubusercontent.com/awslabs/goformation/v4.15.0/schema/sam.schema.json"] = "/cf*/*" },
            -- schemas = { ["https://raw.githubusercontent.com/awslabs/goformation/v4.15.0/schema/cloudformation.schema.json"] = "/cf*/*" },
            customTags = {
              "!Ref",
              "!GetAtt",
              "!GetAtt sequence",
              "!fn",
              "!And",
              "!If",
              "!Not",
              "!Equals",
              "!Or",
              "!FindInMap sequence",
              "!Base64",
              "!Cidr",
              "!Sub",
              "!GetAZs",
              "!ImportValue",
              "!Select sequence",
              "!Split",
              "!Join sequence"
            },
            validate = true,
            completion = true
        }
    }
}
