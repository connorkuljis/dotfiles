package tailscalereset

import (
	"reflect"
	"testing"
)

func TestTailscaleUpArgsWithoutExitNode(t *testing.T) {
	got := tailscaleUpArgs("connor", "")
	want := []string{
		"tailscale",
		"up",
		"--reset",
		"--accept-routes",
		"--operator=connor",
	}

	if !reflect.DeepEqual(got, want) {
		t.Fatalf("tailscaleUpArgs() = %#v, want %#v", got, want)
	}
}

func TestTailscaleUpArgsWithExitNode(t *testing.T) {
	got := tailscaleUpArgs("connor", "jp-tyo-wg-001.mullvad.ts.net")
	want := []string{
		"tailscale",
		"up",
		"--reset",
		"--accept-routes",
		"--operator=connor",
		"--exit-node=jp-tyo-wg-001.mullvad.ts.net",
	}

	if !reflect.DeepEqual(got, want) {
		t.Fatalf("tailscaleUpArgs() = %#v, want %#v", got, want)
	}
}
