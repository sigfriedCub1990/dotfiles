#!/bin/sh
if command -v brew >/dev/null 2>&1; then
	brew install starship
else
	curl -fsSL https://starship.rs/install.sh | bash
fi
