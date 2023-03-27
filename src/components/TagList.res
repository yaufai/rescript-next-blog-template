type t = string

module Tag = {
    @react.component
    let make = (~item: t) => {
        <div className="d-inline-block badge text-bg-light mx-1">
            <a href={`/tag/${item}`} className="text-decoration-none text-reset position-relative stretched-link">
                {React.string(`# ${item}`)}
            </a>
        </div>
    }
}

@react.component
let make = (~tags: array<t>) => <div className="my-3">
    {
        tags->Belt.Array.map(tag => <Tag item={tag}/>)
            ->React.array
    }
</div>