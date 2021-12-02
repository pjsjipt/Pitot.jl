using Pitot
using Documenter

DocMeta.setdocmeta!(Pitot, :DocTestSetup, :(using Pitot); recursive=true)

makedocs(;
    modules=[Pitot],
    authors="Paulo Jabardo <pjabardo@ipt.br>",
    repo="https://github.com/pjsjipt/Pitot.jl/blob/{commit}{path}#{line}",
    sitename="Pitot.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
