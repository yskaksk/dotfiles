conn = stdout
(ourRead, ourWrite) = redirect_stdout()

#empty!(LOAD_PATH)
push!(LOAD_PATH, joinpath(@__DIR__, "packages"))
push!(LOAD_PATH, "@stdlib")

using LanguageServer, Sockets, SymbolServer

server = LanguageServerInstance(stdin, conn, false, "/home/akasaka/.julia/environments/v1.0", "", Dict())
run(server)
