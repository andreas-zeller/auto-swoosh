# Auto Swoosh Makefile

Auto\ Swoosh.app: auto-swoosh.sh
	appify "$<" "$@"
	
clean:
	$(RM) -fr Auto\ Swoosh.app