
hl.window_rule({
  name = "float-terminal",
  match = { class = "kitty" },
  float = true,
  center = true,
  size = {800, 600},
})

hl.window_rule({ match = { class = "Nsxiv" }, float = true, center = true })
