%%raw(`
    import "katex/dist/katex.min.css";
    import "prismjs/themes/prism.css";
    import "prismjs/themes/prism.min.css";
    import "../style/custom.scss";
    import "../style/main.scss";
`)

module GoogleAnalytics = {
    @module("nextjs-google-analytics") 
    @react.component external make: (~trackPageViews: bool) => React.element = "GoogleAnalytics"
}

type pageProps

type props = {
    @as("Component")
    component: React.component<pageProps>,
    pageProps: pageProps,
}

let default = (props: props): React.element => {
    let {component, pageProps} = props
    let content = React.createElement(component, pageProps)

    <>
        // <GoogleAnalytics trackPageViews=true />
        <Layout>
            content
        </Layout>
    </>
}
