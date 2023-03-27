@react.component
let default = (~posts: list<Post.t>) => {
    <>
        <ArticleCardList posts={posts} />
    </>
}

let getStaticProps = _ctx => {
    let props = {
        "props": {
            "posts": Post.loadAll()
                ->ListUtil.sortByPostDate
        }
    }
    Js.Promise.resolve(props)
}

