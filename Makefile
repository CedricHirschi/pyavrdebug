PYTHON_PATH = C:\Users\cedr0\AppData\Local\Programs\Python\Python311

# PIP = $(PYTHON_PATH)\Scripts\pip.exe
PIP = pip
# PYTHON = $(PYTHON_PATH)\python.exe
PYTHON = python3

# colors for cmd (only works on windows)
ifeq ($(SHELL),cmd.exe)
	RED=[0;31m
	BLUE=[0;34m
	GREEN=[0;32m
	NC=[0m
	RMDIR=rmdir /S /Q
else ifeq ($(SHELL),sh.exe)
	RED=[0;31m
	BLUE=[0;34m
	GREEN=[0;32m
	NC=[0m
	RMDIR=rmdir /S /Q
else
	RED=
	BLUE=
	GREEN=
	NC=
	RMDIR=rm -rf
endif

.SILENT:

all: uninstall-old build-new install-new clean
	@echo +------------------------------------------------------------------------+
	@echo $(GREEN)Done!$(NC)
	@echo You can now run $(BLUE)pyavrdebug$(NC) from the command line
	@echo Used python version: $(BLUE)$(PYTHON)$(NC)
	@echo +------------------------------------------------------------------------+

uninstall-old:
	@echo +------------------------------------------------------------------------+
	@echo Uninstalling any old versions of $(BLUE)pyavrdebug$(NC)
	$(PIP) uninstall pyavrdebug -y || @echo Not previously installed
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
	$(RMDIR) build
	$(RMDIR) dist
	$(RMDIR) pyavrdebug.egg-info
	@echo $(GREEN)Done!$(NC)