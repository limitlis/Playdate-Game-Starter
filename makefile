.PHONY: clean
.PHONY: build
.PHONY: run
.PHONY: copy
.PHONY: ship_it
.PHONY: docs

SDK = $(shell egrep '^\s*SDKRoot' ~/.Playdate/config | head -n 1 | cut -c9-)
SDKBIN=$(SDK)/bin
GAME=$(notdir $(CURDIR))
SIM=Playdate Simulator


build: clean compile run

# Builds the final pdx, with debugging removed.
ship_it: clean compile_without_debugging run

run: open

clean:
	rm -rf '$(GAME).pdx'

compile: Source/main.lua
	"$(SDKBIN)/pdc" 'Source' '$(GAME).pdx'

# Passing the -s option to pdc will strip debugging information from the output files.
compile_without_debugging: Source/main.lua
	"$(SDKBIN)/pdc" -s 'Source' '$(GAME).pdx'

open:
	open -a '$(SDKBIN)/$(SIM).app/Contents/MacOS/$(SIM)' '$(GAME).pdx'

# Opens the local docs that shipped with the SDK.
docs:
	open '$(SDK)/Inside Playdate.html'



