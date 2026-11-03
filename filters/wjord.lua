-- wjord.lua — turn Markdown classes into named InDesign styles.
-- Part of the Wjerk Software and Utilities Bundle. License: MPL-2.0
--
--   ::: pullquote          ->  paragraph style "Pullquote"
--   ::: chapter-opener     ->  paragraph style "ChapterOpener"
--   [Baltimore]{.place}    ->  character style "Place"
--
-- An explicit custom-style always wins:
--   ::: {custom-style="Pull Quote Big"}

-- Classes Pandoc already understands. Leave them alone.
local reserved = {
  smallcaps = true, underline = true, mark = true,
  column = true, columns = true, sourceCode = true,
}

local function style_name(class)
  local name = class:gsub("[-_]+(%w)", function(c) return c:upper() end)
  return (name:gsub("^%l", string.upper))
end

local function first_custom_class(el)
  for _, class in ipairs(el.classes) do
    if not reserved[class] then return class end
  end
  return nil
end

local function apply(el)
  if el.attributes["custom-style"] then return nil end
  local class = first_custom_class(el)
  if not class then return nil end
  el.attributes["custom-style"] = style_name(class)
  return el
end

return {
  { Div = apply, Span = apply },
}
