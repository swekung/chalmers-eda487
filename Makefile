.PHONY: clean All

All:
	@echo "----------Building project:[ Final - Debug ]----------"
	@cd "Final" && "$(MAKE)" -f  "Final.mk" && "$(MAKE)" -f  "Final.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ Final - Debug ]----------"
	@cd "Final" && "$(MAKE)" -f  "Final.mk" clean
