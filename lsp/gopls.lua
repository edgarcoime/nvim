return {
    settings = {
        gopls = {
            hints = {
                rangeVariableTypes = true,
                parameterNames = true,
                constantValues = true,
                assignVariableTypes = true,
                compositeliteralTypes = true,
                compositeliteralFields = true,
                functionTypeParameters = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedParams = true,
            },
        },
    },
}