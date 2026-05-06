package main

import (
	"os"

	"dotfiles.local/tools/internal/tailscalereset"
)

func main() {
	os.Exit(tailscalereset.Run(tailscalereset.Config{}))
}
