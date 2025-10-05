-- https://www.youtube.com/watch?v=GxnBIRl9UmA&t=124s
-- https://www.youtube.com/watch?v=FmHhonPjvvA
-- https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean/lua/plugins/luasnip.lua
return {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    enabled = true,
    opts = function(_, opts)
        local ls = require('luasnip')
        local extras = require('luasnip.extras')

        -- Add prefix ";" to each one of my snippets using the extend_decorator
        -- I use this in combination with blink.cmp. This way I don't have to use
        -- the transform_items function in blink.cmp that removes the ";" at the
        -- beginning of each snippet. I added this because snippets that start with
        -- a symbol like ```bash aren't having their ";" removed
        -- https://github.com/L3MON4D3/LuaSnip/discussions/895
        -- NOTE: THis extend_decorator works great, but I also tried to add the ";"
        -- prefix to all of the snippets loaded from friendly-snippets, but I was
        -- unable to do so, so I still have to use the transform_items in blink.cmp
        local extend_decorator = require('luasnip.util.extend_decorator')
        -- Create trigger transformation function
        local function auto_semicolon(context)
            if type(context) == 'string' then
                return { trig = ';' .. context }
            end
            return vim.tbl_extend('keep', { trig = ';' .. context.trig }, context)
        end
        -- Register and apply decorator properly
        extend_decorator.register(ls.s, {
            arg_indx = 1,
            extend = function(original)
                return auto_semicolon(original)
            end,
        })
        local s = extend_decorator.apply(ls.s, {})

        -- local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local rep = extras.rep
        local fmt = require('luasnip.extras.fmt').fmt

        local function clipboard()
            return vim.fn.getreg('+')
        end

        -- CUSTOM SNIPPETS
        -- file filetypes with :set ft

        -- #####################################################################
        --                            Markdown
        -- #####################################################################

        -- Helper function to create code block snippets
        local function create_code_block_snippet(lang)
            return s({
                trig = lang,
                name = 'Codeblock',
                desc = lang .. ' codeblock',
            }, {
                t({ '```' .. lang, '' }),
                i(1),
                t({ '', '```' }),
            })
        end

        -- Define languages for code blocks
        local languages = {
            'txt',
            'lua',
            'sql',
            'go',
            'regex',
            'bash',
            'markdown',
            'markdown_inline',
            'yaml',
            'json',
            'jsonc',
            'cpp',
            'csv',
            'java',
            'javascript',
            'python',
            'dockerfile',
            'html',
            'css',
            'templ',
            'php',
        }

        -- Generate snippets for all languages
        local snippets = {}

        for _, lang in ipairs(languages) do
            table.insert(snippets, create_code_block_snippet(lang))
        end

        ls.add_snippets('markdown', snippets)

        -- #####################################################################
        --                             PYTHON
        -- #####################################################################
        ls.add_snippets('python', {
            s(
                {
                    trig = 'ifname',
                    name = 'Python module setup dunder name dunder main',
                    desc = 'Main function and __name__ entry point',
                },
                fmt(
                    [[
def main():
    {}

if __name__ == "__main__":
    main()
]],
                    {
                        i(1, 'print("Hello, world!")'),
                    }
                )
            ),
        })

        -- #####################################################################
        --                         BASH
        -- #####################################################################
        ls.add_snippets('sh', {
            s(
                {
                    trig = 'main',
                    name = 'Bash boilerplate with main function',
                    desc = 'Bash boilerplate with main function',
                },
                fmt(
                    [[
#!/usr/bin/env bash

main() {{
  {}
}}

main "$@"
]],
                    {
                        i(1, 'echo Hello, world!'),
                    }
                )
            ),
        })

        -- #####################################################################
        --                         all the filetypes
        -- #####################################################################
        ls.add_snippets('all', {
            s({
                trig = 'coime',
                name = 'Add this -> Edgar J Coime',
                desc = 'Add this -> Edgar J Coime',
            }, {
                t('Edgar J Coime'),
            }),
        })

        return opts
    end,
}
