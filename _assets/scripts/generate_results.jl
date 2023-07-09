# Parent file to run all scripts which may generate
# some output that you want to display on the website.
# this can be used as a tester to check that all the code
# on your website runs properly.

using Replay

dir = @__DIR__

"""
    genplain(inputfile)

Small helper function to run some code and redirect the output (stdout) to a file.
"""
function genplain(
    inputfile,
    outputfile=joinpath(dir, "output", "$(splitext(inputfile)[1]).out")
)
    open(joinpath(dir, "output", outputfile), "w") do outf
        redirect_stdout(outf) do
            include(joinpath(dir, inputfile))
        end
    end
end

function genrepl(
    inputfile,
    outputfile=joinpath(dir, "output", "$(splitext(inputfile)[1]).out")
)
    ansi_escape = r"(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]"
    instructions = open(joinpath(dir, inputfile), "r") do f
        read(f, String)
    end
    redirect_stdio(stdout=joinpath(dir, "output", outputfile)) do
        replay(instructions, stdout, julia_project=dir, use_ghostwriter=false, cmd="--color=no -q")
    end
end

# output

genplain("script1.jl")
genrepl("pkgmode.replin")
