using Test
using Compat
using Canopy

anyerrors = false

tests = [
    "test_constants.jl",
    "test_water.jl",
]

println("Running tests:")

for t in tests
    try
        include(t)
        println("\t\033[1m\033[32mPASSED\033[0m: $(t)")
    catch e
        global anyerrors = true
        println("\t\033[1m\033[31mFAILED\033[0m: $(t)")
        showerror(stdout, e, backtrace())
    end
end

if anyerrors
    throw(error("Tests failed"))
end
