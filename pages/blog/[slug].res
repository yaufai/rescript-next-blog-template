open Belt.List
open Next

type propsSlug = {
    post   : Post.t,
    domain : string,
    related: array<Post.t>
}

@react.component
let default = (~post: Post.t, ~domain: string, ~related: array<Post.t>) => {
    let url = `${domain}/blog/${post.frontmatter.slug}`
    <div>
        <Head>
            <meta property="og:title" content={post.frontmatter.title} />
            <meta property="og:description" content={post.frontmatter.description} />
            <meta property="og:type" content="article" />
            <meta property="og:url" content={url} />
        </Head>
        <h1 className="text-3xl font-semibold">
            {post.frontmatter.title->React.string}
        </h1>

        <div>
            {React.string(post.frontmatter.date)}
        </div>

        <TagList tags={post.frontmatter.tags} />

        <div
            dangerouslySetInnerHTML={{"__html": post.body.html}}
        />
        <SocialButton url={`https://${url}`}/>

        <h1>
            {React.string("Related")}
        </h1>
        <ArticleCardList posts={related->fromArray} />
    </div>
}

let getStaticPaths = () => {
    let paths = Post.loadAll()
        ->map(post => { "params": { "slug": post.frontmatter.slug }})
    let props = {
        "paths": Array.of_list(paths),
        "fallback": false
    }
    Js.Promise.resolve(props)
}

let getStaticProps = ctx => {
    let post = Post.loadBySlug(ctx["params"]["slug"])
    let props = {
        "props": {
            post   : post,
            domain : SiteConfig.make().domain,
            related: Post.loadByTagNames(post.frontmatter.tags->fromArray)
                ->toArray
                ->Belt.Array.shuffle
                ->Belt.Array.slice(~len=2, ~offset=0)
        }
    }
    Js.Promise.resolve(props)
}

