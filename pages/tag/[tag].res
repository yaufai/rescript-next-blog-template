open Belt.List

@react.component
let default = (~tag: string, ~posts: list<Post.t>) => {
    <div>
        <h1>
            {React.string(`TAG: ${tag}`)}
        </h1>
        <ArticleCardList posts={posts} />
    </div>
}
  

let getStaticPaths = () => {
    let tags = Post.loadAll()
        ->map(x => x.frontmatter.tags->fromArray)
        ->flatten
        ->ListUtil.dedupe

    Js.Promise.resolve({
        "paths"   : tags
            ->map(tag => { "params": { "tag": tag }})
            ->Array.of_list,
        "fallback": false
    })
}

let getStaticProps = ctx => {
    let tag   = ctx["params"]["tag"]
    let posts = Post.loadAll()
        ->filter(post => post.frontmatter.tags
            ->fromArray
            ->has(tag, (a, b) => a == b)
        )
        ->ListUtil.sortByPostDate
    let props = {
        "props": { { "posts": posts, "tag": tag } }
    }
    Js.Promise.resolve(props)
}

