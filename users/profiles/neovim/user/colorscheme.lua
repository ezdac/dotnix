local theme_avail, _ = pcall(require, "nightfox")
if theme_avail then
  return "nightfox"
else
  return "default_theme"
end
