package ctl

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:        "oakvctl",
	Short:      "Command line client for oak.",
	SuggestFor: []string{"oakctl"},
}

func Execute() error {
	if err := rootCmd.Execute(); err != nil {
		fmt.Fprintln(os.Stderr, "Error:", err)
		os.Exit(1)
	}
	return nil
}

func init() {
	cobra.EnablePrefixMatching = true
}
