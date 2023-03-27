const config = {
    pageExtensions: ["js", "mjs"],
    env: {
        ENV: process.env.NODE_ENV,
    },
    webpack: (config, options) => {
        if (!options.isServer) {
            config.resolve.fallback = {
                fs  : false,
                path: false,
            }
            config.module.rules.push({
                test   : /\.m?js$/,
                use    : options.defaultLoaders.babel,
                exclude: /node_modules/,
                type   : "javascript/auto",
                resolve: {
                    fullySpecified: false,
                }
            })
        }
        return config
    }
}

module.exports = config
