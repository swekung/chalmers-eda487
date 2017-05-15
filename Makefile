.PHONY: clean All

All:
	@echo "----------Building project:[ USART_test - Debug ]----------"
	@cd "USART_test" && "$(MAKE)" -f  "USART_test.mk" && "$(MAKE)" -f  "USART_test.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ USART_test - Debug ]----------"
	@cd "USART_test" && "$(MAKE)" -f  "USART_test.mk" clean
