package tailscalereset

import (
	"fmt"
	"os"
	"os/exec"
)

const (
	red   = "\033[0;31m"
	green = "\033[0;32m"
	blue  = "\033[0;34m"
	reset = "\033[0m"
)

type Config struct {
	ExitNode string
}

func Run(config Config) int {
	operator := os.Getenv("USER")
	if operator == "" {
		fmt.Fprintf(os.Stderr, "%s× error: USER is not set.%s\n", red, reset)
		return 1
	}

	if _, err := exec.LookPath("tailscale"); err != nil {
		fmt.Fprintf(os.Stderr, "%s× error: tailscale not installed.%s\n", red, reset)
		return 1
	}

	if err := runLogged("sudo", "tailscale", "down"); err != nil {
		printCommandError(err)
		return 1
	}

	if err := runLogged("sudo", tailscaleUpArgs(operator, config.ExitNode)...); err != nil {
		printCommandError(err)
		return 1
	}

	if config.ExitNode != "" {
		fmt.Printf("\n%s● waiting: tailscale is reconnecting using exit-node %s%s\n", blue, config.ExitNode, reset)
	} else {
		fmt.Printf("\n%s● waiting: tailscale is reconnecting%s\n", blue, reset)
	}

	if err := run("tailscale", "wait", "--timeout=30s"); err != nil {
		fmt.Fprintf(os.Stderr, "%s× error: tailscale did not connect within 30 seconds.%s\n", red, reset)
		return 1
	}

	if config.ExitNode != "" {
		fmt.Printf("%s● ok: tailscale connected using exit-node %s%s\n", green, config.ExitNode, reset)
	} else {
		fmt.Printf("%s● ok: tailscale connected%s\n", green, reset)
	}

	fmt.Printf("%s● ip:%s\n", blue, reset)
	if err := run("tailscale", "ip"); err != nil {
		printCommandError(err)
		return 1
	}

	return 0
}

func runLogged(name string, args ...string) error {
	fmt.Fprintf(os.Stderr, "+ %s", name)
	for _, arg := range args {
		fmt.Fprintf(os.Stderr, " %s", arg)
	}
	fmt.Fprintln(os.Stderr)

	return run(name, args...)
}

func tailscaleUpArgs(operator, exitNode string) []string {
	args := []string{
		"tailscale",
		"up",
		"--reset",
		"--accept-routes",
		"--operator=" + operator,
	}

	if exitNode != "" {
		args = append(args, "--exit-node="+exitNode)
	}

	return args
}

func run(name string, args ...string) error {
	cmd := exec.Command(name, args...)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func printCommandError(err error) {
	fmt.Fprintf(os.Stderr, "%s× error: %v%s\n", red, err, reset)
}
