local colors = {
  black = "#242632",
  white = "#F8F8F2",
  red = "#FF5555",
  green = "#50fa7b",
  blue = "#6272A4",
  yellow = "#fe8019",
  gray = "#ABB2BF",
}
return {
  normal = {
    a = { bg = colors.black, fg = colors.yellow, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray },
    c = { bg = colors.black, fg = colors.white },
  },
  insert = {
    a = { bg = colors.black, fg = colors.blue, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray },
    c = { bg = colors.black, fg = colors.white },
  },
  visual = {
    a = { bg = colors.black, fg = colors.green, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray },
    c = { bg = colors.black, fg = colors.white },
  },
  replace = {
    a = { bg = colors.black, fg = colors.red, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray },
    c = { bg = colors.black, fg = colors.white },
  },
  command = {
    a = { bg = colors.black, fg = colors.gray, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray },
    c = { bg = colors.black, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.black, fg = colors.gray, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray },
    c = { bg = colors.black, fg = colors.gray },
  },
}
