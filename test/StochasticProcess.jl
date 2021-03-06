using RandomMatrices
using Base.Test

srand(1)
dx = 0.001

let
p = WhiteNoiseProcess(dx)
@test start(p) == nothing
S = next(p)
@test done(p, S) == false
end

let
p = BrownianProcess(dx)
@test start(p) == 0
S = next(p, 0.0)
@test done(p, S) == false
end

let
p = AiryProcess(dx, 2.0)
S = start(p)
@test S == fill(-2/dx^2, 1, 1)
S = next(p, S)
@test done(p, S) == false
end
