################
#   Prologue   #
################
MAKEFLAGS      +=  --warn-undefined-variables
SHELL          :=  bash
.SHELLFLAGS    :=  -u -o pipefail -c
.DEFAULT_GOAL  :=  iso
.SUFIXES:

#################
#   Variables   #
#################
# Paths
build  := ./build.sh

#############
#   Build   #
#############

.PHONY: submodule
submodule: ## Initialize required submodules
submodule:
	@git submodule init
	@git submodule update --remote --merge

.PHONY: iso 
iso: ## Build the iso
iso : submodule
	@sudo $(build) -v

################
#   Cleaning   #
################

.PHONY: clean
clean: ## Remove temporary build directories
	@sudo rm -rf work out 
