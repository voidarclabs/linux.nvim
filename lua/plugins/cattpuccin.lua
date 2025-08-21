return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        transparent_background = true, -- disables setting the background color.
        float = {
            transparent = true, -- enable transparent floating windows
            solid = false, -- use solid styling for floating windows, see |winborder|
        },
        show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    }
}
