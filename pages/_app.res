%%raw(`
    import "bootstrap/dist/css/bootstrap.min.css";
    import "katex/dist/katex.min.css";
    import "prismjs/themes/prism.css";
    import "prismjs/themes/prism.min.css";
    import "../style/main.css";
`)

type pageProps

type props = {
    @as("Component")
    component: React.component<pageProps>,
    pageProps: pageProps,
}

let default = (props: props): React.element => {
    let {component, pageProps} = props
    let content = React.createElement(component, pageProps)

    <Layout>
        content
    </Layout>
}
