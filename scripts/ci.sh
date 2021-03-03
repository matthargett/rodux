#!/bin/bash

set -ex

rojo build test-bundle.project.json --output rodux-tests.rbxmx

roblox-cli analyze test-bundle.project.json
selene src

roblox-cli run --load.model rodux-tests.rbxmx --run scripts/run-tests.lua
