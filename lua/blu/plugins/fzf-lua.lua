return {
	"ibhagwan/fzf-lua",
	dependencies = {"echasnovski/mini.icons"},
	opts = {
		fzf_colors = true,
		winopts = {
		},
    manpages = { previewer = "man_native" },
    helptags = { previewer = "help_native" },
    previewers = {
      man = {
        cmd = "man %s | col -bx"
      },
      codeaction_native = {
        pager = [[delta --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]],
      },
    }
	}
}
