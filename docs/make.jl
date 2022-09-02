using ApproximationAlgorithms
using Documenter

DocMeta.setdocmeta!(ApproximationAlgorithms, :DocTestSetup, :(using ApproximationAlgorithms); recursive=true)

makedocs(;
    modules=[ApproximationAlgorithms],
    authors="Indigo <j.c.f.gauss@sjtu.edu.cn> and contributors",
    repo="https://github.com/sjtu_suyao/ApproximationAlgorithms.jl/blob/{commit}{path}#{line}",
    sitename="ApproximationAlgorithms.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sjtu_suyao.github.io/ApproximationAlgorithms.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sjtu_suyao/ApproximationAlgorithms.jl",
)
