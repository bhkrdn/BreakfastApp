# Breakfast App - Updated Recipe Card Logic

## Full Match Recipe Card (Default State)

- Big recipe image at the top (rounded top corners)
- Recipe Title (bold, dark gray)
- Nutrition Tags (capsules: orange, green)
- Prep Time (small, muted gray)
- No "Full Match" label shown by default

## Missing 1 Ingredient Recipe Card

- Same layout: Image, Title, Tags, Prep Time
- Additional soft label displayed: "Missing Milk"
- Label styled as light blue capsule (`#E0F0FF`)
- Font small (~12px), dark gray text, non-clickable
- Capsule positioned right under nutrition tags, aligned neatly

## Visual Behavior Notes

- Only show "Missing X" capsule if exactly 1 ingredient is missing
- Do not clutter card if multiple ingredients are missing
- Maintain clean visual hierarchy: Title > Tags > Prep Time > Missing Label
- Ensure no visual hijacking; missing ingredient hint should feel secondary
