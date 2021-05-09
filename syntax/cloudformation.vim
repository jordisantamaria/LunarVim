if exists("b:current_syntax")
    finish
endif

set ft=yaml
syn match CfmYamlResourceName "AWS::.*::[a-zA-Z0-9]*" contained containedin=yamlFlowString,yamlPlainScalar
" syn match CfmYamlMainType "^\w*:"
syn match CfVariable "!.*"
syn keyword CFType String Number
hi link CfmYamlResourceName Constant
hi link CfVariable TSProperty
hi link CFType TSTypeBuiltin
hi link Normal String

let b:current_syntax = "cloudformation"


