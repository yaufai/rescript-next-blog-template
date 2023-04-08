module NextShare = {
    @module("next-share") @react.component external facebookShareButton: (~url: string, ~children: React.element) => React.element = "FacebookShareButton"
    @module("next-share") @react.component external facebookIcon       : (~size: int) => React.element = "FacebookIcon"
    @module("next-share") @react.component external twitterShareButton : (~url: string, ~children: React.element) => React.element = "TwitterShareButton"
    @module("next-share") @react.component external twitterIcon        : (~size: int) => React.element = "TwitterIcon"
}

module Wrap = {
    @react.component
    let make = (~children: React.element) => {
        <div className="d-inline-block">
            {children}
        </div>
    }
}


@react.component
let make = (~url: string) => {
    let size = 36
    <div className="justify-content-center d-flex">
        <Wrap>
            <NextShare.facebookShareButton url={url}>
                <NextShare.facebookIcon size={size} />
            </NextShare.facebookShareButton>
        </Wrap>
        <Wrap>
            <NextShare.twitterShareButton url={url}>
                <NextShare.twitterIcon size={size} />
            </NextShare.twitterShareButton>
        </Wrap>
    </div>
}