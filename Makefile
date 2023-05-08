PYTHON_PATH = C:\Users\cedr0\AppData\Local\Programs\Python\Python311

# PIP = $(PYTHON_PATH)\Scripts\pip.exe
PIP = pip
# PYTHON = $(PYTHON_PATH)\python.exe
PYTHON = python

# colors for cmd
RED=[0;31m
BLUE=[0;34m
GREEN=[0;32m
NC=[0m

.SILENT:

all: uninstall-old build-new install-new clean
	@echo +------------------------------------------------------------------------+
	@echo $(GREEN)Done!$(NC)
	@echo You can now run $(BLUE)pyavrdebug$(NC) from the command line
	@echo Used python version: $(BLUE)$(PYTHON_PATH)$(NC)
	@echo +------------------------------------------------------------------------+

uninstall-old:
	@echo +------------------------------------------------------------------------+
	@echo Uninstalling any old versions of $(BLUE)pyavrdebug$(NC)
	$(PIP) uninstall pyavrdebug -y
	@echo $(GREEN)Done!$(NC)

build-new:
	@echo +------------------------------------------------------------------------+
	@echo Building new version of $(BLUE)pyavrdebug$(NC)
	$(PYTHON) setup.py build
	@echo $(GREEN)Done!$(NC)

install-new:
	@echo +------------------------------------------------------------------------+
	@echo Installing new version of $(BLUE)pyavrdebug$(NC)
	$(PYTHON) setup.py install
	@echo $(GREEN)Done!$(NC)

clean:
	@echo +------------------------------------------------------------------------+
	@echo Cleaning up $(BLUE)build$(NC) and $(BLUE)dist$(NC) directories
	if exist build rmdir /S /Q build
	if exist dist rmdir /S /Q dist
	@echo $(GREEN)Done!$(NC)