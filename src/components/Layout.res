open Next

@react.component
let make = (~children) => {
    let config = SiteConfig.make()
    <div>
        <Head>
            <meta property="og:locale" content="en_US"  />
            <meta property="og:site_name" content={config.title} />
            <link href="/favicon.png" rel="icon" sizes="32x32" />
        </Head>
        <header className="my-4">
            <div className="text-center my-3 fs-1">
                <a href="/" className="text-decoration-none">
                    {React.string(config.title)}
                </a>
            </div>
            <p className="text-center">
                {React.string(config.description)}
            </p>
        </header>
        <div className="container">
            <div className="row">
                <main className="col-12 col-md-9">
                    children
                </main>
                <div className="col-0 col-md-3 d-none d-md-block">
                    <ProfileCard />
                </div>
            </div>
        </div>
        <footer>
            <Copyright />
        </footer>
    </div>
}