local ProcessService = game:GetService("ProcessService")
local Root = script.Parent.RoduxTestModel

local Packages = Root.Packages
local TestEZ = require(Root.Packages.Dev.TestEZ)

-- Run all tests, collect results, and report to stdout.
local result = TestEZ.TestBootstrap:run(
	{ Packages.Rodux },
	TestEZ.Reporters.TextReporter
)

if result.failureCount == 0 then
	ProcessService:ExitAsync(0)
else
	ProcessService:ExitAsync(1)
end
