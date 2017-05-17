.PHONY: clean All

All:
	@echo "----------Building project:[ UART_Messaging - Debug ]----------"
	@cd "UART_Messaging" && "$(MAKE)" -f  "UART_Messaging.mk" && "$(MAKE)" -f  "UART_Messaging.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ UART_Messaging - Debug ]----------"
	@cd "UART_Messaging" && "$(MAKE)" -f  "UART_Messaging.mk" clean
