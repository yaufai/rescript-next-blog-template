open Belt

module Tag = {
    type t = string
}

module ArticleCard = {
    @react.component
    let make = (~post: Post.t) => {
        <div className="card col-11 col-md-5 mx-2 my-2 hover-scale">
            <div className="card-body">
                <div className="text-end">
                    {React.string(post.frontmatter.date)}
                </div>
                <span className="card-title">
                    <a href={`/blog/${post.frontmatter.slug}`} className="text-decoration-none stretched-link">
                        {React.string(post.frontmatter.title)}
                    </a>
                </span>
                <div>
                    <TagList tags={post.frontmatter.tags} />
                </div>
                <p className="card-text text-reset">
                    {React.string(post.frontmatter.description)}
                </p>
            </div>
        </div>
    }
}

@react.component
let make = (~posts: list<Post.t>) => {
    let arr = List.toArray(
        List.map(
            posts,
            (post: Post.t) => <ArticleCard
                post={post}
                key={`article-${post.frontmatter.slug}`}
            />
        )
    )
    <div className="row justify-content-center">
        {React.array(arr)}
    </div>
}