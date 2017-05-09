.PHONY: clean All

All:
	@echo "----------Building project:[ flip_flop_irq_ack - Debug ]----------"
	@cd "flip_flop_irq_ack" && "$(MAKE)" -f  "flip_flop_irq_ack.mk" && "$(MAKE)" -f  "flip_flop_irq_ack.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ flip_flop_irq_ack - Debug ]----------"
	@cd "flip_flop_irq_ack" && "$(MAKE)" -f  "flip_flop_irq_ack.mk" clean
