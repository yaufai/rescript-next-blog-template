type props404 = {
    posts: array<Post.t>
}

let default = (props) => {
    <>
        <div className="my-5">
            <h1 className="vh-40 text-center ">
                {React.string("404 Page Not Found")}
            </h1>
        </div>
        
        <p className="my-2 text-center">
            {React.string("...or, you may like")}
        </p>

        <ArticleCardList posts={props} />
    </>
}

let getStaticProps = _ctx => {
    let props = {
        "props": list{
            Post.loadBySlug("getting_started"),
            Post.loadBySlug("customize_markdown_and_frontmatter"),
        }
    }
    Js.Promise.resolve(props)
}

