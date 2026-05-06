package main

import (
	"os"

	"dotfiles.local/tools/internal/tailscalereset"
)

const exitNode = "jp-tyo-wg-001.mullvad.ts.net"

func main() {
	os.Exit(tailscalereset.Run(tailscalereset.Config{
		ExitNode: exitNode,
	}))
}
