@react.component
let make = () => {
    let author = SiteConfig.make().author
    <div className="card">
        <div className="card-body">
            <img
                className="rounded-circle img-fluid px-2"
                src="/author.png"
            />
            <div className="card-title text-center my-2">
            <a href={`/about`} className="text-decoration-none">
                {React.string(author.name)}
            </a>
            </div>
            <p className="card-text">
                {React.string(author.description)}
            </p>
        </div>
    </div>
}